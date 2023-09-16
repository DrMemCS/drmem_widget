// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:drmem_provider/src/schema/__generated__/driver_info.data.gql.dart'
    show GAllDriversData, GAllDriversData_driverInfo;
import 'package:drmem_provider/src/schema/__generated__/driver_info.req.gql.dart'
    show GAllDriversReq;
import 'package:drmem_provider/src/schema/__generated__/driver_info.var.gql.dart'
    show GAllDriversVars;
import 'package:drmem_provider/src/schema/__generated__/drmem.schema.gql.dart'
    show GDateRange, GDateTimeUtc, GSettingData;
import 'package:drmem_provider/src/schema/__generated__/get_all_devices.data.gql.dart'
    show
        GGetAllDevicesData,
        GGetAllDevicesData_deviceInfo,
        GGetAllDevicesData_deviceInfo_driver,
        GGetAllDevicesData_deviceInfo_history,
        GGetAllDevicesData_deviceInfo_history_firstPoint,
        GGetAllDevicesData_deviceInfo_history_lastPoint;
import 'package:drmem_provider/src/schema/__generated__/get_all_devices.req.gql.dart'
    show GGetAllDevicesReq;
import 'package:drmem_provider/src/schema/__generated__/get_all_devices.var.gql.dart'
    show GGetAllDevicesVars;
import 'package:drmem_provider/src/schema/__generated__/get_device.data.gql.dart'
    show
        GGetDeviceData,
        GGetDeviceData_deviceInfo,
        GGetDeviceData_deviceInfo_history,
        GGetDeviceData_deviceInfo_history_firstPoint,
        GGetDeviceData_deviceInfo_history_lastPoint;
import 'package:drmem_provider/src/schema/__generated__/get_device.req.gql.dart'
    show GGetDeviceReq;
import 'package:drmem_provider/src/schema/__generated__/get_device.var.gql.dart'
    show GGetDeviceVars;
import 'package:drmem_provider/src/schema/__generated__/monitor_device.data.gql.dart'
    show GMonitorDeviceData, GMonitorDeviceData_monitorDevice;
import 'package:drmem_provider/src/schema/__generated__/monitor_device.req.gql.dart'
    show GMonitorDeviceReq;
import 'package:drmem_provider/src/schema/__generated__/monitor_device.var.gql.dart'
    show GMonitorDeviceVars;
import 'package:drmem_provider/src/schema/__generated__/set_device.data.gql.dart'
    show GSetDeviceData, GSetDeviceData_setDevice;
import 'package:drmem_provider/src/schema/__generated__/set_device.req.gql.dart'
    show GSetDeviceReq;
import 'package:drmem_provider/src/schema/__generated__/set_device.var.gql.dart'
    show GSetDeviceVars;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAllDriversData,
  GAllDriversData_driverInfo,
  GAllDriversReq,
  GAllDriversVars,
  GDateRange,
  GDateTimeUtc,
  GGetAllDevicesData,
  GGetAllDevicesData_deviceInfo,
  GGetAllDevicesData_deviceInfo_driver,
  GGetAllDevicesData_deviceInfo_history,
  GGetAllDevicesData_deviceInfo_history_firstPoint,
  GGetAllDevicesData_deviceInfo_history_lastPoint,
  GGetAllDevicesReq,
  GGetAllDevicesVars,
  GGetDeviceData,
  GGetDeviceData_deviceInfo,
  GGetDeviceData_deviceInfo_history,
  GGetDeviceData_deviceInfo_history_firstPoint,
  GGetDeviceData_deviceInfo_history_lastPoint,
  GGetDeviceReq,
  GGetDeviceVars,
  GMonitorDeviceData,
  GMonitorDeviceData_monitorDevice,
  GMonitorDeviceReq,
  GMonitorDeviceVars,
  GSetDeviceData,
  GSetDeviceData_setDevice,
  GSetDeviceReq,
  GSetDeviceVars,
  GSettingData,
])
final Serializers serializers = _serializersBuilder.build();
