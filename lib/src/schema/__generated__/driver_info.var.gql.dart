// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:drmem_provider/src/schema/__generated__/serializers.gql.dart'
    as _i1;

part 'driver_info.var.gql.g.dart';

abstract class GAllDriversVars
    implements Built<GAllDriversVars, GAllDriversVarsBuilder> {
  GAllDriversVars._();

  factory GAllDriversVars([Function(GAllDriversVarsBuilder b) updates]) =
      _$GAllDriversVars;

  static Serializer<GAllDriversVars> get serializer =>
      _$gAllDriversVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAllDriversVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAllDriversVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAllDriversVars.serializer,
        json,
      );
}
