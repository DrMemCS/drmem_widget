// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:drmem_provider/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'get_device.data.gql.g.dart';

abstract class GGetDeviceData
    implements Built<GGetDeviceData, GGetDeviceDataBuilder> {
  GGetDeviceData._();

  factory GGetDeviceData([Function(GGetDeviceDataBuilder b) updates]) =
      _$GGetDeviceData;

  static void _initializeBuilder(GGetDeviceDataBuilder b) =>
      b..G__typename = 'Config';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetDeviceData_deviceInfo> get deviceInfo;
  static Serializer<GGetDeviceData> get serializer =>
      _$gGetDeviceDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDeviceData.serializer,
        json,
      );
}

abstract class GGetDeviceData_deviceInfo
    implements
        Built<GGetDeviceData_deviceInfo, GGetDeviceData_deviceInfoBuilder> {
  GGetDeviceData_deviceInfo._();

  factory GGetDeviceData_deviceInfo(
          [Function(GGetDeviceData_deviceInfoBuilder b) updates]) =
      _$GGetDeviceData_deviceInfo;

  static void _initializeBuilder(GGetDeviceData_deviceInfoBuilder b) =>
      b..G__typename = 'DeviceInfo';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get deviceName;
  bool get settable;
  String? get units;
  GGetDeviceData_deviceInfo_history get history;
  static Serializer<GGetDeviceData_deviceInfo> get serializer =>
      _$gGetDeviceDataDeviceInfoSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceData_deviceInfo.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceData_deviceInfo? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDeviceData_deviceInfo.serializer,
        json,
      );
}

abstract class GGetDeviceData_deviceInfo_history
    implements
        Built<GGetDeviceData_deviceInfo_history,
            GGetDeviceData_deviceInfo_historyBuilder> {
  GGetDeviceData_deviceInfo_history._();

  factory GGetDeviceData_deviceInfo_history(
          [Function(GGetDeviceData_deviceInfo_historyBuilder b) updates]) =
      _$GGetDeviceData_deviceInfo_history;

  static void _initializeBuilder(GGetDeviceData_deviceInfo_historyBuilder b) =>
      b..G__typename = 'DeviceHistory';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get totalPoints;
  GGetDeviceData_deviceInfo_history_firstPoint? get firstPoint;
  GGetDeviceData_deviceInfo_history_lastPoint? get lastPoint;
  static Serializer<GGetDeviceData_deviceInfo_history> get serializer =>
      _$gGetDeviceDataDeviceInfoHistorySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceData_deviceInfo_history.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceData_deviceInfo_history? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDeviceData_deviceInfo_history.serializer,
        json,
      );
}

abstract class GGetDeviceData_deviceInfo_history_firstPoint
    implements
        Built<GGetDeviceData_deviceInfo_history_firstPoint,
            GGetDeviceData_deviceInfo_history_firstPointBuilder> {
  GGetDeviceData_deviceInfo_history_firstPoint._();

  factory GGetDeviceData_deviceInfo_history_firstPoint(
      [Function(GGetDeviceData_deviceInfo_history_firstPointBuilder b)
          updates]) = _$GGetDeviceData_deviceInfo_history_firstPoint;

  static void _initializeBuilder(
          GGetDeviceData_deviceInfo_history_firstPointBuilder b) =>
      b..G__typename = 'Reading';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  DateTime get stamp;
  bool? get boolValue;
  int? get intValue;
  double? get floatValue;
  String? get stringValue;
  BuiltList<int>? get colorValue;
  static Serializer<GGetDeviceData_deviceInfo_history_firstPoint>
      get serializer => _$gGetDeviceDataDeviceInfoHistoryFirstPointSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceData_deviceInfo_history_firstPoint.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceData_deviceInfo_history_firstPoint? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDeviceData_deviceInfo_history_firstPoint.serializer,
        json,
      );
}

abstract class GGetDeviceData_deviceInfo_history_lastPoint
    implements
        Built<GGetDeviceData_deviceInfo_history_lastPoint,
            GGetDeviceData_deviceInfo_history_lastPointBuilder> {
  GGetDeviceData_deviceInfo_history_lastPoint._();

  factory GGetDeviceData_deviceInfo_history_lastPoint(
      [Function(GGetDeviceData_deviceInfo_history_lastPointBuilder b)
          updates]) = _$GGetDeviceData_deviceInfo_history_lastPoint;

  static void _initializeBuilder(
          GGetDeviceData_deviceInfo_history_lastPointBuilder b) =>
      b..G__typename = 'Reading';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  DateTime get stamp;
  bool? get boolValue;
  int? get intValue;
  double? get floatValue;
  String? get stringValue;
  BuiltList<int>? get colorValue;
  static Serializer<GGetDeviceData_deviceInfo_history_lastPoint>
      get serializer => _$gGetDeviceDataDeviceInfoHistoryLastPointSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceData_deviceInfo_history_lastPoint.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceData_deviceInfo_history_lastPoint? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDeviceData_deviceInfo_history_lastPoint.serializer,
        json,
      );
}
