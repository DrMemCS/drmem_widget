/// Provides a widget to interact with a DrMem node through the client API.
///
/// Near the top of your widget tree, you place an instance of [DrMem]. This
/// widget should be rebuilt as infrequently as possible. It contains a table
/// of known nodes and it maintains connections to them. If this widget gets
/// rebuilt, all of that state needs to be reproduced and will cause jank and
/// extra work on the DrMem node.

library drmem_widget;

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:gql_websocket_link/gql_websocket_link.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
import 'package:nsd/nsd.dart';
import 'package:built_collection/built_collection.dart';
import 'schema/__generated__/set_device.data.gql.dart';
import 'schema/__generated__/set_device.req.gql.dart';
import 'schema/__generated__/drmem.schema.gql.dart';
import 'schema/__generated__/driver_info.data.gql.dart';
import 'schema/__generated__/driver_info.req.gql.dart';
import 'schema/__generated__/get_device.data.gql.dart';
import 'schema/__generated__/get_device.req.gql.dart';
import 'schema/__generated__/monitor_device.req.gql.dart';
import 'schema/__generated__/monitor_device.data.gql.dart';
import 'schema/__generated__/monitor_device.var.gql.dart';

import 'device_value.dart';
import 'device_like.dart';
import 'device_history.dart';
import 'node_info.dart';
import 'reading.dart';
import 'driver_info.dart';
import 'device_info.dart';

import 'dart:developer' as dev;

typedef _NodeValue = (NodeInfo, Client, Client);
typedef _NodeMap = Map<String, _NodeValue>;

// Removes a trailing period. Under OSX, a local hostname is given as
// "name.local." so we need to remove the trailing period.

String _stripTrailingPeriod(String s) =>
    s.endsWith(".") ? s.substring(0, s.length - 1) : s;

// Creates a [DriverInfo] object from a GraphQL [driverInfo] reply value.

DriverInfo _driverInfoFrom(GAllDriversData_driverInfo o) =>
    DriverInfo(o.name, o.summary, o.description);

// Local extension(s) to the [DevValue] type. These aren't made public because
// they're only useful for this widget when interacting with the GraphQL API.

extension on DevValue {
  // Adds a method to the DevValue classes which can convert a value into a
  // builder of [GSettingData]. This is used when a client wants to make a
  // setting. Rather than create a different type (which GraphQL requires),
  // this allows an app to use the [DevValue] hierarchy for inputs and outputs.

  GSettingDataBuilder toSettingData() => switch (this) {
        DevBool(value: bool value) => GSettingDataBuilder()..Gbool = value,
        DevInt(value: int value) => GSettingDataBuilder()..Gint = value,
        DevFlt(value: double value) => GSettingDataBuilder()..flt = value,
        DevStr(value: String value) => GSettingDataBuilder()..str = value,
        DevColor(red: int r, green: int g, blue: int b) => GSettingDataBuilder()
          ..color = ListBuilder([r, g, b])
      };
}

// Create a private extension that defines a method to convert the complex,
// GraphQL history type into our Dart history type.

extension on GGetDeviceData_deviceInfo_history {
  // Converts the GraphQL-generated reply type (representing the device's
  // historical summary) into a friendlier, Dart version.

  DeviceHistory? toDeviceHistory() {
    final oldest = firstPoint;
    final newest = lastPoint;

    return (oldest != null && newest != null)
        ? DeviceHistory(
            totalPoints: totalPoints,
            oldest: Reading.fromParams(
                oldest.stamp,
                oldest.boolValue,
                oldest.intValue,
                oldest.floatValue,
                oldest.stringValue,
                oldest.colorValue?.toList()),
            newest: Reading.fromParams(
                newest.stamp,
                newest.boolValue,
                newest.intValue,
                newest.floatValue,
                newest.stringValue,
                newest.colorValue?.toList()))
        : null;
  }
}

// Create an extension which provides a conversion method only needed by this
// module.

extension on GSetDeviceData_setDevice {
  // Creates a [Reading] value from a GraphQL [setDevice] reply value.

