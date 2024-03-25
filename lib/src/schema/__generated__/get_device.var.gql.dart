// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:drmem_provider/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'get_device.var.gql.g.dart';

abstract class GGetDeviceVars
    implements Built<GGetDeviceVars, GGetDeviceVarsBuilder> {
  GGetDeviceVars._();

  factory GGetDeviceVars([void Function(GGetDeviceVarsBuilder b) updates]) =
      _$GGetDeviceVars;

  String get name;
  static Serializer<GGetDeviceVars> get serializer =>
      _$gGetDeviceVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetDeviceVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetDeviceVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetDeviceVars.serializer,
        json,
      );
}
