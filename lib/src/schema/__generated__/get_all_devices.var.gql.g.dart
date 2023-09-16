// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_devices.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetAllDevicesVars> _$gGetAllDevicesVarsSerializer =
    new _$GGetAllDevicesVarsSerializer();

class _$GGetAllDevicesVarsSerializer
    implements StructuredSerializer<GGetAllDevicesVars> {
  @override
  final Iterable<Type> types = const [GGetAllDevicesVars, _$GGetAllDevicesVars];
  @override
  final String wireName = 'GGetAllDevicesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAllDevicesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GGetAllDevicesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GGetAllDevicesVarsBuilder().build();
  }
}

class _$GGetAllDevicesVars extends GGetAllDevicesVars {
  factory _$GGetAllDevicesVars(
          [void Function(GGetAllDevicesVarsBuilder)? updates]) =>
      (new GGetAllDevicesVarsBuilder()..update(updates))._build();

  _$GGetAllDevicesVars._() : super._();

  @override
  GGetAllDevicesVars rebuild(
          void Function(GGetAllDevicesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAllDevicesVarsBuilder toBuilder() =>
      new GGetAllDevicesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAllDevicesVars;
  }

  @override
  int get hashCode {
    return 884068363;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GGetAllDevicesVars').toString();
  }
}

class GGetAllDevicesVarsBuilder
    implements Builder<GGetAllDevicesVars, GGetAllDevicesVarsBuilder> {
  _$GGetAllDevicesVars? _$v;

  GGetAllDevicesVarsBuilder();

  @override
  void replace(GGetAllDevicesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAllDevicesVars;
  }

  @override
  void update(void Function(GGetAllDevicesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAllDevicesVars build() => _build();

  _$GGetAllDevicesVars _build() {
    final _$result = _$v ?? new _$GGetAllDevicesVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
