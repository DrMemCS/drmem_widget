// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:drmem_provider/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'set_device.data.gql.g.dart';

abstract class GSetDeviceData
    implements Built<GSetDeviceData, GSetDeviceDataBuilder> {
  GSetDeviceData._();

  factory GSetDeviceData([void Function(GSetDeviceDataBuilder b) updates]) =
      _$GSetDeviceData;

  static void _initializeBuilder(GSetDeviceDataBuilder b) =>
      b..G__typename = 'Control';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GSetDeviceData_setDevice get setDevice;
  static Serializer<GSetDeviceData> get serializer =>
      _$gSetDeviceDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSetDeviceData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSetDeviceData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSetDeviceData.serializer,
        json,
      );
}

abstract class GSetDeviceData_setDevice
    implements
        Built<GSetDeviceData_setDevice, GSetDeviceData_setDeviceBuilder> {
  GSetDeviceData_setDevice._();

  factory GSetDeviceData_setDevice(
          [void Function(GSetDeviceData_setDeviceBuilder b) updates]) =
      _$GSetDeviceData_setDevice;

  static void _initializeBuilder(GSetDeviceData_setDeviceBuilder b) =>
      b..G__typename = 'Reading';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  DateTime get stamp;
  bool? get boolValue;
  int? get intValue;
  double? get floatValue;
  String? get stringValue;
  BuiltList<int>? get colorValue;
  static Serializer<GSetDeviceData_setDevice> get serializer =>
      _$gSetDeviceDataSetDeviceSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSetDeviceData_setDevice.serializer,
        this,
      ) as Map<String, dynamic>);

  static GSetDeviceData_setDevice? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSetDeviceData_setDevice.serializer,
        json,
      );
}
