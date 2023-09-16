// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:drmem_provider/src/schema/__generated__/driver_info.ast.gql.dart'
    as _i5;
import 'package:drmem_provider/src/schema/__generated__/driver_info.data.gql.dart'
    as _i2;
import 'package:drmem_provider/src/schema/__generated__/driver_info.var.gql.dart'
    as _i3;
import 'package:drmem_provider/src/schema/__generated__/serializers.gql.dart'
    as _i6;
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'driver_info.req.gql.g.dart';

abstract class GAllDriversReq
    implements
        Built<GAllDriversReq, GAllDriversReqBuilder>,
        _i1.OperationRequest<_i2.GAllDriversData, _i3.GAllDriversVars> {
  GAllDriversReq._();

  factory GAllDriversReq([Function(GAllDriversReqBuilder b) updates]) =
      _$GAllDriversReq;

  static void _initializeBuilder(GAllDriversReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'AllDrivers',
    )
    ..executeOnListen = true;
  @override
  _i3.GAllDriversVars get vars;
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
  _i2.GAllDriversData? Function(
    _i2.GAllDriversData?,
    _i2.GAllDriversData?,
  )? get updateResult;
  @override
  _i2.GAllDriversData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GAllDriversData? parseData(Map<String, dynamic> json) =>
      _i2.GAllDriversData.fromJson(json);
  static Serializer<GAllDriversReq> get serializer =>
      _$gAllDriversReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GAllDriversReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAllDriversReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GAllDriversReq.serializer,
        json,
      );
}
