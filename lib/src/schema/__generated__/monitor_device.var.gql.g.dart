// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitor_device.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMonitorDeviceVars> _$gMonitorDeviceVarsSerializer =
    new _$GMonitorDeviceVarsSerializer();

class _$GMonitorDeviceVarsSerializer
    implements StructuredSerializer<GMonitorDeviceVars> {
  @override
  final Iterable<Type> types = const [GMonitorDeviceVars, _$GMonitorDeviceVars];
  @override
  final String wireName = 'GMonitorDeviceVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GMonitorDeviceVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'device',
      serializers.serialize(object.device,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.range;
    if (value != null) {
      result
        ..add('range')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.GDateRange)));
    }
    return result;
  }

  @override
  GMonitorDeviceVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMonitorDeviceVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'device':
          result.device = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'range':
          result.range.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GDateRange))!
              as _i1.GDateRange);
          break;
      }
    }

    return result.build();
  }
}

class _$GMonitorDeviceVars extends GMonitorDeviceVars {
  @override
  final String device;
  @override
  final _i1.GDateRange? range;

  factory _$GMonitorDeviceVars(
          [void Function(GMonitorDeviceVarsBuilder)? updates]) =>
      (new GMonitorDeviceVarsBuilder()..update(updates))._build();

  _$GMonitorDeviceVars._({required this.device, this.range}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        device, r'GMonitorDeviceVars', 'device');
  }

  @override
  GMonitorDeviceVars rebuild(
          void Function(GMonitorDeviceVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMonitorDeviceVarsBuilder toBuilder() =>
      new GMonitorDeviceVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMonitorDeviceVars &&
        device == other.device &&
        range == other.range;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, device.hashCode);
    _$hash = $jc(_$hash, range.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GMonitorDeviceVars')
          ..add('device', device)
          ..add('range', range))
        .toString();
  }
}

class GMonitorDeviceVarsBuilder
    implements Builder<GMonitorDeviceVars, GMonitorDeviceVarsBuilder> {
  _$GMonitorDeviceVars? _$v;

  String? _device;
  String? get device => _$this._device;
  set device(String? device) => _$this._device = device;

  _i1.GDateRangeBuilder? _range;
  _i1.GDateRangeBuilder get range =>
      _$this._range ??= new _i1.GDateRangeBuilder();
  set range(_i1.GDateRangeBuilder? range) => _$this._range = range;

  GMonitorDeviceVarsBuilder();

  GMonitorDeviceVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _device = $v.device;
      _range = $v.range?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMonitorDeviceVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMonitorDeviceVars;
  }

  @override
  void update(void Function(GMonitorDeviceVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMonitorDeviceVars build() => _build();

  _$GMonitorDeviceVars _build() {
    _$GMonitorDeviceVars _$result;
    try {
      _$result = _$v ??
          new _$GMonitorDeviceVars._(
              device: BuiltValueNullFieldError.checkNotNull(
                  device, r'GMonitorDeviceVars', 'device'),
              range: _range?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'range';
        _range?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GMonitorDeviceVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
