// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:drmem_provider/src/schema/__generated__/monitor_device.ast.gql.dart'
    as _i5;
import 'package:drmem_provider/src/schema/__generated__/monitor_device.data.gql.dart'
    as _i2;
import 'package:drmem_provider/src/schema/__generated__/monitor_device.var.gql.dart'
    as _i3;
import 'package:drmem_provider/src/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'monitor_device.req.gql.g.dart';

abstract class GMonitorDeviceReq
    implements
        Built<GMonitorDeviceReq, GMonitorDeviceReqBuilder>,
        _i1.OperationRequest<_i2.GMonitorDeviceData, _i3.GMonitorDeviceVars> {
  GMonitorDeviceReq._();

  factory GMonitorDeviceReq([Function(GMonitorDeviceReqBuilder b) updates]) =
      _$GMonitorDeviceReq;

  static void _initializeBuilder(GMonitorDeviceReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'MonitorDevice',
    )
    ..executeOnListen = true;
  @override
  _i3.GMonitorDeviceVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GMonitorDeviceData? Function(
    _i2.GMonitorDeviceData?,
    _i2.GMonitorDeviceData?,
  )? get updateResult;
  @override
  _i2.GMonitorDeviceData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GMonitorDeviceData? parseData(Map<String, dynamic> json) =>
      _i2.GMonitorDeviceData.fromJson(json);
  static Serializer<GMonitorDeviceReq> get serializer =>
      _$gMonitorDeviceReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GMonitorDeviceReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMonitorDeviceReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GMonitorDeviceReq.serializer,
        json,
      );
}