  Reading toReading() => Reading.fromParams(stamp, boolValue, intValue,
      floatValue, stringValue, colorValue?.toList());
}

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
      final addr = HostInfo.tryParse(propToString("pref-addr")) ??
          HostInfo(_stripTrailingPeriod(h), p);

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

// This widget implements an inherited model. Each time it's built, it gets a
// snapshot of the known nodes. Widgets that register with it will get rebuilt
// when the associated value changes.

class _DrMemModel extends InheritedModel<String> {
  final Map<String, NodeInfo> nodes;

  const _DrMemModel(this.nodes, {required super.child});

  @override
  bool updateShouldNotify(_DrMemModel oldWidget) =>
      !mapEquals(nodes, oldWidget.nodes);

  @override
  bool updateShouldNotifyDependent(_DrMemModel oldWidget, Set<String> deps) =>
      deps.any((e) => nodes[e] != oldWidget.nodes[e]);

  // Allows a client to handle the case where this model may not be in the
  // widget tree.

  static _DrMemModel _of(BuildContext context, {String? aspect}) =>
      InheritedModel.inheritFrom<_DrMemModel>(context, aspect: aspect)!;
}

/// The [DrMem] widget implements a "provider" widget for an application's
/// tree. Its state manages GraphQL connections to registered DrMem nodes. It
/// should be located near the top of the tree so it remains stable during the
/// life of the application.

class DrMem extends StatefulWidget {
  final Widget child;

  const DrMem({required this.child, super.key});

  @override
  State<DrMem> createState() => _DrMemState();

  /// Returns the instance of this class higher up in the widget tree.

  static _DrMemState _of(BuildContext context) =>
      context.findAncestorStateOfType<_DrMemState>()!;

  /// Returns a snapshot of the current node table. This should only be used
  /// to grab the state in order to save it to persistent storgae, for instance.

  List<Map<String, dynamic>> getNodeTableState(BuildContext context) =>
      context.findAncestorStateOfType<_DrMemState>()!.nodeTable;

  /// Use this property to reset the table into a previous state. All current
  /// information will be lost and replaced. The map should be compatible with
  /// the map returned by [getNodeTableState]. Any portion of [state] that
  /// can't be used to restore a nodetbale entry will be ignored.

  setNodeTableState(BuildContext context, List<Map<String, dynamic>> state) =>
      context.findAncestorStateOfType<_DrMemState>()!.nodeTable = state;

  /// Adds a new node to the table of known DrMem nodes. When this completes,
  /// the application can interact with the node using the rest of the API.
  ///
  /// [context] is the context of the widget making the request.
  ///
  /// [name] is the name of the node. All DrMem nodes should have unique names.
  ///
  /// [host] is the IP address of the host.
  ///
  /// [port] is the port number to use.
  ///
  /// [qEnd] is the URL path needed to get to the GraphQL query/mutation
  /// handler.
  ///
  /// [sEnd] is the URL path needed to get to the GraphQL subscription handler.

  static void addNode(BuildContext context, NodeInfo info) =>
      _of(context)._addNode(info);

  /// Removes a node from the table.
  ///
  /// [context] is the context of the widget making the request.
  ///
  /// [name] is the name of the node. All DrMem nodes should have unique names.

  static void removeNode(BuildContext context, String name) =>
      _of(context)._removeNode(name);

  /// Sets a value of a DrMem device.
  ///
  /// The target device must be settable.
  ///
  /// [context] is the context of the widget making the request.
  ///
  /// [device] is the name fo the device.
  ///
  /// [value] is the value to set. Most devices enforce a value type. For
  /// instance, "enable" devices are typically boolean. If the incorrect type
  /// is sent, the driver will return an error. See the driver documentation
  /// to see what data type is supported by the device.
  ///
  /// The function returns a [Reading] structure echoing the setting used by
  /// the driver and containing the timestamp of when the setting was applied.
  /// Some drivers will return an error when a setting value is out of range.
  /// Other drivers may accept the value, but clip it to remain in range. See
  /// the driver docs to understand the behavior since the returned value may
  /// differ from the one sent.

