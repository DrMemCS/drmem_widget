// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_device.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GSetDeviceData> _$gSetDeviceDataSerializer =
    new _$GSetDeviceDataSerializer();
Serializer<GSetDeviceData_setDevice> _$gSetDeviceDataSetDeviceSerializer =
    new _$GSetDeviceData_setDeviceSerializer();

class _$GSetDeviceDataSerializer
    implements StructuredSerializer<GSetDeviceData> {
  @override
  final Iterable<Type> types = const [GSetDeviceData, _$GSetDeviceData];
  @override
  final String wireName = 'GSetDeviceData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GSetDeviceData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'setDevice',
      serializers.serialize(object.setDevice,
          specifiedType: const FullType(GSetDeviceData_setDevice)),
    ];

    return result;
  }

  @override
  GSetDeviceData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSetDeviceDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'setDevice':
          result.setDevice.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GSetDeviceData_setDevice))!
              as GSetDeviceData_setDevice);
          break;
      }
    }

    return result.build();
  }
}

class _$GSetDeviceData_setDeviceSerializer
    implements StructuredSerializer<GSetDeviceData_setDevice> {
  @override
  final Iterable<Type> types = const [
    GSetDeviceData_setDevice,
    _$GSetDeviceData_setDevice
  ];
  @override
  final String wireName = 'GSetDeviceData_setDevice';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GSetDeviceData_setDevice object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'stamp',
      serializers.serialize(object.stamp,
          specifiedType: const FullType(DateTime)),
    ];
    Object? value;
    value = object.boolValue;
    if (value != null) {
      result
        ..add('boolValue')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.intValue;
    if (value != null) {
      result
        ..add('intValue')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.floatValue;
    if (value != null) {
      result
        ..add('floatValue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.stringValue;
    if (value != null) {
      result
        ..add('stringValue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GSetDeviceData_setDevice deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GSetDeviceData_setDeviceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'stamp':
          result.stamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'boolValue':
          result.boolValue = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'intValue':
          result.intValue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'floatValue':
          result.floatValue = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'stringValue':
          result.stringValue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GSetDeviceData extends GSetDeviceData {
  @override
  final String G__typename;
  @override
  final GSetDeviceData_setDevice setDevice;

  factory _$GSetDeviceData([void Function(GSetDeviceDataBuilder)? updates]) =>
      (new GSetDeviceDataBuilder()..update(updates))._build();

  _$GSetDeviceData._({required this.G__typename, required this.setDevice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSetDeviceData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        setDevice, r'GSetDeviceData', 'setDevice');
  }

  @override
  GSetDeviceData rebuild(void Function(GSetDeviceDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSetDeviceDataBuilder toBuilder() =>
      new GSetDeviceDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSetDeviceData &&
        G__typename == other.G__typename &&
        setDevice == other.setDevice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, setDevice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSetDeviceData')
          ..add('G__typename', G__typename)
          ..add('setDevice', setDevice))
        .toString();
  }
}

class GSetDeviceDataBuilder
    implements Builder<GSetDeviceData, GSetDeviceDataBuilder> {
  _$GSetDeviceData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GSetDeviceData_setDeviceBuilder? _setDevice;
  GSetDeviceData_setDeviceBuilder get setDevice =>
      _$this._setDevice ??= new GSetDeviceData_setDeviceBuilder();
  set setDevice(GSetDeviceData_setDeviceBuilder? setDevice) =>
      _$this._setDevice = setDevice;

  GSetDeviceDataBuilder() {
    GSetDeviceData._initializeBuilder(this);
  }

  GSetDeviceDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _setDevice = $v.setDevice.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSetDeviceData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSetDeviceData;
  }

  @override
  void update(void Function(GSetDeviceDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSetDeviceData build() => _build();

  _$GSetDeviceData _build() {
    _$GSetDeviceData _$result;
    try {
      _$result = _$v ??
          new _$GSetDeviceData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GSetDeviceData', 'G__typename'),
              setDevice: setDevice.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'setDevice';
        setDevice.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GSetDeviceData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GSetDeviceData_setDevice extends GSetDeviceData_setDevice {
  @override
  final String G__typename;
  @override
  final DateTime stamp;
  @override
  final bool? boolValue;
  @override
  final int? intValue;
  @override
  final double? floatValue;
  @override
  final String? stringValue;

  factory _$GSetDeviceData_setDevice(
          [void Function(GSetDeviceData_setDeviceBuilder)? updates]) =>
      (new GSetDeviceData_setDeviceBuilder()..update(updates))._build();

  _$GSetDeviceData_setDevice._(
      {required this.G__typename,
      required this.stamp,
      this.boolValue,
      this.intValue,
      this.floatValue,
      this.stringValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GSetDeviceData_setDevice', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        stamp, r'GSetDeviceData_setDevice', 'stamp');
  }

  @override
  GSetDeviceData_setDevice rebuild(
          void Function(GSetDeviceData_setDeviceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GSetDeviceData_setDeviceBuilder toBuilder() =>
      new GSetDeviceData_setDeviceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GSetDeviceData_setDevice &&
        G__typename == other.G__typename &&
        stamp == other.stamp &&
        boolValue == other.boolValue &&
        intValue == other.intValue &&
        floatValue == other.floatValue &&
        stringValue == other.stringValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, stamp.hashCode);
    _$hash = $jc(_$hash, boolValue.hashCode);
    _$hash = $jc(_$hash, intValue.hashCode);
    _$hash = $jc(_$hash, floatValue.hashCode);
    _$hash = $jc(_$hash, stringValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GSetDeviceData_setDevice')
          ..add('G__typename', G__typename)
          ..add('stamp', stamp)
          ..add('boolValue', boolValue)
          ..add('intValue', intValue)
          ..add('floatValue', floatValue)
          ..add('stringValue', stringValue))
        .toString();
  }
}

class GSetDeviceData_setDeviceBuilder
    implements
        Builder<GSetDeviceData_setDevice, GSetDeviceData_setDeviceBuilder> {
  _$GSetDeviceData_setDevice? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  DateTime? _stamp;
  DateTime? get stamp => _$this._stamp;
  set stamp(DateTime? stamp) => _$this._stamp = stamp;

  bool? _boolValue;
  bool? get boolValue => _$this._boolValue;
  set boolValue(bool? boolValue) => _$this._boolValue = boolValue;

  int? _intValue;
  int? get intValue => _$this._intValue;
  set intValue(int? intValue) => _$this._intValue = intValue;

  double? _floatValue;
  double? get floatValue => _$this._floatValue;
  set floatValue(double? floatValue) => _$this._floatValue = floatValue;

  String? _stringValue;
  String? get stringValue => _$this._stringValue;
  set stringValue(String? stringValue) => _$this._stringValue = stringValue;

  GSetDeviceData_setDeviceBuilder() {
    GSetDeviceData_setDevice._initializeBuilder(this);
  }

  GSetDeviceData_setDeviceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _stamp = $v.stamp;
      _boolValue = $v.boolValue;
      _intValue = $v.intValue;
      _floatValue = $v.floatValue;
      _stringValue = $v.stringValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GSetDeviceData_setDevice other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GSetDeviceData_setDevice;
  }

  @override
  void update(void Function(GSetDeviceData_setDeviceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GSetDeviceData_setDevice build() => _build();

  _$GSetDeviceData_setDevice _build() {
    final _$result = _$v ??
        new _$GSetDeviceData_setDevice._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GSetDeviceData_setDevice', 'G__typename'),
            stamp: BuiltValueNullFieldError.checkNotNull(
                stamp, r'GSetDeviceData_setDevice', 'stamp'),
            boolValue: boolValue,
            intValue: intValue,
            floatValue: floatValue,
            stringValue: stringValue);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
