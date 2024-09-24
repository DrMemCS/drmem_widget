// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:drmem_provider/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'get_all_devices.var.gql.g.dart';

abstract class GGetAllDevicesVars
    implements Built<GGetAllDevicesVars, GGetAllDevicesVarsBuilder> {
  GGetAllDevicesVars._();

  factory GGetAllDevicesVars(
          [void Function(GGetAllDevicesVarsBuilder b) updates]) =
      _$GGetAllDevicesVars;

  static Serializer<GGetAllDevicesVars> get serializer =>
      _$gGetAllDevicesVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetAllDevicesVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetAllDevicesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetAllDevicesVars.serializer,
        json,
      );
}
