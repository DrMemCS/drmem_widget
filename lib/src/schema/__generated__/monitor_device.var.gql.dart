// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:drmem_provider/src/schema/__generated__/drmem.schema.gql.dart'
    as _i1;
import 'package:drmem_provider/src/schema/__generated__/serializers.gql.dart'
    as _i2;

part 'monitor_device.var.gql.g.dart';

abstract class GMonitorDeviceVars
    implements Built<GMonitorDeviceVars, GMonitorDeviceVarsBuilder> {
  GMonitorDeviceVars._();

  factory GMonitorDeviceVars(
          [void Function(GMonitorDeviceVarsBuilder b) updates]) =
      _$GMonitorDeviceVars;

  String get device;
  _i1.GDateRange? get range;
  static Serializer<GMonitorDeviceVars> get serializer =>
      _$gMonitorDeviceVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GMonitorDeviceVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GMonitorDeviceVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GMonitorDeviceVars.serializer,
        json,
      );
}
