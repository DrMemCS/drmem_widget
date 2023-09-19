// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:drmem_provider/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'get_all_devices.data.gql.g.dart';

abstract class GGetAllDevicesData
    implements Built<GGetAllDevicesData, GGetAllDevicesDataBuilder> {
  GGetAllDevicesData._();

  factory GGetAllDevicesData([Function(GGetAllDevicesDataBuilder b) updates]) =
      _$GGetAllDevicesData;

  static void _initializeBuilder(GGetAllDevicesDataBuilder b) =>
      b..G__typename = 'Config';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetAllDevicesData_deviceInfo> get deviceInfo;
  static Serializer<GGetAllDevicesData> get serializer =>
      _$gGetAllDevicesDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAllDevicesData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAllDevicesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAllDevicesData.serializer,
        json,
      );
}

abstract class GGetAllDevicesData_deviceInfo
    implements
        Built<GGetAllDevicesData_deviceInfo,
            GGetAllDevicesData_deviceInfoBuilder> {
  GGetAllDevicesData_deviceInfo._();

  factory GGetAllDevicesData_deviceInfo(
          [Function(GGetAllDevicesData_deviceInfoBuilder b) updates]) =
      _$GGetAllDevicesData_deviceInfo;

  static void _initializeBuilder(GGetAllDevicesData_deviceInfoBuilder b) =>
      b..G__typename = 'DeviceInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get deviceName;
  bool get settable;
  String? get units;
  GGetAllDevicesData_deviceInfo_history get history;
  GGetAllDevicesData_deviceInfo_driver? get driver;
  static Serializer<GGetAllDevicesData_deviceInfo> get serializer =>
      _$gGetAllDevicesDataDeviceInfoSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAllDevicesData_deviceInfo.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAllDevicesData_deviceInfo? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAllDevicesData_deviceInfo.serializer,
        json,
      );
}

abstract class GGetAllDevicesData_deviceInfo_history
    implements
        Built<GGetAllDevicesData_deviceInfo_history,
            GGetAllDevicesData_deviceInfo_historyBuilder> {
  GGetAllDevicesData_deviceInfo_history._();

  factory GGetAllDevicesData_deviceInfo_history(
          [Function(GGetAllDevicesData_deviceInfo_historyBuilder b) updates]) =
      _$GGetAllDevicesData_deviceInfo_history;

  static void _initializeBuilder(
          GGetAllDevicesData_deviceInfo_historyBuilder b) =>
      b..G__typename = 'DeviceHistory';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get totalPoints;
  GGetAllDevicesData_deviceInfo_history_firstPoint? get firstPoint;
  GGetAllDevicesData_deviceInfo_history_lastPoint? get lastPoint;
  static Serializer<GGetAllDevicesData_deviceInfo_history> get serializer =>
      _$gGetAllDevicesDataDeviceInfoHistorySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAllDevicesData_deviceInfo_history.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAllDevicesData_deviceInfo_history? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAllDevicesData_deviceInfo_history.serializer,
        json,
      );
}

abstract class GGetAllDevicesData_deviceInfo_history_firstPoint
    implements
        Built<GGetAllDevicesData_deviceInfo_history_firstPoint,
            GGetAllDevicesData_deviceInfo_history_firstPointBuilder> {
  GGetAllDevicesData_deviceInfo_history_firstPoint._();

  factory GGetAllDevicesData_deviceInfo_history_firstPoint(
      [Function(GGetAllDevicesData_deviceInfo_history_firstPointBuilder b)
          updates]) = _$GGetAllDevicesData_deviceInfo_history_firstPoint;

  static void _initializeBuilder(
          GGetAllDevicesData_deviceInfo_history_firstPointBuilder b) =>
      b..G__typename = 'Reading';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  DateTime get stamp;
  bool? get boolValue;
  int? get intValue;
  double? get floatValue;
  String? get stringValue;
  static Serializer<GGetAllDevicesData_deviceInfo_history_firstPoint>
      get serializer =>
          _$gGetAllDevicesDataDeviceInfoHistoryFirstPointSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAllDevicesData_deviceInfo_history_firstPoint.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAllDevicesData_deviceInfo_history_firstPoint? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAllDevicesData_deviceInfo_history_firstPoint.serializer,
        json,
      );
}

abstract class GGetAllDevicesData_deviceInfo_history_lastPoint
    implements
        Built<GGetAllDevicesData_deviceInfo_history_lastPoint,
            GGetAllDevicesData_deviceInfo_history_lastPointBuilder> {
  GGetAllDevicesData_deviceInfo_history_lastPoint._();

  factory GGetAllDevicesData_deviceInfo_history_lastPoint(
      [Function(GGetAllDevicesData_deviceInfo_history_lastPointBuilder b)
          updates]) = _$GGetAllDevicesData_deviceInfo_history_lastPoint;

  static void _initializeBuilder(
          GGetAllDevicesData_deviceInfo_history_lastPointBuilder b) =>
      b..G__typename = 'Reading';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  DateTime get stamp;
  bool? get boolValue;
  int? get intValue;
  double? get floatValue;
  String? get stringValue;
  static Serializer<GGetAllDevicesData_deviceInfo_history_lastPoint>
      get serializer =>
          _$gGetAllDevicesDataDeviceInfoHistoryLastPointSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAllDevicesData_deviceInfo_history_lastPoint.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAllDevicesData_deviceInfo_history_lastPoint? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAllDevicesData_deviceInfo_history_lastPoint.serializer,
        json,
      );
}

abstract class GGetAllDevicesData_deviceInfo_driver
    implements
        Built<GGetAllDevicesData_deviceInfo_driver,
            GGetAllDevicesData_deviceInfo_driverBuilder> {
  GGetAllDevicesData_deviceInfo_driver._();

  factory GGetAllDevicesData_deviceInfo_driver(
          [Function(GGetAllDevicesData_deviceInfo_driverBuilder b) updates]) =
      _$GGetAllDevicesData_deviceInfo_driver;

  static void _initializeBuilder(
          GGetAllDevicesData_deviceInfo_driverBuilder b) =>
      b..G__typename = 'DriverInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  static Serializer<GGetAllDevicesData_deviceInfo_driver> get serializer =>
      _$gGetAllDevicesDataDeviceInfoDriverSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAllDevicesData_deviceInfo_driver.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGetAllDevicesData_deviceInfo_driver? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAllDevicesData_deviceInfo_driver.serializer,
        json,
      );
}
