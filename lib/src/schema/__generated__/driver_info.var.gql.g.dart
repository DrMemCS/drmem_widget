// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_info.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAllDriversVars> _$gAllDriversVarsSerializer =
    new _$GAllDriversVarsSerializer();

class _$GAllDriversVarsSerializer
    implements StructuredSerializer<GAllDriversVars> {
  @override
  final Iterable<Type> types = const [GAllDriversVars, _$GAllDriversVars];
  @override
  final String wireName = 'GAllDriversVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAllDriversVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GAllDriversVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GAllDriversVarsBuilder().build();
  }
}

class _$GAllDriversVars extends GAllDriversVars {
  factory _$GAllDriversVars([void Function(GAllDriversVarsBuilder)? updates]) =>
      (new GAllDriversVarsBuilder()..update(updates))._build();

  _$GAllDriversVars._() : super._();

  @override
  GAllDriversVars rebuild(void Function(GAllDriversVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllDriversVarsBuilder toBuilder() =>
      new GAllDriversVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllDriversVars;
  }

  @override
  int get hashCode {
    return 936373161;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GAllDriversVars').toString();
  }
}

class GAllDriversVarsBuilder
    implements Builder<GAllDriversVars, GAllDriversVarsBuilder> {
  _$GAllDriversVars? _$v;

  GAllDriversVarsBuilder();

  @override
  void replace(GAllDriversVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAllDriversVars;
  }

  @override
  void update(void Function(GAllDriversVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAllDriversVars build() => _build();

  _$GAllDriversVars _build() {
    final _$result = _$v ?? new _$GAllDriversVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
