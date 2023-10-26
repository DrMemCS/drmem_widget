// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitor_device.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMonitorDeviceData> _$gMonitorDeviceDataSerializer =
    new _$GMonitorDeviceDataSerializer();
Serializer<GMonitorDeviceData_monitorDevice>
    _$gMonitorDeviceDataMonitorDeviceSerializer =
    new _$GMonitorDeviceData_monitorDeviceSerializer();

class _$GMonitorDeviceDataSerializer
    implements StructuredSerializer<GMonitorDeviceData> {
  @override
  final Iterable<Type> types = const [GMonitorDeviceData, _$GMonitorDeviceData];
  @override
  final String wireName = 'GMonitorDeviceData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GMonitorDeviceData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'monitorDevice',
      serializers.serialize(object.monitorDevice,
          specifiedType: const FullType(GMonitorDeviceData_monitorDevice)),
    ];

    return result;
  }

  @override
  GMonitorDeviceData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMonitorDeviceDataBuilder();

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
        case 'monitorDevice':
          result.monitorDevice.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GMonitorDeviceData_monitorDevice))!
              as GMonitorDeviceData_monitorDevice);
          break;
      }
    }

    return result.build();
  }
}

class _$GMonitorDeviceData_monitorDeviceSerializer
    implements StructuredSerializer<GMonitorDeviceData_monitorDevice> {
  @override
  final Iterable<Type> types = const [
    GMonitorDeviceData_monitorDevice,
    _$GMonitorDeviceData_monitorDevice
  ];
  @override
  final String wireName = 'GMonitorDeviceData_monitorDevice';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GMonitorDeviceData_monitorDevice object,
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
    value = object.colorValue;
    if (value != null) {
      result
        ..add('colorValue')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    return result;
  }

  @override
  GMonitorDeviceData_monitorDevice deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GMonitorDeviceData_monitorDeviceBuilder();

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
        case 'colorValue':
          result.colorValue.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GMonitorDeviceData extends GMonitorDeviceData {
  @override
  final String G__typename;
  @override
  final GMonitorDeviceData_monitorDevice monitorDevice;

  factory _$GMonitorDeviceData(
          [void Function(GMonitorDeviceDataBuilder)? updates]) =>
      (new GMonitorDeviceDataBuilder()..update(updates))._build();

  _$GMonitorDeviceData._(
      {required this.G__typename, required this.monitorDevice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GMonitorDeviceData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        monitorDevice, r'GMonitorDeviceData', 'monitorDevice');
  }

  @override
  GMonitorDeviceData rebuild(
          void Function(GMonitorDeviceDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMonitorDeviceDataBuilder toBuilder() =>
      new GMonitorDeviceDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMonitorDeviceData &&
        G__typename == other.G__typename &&
        monitorDevice == other.monitorDevice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, monitorDevice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GMonitorDeviceData')
          ..add('G__typename', G__typename)
          ..add('monitorDevice', monitorDevice))
        .toString();
  }
}

class GMonitorDeviceDataBuilder
    implements Builder<GMonitorDeviceData, GMonitorDeviceDataBuilder> {
  _$GMonitorDeviceData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GMonitorDeviceData_monitorDeviceBuilder? _monitorDevice;
  GMonitorDeviceData_monitorDeviceBuilder get monitorDevice =>
      _$this._monitorDevice ??= new GMonitorDeviceData_monitorDeviceBuilder();
  set monitorDevice(GMonitorDeviceData_monitorDeviceBuilder? monitorDevice) =>
      _$this._monitorDevice = monitorDevice;

  GMonitorDeviceDataBuilder() {
    GMonitorDeviceData._initializeBuilder(this);
  }

  GMonitorDeviceDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _monitorDevice = $v.monitorDevice.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMonitorDeviceData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMonitorDeviceData;
  }

  @override
  void update(void Function(GMonitorDeviceDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMonitorDeviceData build() => _build();

  _$GMonitorDeviceData _build() {
    _$GMonitorDeviceData _$result;
    try {
      _$result = _$v ??
          new _$GMonitorDeviceData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GMonitorDeviceData', 'G__typename'),
              monitorDevice: monitorDevice.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'monitorDevice';
        monitorDevice.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GMonitorDeviceData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GMonitorDeviceData_monitorDevice
    extends GMonitorDeviceData_monitorDevice {
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
  @override
  final BuiltList<int>? colorValue;

  factory _$GMonitorDeviceData_monitorDevice(
          [void Function(GMonitorDeviceData_monitorDeviceBuilder)? updates]) =>
      (new GMonitorDeviceData_monitorDeviceBuilder()..update(updates))._build();

  _$GMonitorDeviceData_monitorDevice._(
      {required this.G__typename,
      required this.stamp,
      this.boolValue,
      this.intValue,
      this.floatValue,
      this.stringValue,
      this.colorValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GMonitorDeviceData_monitorDevice', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        stamp, r'GMonitorDeviceData_monitorDevice', 'stamp');
  }

  @override
  GMonitorDeviceData_monitorDevice rebuild(
          void Function(GMonitorDeviceData_monitorDeviceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMonitorDeviceData_monitorDeviceBuilder toBuilder() =>
      new GMonitorDeviceData_monitorDeviceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMonitorDeviceData_monitorDevice &&
        G__typename == other.G__typename &&
        stamp == other.stamp &&
        boolValue == other.boolValue &&
        intValue == other.intValue &&
        floatValue == other.floatValue &&
        stringValue == other.stringValue &&
        colorValue == other.colorValue;
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
    _$hash = $jc(_$hash, colorValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GMonitorDeviceData_monitorDevice')
          ..add('G__typename', G__typename)
          ..add('stamp', stamp)
          ..add('boolValue', boolValue)
          ..add('intValue', intValue)
          ..add('floatValue', floatValue)
          ..add('stringValue', stringValue)
          ..add('colorValue', colorValue))
        .toString();
  }
}

class GMonitorDeviceData_monitorDeviceBuilder
    implements
        Builder<GMonitorDeviceData_monitorDevice,
            GMonitorDeviceData_monitorDeviceBuilder> {
  _$GMonitorDeviceData_monitorDevice? _$v;

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

  ListBuilder<int>? _colorValue;
  ListBuilder<int> get colorValue =>
      _$this._colorValue ??= new ListBuilder<int>();
  set colorValue(ListBuilder<int>? colorValue) =>
      _$this._colorValue = colorValue;

  GMonitorDeviceData_monitorDeviceBuilder() {
    GMonitorDeviceData_monitorDevice._initializeBuilder(this);
  }

  GMonitorDeviceData_monitorDeviceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _stamp = $v.stamp;
      _boolValue = $v.boolValue;
      _intValue = $v.intValue;
      _floatValue = $v.floatValue;
      _stringValue = $v.stringValue;
      _colorValue = $v.colorValue?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GMonitorDeviceData_monitorDevice other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMonitorDeviceData_monitorDevice;
  }

  @override
  void update(void Function(GMonitorDeviceData_monitorDeviceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMonitorDeviceData_monitorDevice build() => _build();

  _$GMonitorDeviceData_monitorDevice _build() {
    _$GMonitorDeviceData_monitorDevice _$result;
    try {
      _$result = _$v ??
          new _$GMonitorDeviceData_monitorDevice._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GMonitorDeviceData_monitorDevice', 'G__typename'),
              stamp: BuiltValueNullFieldError.checkNotNull(
                  stamp, r'GMonitorDeviceData_monitorDevice', 'stamp'),
              boolValue: boolValue,
              intValue: intValue,
              floatValue: floatValue,
              stringValue: stringValue,
              colorValue: _colorValue?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'colorValue';
        _colorValue?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GMonitorDeviceData_monitorDevice', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
