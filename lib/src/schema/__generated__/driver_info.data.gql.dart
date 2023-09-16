// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:drmem_provider/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'driver_info.data.gql.g.dart';

abstract class GAllDriversData
    implements Built<GAllDriversData, GAllDriversDataBuilder> {
  GAllDriversData._();

  factory GAllDriversData([Function(GAllDriversDataBuilder b) updates]) =
      _$GAllDriversData;

  static void _initializeBuilder(GAllDriversDataBuilder b) =>
      b..G__typename = 'Config';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GAllDriversData_driverInfo> get driverInfo;
  static Serializer<GAllDriversData> get serializer =>
      _$gAllDriversDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAllDriversData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAllDriversData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAllDriversData.serializer,
        json,
      );
}

abstract class GAllDriversData_driverInfo
    implements
        Built<GAllDriversData_driverInfo, GAllDriversData_driverInfoBuilder> {
  GAllDriversData_driverInfo._();

  factory GAllDriversData_driverInfo(
          [Function(GAllDriversData_driverInfoBuilder b) updates]) =
      _$GAllDriversData_driverInfo;

  static void _initializeBuilder(GAllDriversData_driverInfoBuilder b) =>
      b..G__typename = 'DriverInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  String get summary;
  String get description;
  static Serializer<GAllDriversData_driverInfo> get serializer =>
      _$gAllDriversDataDriverInfoSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAllDriversData_driverInfo.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAllDriversData_driverInfo? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAllDriversData_driverInfo.serializer,
        json,
      );
}
