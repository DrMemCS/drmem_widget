// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_devices.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetAllDevicesData> _$gGetAllDevicesDataSerializer =
    new _$GGetAllDevicesDataSerializer();
Serializer<GGetAllDevicesData_deviceInfo>
    _$gGetAllDevicesDataDeviceInfoSerializer =
    new _$GGetAllDevicesData_deviceInfoSerializer();
Serializer<GGetAllDevicesData_deviceInfo_history>
    _$gGetAllDevicesDataDeviceInfoHistorySerializer =
    new _$GGetAllDevicesData_deviceInfo_historySerializer();
Serializer<GGetAllDevicesData_deviceInfo_history_firstPoint>
    _$gGetAllDevicesDataDeviceInfoHistoryFirstPointSerializer =
    new _$GGetAllDevicesData_deviceInfo_history_firstPointSerializer();
Serializer<GGetAllDevicesData_deviceInfo_history_lastPoint>
    _$gGetAllDevicesDataDeviceInfoHistoryLastPointSerializer =
    new _$GGetAllDevicesData_deviceInfo_history_lastPointSerializer();
Serializer<GGetAllDevicesData_deviceInfo_driver>
    _$gGetAllDevicesDataDeviceInfoDriverSerializer =
    new _$GGetAllDevicesData_deviceInfo_driverSerializer();

class _$GGetAllDevicesDataSerializer
    implements StructuredSerializer<GGetAllDevicesData> {
  @override
  final Iterable<Type> types = const [GGetAllDevicesData, _$GGetAllDevicesData];
  @override
  final String wireName = 'GGetAllDevicesData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAllDevicesData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'deviceInfo',
      serializers.serialize(object.deviceInfo,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GGetAllDevicesData_deviceInfo)])),
    ];

    return result;
  }

  @override
  GGetAllDevicesData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAllDevicesDataBuilder();

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
        case 'deviceInfo':
          result.deviceInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GGetAllDevicesData_deviceInfo)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAllDevicesData_deviceInfoSerializer
    implements StructuredSerializer<GGetAllDevicesData_deviceInfo> {
  @override
  final Iterable<Type> types = const [
    GGetAllDevicesData_deviceInfo,
    _$GGetAllDevicesData_deviceInfo
  ];
  @override
  final String wireName = 'GGetAllDevicesData_deviceInfo';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAllDevicesData_deviceInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'deviceName',
      serializers.serialize(object.deviceName,
          specifiedType: const FullType(String)),
      'settable',
      serializers.serialize(object.settable,
          specifiedType: const FullType(bool)),
      'history',
      serializers.serialize(object.history,
          specifiedType: const FullType(GGetAllDevicesData_deviceInfo_history)),
    ];
    Object? value;
    value = object.units;
    if (value != null) {
      result
        ..add('units')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.driver;
    if (value != null) {
      result
        ..add('driver')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GGetAllDevicesData_deviceInfo_driver)));
    }
    return result;
  }

  @override
  GGetAllDevicesData_deviceInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAllDevicesData_deviceInfoBuilder();

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
        case 'deviceName':
          result.deviceName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'settable':
          result.settable = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'units':
          result.units = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'history':
          result.history.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetAllDevicesData_deviceInfo_history))!
              as GGetAllDevicesData_deviceInfo_history);
          break;
        case 'driver':
          result.driver.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetAllDevicesData_deviceInfo_driver))!
              as GGetAllDevicesData_deviceInfo_driver);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAllDevicesData_deviceInfo_historySerializer
    implements StructuredSerializer<GGetAllDevicesData_deviceInfo_history> {
  @override
  final Iterable<Type> types = const [
    GGetAllDevicesData_deviceInfo_history,
    _$GGetAllDevicesData_deviceInfo_history
  ];
  @override
  final String wireName = 'GGetAllDevicesData_deviceInfo_history';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAllDevicesData_deviceInfo_history object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'totalPoints',
      serializers.serialize(object.totalPoints,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.firstPoint;
    if (value != null) {
      result
        ..add('firstPoint')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetAllDevicesData_deviceInfo_history_firstPoint)));
    }
    value = object.lastPoint;
    if (value != null) {
      result
        ..add('lastPoint')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GGetAllDevicesData_deviceInfo_history_lastPoint)));
    }
    return result;
  }

  @override
  GGetAllDevicesData_deviceInfo_history deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAllDevicesData_deviceInfo_historyBuilder();

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
        case 'totalPoints':
          result.totalPoints = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'firstPoint':
          result.firstPoint.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetAllDevicesData_deviceInfo_history_firstPoint))!
              as GGetAllDevicesData_deviceInfo_history_firstPoint);
          break;
        case 'lastPoint':
          result.lastPoint.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetAllDevicesData_deviceInfo_history_lastPoint))!
              as GGetAllDevicesData_deviceInfo_history_lastPoint);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAllDevicesData_deviceInfo_history_firstPointSerializer
    implements
        StructuredSerializer<GGetAllDevicesData_deviceInfo_history_firstPoint> {
  @override
  final Iterable<Type> types = const [
    GGetAllDevicesData_deviceInfo_history_firstPoint,
    _$GGetAllDevicesData_deviceInfo_history_firstPoint
  ];
  @override
  final String wireName = 'GGetAllDevicesData_deviceInfo_history_firstPoint';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetAllDevicesData_deviceInfo_history_firstPoint object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'stamp',
      serializers.serialize(object.stamp,
          specifiedType: const FullType(_i2.GDateTimeUtc)),
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
  GGetAllDevicesData_deviceInfo_history_firstPoint deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetAllDevicesData_deviceInfo_history_firstPointBuilder();

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
          result.stamp.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GDateTimeUtc))!
              as _i2.GDateTimeUtc);
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

