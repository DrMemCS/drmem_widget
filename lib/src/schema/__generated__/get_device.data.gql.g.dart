// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_device.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetDeviceData> _$gGetDeviceDataSerializer =
    new _$GGetDeviceDataSerializer();
Serializer<GGetDeviceData_deviceInfo> _$gGetDeviceDataDeviceInfoSerializer =
    new _$GGetDeviceData_deviceInfoSerializer();
Serializer<GGetDeviceData_deviceInfo_history>
    _$gGetDeviceDataDeviceInfoHistorySerializer =
    new _$GGetDeviceData_deviceInfo_historySerializer();
Serializer<GGetDeviceData_deviceInfo_history_firstPoint>
    _$gGetDeviceDataDeviceInfoHistoryFirstPointSerializer =
    new _$GGetDeviceData_deviceInfo_history_firstPointSerializer();
Serializer<GGetDeviceData_deviceInfo_history_lastPoint>
    _$gGetDeviceDataDeviceInfoHistoryLastPointSerializer =
    new _$GGetDeviceData_deviceInfo_history_lastPointSerializer();

class _$GGetDeviceDataSerializer
    implements StructuredSerializer<GGetDeviceData> {
  @override
  final Iterable<Type> types = const [GGetDeviceData, _$GGetDeviceData];
  @override
  final String wireName = 'GGetDeviceData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetDeviceData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'deviceInfo',
      serializers.serialize(object.deviceInfo,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GGetDeviceData_deviceInfo)])),
    ];

    return result;
  }

  @override
  GGetDeviceData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetDeviceDataBuilder();

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
                const FullType(GGetDeviceData_deviceInfo)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDeviceData_deviceInfoSerializer
    implements StructuredSerializer<GGetDeviceData_deviceInfo> {
  @override
  final Iterable<Type> types = const [
    GGetDeviceData_deviceInfo,
    _$GGetDeviceData_deviceInfo
  ];
  @override
  final String wireName = 'GGetDeviceData_deviceInfo';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetDeviceData_deviceInfo object,
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
          specifiedType: const FullType(GGetDeviceData_deviceInfo_history)),
    ];
    Object? value;
    value = object.units;
    if (value != null) {
      result
        ..add('units')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetDeviceData_deviceInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetDeviceData_deviceInfoBuilder();

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
                      const FullType(GGetDeviceData_deviceInfo_history))!
              as GGetDeviceData_deviceInfo_history);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDeviceData_deviceInfo_historySerializer
    implements StructuredSerializer<GGetDeviceData_deviceInfo_history> {
  @override
  final Iterable<Type> types = const [
    GGetDeviceData_deviceInfo_history,
    _$GGetDeviceData_deviceInfo_history
  ];
  @override
  final String wireName = 'GGetDeviceData_deviceInfo_history';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GGetDeviceData_deviceInfo_history object,
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
            specifiedType:
                const FullType(GGetDeviceData_deviceInfo_history_firstPoint)));
    }
    value = object.lastPoint;
    if (value != null) {
      result
        ..add('lastPoint')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GGetDeviceData_deviceInfo_history_lastPoint)));
    }
    return result;
  }

  @override
  GGetDeviceData_deviceInfo_history deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetDeviceData_deviceInfo_historyBuilder();

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
                      GGetDeviceData_deviceInfo_history_firstPoint))!
              as GGetDeviceData_deviceInfo_history_firstPoint);
          break;
        case 'lastPoint':
          result.lastPoint.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetDeviceData_deviceInfo_history_lastPoint))!
              as GGetDeviceData_deviceInfo_history_lastPoint);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetDeviceData_deviceInfo_history_firstPointSerializer
    implements
        StructuredSerializer<GGetDeviceData_deviceInfo_history_firstPoint> {
  @override
  final Iterable<Type> types = const [
    GGetDeviceData_deviceInfo_history_firstPoint,
    _$GGetDeviceData_deviceInfo_history_firstPoint
  ];
  @override
  final String wireName = 'GGetDeviceData_deviceInfo_history_firstPoint';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetDeviceData_deviceInfo_history_firstPoint object,
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
  GGetDeviceData_deviceInfo_history_firstPoint deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetDeviceData_deviceInfo_history_firstPointBuilder();

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

class _$GGetDeviceData_deviceInfo_history_lastPointSerializer
    implements
        StructuredSerializer<GGetDeviceData_deviceInfo_history_lastPoint> {
  @override
  final Iterable<Type> types = const [
    GGetDeviceData_deviceInfo_history_lastPoint,
    _$GGetDeviceData_deviceInfo_history_lastPoint
  ];
  @override
  final String wireName = 'GGetDeviceData_deviceInfo_history_lastPoint';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GGetDeviceData_deviceInfo_history_lastPoint object,
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
  GGetDeviceData_deviceInfo_history_lastPoint deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetDeviceData_deviceInfo_history_lastPointBuilder();

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

class _$GGetDeviceData extends GGetDeviceData {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetDeviceData_deviceInfo> deviceInfo;

  factory _$GGetDeviceData([void Function(GGetDeviceDataBuilder)? updates]) =>
      (new GGetDeviceDataBuilder()..update(updates))._build();

  _$GGetDeviceData._({required this.G__typename, required this.deviceInfo})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetDeviceData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        deviceInfo, r'GGetDeviceData', 'deviceInfo');
  }

  @override
  GGetDeviceData rebuild(void Function(GGetDeviceDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDeviceDataBuilder toBuilder() =>
      new GGetDeviceDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDeviceData &&
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
    return (newBuiltValueToStringHelper(r'GGetDeviceData')
          ..add('G__typename', G__typename)
          ..add('deviceInfo', deviceInfo))
        .toString();
  }
}

class GGetDeviceDataBuilder
    implements Builder<GGetDeviceData, GGetDeviceDataBuilder> {
  _$GGetDeviceData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetDeviceData_deviceInfo>? _deviceInfo;
  ListBuilder<GGetDeviceData_deviceInfo> get deviceInfo =>
      _$this._deviceInfo ??= new ListBuilder<GGetDeviceData_deviceInfo>();
  set deviceInfo(ListBuilder<GGetDeviceData_deviceInfo>? deviceInfo) =>
      _$this._deviceInfo = deviceInfo;

  GGetDeviceDataBuilder() {
    GGetDeviceData._initializeBuilder(this);
  }

  GGetDeviceDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deviceInfo = $v.deviceInfo.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetDeviceData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDeviceData;
  }

  @override
  void update(void Function(GGetDeviceDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDeviceData build() => _build();

  _$GGetDeviceData _build() {
    _$GGetDeviceData _$result;
    try {
      _$result = _$v ??
          new _$GGetDeviceData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetDeviceData', 'G__typename'),
              deviceInfo: deviceInfo.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'deviceInfo';
        deviceInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetDeviceData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetDeviceData_deviceInfo extends GGetDeviceData_deviceInfo {
  @override
  final String G__typename;
  @override
  final String deviceName;
  @override
  final bool settable;
  @override
  final String? units;
  @override
  final GGetDeviceData_deviceInfo_history history;

  factory _$GGetDeviceData_deviceInfo(
          [void Function(GGetDeviceData_deviceInfoBuilder)? updates]) =>
      (new GGetDeviceData_deviceInfoBuilder()..update(updates))._build();

  _$GGetDeviceData_deviceInfo._(
      {required this.G__typename,
      required this.deviceName,
      required this.settable,
      this.units,
      required this.history})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetDeviceData_deviceInfo', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        deviceName, r'GGetDeviceData_deviceInfo', 'deviceName');
    BuiltValueNullFieldError.checkNotNull(
        settable, r'GGetDeviceData_deviceInfo', 'settable');
    BuiltValueNullFieldError.checkNotNull(
        history, r'GGetDeviceData_deviceInfo', 'history');
  }

  @override
  GGetDeviceData_deviceInfo rebuild(
          void Function(GGetDeviceData_deviceInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDeviceData_deviceInfoBuilder toBuilder() =>
      new GGetDeviceData_deviceInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDeviceData_deviceInfo &&
        G__typename == other.G__typename &&
        deviceName == other.deviceName &&
        settable == other.settable &&
        units == other.units &&
        history == other.history;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, deviceName.hashCode);
    _$hash = $jc(_$hash, settable.hashCode);
    _$hash = $jc(_$hash, units.hashCode);
    _$hash = $jc(_$hash, history.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetDeviceData_deviceInfo')
          ..add('G__typename', G__typename)
          ..add('deviceName', deviceName)
          ..add('settable', settable)
          ..add('units', units)
          ..add('history', history))
        .toString();
  }
}

class GGetDeviceData_deviceInfoBuilder
    implements
        Builder<GGetDeviceData_deviceInfo, GGetDeviceData_deviceInfoBuilder> {
  _$GGetDeviceData_deviceInfo? _$v;

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

  GGetDeviceData_deviceInfo_historyBuilder? _history;
  GGetDeviceData_deviceInfo_historyBuilder get history =>
      _$this._history ??= new GGetDeviceData_deviceInfo_historyBuilder();
  set history(GGetDeviceData_deviceInfo_historyBuilder? history) =>
      _$this._history = history;

  GGetDeviceData_deviceInfoBuilder() {
    GGetDeviceData_deviceInfo._initializeBuilder(this);
  }

  GGetDeviceData_deviceInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _deviceName = $v.deviceName;
      _settable = $v.settable;
      _units = $v.units;
      _history = $v.history.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetDeviceData_deviceInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDeviceData_deviceInfo;
  }

  @override
  void update(void Function(GGetDeviceData_deviceInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDeviceData_deviceInfo build() => _build();

  _$GGetDeviceData_deviceInfo _build() {
    _$GGetDeviceData_deviceInfo _$result;
    try {
      _$result = _$v ??
          new _$GGetDeviceData_deviceInfo._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GGetDeviceData_deviceInfo', 'G__typename'),
              deviceName: BuiltValueNullFieldError.checkNotNull(
                  deviceName, r'GGetDeviceData_deviceInfo', 'deviceName'),
              settable: BuiltValueNullFieldError.checkNotNull(
                  settable, r'GGetDeviceData_deviceInfo', 'settable'),
              units: units,
              history: history.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'history';
        history.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GGetDeviceData_deviceInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetDeviceData_deviceInfo_history
    extends GGetDeviceData_deviceInfo_history {
  @override
  final String G__typename;
  @override
  final int totalPoints;
  @override
  final GGetDeviceData_deviceInfo_history_firstPoint? firstPoint;
  @override
  final GGetDeviceData_deviceInfo_history_lastPoint? lastPoint;

  factory _$GGetDeviceData_deviceInfo_history(
          [void Function(GGetDeviceData_deviceInfo_historyBuilder)? updates]) =>
      (new GGetDeviceData_deviceInfo_historyBuilder()..update(updates))
          ._build();

  _$GGetDeviceData_deviceInfo_history._(
      {required this.G__typename,
      required this.totalPoints,
      this.firstPoint,
      this.lastPoint})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GGetDeviceData_deviceInfo_history', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        totalPoints, r'GGetDeviceData_deviceInfo_history', 'totalPoints');
  }

  @override
  GGetDeviceData_deviceInfo_history rebuild(
          void Function(GGetDeviceData_deviceInfo_historyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDeviceData_deviceInfo_historyBuilder toBuilder() =>
      new GGetDeviceData_deviceInfo_historyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDeviceData_deviceInfo_history &&
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
    return (newBuiltValueToStringHelper(r'GGetDeviceData_deviceInfo_history')
          ..add('G__typename', G__typename)
          ..add('totalPoints', totalPoints)
          ..add('firstPoint', firstPoint)
          ..add('lastPoint', lastPoint))
        .toString();
  }
}

class GGetDeviceData_deviceInfo_historyBuilder
    implements
        Builder<GGetDeviceData_deviceInfo_history,
            GGetDeviceData_deviceInfo_historyBuilder> {
  _$GGetDeviceData_deviceInfo_history? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _totalPoints;
  int? get totalPoints => _$this._totalPoints;
  set totalPoints(int? totalPoints) => _$this._totalPoints = totalPoints;

  GGetDeviceData_deviceInfo_history_firstPointBuilder? _firstPoint;
  GGetDeviceData_deviceInfo_history_firstPointBuilder get firstPoint =>
      _$this._firstPoint ??=
          new GGetDeviceData_deviceInfo_history_firstPointBuilder();
  set firstPoint(
          GGetDeviceData_deviceInfo_history_firstPointBuilder? firstPoint) =>
      _$this._firstPoint = firstPoint;

  GGetDeviceData_deviceInfo_history_lastPointBuilder? _lastPoint;
  GGetDeviceData_deviceInfo_history_lastPointBuilder get lastPoint =>
      _$this._lastPoint ??=
          new GGetDeviceData_deviceInfo_history_lastPointBuilder();
  set lastPoint(
          GGetDeviceData_deviceInfo_history_lastPointBuilder? lastPoint) =>
      _$this._lastPoint = lastPoint;

  GGetDeviceData_deviceInfo_historyBuilder() {
    GGetDeviceData_deviceInfo_history._initializeBuilder(this);
  }

  GGetDeviceData_deviceInfo_historyBuilder get _$this {
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
  void replace(GGetDeviceData_deviceInfo_history other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDeviceData_deviceInfo_history;
  }

  @override
  void update(
      void Function(GGetDeviceData_deviceInfo_historyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDeviceData_deviceInfo_history build() => _build();

  _$GGetDeviceData_deviceInfo_history _build() {
    _$GGetDeviceData_deviceInfo_history _$result;
    try {
      _$result = _$v ??
          new _$GGetDeviceData_deviceInfo_history._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GGetDeviceData_deviceInfo_history', 'G__typename'),
              totalPoints: BuiltValueNullFieldError.checkNotNull(totalPoints,
                  r'GGetDeviceData_deviceInfo_history', 'totalPoints'),
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
            r'GGetDeviceData_deviceInfo_history', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetDeviceData_deviceInfo_history_firstPoint
    extends GGetDeviceData_deviceInfo_history_firstPoint {
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

  factory _$GGetDeviceData_deviceInfo_history_firstPoint(
          [void Function(GGetDeviceData_deviceInfo_history_firstPointBuilder)?
              updates]) =>
      (new GGetDeviceData_deviceInfo_history_firstPointBuilder()
            ..update(updates))
          ._build();

  _$GGetDeviceData_deviceInfo_history_firstPoint._(
      {required this.G__typename,
      required this.stamp,
      this.boolValue,
      this.intValue,
      this.floatValue,
      this.stringValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetDeviceData_deviceInfo_history_firstPoint', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        stamp, r'GGetDeviceData_deviceInfo_history_firstPoint', 'stamp');
  }

  @override
  GGetDeviceData_deviceInfo_history_firstPoint rebuild(
          void Function(GGetDeviceData_deviceInfo_history_firstPointBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDeviceData_deviceInfo_history_firstPointBuilder toBuilder() =>
      new GGetDeviceData_deviceInfo_history_firstPointBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDeviceData_deviceInfo_history_firstPoint &&
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
            r'GGetDeviceData_deviceInfo_history_firstPoint')
          ..add('G__typename', G__typename)
          ..add('stamp', stamp)
          ..add('boolValue', boolValue)
          ..add('intValue', intValue)
          ..add('floatValue', floatValue)
          ..add('stringValue', stringValue))
        .toString();
  }
}

class GGetDeviceData_deviceInfo_history_firstPointBuilder
    implements
        Builder<GGetDeviceData_deviceInfo_history_firstPoint,
            GGetDeviceData_deviceInfo_history_firstPointBuilder> {
  _$GGetDeviceData_deviceInfo_history_firstPoint? _$v;

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

  GGetDeviceData_deviceInfo_history_firstPointBuilder() {
    GGetDeviceData_deviceInfo_history_firstPoint._initializeBuilder(this);
  }

  GGetDeviceData_deviceInfo_history_firstPointBuilder get _$this {
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
  void replace(GGetDeviceData_deviceInfo_history_firstPoint other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDeviceData_deviceInfo_history_firstPoint;
  }

  @override
  void update(
      void Function(GGetDeviceData_deviceInfo_history_firstPointBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDeviceData_deviceInfo_history_firstPoint build() => _build();

  _$GGetDeviceData_deviceInfo_history_firstPoint _build() {
    final _$result = _$v ??
        new _$GGetDeviceData_deviceInfo_history_firstPoint._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetDeviceData_deviceInfo_history_firstPoint', 'G__typename'),
            stamp: BuiltValueNullFieldError.checkNotNull(stamp,
                r'GGetDeviceData_deviceInfo_history_firstPoint', 'stamp'),
            boolValue: boolValue,
            intValue: intValue,
            floatValue: floatValue,
            stringValue: stringValue);
    replace(_$result);
    return _$result;
  }
}

class _$GGetDeviceData_deviceInfo_history_lastPoint
    extends GGetDeviceData_deviceInfo_history_lastPoint {
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

  factory _$GGetDeviceData_deviceInfo_history_lastPoint(
          [void Function(GGetDeviceData_deviceInfo_history_lastPointBuilder)?
              updates]) =>
      (new GGetDeviceData_deviceInfo_history_lastPointBuilder()
            ..update(updates))
          ._build();

  _$GGetDeviceData_deviceInfo_history_lastPoint._(
      {required this.G__typename,
      required this.stamp,
      this.boolValue,
      this.intValue,
      this.floatValue,
      this.stringValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GGetDeviceData_deviceInfo_history_lastPoint', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        stamp, r'GGetDeviceData_deviceInfo_history_lastPoint', 'stamp');
  }

  @override
  GGetDeviceData_deviceInfo_history_lastPoint rebuild(
          void Function(GGetDeviceData_deviceInfo_history_lastPointBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetDeviceData_deviceInfo_history_lastPointBuilder toBuilder() =>
      new GGetDeviceData_deviceInfo_history_lastPointBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetDeviceData_deviceInfo_history_lastPoint &&
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
            r'GGetDeviceData_deviceInfo_history_lastPoint')
          ..add('G__typename', G__typename)
          ..add('stamp', stamp)
          ..add('boolValue', boolValue)
          ..add('intValue', intValue)
          ..add('floatValue', floatValue)
          ..add('stringValue', stringValue))
        .toString();
  }
}

class GGetDeviceData_deviceInfo_history_lastPointBuilder
    implements
        Builder<GGetDeviceData_deviceInfo_history_lastPoint,
            GGetDeviceData_deviceInfo_history_lastPointBuilder> {
  _$GGetDeviceData_deviceInfo_history_lastPoint? _$v;

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

  GGetDeviceData_deviceInfo_history_lastPointBuilder() {
    GGetDeviceData_deviceInfo_history_lastPoint._initializeBuilder(this);
  }

  GGetDeviceData_deviceInfo_history_lastPointBuilder get _$this {
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
  void replace(GGetDeviceData_deviceInfo_history_lastPoint other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGetDeviceData_deviceInfo_history_lastPoint;
  }

  @override
  void update(
      void Function(GGetDeviceData_deviceInfo_history_lastPointBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetDeviceData_deviceInfo_history_lastPoint build() => _build();

  _$GGetDeviceData_deviceInfo_history_lastPoint _build() {
    final _$result = _$v ??
        new _$GGetDeviceData_deviceInfo_history_lastPoint._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GGetDeviceData_deviceInfo_history_lastPoint', 'G__typename'),
            stamp: BuiltValueNullFieldError.checkNotNull(
                stamp, r'GGetDeviceData_deviceInfo_history_lastPoint', 'stamp'),
            boolValue: boolValue,
            intValue: intValue,
            floatValue: floatValue,
            stringValue: stringValue);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
