/// Provides a widget to interact with a DrMem node through the client API.
///
/// Near the top of your widget tree, you place an instance of [DrMem]. This
/// widget should be rebuilt as infrequently as possible. It contains a table
/// of known nodes and it maintains connections to them. If this widget gets
/// rebuilt, all of that state needs to be reproduced and will cause jank and
/// extra work on the DrMem node.

library drmem_widget;

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
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

import 'client_id.dart';
import 'device_value.dart';
import 'device_like.dart';
import 'device_history.dart';
import 'node_info.dart';
import 'reading.dart';
import 'driver_info.dart';
import 'device_info.dart';

import 'dart:developer' as dev;

typedef _NodeValue = (Client, Client);
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
        DevColor(red: int r, green: int g, blue: int b, alpha: 255) =>
          GSettingDataBuilder()..color = ListBuilder([r, g, b]),
        DevColor(red: int r, green: int g, blue: int b, alpha: int a) =>
          GSettingDataBuilder()..color = ListBuilder([r, g, b, a]),
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

  String? _propToString(String key) {
    final Uint8List? tmp = txt?[key];

    return tmp != null
        ? const Utf8Decoder(allowMalformed: true).convert(tmp)
        : null;
  }

  NodeInfo? toNodeInfo(bool active) {
    if (this case Service(name: String n, host: String h, port: int p)) {
      final addr = HostInfo.tryParse(_propToString("pref-addr")) ??
          HostInfo(_stripTrailingPeriod(h), p);
      final boottime = _propToString("bootTime");

      return NodeInfo(
        name: n,
        addr: addr,
        location: _propToString("location") ?? "unknown",
        version: _propToString("version") ?? "0.0.0",
        bootTime: active
            ? (boottime != null
                ? DateTime.tryParse(boottime) ?? DateTime.now()
                : DateTime.now())
            : null,
        signature: _propToString("signature"),
        queries: _propToString("queries") ?? "/drmem/q",
        mutations: _propToString("mutations") ?? "/drmem/q",
        subscriptions: _propToString("subscriptions") ?? "/drmem/s",
      );
    } else {
      dev.log("couldn't convert $this to NodeInfo");
      return null;
    }
  }
}

/// The [DrMem] widget implements a "provider" widget for an application's
/// tree. Its state manages GraphQL connections to registered DrMem nodes. It
/// should be located near the top of the tree so it remains stable during the
/// life of the application.

class DrMem extends StatefulWidget {
  final Widget child;

  /// Creates an instance of the [DrMem] widget.
  ///
  /// This widget provides methods to communicate with a DrMem node. Some of
  /// these connections are long-lived (receiving device values, for instance)
  /// so this widget should be placed near the top of the widget tree to
  /// prevent it from tearing down and rebuilding the connections.
  ///
  /// [key] is an optional key to be associated with the widget
  ///
  /// [child] is the widget subtree under this widget.

  const DrMem({required this.child, super.key});

  @override
  State<DrMem> createState() => _DrMemState();

  /// Returns the instance of this class higher up in the widget tree.

  static _DrMemState _of(BuildContext context) =>
      context.findAncestorStateOfType<_DrMemState>()!;

  /// Returns a future that resolves to a stream that returns NodeInfo objects
  /// for DrMem nodes that are announcing themselves on the local network. The
  /// future only blocks early in the application's lifetime, when the mDNS
  /// service is initializing. Once that is done, the Future resolves
  /// immediately.
  ///
  /// [context] is the context of the widget making the request.

  static Future<Stream<NodeInfo>> mdnsSubscribe(BuildContext context) async =>
      _of(context)._mdnsSubscribe();

  /// Adds a mapping of a node to its network connections. The `NodeInfo` type
  /// provides information on how the connections should be made.
  ///
  /// [context] is the context of the widget making the request.
  ///
  /// [info] specifies the information of the node to be added.
  ///
  /// [clientID] is a unique string to identify an instance of a GraphQL client.
  /// An application should provide a way to view this value so it can be
  /// specified in the site's `drmem.toml` file. This value should not be
  /// available publicly but should only be known to the DrMem targets.

  static void addNode(BuildContext context, NodeInfo info, ClientID clientID) =>
      _of(context)._addNode(info, clientID);

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
  /// therefore, is built with a custom set of drivers. This function queries
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
          {required DeviceLike device}) =>
      switch (device) {
        DevicePattern() => _of(context)._getDeviceInfo(device: device),
        Device() => _of(context)._getDeviceInfo(device: device.toPattern())
      };

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
}

class _DrMemState extends State<DrMem> {
  late Future<Discovery> _disc;
  final _NodeMap _nodes = {};

  @override
  void initState() {
    super.initState();
    dev.log("starting mDNS monitor", name: "mdns.announce");
    _disc = startDiscovery('_drmem._tcp');
  }