  static Future<Reading> setDevice(
          BuildContext context, Device device, DevValue value) =>
      _of(context)._setDevice(device, value);

  /// Retrieves driver information from a DrMem node.
  ///
  /// Each instance of DrMem interacts with it own set of hardware devices and,
  /// therefore, is built with a custom set of drviers. This function queries
  /// the node for available information on its set of drivers.
  ///
  /// [context] is the context of the widget making the request.
  ///
  /// [node] is the name of the DrMem node used when registering it with
  /// [addNode].

  static Future<List<DriverInfo>> getDriverInfo(
          BuildContext context, String node) =>
      _of(context)._getDriverInfo(node);

  /// Returns information about a device.
  ///
  /// [context] is the context of the widget making the request.
  ///
  /// [node] indicates which DrMem node should be queried.
  ///
  /// [device] specifies which device's information should be returned. If a
  /// unique, existing device name is given, a one-element `List` will be
  /// returned. If the device parameter specifies a pattern, all matching
  /// devices will have their information returned.
  ///
  /// Returns a Future that resolves to a `List` of device information
  /// ([DevInfo]), or an error.

  static Future<List<DeviceInfo>> getDeviceInfo(BuildContext context,
          {required DevicePattern device}) =>
      _of(context)._getDeviceInfo(device: device);

  /// Returns a stream of readings for a device.
  ///
  /// This method provides many flexible ways to obtain device readings. Some
  /// of these options may be limited, if the DrMem node is using the simple
  /// backend (which only saves one point of history.)
  ///
  /// [context] is the context of the widget making the request.
  ///
  /// [device] is the device whose readings should be streamed.
  ///
  /// [startTime] and [endTime] are optional arguments which create a range
  /// of time in which readings should be returned. If both are `null`, the
  /// latest and all future readings are returned until the stream is closed.
  /// If `startTime` is null, the latest reading is returned and all future
  /// readings until `endTime` is reached. If `endTime` is null, then all
  /// readings from `startTime` until the current time are returned followed
  /// by all future readings until the stream is closed. If both times are
  /// before the current time, just the data between the two times is returned.
  /// If both times are after the current time, then readings won't begin until
  /// `startTime` is reached.
  ///
  /// DrMem's configuration determines the size of a device's history. This
  /// function can only return what's available.

  static Stream<Reading> monitorDevice(BuildContext context, Device device,
          {DateTime? startTime, DateTime? endTime}) =>
      _of(context)
          ._monitorDevice(device, startTime: startTime, endTime: endTime);

  /// Retrieves node information and registers the calling widget to be rebuilt
  /// if its node of interest gets updated.

  static NodeInfo? getNodeInfo(
          {required BuildContext context, required String node}) =>
      _DrMemModel._of(context, aspect: node).nodes[node];

  /// Retrieves all the known node names. The calling widget is registered to
  /// be rebuilt if any part of the model changes.

  static Iterable<String> getNodeNames({required BuildContext context}) =>
      _DrMemModel._of(context).nodes.keys;
}

class _DrMemState extends State<DrMem> {
  Discovery? _disc;
  final _NodeMap _nodes = {};

  @override
  void initState() {
    dev.log("starting mDNS monitor", name: "mdns.announce");
    startDiscovery('_drmem._tcp').then((value) {
      _disc = value;
      value.addServiceListener(_serviceUpdate);
      dev.log("registered with mDNS", name: "mdns.announce");
    });
    super.initState();
  }

  @override
  void dispose() {
    final tmp = _disc;

    // Shut down the background thread asynchronously.

    if (tmp != null) {
      // Unregister synchronously.

      tmp.removeServiceListener(_serviceUpdate);
      dev.log("unregistered from mDNS", name: "mDNS");
      Future.microtask(() async {
        await stopDiscovery(tmp);
        dev.log("stopped mDNS monitor", name: "mDNS");
      });
    }

    // Close the connections to DrMem.

    for (final MapEntry(value: (_, a, b)) in _nodes.entries) {
      a.dispose();
      b.dispose();
    }
    super.dispose();
  }

