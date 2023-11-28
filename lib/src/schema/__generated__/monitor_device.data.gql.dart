// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:drmem_provider/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'monitor_device.data.gql.g.dart';

abstract class GMonitorDeviceData
    implements Built<GMonitorDeviceData, GMonitorDeviceDataBuilder> {
  GMonitorDeviceData._();

  factory GMonitorDeviceData([Function(GMonitorDeviceDataBuilder b) updates]) =
      _$GMonitorDeviceData;

  static void _initializeBuilder(GMonitorDeviceDataBuilder b) =>
      b..G__typename = 'Subscription';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GMonitorDeviceData_monitorDevice get monitorDevice;
  static Serializer<GMonitorDeviceData> get serializer =>
      _$gMonitorDeviceDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMonitorDeviceData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMonitorDeviceData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMonitorDeviceData.serializer,
        json,
      );
}

abstract class GMonitorDeviceData_monitorDevice
    implements
        Built<GMonitorDeviceData_monitorDevice,
            GMonitorDeviceData_monitorDeviceBuilder> {
  GMonitorDeviceData_monitorDevice._();

  factory GMonitorDeviceData_monitorDevice(
          [Function(GMonitorDeviceData_monitorDeviceBuilder b) updates]) =
      _$GMonitorDeviceData_monitorDevice;

  static void _initializeBuilder(GMonitorDeviceData_monitorDeviceBuilder b) =>
      b..G__typename = 'Reading';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  DateTime get stamp;
  bool? get boolValue;
  int? get intValue;
  double? get floatValue;
  String? get stringValue;
  BuiltList<int>? get colorValue;
  static Serializer<GMonitorDeviceData_monitorDevice> get serializer =>
      _$gMonitorDeviceDataMonitorDeviceSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMonitorDeviceData_monitorDevice.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMonitorDeviceData_monitorDevice? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMonitorDeviceData_monitorDevice.serializer,
        json,
      );
}