  @override
  void dispose() {
    Future.microtask(() async {
      final tmp = await _disc;

      await stopDiscovery(tmp);
      dev.log("stopped mDNS monitor", name: "mDNS");
    });

    // Close the connections to DrMem.

    for (final MapEntry(value: (a, b)) in _nodes.entries) {
      a.dispose();
      b.dispose();
    }
    super.dispose();
  }

  // Helper function to create the GraphQL query URIs.

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

  // Creates two `Client` connections that will connect to the specified node.
  // If an encrypted channel is requested, the client's ID is passed along.

  static (Client, Client) _createConnections(NodeInfo info, ClientID id) {
    final encrypted = info.signature != null;
    final (qUri, sUri) = _buildUris(
        addr: info.addr,
        qEnd: info.queries,
        sEnd: info.subscriptions,
        encrypted: encrypted);
    final Map<String, String> headers =
        encrypted ? {'X-DrMem-Client-Id': id.fingerprint} : {};
    final qClient = Client(
        link: HttpLink(qUri.toString(), defaultHeaders: headers),
        cache: Cache());
    final sClient = Client(
        link: WebSocketLink(null,
            channelGenerator: () => IOWebSocketChannel.connect(sUri,
                protocols: ["graphql-ws"],
                headers: headers,
                connectTimeout: const Duration(seconds: 1),
                pingInterval: const Duration(seconds: 10)),
            reconnectInterval: const Duration(seconds: 2)),
        cache: Cache());

    return (qClient, sClient);
  }

  // Validates a device value by adding a default node, if the node was null,
  // or verifying the node exists if it isn't null.

  Device _resolve(Device dev) {
    if (_nodes.containsKey(dev.node)) {
      return dev;
    } else {
      throw Exception("device on unknown node, '${dev.node}'");
    }
  }

  Future<Stream<NodeInfo>> _mdnsSubscribe() async {
    final mdns = await _disc;
    final StreamController<NodeInfo> ctrl = StreamController();

    void serviceListener(Service service, ServiceStatus status) {
      if (service.name == null) {
        dev.log("mDNS announcement is missing service name ... ignoring",
            name: "mDNS");
        return;
      }

      final ni = service.toNodeInfo(status == ServiceStatus.found);

      if (ni != null) {
        ctrl.add(ni);
        dev.log("announced node ${ni.name}", name: "mDNS");
      }
    }

    ctrl.onResume = ctrl.onListen = () {
      mdns.addServiceListener(serviceListener);
      dev.log("listening to mdns stream", name: "mDNS");
    };

    ctrl.onPause = ctrl.onCancel = () {
      mdns.removeServiceListener(serviceListener);
      dev.log("ignoring mdns stream", name: "mDNS");
    };
    return ctrl.stream;
  }

  // The implementation of [DrMem.addNode].

  void _addNode(NodeInfo info, ClientID clientId) {
    if (!_nodes.containsKey(info.name)) {
      _nodes[info.name] = _createConnections(info, clientId);
    }
  }

  // The implementation of [DrMem.removeNode].

  void _removeNode(String name) => _nodes.remove(name);

  // Translates the response of a [getDeviceInfo] query into a `List<DevInfo>`.

  List<DeviceInfo> Function(GGetDeviceData) _toDevInfoList(String node) =>
      (result) => result.deviceInfo
          .map((e) => DeviceInfo(
                Device(name: e.deviceName, node: node),
                e.settable,
                e.units,
                e.history.toDeviceHistory(),
              ))
          .toList()
        ..sort((DeviceInfo a, DeviceInfo b) => a.device.compareTo(b.device));

  // Gets the two GraphQL handles associated with the specified node.

  (Client, Client) _getHandles(String node) {
    if (_nodes[node] case (Client q, Client s)) {
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

  // The implementation of [DrMem.setDevice].

  Future<Reading> _setDevice(Device device, DevValue value) => _rpc(
      _resolve(device).node,
      GSetDeviceReq((b) => b
        ..vars.device = device.name
        ..vars.value = value.toSettingData()),
      (result) => result.setDevice.toReading());

  // The implementation of [DrMem.getDriverInfo].

  Future<List<DriverInfo>> _getDriverInfo(String node) => _rpc(
        node,
        GAllDriversReq((b) => b),
        (result) => result.driverInfo.map(_driverInfoFrom).toList()
          ..sort((DriverInfo a, DriverInfo b) => a.name.compareTo(b.name)),
      );

  // This is the implementation of [DrMem.getDeviceInfo].

  Future<List<DeviceInfo>> _getDeviceInfo({required DevicePattern device}) =>
      _rpc(
          device.node,
          GGetDeviceReq((b) => b
            ..fetchPolicy = FetchPolicy.NetworkOnly
            ..vars.name = device.name),
          _toDevInfoList(device.node));

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
    final (_, Client sub) = _getHandles(dev.node);

    return sub
        .request(GMonitorDeviceReq((b) => b
          ..fetchPolicy = FetchPolicy.NetworkOnly
          ..vars.device = device.name
          ..vars.range = _buildDateRange(startTime, endTime)))
        .where((response) => !response.loading && response.data != null)
        .map(_monDevRespToReading);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