  // Returns an unmodifiable version of the node table.

  List<Map<String, dynamic>> get nodeTable => _nodes.entries.map((entry) {
        final (v, _, _) = entry.value;

        return <String, dynamic>{
          'name': v.name,
          'version': v.version,
          'location': v.location,
          'host': v.addr.host,
          'port': v.addr.port,
          'signature': v.signature,
          'boottime': v.bootTime?.toIso8601String(),
          'queries': v.queries,
          'mutations': v.mutations,
          'subscriptions': v.subscriptions
        };
      }).toList();

  // Sets the contents of the node table to [map]. Any entries in [map] that
  // don't follow the format for the node table will be ignored.

  set nodeTable(List<Map<String, dynamic>> l) {
    // Remove the old nodes, one by one. It needs to be done this way because
    // `_removeNode` will notifiy widgets that their node has been updated.
    // Doing a `_nodes.clear()` wouldn't notify them.

    final oldNodes = _nodes.keys.toList();

    for (final node in oldNodes) {
      _removeNode(node);
    }

    // Now populate the empty node table with entries from the parameter.
    // Ignore any entries that don't have the proper keys or values.

    for (final ii in l) {
      if (ii
          case {
            'name': String name,
            'version': String version,
            'location': String location,
            'host': String host,
            'port': int port,
            'signature': String? signature,
            'boottime': String? bootTime,
            'queries': String queries,
            'mutations': String mutations,
            'subscriptions': String subscriptions
          }) {
        _addNode(NodeInfo(
            name: name,
            version: version,
            location: location,
            addr: HostInfo(host, port),
            bootTime: bootTime != null ? DateTime.tryParse(bootTime) : null,
            signature: signature,
            queries: queries,
            mutations: mutations,
            subscriptions: subscriptions));
      }
    }
  }

  // Helper function to create the GraphQL query URI.

  static (Uri, Uri) _buildUris(
          {required HostInfo addr,
          required String qEnd,
          required String sEnd,
          bool encrypted = false}) =>
      (
        Uri(
          scheme: encrypted ? "https" : "http",
          host: addr.host,
          port: addr.port,
          path: qEnd,
        ),
        Uri(
          scheme: encrypted ? "wss" : "ws",
          host: addr.host,
          port: addr.port,
          path: sEnd,
        )
      );

  // Validates a device value by adding a default node, if the node was null,
  // or verifying the node exists if it isn't null.

  Device _resolve(Device dev) {
    if (dev case Device(node: String node)) {
      if (_nodes.containsKey(node)) {
        return dev;
      } else {
        throw Exception("device on unknown node, '$node'");
      }
    } else if (_nodes.length == 1) {
      return Device(node: _nodes.keys.first, name: dev.name);
    } else {
      throw Exception("device needs a node specified");
    }
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
        // If the node isn't in the map or it is and we can merge the data
        // with what's in the map, then update the entry.

        if (_nodes[ni.name] case (NodeInfo info, Client q, Client s)) {
          if (info.canUpdate(ni)) {
            setState(() => _nodes[ni.name] = (ni, q, s));
            dev.log("updated node ${ni.name}", name: "mDNS");
          } else {
            dev.log(
                "node ${ni.name} announced but can't be merged ... ignoring",
                name: "mDNS");
          }
        } else {
          _addNode(ni);
          dev.log("added new node ${ni.name}", name: "mDNS");
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
      setState(() {
        _nodes[service.name]?.$1.deactivate();
        dev.log("deactivate node ${service.name}", name: "mDNS");
      });
    }
  }

  // The implementation of [DrMem.addNode].

  void _addNode(NodeInfo info) {
    final (qUri, sUri) = _buildUris(
        addr: info.addr, qEnd: info.queries, sEnd: info.subscriptions);
    final qClient = Client(link: HttpLink(qUri.toString()), cache: Cache());
    final sClient = Client(
        link: WebSocketLink(null,
            channelGenerator: () =>
                WebSocketChannel.connect(sUri, protocols: ["graphql-ws"]),
            reconnectInterval: const Duration(seconds: 1)),
        cache: Cache());

    setState(() => _nodes[info.name] = (info, qClient, sClient));
  }

