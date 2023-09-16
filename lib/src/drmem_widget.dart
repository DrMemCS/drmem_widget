library drmem_widget;

import 'dart:async';
import 'package:flutter/material.dart';
import "package:gql_websocket_link/gql_websocket_link.dart";
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
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
import 'reading.dart';
import 'driver_info.dart';
import 'device_info.dart';

extension on DevValue {
  // Adds a method to the DevValue classes which can convert a value into a
  // builder of [GSettingData]. This is used when a client want to make a
  // setting. Rather than create a different type (which GraphQL requires),
  // this allows an app to use the [DevValue] hierarchy for inputs and outputs.

  GSettingDataBuilder toSettingData() => switch (this) {
        DevBool(value: bool value) => GSettingDataBuilder()..Gbool = value,
        DevInt(value: int value) => GSettingDataBuilder()..Gint = value,
        DevFlt(value: double value) => GSettingDataBuilder()..flt = value,
        DevStr(value: String value) => GSettingDataBuilder()..str = value
      };
}

extension on GGetDeviceData_deviceInfo_history {
// Converts the GraphQL-generated reply type (representing the device's
// historical summary) into a friendlier, Dart version.

  DeviceHistory? toDeviceHistory() {
    if (firstPoint != null && lastPoint != null) {
      final oldest = firstPoint!;
      final newest = lastPoint!;

      return DeviceHistory(
          totalPoints,
          _readingFrom(oldest.stamp, oldest.boolValue, oldest.intValue,
              oldest.floatValue, oldest.stringValue),
          _readingFrom(newest.stamp, newest.boolValue, newest.intValue,
              newest.floatValue, newest.stringValue));
    } else {
      return null;
    }
  }
}

// Creates a [Reading] value from a set of values.

Reading _readingFrom(GDateTimeUtc dt, bool? b, int? i, double? d, String? s) =>
    Reading(
        DateTime.parse(dt.value),
        switch ((b, i, d, s)) {
          (_, null, null, null) when b != null => DevBool(value: b),
          (null, _, null, null) when i != null => DevInt(value: i),
          (null, null, _, null) when d != null => DevFlt(value: d),
          (null, null, null, _) when s != null => DevStr(value: s),
          (null, null, null, null) => throw (Exception("reading has no data")),
          _ => throw (Exception("reading has multiple value types"))
        });

// Creates a [Reading] value from a GraphQL [setDevice] reply value.

Reading _readingFromSetResult(GSetDeviceData_setDevice reply) => _readingFrom(
    reply.stamp,
    reply.boolValue,
    reply.intValue,
    reply.floatValue,
    reply.stringValue);

// Creates a [DriverInfo] object from a GraphQL [driverInfo] reply value.

DriverInfo _driverInfoFrom(GAllDriversData_driverInfo o) =>
    DriverInfo(o.name, o.summary, o.description);

/// The [DrMem] widget implements a "provider" widget for an application's
/// tree. It manages GraphQL connections to registered DrMem nodes. It should be
/// located near the top of the tree so it remains stable during the life of
/// the application.

class DrMem extends InheritedWidget {
  // This map holds the GraphQL endpoints for known, DrMem nodes. If the
  // endpoints are `null`, we haven't yet made contact with it.

  final Map<String, (Client, Client)> _nodes = {};

  /// Creates the widget and associates it with a widget subtree.

  DrMem({required super.child, super.key});

  // Helper function to create the GraphQL query URI.

  static String _buildQueryUri(String host, int port, String qEnd) =>
      Uri(scheme: "http", host: host, port: port, path: qEnd).toString();

  // Helper function to create the GraphQL subscription URI.

  static String _buildSubUri(String host, int port, String sEnd) =>
      Uri(scheme: "ws", host: host, port: port, path: sEnd).toString();

  // Validates a device value by adding a default node, if the node was null,
  // or verifying the node exists if it isn't null.

  Device _resolve(Device dev) {
    switch (dev) {
      case Device(node: null):
        {
          if (_nodes.length == 1) {
            return Device(node: _nodes.keys.first, name: dev.name);
          } else {
            throw Exception("device needs a node specified");
          }
        }
      case Device(node: var node):
        {
          if (_nodes.containsKey(node)) {
            return dev;
          } else {
            throw Exception("device on unknown node, '$node'");
          }
        }
    }
  }

  /// Adds a new node to the table of known DrMem nodes. When this completes,
  /// the application can interact with the node using the rest of the API.
  ///
  /// [name] is the name of the node. On a given subnet, all DrMem node should
  /// have unique names.
  ///
  /// [host] is the IP address of the host.
  ///
  /// [port] is the port number to use.
  ///
  /// [qEnd] is the URL path needed to get to the GraphQL query/mutation
  /// handler.
  ///
  /// [sEnd] is the URL path needed to get to the GraphQL subscription handler.

