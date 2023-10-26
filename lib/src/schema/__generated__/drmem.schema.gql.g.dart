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
    value = object.color;
    if (value != null) {
      result
        ..add('color')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
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
        case 'color':
          result.color.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
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
            specifiedType: const FullType(DateTime)));
    }
    value = object.end;
    if (value != null) {
      result
        ..add('end')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
          result.start = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'end':
          result.end = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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
  @override
  final BuiltList<int>? color;

  factory _$GSettingData([void Function(GSettingDataBuilder)? updates]) =>
      (new GSettingDataBuilder()..update(updates))._build();

  _$GSettingData._({this.Gint, this.flt, this.Gbool, this.str, this.color})
      : super._();

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
        str == other.str &&
        color == other.color;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, Gint.hashCode);
    _$hash = $jc(_$hash, flt.hashCode);
    _$hash = $jc(_$hash, Gbool.hashCode);
    _$hash = $jc(_$hash, str.hashCode);
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSettingData')
          ..add('Gint', Gint)
          ..add('flt', flt)
          ..add('Gbool', Gbool)
          ..add('str', str)
          ..add('color', color))
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

  ListBuilder<int>? _color;
  ListBuilder<int> get color => _$this._color ??= new ListBuilder<int>();
  set color(ListBuilder<int>? color) => _$this._color = color;

  GSettingDataBuilder();

  GSettingDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _Gint = $v.Gint;
      _flt = $v.flt;
      _Gbool = $v.Gbool;
      _str = $v.str;
      _color = $v.color?.toBuilder();
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
    _$GSettingData _$result;
    try {
      _$result = _$v ??
          new _$GSettingData._(
              Gint: Gint,
              flt: flt,
              Gbool: Gbool,
              str: str,
              color: _color?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'color';
        _color?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GSettingData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDateRange extends GDateRange {
  @override
  final DateTime? start;
  @override
  final DateTime? end;

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

  DateTime? _start;
  DateTime? get start => _$this._start;
  set start(DateTime? start) => _$this._start = start;

  DateTime? _end;
  DateTime? get end => _$this._end;
  set end(DateTime? end) => _$this._end = end;

  GDateRangeBuilder();

  GDateRangeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _start = $v.start;
      _end = $v.end;
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
    final _$result = _$v ?? new _$GDateRange._(start: start, end: end);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