  // The implementation of [DrMem.removeNode].

  void _removeNode(String name) => setState(() => _nodes.remove(name));

  // Translates the response of a [getDeviceInfo] query into a `List<DevInfo>`.

  List<DeviceInfo> _toDevInfoList(GGetDeviceData result) => result.deviceInfo
      .map((e) => DeviceInfo(
            Device(name: e.deviceName),
            e.settable,
            e.units,
            e.history.toDeviceHistory(),
          ))
      .toList();

  // Gets the two GraphQL handles associated with the specified node.

  (Client, Client) _getHandles(String node) {
    if (_nodes[node] case (_, Client q, Client s)) {
      return (q, s);
    } else {
      throw ArgumentError("node '$node' not found");
    }
  }

  // This internal function generalizes a GraphQL "RPC" call. In the `ferry`
  // GraphQL package, all GraphQL interactions return a stream -- even RPCs.
  // The incoming packets indicate the states the request goes through. This
  // function finds the packet that has the return value and passes it to a
  // translation function to get the final value.

  Future<Result> _rpc<TData, TVars, Result>(String node,
      OperationRequest<TData, TVars> request, Result Function(TData) xlat) {
    final (Client query, _) = _getHandles(node);

    return query
        .request(request)
        .where((response) => !response.loading)
        .first
        .then((value) {
      if (value.hasErrors) {
        throw Exception(value.graphqlErrors);
      } else {
        final data = value.data;

        if (data != null) {
          return xlat(data);
        } else {
          throw Exception("no data was returned from request");
        }
      }
    });
  }

  // The implmentation of [DrMem.setDevice].

  Future<Reading> _setDevice(Device device, DevValue value) => _rpc(
      _resolve(device).node!,
      GSetDeviceReq((b) => b
        ..vars.device = device.name
        ..vars.value = value.toSettingData()),
      (result) => result.setDevice.toReading());

  // The implementation of [DrMem.getDriverInfo].

  Future<List<DriverInfo>> _getDriverInfo(String node) => _rpc(
        node,
        GAllDriversReq((b) => b),
        (result) => result.driverInfo.map(_driverInfoFrom).toList(),
      );

  // This is the implementation of [DrMem.getDeviceInfo].

  Future<List<DeviceInfo>> _getDeviceInfo({required DevicePattern device}) =>
      _rpc(device.node, GGetDeviceReq((b) => b..vars.name = device.name),
          _toDevInfoList);

  // Returns an appropriate GDateRangeBuilder based on the two input dates.
  // In DrMem's GraphQL API, if both dates are `null`, we don't provide a
  // date range (i.e. `null`). Otherwise we return a builder (possibly with
  // one of the date fields `null`.)

  GDateRangeBuilder? _buildDateRange(DateTime? a, DateTime? b) =>
      (a != null || b != null)
          ? (GDateRangeBuilder()
            ..start = a
            ..end = b)
          : null;

  static Reading _monDevRespToReading(
      OperationResponse<GMonitorDeviceData, GMonitorDeviceVars> response) {
    final data = response.data!.monitorDevice;

    return Reading.fromParams(data.stamp, data.boolValue, data.intValue,
        data.floatValue, data.stringValue, data.colorValue?.toList());
  }

  // The implementation of [DrMem.monitorDevice].

  Stream<Reading> _monitorDevice(Device device,
      {DateTime? startTime, DateTime? endTime}) {
    final dev = _resolve(device);
    final (_, Client sub) = _getHandles(dev.node!);

    return sub
        .request(GMonitorDeviceReq((b) => b
          ..vars.device = device.name
          ..vars.range = _buildDateRange(startTime, endTime)))
        .where((response) => !response.loading && response.data != null)
        .map(_monDevRespToReading);
  }

  @override
  Widget build(BuildContext context) =>
      _DrMemModel(_nodes.map((key, value) => MapEntry(key, value.$1)),
          child: widget.child);
}
