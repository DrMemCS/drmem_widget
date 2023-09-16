// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drmem.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSettingData> _$gSettingDataSerializer =
    new _$GSettingDataSerializer();
Serializer<GDateRange> _$gDateRangeSerializer = new _$GDateRangeSerializer();

class _$GSettingDataSerializer implements StructuredSerializer<GSettingData> {
  @override
  final Iterable<Type> types = const [GSettingData, _$GSettingData];
  @override
  final String wireName = 'GSettingData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GSettingData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.Gint;
    if (value != null) {
      result
        ..add('int')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.flt;
    if (value != null) {
      result
        ..add('flt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.Gbool;
    if (value != null) {
      result
        ..add('bool')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.str;
    if (value != null) {
      result
        ..add('str')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GSettingData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSettingDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'int':
          result.Gint = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'flt':
          result.flt = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'bool':
          result.Gbool = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'str':
          result.str = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GDateRangeSerializer implements StructuredSerializer<GDateRange> {
  @override
  final Iterable<Type> types = const [GDateRange, _$GDateRange];
  @override
  final String wireName = 'GDateRange';

  @override
  Iterable<Object?> serialize(Serializers serializers, GDateRange object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.start;
    if (value != null) {
      result
        ..add('start')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTimeUtc)));
    }
    value = object.end;
    if (value != null) {
      result
        ..add('end')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GDateTimeUtc)));
    }
    return result;
  }

  @override
  GDateRange deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GDateRangeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'start':
          result.start.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTimeUtc))! as GDateTimeUtc);
          break;
        case 'end':
          result.end.replace(serializers.deserialize(value,
              specifiedType: const FullType(GDateTimeUtc))! as GDateTimeUtc);
          break;
      }
    }

    return result.build();
  }
}

class _$GSettingData extends GSettingData {
  @override
  final int? Gint;
  @override
  final double? flt;
  @override
  final bool? Gbool;
  @override
  final String? str;

  factory _$GSettingData([void Function(GSettingDataBuilder)? updates]) =>
      (new GSettingDataBuilder()..update(updates))._build();

  _$GSettingData._({this.Gint, this.flt, this.Gbool, this.str}) : super._();

  @override
  GSettingData rebuild(void Function(GSettingDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSettingDataBuilder toBuilder() => new GSettingDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSettingData &&
        Gint == other.Gint &&
        flt == other.flt &&
        Gbool == other.Gbool &&
        str == other.str;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, Gint.hashCode);
    _$hash = $jc(_$hash, flt.hashCode);
    _$hash = $jc(_$hash, Gbool.hashCode);
    _$hash = $jc(_$hash, str.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSettingData')
          ..add('Gint', Gint)
          ..add('flt', flt)
          ..add('Gbool', Gbool)
          ..add('str', str))
        .toString();
  }
}

class GSettingDataBuilder
    implements Builder<GSettingData, GSettingDataBuilder> {
  _$GSettingData? _$v;

  int? _Gint;
  int? get Gint => _$this._Gint;
  set Gint(int? Gint) => _$this._Gint = Gint;

  double? _flt;
  double? get flt => _$this._flt;
  set flt(double? flt) => _$this._flt = flt;

  bool? _Gbool;
  bool? get Gbool => _$this._Gbool;
  set Gbool(bool? Gbool) => _$this._Gbool = Gbool;

  String? _str;
  String? get str => _$this._str;
  set str(String? str) => _$this._str = str;

  GSettingDataBuilder();

  GSettingDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Gint = $v.Gint;
      _flt = $v.flt;
      _Gbool = $v.Gbool;
      _str = $v.str;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSettingData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSettingData;
  }

  @override
  void update(void Function(GSettingDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSettingData build() => _build();

  _$GSettingData _build() {
    final _$result = _$v ??
        new _$GSettingData._(Gint: Gint, flt: flt, Gbool: Gbool, str: str);
    replace(_$result);
    return _$result;
  }
}

class _$GDateTimeUtc extends GDateTimeUtc {
  @override
  final String value;

  factory _$GDateTimeUtc([void Function(GDateTimeUtcBuilder)? updates]) =>
      (new GDateTimeUtcBuilder()..update(updates))._build();

  _$GDateTimeUtc._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'GDateTimeUtc', 'value');
  }

  @override
  GDateTimeUtc rebuild(void Function(GDateTimeUtcBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDateTimeUtcBuilder toBuilder() => new GDateTimeUtcBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDateTimeUtc && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDateTimeUtc')..add('value', value))
        .toString();
  }
}

class GDateTimeUtcBuilder
    implements Builder<GDateTimeUtc, GDateTimeUtcBuilder> {
  _$GDateTimeUtc? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GDateTimeUtcBuilder();

  GDateTimeUtcBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDateTimeUtc other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDateTimeUtc;
  }

  @override
  void update(void Function(GDateTimeUtcBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDateTimeUtc build() => _build();

  _$GDateTimeUtc _build() {
    final _$result = _$v ??
        new _$GDateTimeUtc._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'GDateTimeUtc', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GDateRange extends GDateRange {
  @override
  final GDateTimeUtc? start;
  @override
  final GDateTimeUtc? end;

  factory _$GDateRange([void Function(GDateRangeBuilder)? updates]) =>
      (new GDateRangeBuilder()..update(updates))._build();

  _$GDateRange._({this.start, this.end}) : super._();

  @override
  GDateRange rebuild(void Function(GDateRangeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDateRangeBuilder toBuilder() => new GDateRangeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDateRange && start == other.start && end == other.end;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, start.hashCode);
    _$hash = $jc(_$hash, end.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GDateRange')
          ..add('start', start)
          ..add('end', end))
        .toString();
  }
}

class GDateRangeBuilder implements Builder<GDateRange, GDateRangeBuilder> {
  _$GDateRange? _$v;

  GDateTimeUtcBuilder? _start;
  GDateTimeUtcBuilder get start => _$this._start ??= new GDateTimeUtcBuilder();
  set start(GDateTimeUtcBuilder? start) => _$this._start = start;

  GDateTimeUtcBuilder? _end;
  GDateTimeUtcBuilder get end => _$this._end ??= new GDateTimeUtcBuilder();
  set end(GDateTimeUtcBuilder? end) => _$this._end = end;

  GDateRangeBuilder();

  GDateRangeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _start = $v.start?.toBuilder();
      _end = $v.end?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDateRange other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GDateRange;
  }

  @override
  void update(void Function(GDateRangeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GDateRange build() => _build();

  _$GDateRange _build() {
    _$GDateRange _$result;
    try {
      _$result =
          _$v ?? new _$GDateRange._(start: _start?.build(), end: _end?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'start';
        _start?.build();
        _$failedField = 'end';
        _end?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GDateRange', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