class _$GGetAllDevicesData_deviceInfo_history_lastPointSerializer
    implements
        StructuredSerializer<GGetAllDevicesData_deviceInfo_history_lastPoint> {
  @override
  final Iterable<Type> types = const [
    GGetAllDevicesData_deviceInfo_history_lastPoint,
    _$GGetAllDevicesData_deviceInfo_history_lastPoint
  ];
  @override
  final String wireName = 'GGetAllDevicesData_deviceInfo_history_lastPoint';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetAllDevicesData_deviceInfo_history_lastPoint object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'stamp',
      serializers.serialize(object.stamp,
          specifiedType: const FullType(_i2.GDateTimeUtc)),
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
  GGetAllDevicesData_deviceInfo_history_lastPoint deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAllDevicesData_deviceInfo_history_lastPointBuilder();

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
          result.stamp.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i2.GDateTimeUtc))!
              as _i2.GDateTimeUtc);
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

class _$GGetAllDevicesData_deviceInfo_driverSerializer
    implements StructuredSerializer<GGetAllDevicesData_deviceInfo_driver> {
  @override
  final Iterable<Type> types = const [
    GGetAllDevicesData_deviceInfo_driver,
    _$GGetAllDevicesData_deviceInfo_driver
  ];
  @override
  final String wireName = 'GGetAllDevicesData_deviceInfo_driver';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetAllDevicesData_deviceInfo_driver object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGetAllDevicesData_deviceInfo_driver deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetAllDevicesData_deviceInfo_driverBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetAllDevicesData extends GGetAllDevicesData {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetAllDevicesData_deviceInfo> deviceInfo;

  factory _$GGetAllDevicesData(
          [void Function(GGetAllDevicesDataBuilder)? updates]) =>
      (new GGetAllDevicesDataBuilder()..update(updates))._build();

  _$GGetAllDevicesData._({required this.G__typename, required this.deviceInfo})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetAllDevicesData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        deviceInfo, r'GGetAllDevicesData', 'deviceInfo');
  }

  @override
  GGetAllDevicesData rebuild(
          void Function(GGetAllDevicesDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAllDevicesDataBuilder toBuilder() =>
      new GGetAllDevicesDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAllDevicesData &&
        G__typename == other.G__typename &&
        deviceInfo == other.deviceInfo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deviceInfo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetAllDevicesData')
          ..add('G__typename', G__typename)
          ..add('deviceInfo', deviceInfo))
        .toString();
  }
}

