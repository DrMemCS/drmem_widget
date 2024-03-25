// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:drmem_provider/src/schema/__generated__/get_all_devices.ast.gql.dart'
    as _i5;
import 'package:drmem_provider/src/schema/__generated__/get_all_devices.data.gql.dart'
    as _i2;
import 'package:drmem_provider/src/schema/__generated__/get_all_devices.var.gql.dart'
    as _i3;
import 'package:drmem_provider/src/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'get_all_devices.req.gql.g.dart';

abstract class GGetAllDevicesReq
    implements
        Built<GGetAllDevicesReq, GGetAllDevicesReqBuilder>,
        _i1.OperationRequest<_i2.GGetAllDevicesData, _i3.GGetAllDevicesVars> {
  GGetAllDevicesReq._();

  factory GGetAllDevicesReq(
          [void Function(GGetAllDevicesReqBuilder b) updates]) =
      _$GGetAllDevicesReq;

  static void _initializeBuilder(GGetAllDevicesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'GetAllDevices',
    )
    ..executeOnListen = true;

  @override
  _i3.GGetAllDevicesVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
        context: context ?? const _i4.Context(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GGetAllDevicesData? Function(
    _i2.GGetAllDevicesData?,
    _i2.GGetAllDevicesData?,
  )? get updateResult;
  @override
  _i2.GGetAllDevicesData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  @BuiltValueField(serialize: false)
  _i4.Context? get context;
  @override
  _i2.GGetAllDevicesData? parseData(Map<String, dynamic> json) =>
      _i2.GGetAllDevicesData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GGetAllDevicesData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GGetAllDevicesData, _i3.GGetAllDevicesVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GGetAllDevicesReq> get serializer =>
      _$gGetAllDevicesReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GGetAllDevicesReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetAllDevicesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GGetAllDevicesReq.serializer,
        json,
      );
}