  void addNode(String name, String host, int port, String qEnd, String sEnd) =>
      _nodes[name] = (
        Client(
            link: HttpLink(_buildQueryUri(host, port, qEnd)), cache: Cache()),
        Client(
            link: WebSocketLink(_buildSubUri(host, port, sEnd),
                reconnectInterval: const Duration(seconds: 1),
                initialPayload: {
                  "headers": {"sec-websocket-protocol": "graphql-ws"}
                }),
            cache: Cache())
      );

  /// Removes a node from the table. The application should make sure that it
  /// has closed all subscriptions to the node because it will receive errors
  /// on any in-flight transactions.

  void removeNode(String name) {
    _nodes.remove(name);
  }

  /// Returns the instance of this class higher up in the widget tree.

  static DrMem of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DrMem>()!;

  // This class only has connections to the nodes so it never has to notify
  // any observers about updates.

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

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
      return entry;
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

  /// Sets a value of a DrMem device.
  ///
  /// The target device must be settable.
  ///
  /// [device] is the name fo the device.
  ///
  /// [value] is the value to set. Most devices enforce a value type. For
  /// instance, "enable" devices are typically boolean. If the incorrect type
  /// is sent, the driver will return an error. See the driver documentation
  /// to see what data type is supported by the device.
  ///
  /// The functon returns a [Reading] structure echoing the setting and
  /// containing the timestamp of when the setting was applied. Some drivers
  /// will return an error when a setting value is out of range. Other drivers
  /// may accept the value, but clip it to remain in range. See the driver docs
  /// to understand the behavior.

  Future<Reading> setDevice(Device device, DevValue value) => _rpc(
      _resolve(device).node!,
      GSetDeviceReq((b) => b
        ..vars.device = device.name
        ..vars.value = value.toSettingData()),
      (result) => _readingFromSetResult(result.setDevice));

  /// Retrieves driver information from a DrMem node.
  ///
  /// Each instance of DrMem interacts with it own set of hardware devices and,
  /// therefore, is built with a custom set of drviers. This function queries
  /// the node for available information on its set of drivers.
  ///
  /// [node] is the name of the DrMem node used when registering it with
  /// [addNode].

  Future<List<DriverInfo>> getDriverInfo(String node) => _rpc(
        node,
        GAllDriversReq((b) => b),
        (result) => result.driverInfo.map(_driverInfoFrom).toList(),
      );

  /// Returns information about a device.
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

  Future<List<DeviceInfo>> getDeviceInfo({required DevicePattern device}) =>
      _rpc(device.node, GGetDeviceReq((b) => b..vars.name = device.name),
          _toDevInfoList);

  // Returns a date builder or `null`, based on the date parameter.

  GDateTimeUtcBuilder? _buildDate(DateTime? dt) {
    if (dt != null) {
      final b = GDateTimeUtcBuilder();

      b.value = dt.toIso8601String();
      return b;
    } else {
      return null;
    }
  }

  // Returns an appropriate GDateRangeBuilder based on the two input dates.
  // In DrMem's GraphQL API, if both dates are `null`, we don't provide a
  // date range (i.e. `null`). Otherwise we return a builder (possibly with
  // one of the date fields `null`.)

  GDateRangeBuilder? _buildDateRange(DateTime? a, DateTime? b) {
    if (a != null && b != null) {
      return GDateRangeBuilder()
        ..start = _buildDate(a)
        ..end = _buildDate(b);
    } else {
      return null;
    }
  }

  /// Returns a stream of readings for a device.
  ///
  /// This method provides many flexible ways to obtain device readings. Some
  /// of these options may be limited, if the DrMem node is using the simple
  /// backend (which only saves one point of history.)
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
  /// `startTime` if reached.
  ///
  /// DrMem's configuration determines the size of a device's history. This
  /// function can only return what's available.
  Stream<Reading> monitorDevice(Device device,
      {DateTime? startTime, DateTime? endTime}) {
    final dev = _resolve(device);
    final (_, sub) = _getHandles(dev.node!);

    return sub
        .request(GMonitorDeviceReq((b) => b
          ..vars.device = device.name
          ..vars.range = _buildDateRange(startTime, endTime)))
        .where((response) => !response.loading && response.data != null)
        .map((response) => response.data!.monitorDevice)
        .map((data) => _readingFrom(data.stamp, data.boolValue, data.intValue,
            data.floatValue, data.stringValue));
  }
}