class GGetAllDevicesDataBuilder
    implements Builder<GGetAllDevicesData, GGetAllDevicesDataBuilder> {
  _$GGetAllDevicesData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetAllDevicesData_deviceInfo>? _deviceInfo;
  ListBuilder<GGetAllDevicesData_deviceInfo> get deviceInfo =>
      _$this._deviceInfo ??= new ListBuilder<GGetAllDevicesData_deviceInfo>();
  set deviceInfo(ListBuilder<GGetAllDevicesData_deviceInfo>? deviceInfo) =>
      _$this._deviceInfo = deviceInfo;

  GGetAllDevicesDataBuilder() {
    GGetAllDevicesData._initializeBuilder(this);
  }

  GGetAllDevicesDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deviceInfo = $v.deviceInfo.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAllDevicesData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAllDevicesData;
  }

  @override
  void update(void Function(GGetAllDevicesDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAllDevicesData build() => _build();

  _$GGetAllDevicesData _build() {
    _$GGetAllDevicesData _$result;
    try {
      _$result = _$v ??
          new _$GGetAllDevicesData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetAllDevicesData', 'G__typename'),
              deviceInfo: deviceInfo.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deviceInfo';
        deviceInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetAllDevicesData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAllDevicesData_deviceInfo extends GGetAllDevicesData_deviceInfo {
  @override
  final String G__typename;
  @override
  final String deviceName;
  @override
  final bool settable;
  @override
  final String? units;
  @override
  final GGetAllDevicesData_deviceInfo_history history;
  @override
  final GGetAllDevicesData_deviceInfo_driver? driver;

  factory _$GGetAllDevicesData_deviceInfo(
          [void Function(GGetAllDevicesData_deviceInfoBuilder)? updates]) =>
      (new GGetAllDevicesData_deviceInfoBuilder()..update(updates))._build();

  _$GGetAllDevicesData_deviceInfo._(
      {required this.G__typename,
      required this.deviceName,
      required this.settable,
      this.units,
      required this.history,
      this.driver})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetAllDevicesData_deviceInfo', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        deviceName, r'GGetAllDevicesData_deviceInfo', 'deviceName');
    BuiltValueNullFieldError.checkNotNull(
        settable, r'GGetAllDevicesData_deviceInfo', 'settable');
    BuiltValueNullFieldError.checkNotNull(
        history, r'GGetAllDevicesData_deviceInfo', 'history');
  }

  @override
  GGetAllDevicesData_deviceInfo rebuild(
          void Function(GGetAllDevicesData_deviceInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAllDevicesData_deviceInfoBuilder toBuilder() =>
      new GGetAllDevicesData_deviceInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAllDevicesData_deviceInfo &&
        G__typename == other.G__typename &&
        deviceName == other.deviceName &&
        settable == other.settable &&
        units == other.units &&
        history == other.history &&
        driver == other.driver;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deviceName.hashCode);
    _$hash = $jc(_$hash, settable.hashCode);
    _$hash = $jc(_$hash, units.hashCode);
    _$hash = $jc(_$hash, history.hashCode);
    _$hash = $jc(_$hash, driver.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetAllDevicesData_deviceInfo')
          ..add('G__typename', G__typename)
          ..add('deviceName', deviceName)
          ..add('settable', settable)
          ..add('units', units)
          ..add('history', history)
          ..add('driver', driver))
        .toString();
  }
}

class GGetAllDevicesData_deviceInfoBuilder
    implements
        Builder<GGetAllDevicesData_deviceInfo,
            GGetAllDevicesData_deviceInfoBuilder> {
  _$GGetAllDevicesData_deviceInfo? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _deviceName;
  String? get deviceName => _$this._deviceName;
  set deviceName(String? deviceName) => _$this._deviceName = deviceName;

  bool? _settable;
  bool? get settable => _$this._settable;
  set settable(bool? settable) => _$this._settable = settable;

  String? _units;
  String? get units => _$this._units;
  set units(String? units) => _$this._units = units;

  GGetAllDevicesData_deviceInfo_historyBuilder? _history;
  GGetAllDevicesData_deviceInfo_historyBuilder get history =>
      _$this._history ??= new GGetAllDevicesData_deviceInfo_historyBuilder();
  set history(GGetAllDevicesData_deviceInfo_historyBuilder? history) =>
      _$this._history = history;

  GGetAllDevicesData_deviceInfo_driverBuilder? _driver;
  GGetAllDevicesData_deviceInfo_driverBuilder get driver =>
      _$this._driver ??= new GGetAllDevicesData_deviceInfo_driverBuilder();
  set driver(GGetAllDevicesData_deviceInfo_driverBuilder? driver) =>
      _$this._driver = driver;

  GGetAllDevicesData_deviceInfoBuilder() {
    GGetAllDevicesData_deviceInfo._initializeBuilder(this);
  }

  GGetAllDevicesData_deviceInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deviceName = $v.deviceName;
      _settable = $v.settable;
      _units = $v.units;
      _history = $v.history.toBuilder();
      _driver = $v.driver?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAllDevicesData_deviceInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAllDevicesData_deviceInfo;
  }

  @override
  void update(void Function(GGetAllDevicesData_deviceInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAllDevicesData_deviceInfo build() => _build();

  _$GGetAllDevicesData_deviceInfo _build() {
    _$GGetAllDevicesData_deviceInfo _$result;
    try {
      _$result = _$v ??
          new _$GGetAllDevicesData_deviceInfo._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetAllDevicesData_deviceInfo', 'G__typename'),
              deviceName: BuiltValueNullFieldError.checkNotNull(
                  deviceName, r'GGetAllDevicesData_deviceInfo', 'deviceName'),
              settable: BuiltValueNullFieldError.checkNotNull(
                  settable, r'GGetAllDevicesData_deviceInfo', 'settable'),
              units: units,
              history: history.build(),
              driver: _driver?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'history';
        history.build();
        _$failedField = 'driver';
        _driver?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetAllDevicesData_deviceInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAllDevicesData_deviceInfo_history
    extends GGetAllDevicesData_deviceInfo_history {
  @override
  final String G__typename;
  @override
  final int totalPoints;
  @override
  final GGetAllDevicesData_deviceInfo_history_firstPoint? firstPoint;
  @override
  final GGetAllDevicesData_deviceInfo_history_lastPoint? lastPoint;

  factory _$GGetAllDevicesData_deviceInfo_history(
          [void Function(GGetAllDevicesData_deviceInfo_historyBuilder)?
              updates]) =>
      (new GGetAllDevicesData_deviceInfo_historyBuilder()..update(updates))
          ._build();

  _$GGetAllDevicesData_deviceInfo_history._(
      {required this.G__typename,
      required this.totalPoints,
      this.firstPoint,
      this.lastPoint})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetAllDevicesData_deviceInfo_history', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        totalPoints, r'GGetAllDevicesData_deviceInfo_history', 'totalPoints');
  }

  @override
  GGetAllDevicesData_deviceInfo_history rebuild(
          void Function(GGetAllDevicesData_deviceInfo_historyBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAllDevicesData_deviceInfo_historyBuilder toBuilder() =>
      new GGetAllDevicesData_deviceInfo_historyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAllDevicesData_deviceInfo_history &&
        G__typename == other.G__typename &&
        totalPoints == other.totalPoints &&
        firstPoint == other.firstPoint &&
        lastPoint == other.lastPoint;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, totalPoints.hashCode);
    _$hash = $jc(_$hash, firstPoint.hashCode);
    _$hash = $jc(_$hash, lastPoint.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GGetAllDevicesData_deviceInfo_history')
          ..add('G__typename', G__typename)
          ..add('totalPoints', totalPoints)
          ..add('firstPoint', firstPoint)
          ..add('lastPoint', lastPoint))
        .toString();
  }
}

class GGetAllDevicesData_deviceInfo_historyBuilder
    implements
        Builder<GGetAllDevicesData_deviceInfo_history,
            GGetAllDevicesData_deviceInfo_historyBuilder> {
  _$GGetAllDevicesData_deviceInfo_history? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _totalPoints;
  int? get totalPoints => _$this._totalPoints;
  set totalPoints(int? totalPoints) => _$this._totalPoints = totalPoints;

  GGetAllDevicesData_deviceInfo_history_firstPointBuilder? _firstPoint;
  GGetAllDevicesData_deviceInfo_history_firstPointBuilder get firstPoint =>
      _$this._firstPoint ??=
          new GGetAllDevicesData_deviceInfo_history_firstPointBuilder();
  set firstPoint(
          GGetAllDevicesData_deviceInfo_history_firstPointBuilder?
              firstPoint) =>
      _$this._firstPoint = firstPoint;

  GGetAllDevicesData_deviceInfo_history_lastPointBuilder? _lastPoint;
  GGetAllDevicesData_deviceInfo_history_lastPointBuilder get lastPoint =>
      _$this._lastPoint ??=
          new GGetAllDevicesData_deviceInfo_history_lastPointBuilder();
  set lastPoint(
          GGetAllDevicesData_deviceInfo_history_lastPointBuilder? lastPoint) =>
      _$this._lastPoint = lastPoint;

  GGetAllDevicesData_deviceInfo_historyBuilder() {
    GGetAllDevicesData_deviceInfo_history._initializeBuilder(this);
  }

  GGetAllDevicesData_deviceInfo_historyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _totalPoints = $v.totalPoints;
      _firstPoint = $v.firstPoint?.toBuilder();
      _lastPoint = $v.lastPoint?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAllDevicesData_deviceInfo_history other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAllDevicesData_deviceInfo_history;
  }

  @override
  void update(
      void Function(GGetAllDevicesData_deviceInfo_historyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAllDevicesData_deviceInfo_history build() => _build();

  _$GGetAllDevicesData_deviceInfo_history _build() {
    _$GGetAllDevicesData_deviceInfo_history _$result;
    try {
      _$result = _$v ??
          new _$GGetAllDevicesData_deviceInfo_history._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetAllDevicesData_deviceInfo_history', 'G__typename'),
              totalPoints: BuiltValueNullFieldError.checkNotNull(totalPoints,
                  r'GGetAllDevicesData_deviceInfo_history', 'totalPoints'),
              firstPoint: _firstPoint?.build(),
              lastPoint: _lastPoint?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'firstPoint';
        _firstPoint?.build();
        _$failedField = 'lastPoint';
        _lastPoint?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetAllDevicesData_deviceInfo_history',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAllDevicesData_deviceInfo_history_firstPoint
    extends GGetAllDevicesData_deviceInfo_history_firstPoint {
  @override
  final String G__typename;
  @override
  final _i2.GDateTimeUtc stamp;
  @override
  final bool? boolValue;
  @override
  final int? intValue;
  @override
  final double? floatValue;
  @override
  final String? stringValue;

  factory _$GGetAllDevicesData_deviceInfo_history_firstPoint(
          [void Function(
                  GGetAllDevicesData_deviceInfo_history_firstPointBuilder)?
              updates]) =>
      (new GGetAllDevicesData_deviceInfo_history_firstPointBuilder()
            ..update(updates))
          ._build();

  _$GGetAllDevicesData_deviceInfo_history_firstPoint._(
      {required this.G__typename,
      required this.stamp,
      this.boolValue,
      this.intValue,
      this.floatValue,
      this.stringValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetAllDevicesData_deviceInfo_history_firstPoint', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        stamp, r'GGetAllDevicesData_deviceInfo_history_firstPoint', 'stamp');
  }

  @override
  GGetAllDevicesData_deviceInfo_history_firstPoint rebuild(
          void Function(GGetAllDevicesData_deviceInfo_history_firstPointBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAllDevicesData_deviceInfo_history_firstPointBuilder toBuilder() =>
      new GGetAllDevicesData_deviceInfo_history_firstPointBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAllDevicesData_deviceInfo_history_firstPoint &&
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
    return (newBuiltValueToStringHelper(
            r'GGetAllDevicesData_deviceInfo_history_firstPoint')
          ..add('G__typename', G__typename)
          ..add('stamp', stamp)
          ..add('boolValue', boolValue)
          ..add('intValue', intValue)
          ..add('floatValue', floatValue)
          ..add('stringValue', stringValue))
        .toString();
  }
}

class GGetAllDevicesData_deviceInfo_history_firstPointBuilder
    implements
        Builder<GGetAllDevicesData_deviceInfo_history_firstPoint,
            GGetAllDevicesData_deviceInfo_history_firstPointBuilder> {
  _$GGetAllDevicesData_deviceInfo_history_firstPoint? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  _i2.GDateTimeUtcBuilder? _stamp;
  _i2.GDateTimeUtcBuilder get stamp =>
      _$this._stamp ??= new _i2.GDateTimeUtcBuilder();
  set stamp(_i2.GDateTimeUtcBuilder? stamp) => _$this._stamp = stamp;

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

  GGetAllDevicesData_deviceInfo_history_firstPointBuilder() {
    GGetAllDevicesData_deviceInfo_history_firstPoint._initializeBuilder(this);
  }

  GGetAllDevicesData_deviceInfo_history_firstPointBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _stamp = $v.stamp.toBuilder();
      _boolValue = $v.boolValue;
      _intValue = $v.intValue;
      _floatValue = $v.floatValue;
      _stringValue = $v.stringValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAllDevicesData_deviceInfo_history_firstPoint other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAllDevicesData_deviceInfo_history_firstPoint;
  }

  @override
  void update(
      void Function(GGetAllDevicesData_deviceInfo_history_firstPointBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAllDevicesData_deviceInfo_history_firstPoint build() => _build();

  _$GGetAllDevicesData_deviceInfo_history_firstPoint _build() {
    _$GGetAllDevicesData_deviceInfo_history_firstPoint _$result;
    try {
      _$result = _$v ??
          new _$GGetAllDevicesData_deviceInfo_history_firstPoint._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetAllDevicesData_deviceInfo_history_firstPoint',
                  'G__typename'),
              stamp: stamp.build(),
              boolValue: boolValue,
              intValue: intValue,
              floatValue: floatValue,
              stringValue: stringValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'stamp';
        stamp.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetAllDevicesData_deviceInfo_history_firstPoint',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAllDevicesData_deviceInfo_history_lastPoint
    extends GGetAllDevicesData_deviceInfo_history_lastPoint {
  @override
  final String G__typename;
  @override
  final _i2.GDateTimeUtc stamp;
  @override
  final bool? boolValue;
  @override
  final int? intValue;
  @override
  final double? floatValue;
  @override
  final String? stringValue;

  factory _$GGetAllDevicesData_deviceInfo_history_lastPoint(
          [void Function(
                  GGetAllDevicesData_deviceInfo_history_lastPointBuilder)?
              updates]) =>
      (new GGetAllDevicesData_deviceInfo_history_lastPointBuilder()
            ..update(updates))
          ._build();

  _$GGetAllDevicesData_deviceInfo_history_lastPoint._(
      {required this.G__typename,
      required this.stamp,
      this.boolValue,
      this.intValue,
      this.floatValue,
      this.stringValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetAllDevicesData_deviceInfo_history_lastPoint', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        stamp, r'GGetAllDevicesData_deviceInfo_history_lastPoint', 'stamp');
  }

  @override
  GGetAllDevicesData_deviceInfo_history_lastPoint rebuild(
          void Function(GGetAllDevicesData_deviceInfo_history_lastPointBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAllDevicesData_deviceInfo_history_lastPointBuilder toBuilder() =>
      new GGetAllDevicesData_deviceInfo_history_lastPointBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAllDevicesData_deviceInfo_history_lastPoint &&
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
    return (newBuiltValueToStringHelper(
            r'GGetAllDevicesData_deviceInfo_history_lastPoint')
          ..add('G__typename', G__typename)
          ..add('stamp', stamp)
          ..add('boolValue', boolValue)
          ..add('intValue', intValue)
          ..add('floatValue', floatValue)
          ..add('stringValue', stringValue))
        .toString();
  }
}

class GGetAllDevicesData_deviceInfo_history_lastPointBuilder
    implements
        Builder<GGetAllDevicesData_deviceInfo_history_lastPoint,
            GGetAllDevicesData_deviceInfo_history_lastPointBuilder> {
  _$GGetAllDevicesData_deviceInfo_history_lastPoint? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  _i2.GDateTimeUtcBuilder? _stamp;
  _i2.GDateTimeUtcBuilder get stamp =>
      _$this._stamp ??= new _i2.GDateTimeUtcBuilder();
  set stamp(_i2.GDateTimeUtcBuilder? stamp) => _$this._stamp = stamp;

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

  GGetAllDevicesData_deviceInfo_history_lastPointBuilder() {
    GGetAllDevicesData_deviceInfo_history_lastPoint._initializeBuilder(this);
  }

  GGetAllDevicesData_deviceInfo_history_lastPointBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _stamp = $v.stamp.toBuilder();
      _boolValue = $v.boolValue;
      _intValue = $v.intValue;
      _floatValue = $v.floatValue;
      _stringValue = $v.stringValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAllDevicesData_deviceInfo_history_lastPoint other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAllDevicesData_deviceInfo_history_lastPoint;
  }

  @override
  void update(
      void Function(GGetAllDevicesData_deviceInfo_history_lastPointBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAllDevicesData_deviceInfo_history_lastPoint build() => _build();

  _$GGetAllDevicesData_deviceInfo_history_lastPoint _build() {
    _$GGetAllDevicesData_deviceInfo_history_lastPoint _$result;
    try {
      _$result = _$v ??
          new _$GGetAllDevicesData_deviceInfo_history_lastPoint._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename,
                  r'GGetAllDevicesData_deviceInfo_history_lastPoint',
                  'G__typename'),
              stamp: stamp.build(),
              boolValue: boolValue,
              intValue: intValue,
              floatValue: floatValue,
              stringValue: stringValue);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'stamp';
        stamp.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetAllDevicesData_deviceInfo_history_lastPoint',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetAllDevicesData_deviceInfo_driver
    extends GGetAllDevicesData_deviceInfo_driver {
  @override
  final String G__typename;
  @override
  final String name;

  factory _$GGetAllDevicesData_deviceInfo_driver(
          [void Function(GGetAllDevicesData_deviceInfo_driverBuilder)?
              updates]) =>
      (new GGetAllDevicesData_deviceInfo_driverBuilder()..update(updates))
          ._build();

  _$GGetAllDevicesData_deviceInfo_driver._(
      {required this.G__typename, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetAllDevicesData_deviceInfo_driver', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GGetAllDevicesData_deviceInfo_driver', 'name');
  }

  @override
  GGetAllDevicesData_deviceInfo_driver rebuild(
          void Function(GGetAllDevicesData_deviceInfo_driverBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetAllDevicesData_deviceInfo_driverBuilder toBuilder() =>
      new GGetAllDevicesData_deviceInfo_driverBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetAllDevicesData_deviceInfo_driver &&
        G__typename == other.G__typename &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetAllDevicesData_deviceInfo_driver')
          ..add('G__typename', G__typename)
          ..add('name', name))
        .toString();
  }
}

class GGetAllDevicesData_deviceInfo_driverBuilder
    implements
        Builder<GGetAllDevicesData_deviceInfo_driver,
            GGetAllDevicesData_deviceInfo_driverBuilder> {
  _$GGetAllDevicesData_deviceInfo_driver? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GGetAllDevicesData_deviceInfo_driverBuilder() {
    GGetAllDevicesData_deviceInfo_driver._initializeBuilder(this);
  }

  GGetAllDevicesData_deviceInfo_driverBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetAllDevicesData_deviceInfo_driver other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetAllDevicesData_deviceInfo_driver;
  }

  @override
  void update(
      void Function(GGetAllDevicesData_deviceInfo_driverBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetAllDevicesData_deviceInfo_driver build() => _build();

  _$GGetAllDevicesData_deviceInfo_driver _build() {
    final _$result = _$v ??
        new _$GGetAllDevicesData_deviceInfo_driver._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetAllDevicesData_deviceInfo_driver', 'G__typename'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GGetAllDevicesData_deviceInfo_driver', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
