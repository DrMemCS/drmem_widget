/// Provides a widget to interact with a DrMem node through the client API.
///
/// Near the top of your widget tree, you place an instance of [DrMem]. This
/// widget should be rebuilt as infrequently as possible. It contains a table
/// of known nodes and it maintains connections to them. If this widget gets
/// rebuilt, all of that state needs to be reproduced and will cause jank and
/// extra work on the DrMem node.

library drmem_widget;

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:gql_websocket_link/gql_websocket_link.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
import 'package:built_collection/built_collection.dart';
import 'schema/__generated__/set_device.data.gql.dart';
import 'schema/__generated__/set_device.req.gql.dart';
import 'schema/__generated__/drmem.schema.gql.dart';
import 'schema/__generated__/driver_info.data.gql.dart';
import 'schema/__generated__/driver_info.req.gql.dart';
import 'schema/__generated__/get_device.data.gql.dart';
import 'schema/__generated__/get_device.req.gql.dart';
import 'schema/__generated__/monitor_device.req.gql.dart';

import 'device_value.dart';
import 'device_like.dart';
import 'device_history.dart';
import 'node_info.dart';
import 'reading.dart';
import 'driver_info.dart';
import 'device_info.dart';

typedef _NodeValue = (NodeInfo, Client, Client);
typedef _NodeMap = Map<String, _NodeValue>;

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

    if (oldest != null && newest != null) {
      return DeviceHistory(
          totalPoints,
          fromParams(
              oldest.stamp,
              oldest.boolValue,
              oldest.intValue,
              oldest.floatValue,
              oldest.stringValue,
              oldest.colorValue?.toList()),
          fromParams(
              newest.stamp,
              newest.boolValue,
              newest.intValue,
              newest.floatValue,
              newest.stringValue,
              newest.colorValue?.toList()));
    } else {
      return null;
    }
  }
}

// Create an extension which provides a conversion method only needed by this
// module.

extension on GSetDeviceData_setDevice {
  // Creates a [Reading] value from a GraphQL [setDevice] reply value.

  Reading toReading() => fromParams(stamp, boolValue, intValue, floatValue,
      stringValue, colorValue?.toList());
}

// Creates a [Reading] value from a set of values. This fucntion uses a
// `switch` statement with pattern matching to make sure the parameters
// specify a correctly formatted, single device value.

Reading fromParams(
        DateTime dt, bool? b, int? i, double? d, String? s, List<int>? c) =>
    Reading(
        dt,
        switch ((b, i, d, s, c)) {
          (_, null, null, null, null) when b != null => DevBool(value: b),
          (null, _, null, null, null) when i != null => DevInt(value: i),
          (null, null, _, null, null) when d != null => DevFlt(value: d),
          (null, null, null, _, null) when s != null => DevStr(value: s),
          (null, null, null, null, [int r, int g, int b]) =>
            DevColor(red: r, green: g, blue: b),
          (null, null, null, null, _) when c != null =>
            throw (Exception("wrong number of color components")),
          (null, null, null, null, null) =>
            throw (Exception("reading has no data")),
          _ => throw (Exception("reading has multiple value types"))
        });

// Creates a [DriverInfo] object from a GraphQL [driverInfo] reply value.

DriverInfo _driverInfoFrom(GAllDriversData_driverInfo o) =>
    DriverInfo(o.name, o.summary, o.description);

// This widget implements an inherited model. Each time it's built, it gets a
// snapshot of the known nodes. Widgets that register with it will get rebuilt
// when the associated value changes.

class _DrMemModel extends InheritedModel<String> {
  final _NodeMap nodes;

  const _DrMemModel(this.nodes, {required super.child});

  @override
  bool updateShouldNotify(_DrMemModel oldWidget) =>
      !mapEquals(nodes, oldWidget.nodes);

  @override
  bool updateShouldNotifyDependent(_DrMemModel oldWidget, Set<String> deps) =>
      deps.any((e) => nodes[e] != oldWidget.nodes[e]);
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
  /// The function returns a [Reading] structure echoing the setting and
  /// containing the timestamp of when the setting was applied. Some drivers
  /// will return an error when a setting value is out of range. Other drivers
  /// may accept the value, but clip it to remain in range. See the driver docs
  /// to understand the behavior.

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
}

class _DrMemState extends State<DrMem> {
  // This map holds the GraphQL endpoints for known, DrMem nodes. If the
  // endpoints are `null`, we haven't yet made contact with it.

  late _NodeMap _nodes;

  @override
  void initState() {
    _nodes = {};
    super.initState();
  }

  @override
  void dispose() {
    // Close the connections to DrMem.

    for (final MapEntry(value: (_, a, b)) in _nodes.entries) {
      a.dispose();
      b.dispose();
    }
    super.dispose();
  }

  // Helper function to create the GraphQL query URI.

  static (Uri, Uri) _buildUris(
          {required (String, int) host,
          required String qEnd,
          required String sEnd,
          bool encrypted = false}) =>
      (
        Uri(
          scheme: encrypted ? "https" : "http",
          host: host.$1,
          port: host.$2,
          path: qEnd,
        ),
        Uri(
          scheme: encrypted ? "wss" : "ws",
          host: host.$1,
          port: host.$2,
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

  // The implementation of [DrMem.addNode].

  void _addNode(NodeInfo info) {
    final (qUri, sUri) = _buildUris(
        host: info.addr, qEnd: info.queries, sEnd: info.subscriptions);
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
    final entry = _nodes[node];

    if (entry != null) {
      return (entry.$2, entry.$3);
    } else {
      throw Exception('node `$node` is not known');
    }
  }

  // This internal function generalizes a GraphQL "RPC" call. In the `ferry`
  // GraphQL package, all GraphQL interactions return a stream -- even RPCs.
  // The incoming packets indicate the states the request goes through. This
  // function finds the packet that has the return value and passes it to a
  // translation function to get the final value.

  Future<Result> _rpc<TData, TVars, Result>(String node,
      OperationRequest<TData, TVars> request, Result Function(TData) xlat) {
    final (query, _) = _getHandles(node);

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

  GDateRangeBuilder? _buildDateRange(DateTime? a, DateTime? b) {
    if (a != null && b != null) {
      return GDateRangeBuilder()
        ..start = a
        ..end = b;
    } else {
      return null;
    }
  }

  // The implementation of [DrMem.monitorDevice].

  Stream<Reading> _monitorDevice(Device device,
      {DateTime? startTime, DateTime? endTime}) {
    final dev = _resolve(device);
    final (_, sub) = _getHandles(dev.node!);

    return sub
        .request(GMonitorDeviceReq((b) => b
          ..vars.device = device.name
          ..vars.range = _buildDateRange(startTime, endTime)))
        .where((response) => !response.loading && response.data != null)
        .map((response) => response.data!.monitorDevice)
        .map((data) => _Convert.fromParams(
            data.stamp,
            data.boolValue,
            data.intValue,
            data.floatValue,
            data.stringValue,
            data.colorValue?.toList()));
  }

  @override
  Widget build(BuildContext context) =>
      _DrMemModel({..._nodes}, child: widget.child);
}
