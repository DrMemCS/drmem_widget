// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:drmem_provider/src/schema/__generated__/serializers.gql.dart'
    as _i1;
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i2;

part 'drmem.schema.gql.g.dart';

abstract class GSettingData
    implements Built<GSettingData, GSettingDataBuilder> {
  GSettingData._();

  factory GSettingData([Function(GSettingDataBuilder b) updates]) =
      _$GSettingData;

  @BuiltValueField(wireName: 'int')
  int? get Gint;
  double? get flt;
  @BuiltValueField(wireName: 'bool')
  bool? get Gbool;
  String? get str;
  static Serializer<GSettingData> get serializer => _$gSettingDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSettingData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSettingData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSettingData.serializer,
        json,
      );
}

abstract class GDateTimeUtc
    implements Built<GDateTimeUtc, GDateTimeUtcBuilder> {
  GDateTimeUtc._();

  factory GDateTimeUtc([String? value]) =>
      _$GDateTimeUtc((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDateTimeUtc> get serializer =>
      _i2.DefaultScalarSerializer<GDateTimeUtc>(
          (Object serialized) => GDateTimeUtc((serialized as String?)));
}

abstract class GDateRange implements Built<GDateRange, GDateRangeBuilder> {
  GDateRange._();

  factory GDateRange([Function(GDateRangeBuilder b) updates]) = _$GDateRange;

  GDateTimeUtc? get start;
  GDateTimeUtc? get end;
  static Serializer<GDateRange> get serializer => _$gDateRangeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDateRange.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDateRange? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDateRange.serializer,
        json,
      );
}

const Map<String, Set<String>> possibleTypesMap = {};
