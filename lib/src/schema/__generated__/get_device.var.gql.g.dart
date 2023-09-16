// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_device.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetDeviceVars> _$gGetDeviceVarsSerializer =
    new _$GGetDeviceVarsSerializer();

class _$GGetDeviceVarsSerializer
    implements StructuredSerializer<GGetDeviceVars> {
  @override
  final Iterable<Type> types = const [GGetDeviceVars, _$GGetDeviceVars];
  @override
  final String wireName = 'GGetDeviceVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetDeviceVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetDeviceVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetDeviceVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDeviceVars extends GGetDeviceVars {
  @override
  final String name;

  factory _$GGetDeviceVars([void Function(GGetDeviceVarsBuilder)? updates]) =>
      (new GGetDeviceVarsBuilder()..update(updates))._build();

  _$GGetDeviceVars._({required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'GGetDeviceVars', 'name');
  }

  @override
  GGetDeviceVars rebuild(void Function(GGetDeviceVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDeviceVarsBuilder toBuilder() =>
      new GGetDeviceVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDeviceVars && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetDeviceVars')..add('name', name))
        .toString();
  }
}

class GGetDeviceVarsBuilder
    implements Builder<GGetDeviceVars, GGetDeviceVarsBuilder> {
  _$GGetDeviceVars? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GGetDeviceVarsBuilder();

  GGetDeviceVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetDeviceVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDeviceVars;
  }

  @override
  void update(void Function(GGetDeviceVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDeviceVars build() => _build();

  _$GGetDeviceVars _build() {
    final _$result = _$v ??
        new _$GGetDeviceVars._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GGetDeviceVars', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
