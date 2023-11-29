import 'dart:convert';
import 'package:drmem_provider/drmem_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nsd/nsd.dart';

import 'dart:developer' as dev;

// Holds a snapshot of the current set of identified DrMem nodes. Since it's
// an `InheritedModel` widget, we can conditionally update dependent widgets,
// based on which entry they registered to receive.

class _DrMemNodeModel extends InheritedModel<String> {
  final Map<String, NodeInfo> nodes;

  const _DrMemNodeModel({required this.nodes, required super.child});

  // This checks to see if there are ANY differences between the two widgets'
  // state. This is so widget that register for any change will get updated.

  @override
  bool updateShouldNotify(_DrMemNodeModel oldWidget) =>
      !mapEquals(nodes, oldWidget.nodes);

  // This checks to see if widgets that registered for specific aspects need
  // to be updated. It loops through the registered aspects and determines
  // whether any have changed.

  @override
  bool updateShouldNotifyDependent(
          _DrMemNodeModel oldWidget, Set<String> dependencies) =>
      dependencies.any((ii) => nodes[ii] != oldWidget.nodes[ii]);

  // Allows a client to handle the case where this model may not be in the
  // widget tree.

  static _DrMemNodeModel? maybeOf(BuildContext context, {String? aspect}) =>
      InheritedModel.inheritFrom<_DrMemNodeModel>(context, aspect: aspect);

  // Use this method when you know DrMemNodeModel is always in the tree.

  static _DrMemNodeModel of(BuildContext context, {String? aspect}) {
    final _DrMemNodeModel? result = maybeOf(context, aspect: aspect);

    assert(result != null, 'Unable to find an instance of DrMemNodeModel...');
    return result!;
  }
}

// Takes astring in "host:port" format and returns a HostInfo type. If it
// can't be parsed, `null` is returned.

HostInfo? _parseHostInfo(String? s) {
  if (s?.split(":") case [String host, String tmp]) {
    final port = int.tryParse(tmp);

    if (port != null) {
      return (host, port);
    }
  }
  return null;
}

String _stripTrailingPeriod(String s) =>
    s.endsWith(".") ? s.substring(0, s.length - 1) : s;

extension on Service {
  // Looks in the `txt` field of the Service info for a value associated with
  // the requested key. If found, it returns the value as a String.

  String? propToString(String key) {
    final Uint8List? tmp = txt?[key];

    return tmp != null
        ? const Utf8Decoder(allowMalformed: true).convert(tmp)
        : null;
  }

  NodeInfo? toNodeInfo() {
    if (this case Service(name: String n, host: String h, port: int p)) {
      final addr = _parseHostInfo(propToString("pref-addr")) ??
          (_stripTrailingPeriod(h), p);

      return NodeInfo(
        name: n,
        addr: addr,
        location: propToString("location") ?? "unknown",
        version: propToString("version") ?? "0.0.0",
        bootTime: DateTime.tryParse(propToString("bootTime") ?? ""),
        signature: propToString("signature"),
        queries: propToString("queries") ?? "/drmem/q",
        mutations: propToString("mutations") ?? "/drmem/q",
        subscriptions: propToString("subscriptions") ?? "/drmem/s",
      );
    } else {
      return null;
    }
  }
}

/// Maintains a set of DrMem nodes.
///
/// This widget should be inserted near the root of the widget tree. It
/// maintains a set of known DrMem nodes. The set can be populated
/// programmatically (like from a persistent resource.) But it will also be
/// updated using mDNS so DrMem nodes on the local network will automatically
/// get added.

class DrMemNodes extends StatefulWidget {
  final Widget child;

  const DrMemNodes({required this.child, super.key});

  /// Retrieves node information and registers the calling widget to be rebuilt
  /// if its node of interest gets updated.

  static NodeInfo? getNodeInfo(
          {required BuildContext context, required String node}) =>
      _DrMemNodeModel.of(context, aspect: node).nodes[node];

  /// Retrieves all the known node names. The calling widget is registered to
  /// be rebuilt if any part of the model changes.

  static Iterable<String> getNodeNames({required BuildContext context}) =>
      _DrMemNodeModel.of(context).nodes.keys;

  @override
  State<DrMemNodes> createState() => _DrMemNodesState();
}

class _DrMemNodesState extends State<DrMemNodes> {
  final Map<String, NodeInfo> _nodes = {};
  late final Future<Discovery> _fut;
  Discovery? disc;

  // When creating the state, start up the mDNS service.

  @override
  void initState() {
    _fut = startDiscovery('_drmem._tcp');
    dev.log("starting mDNS", name: "mdns.announce");
    super.initState();
  }

  // When this widget gets destroyed, it needs to unregister with the mDNS
  // service and free up the resources.

  @override
  void dispose() {
    final tmp = disc;

    // Shut down the background thread asynchronously.

    if (tmp != null) {
      // Unregister synchronously.

      tmp.removeServiceListener(_serviceUpdate);
      dev.log("unregistered", name: "mDNS");
      Future.microtask(() async {
        await stopDiscovery(tmp);
        dev.log("stopped mDNS", name: "mDNS");
      });
    }
    super.dispose();
  }

  // Handles all incoming mDNS announcements.

  void _serviceUpdate(Service service, ServiceStatus status) {
    // If no name is given, the announcement is worthless.

    if (service.name == null) {
      dev.log("mDNS announcement is missing service name ... ignoring",
          name: "mDNS");
      return;
    }

    // If this is a `found` announcement, we need to add it to the model.

    if (status == ServiceStatus.found) {
      final ni = service.toNodeInfo();

      // If `ni` isn't null, then we have an address to communicate with.
      // If no address was found, we can't talk to it, so we ignore the
      // announcement.

      if (ni != null) {
        dev.log("add node ${ni.name}", name: "mDNS");

        if (_nodes[ni.name]?.canUpdate(ni) ?? true) {
          _nodes[ni.name] = ni;

          // Mark that the widget needs to be rebuilt.

          setState(() {});
        }
      } else {
        dev.log(
            "node ${service.name} doesn't have a valid address ... ignoring",
            name: "mDNS");
      }
    }

    // This is a `lost` announcement. Deactivate the node (it'll appear in the
    // list but won't appear active.)

    else {
      _nodes[service.name]?.deactivate();

      // Mark that the widget needs to be rebuilt.

      setState(() {});
      dev.log("deactivate node ${service.name}", name: "mDNS");
    }
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: _fut,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          disc = snapshot.data!;
          dev.log("mDNS running", name: "mDNS");
        }

        return _DrMemNodeModel(
          nodes: Map.unmodifiable(_nodes),
          child: widget.child,
        );
      });
}
