// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_info.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAllDriversData> _$gAllDriversDataSerializer =
    new _$GAllDriversDataSerializer();
Serializer<GAllDriversData_driverInfo> _$gAllDriversDataDriverInfoSerializer =
    new _$GAllDriversData_driverInfoSerializer();

class _$GAllDriversDataSerializer
    implements StructuredSerializer<GAllDriversData> {
  @override
  final Iterable<Type> types = const [GAllDriversData, _$GAllDriversData];
  @override
  final String wireName = 'GAllDriversData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAllDriversData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'driverInfo',
      serializers.serialize(object.driverInfo,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GAllDriversData_driverInfo)])),
    ];

    return result;
  }

  @override
  GAllDriversData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllDriversDataBuilder();

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
        case 'driverInfo':
          result.driverInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GAllDriversData_driverInfo)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GAllDriversData_driverInfoSerializer
    implements StructuredSerializer<GAllDriversData_driverInfo> {
  @override
  final Iterable<Type> types = const [
    GAllDriversData_driverInfo,
    _$GAllDriversData_driverInfo
  ];
  @override
  final String wireName = 'GAllDriversData_driverInfo';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAllDriversData_driverInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'summary',
      serializers.serialize(object.summary,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAllDriversData_driverInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllDriversData_driverInfoBuilder();

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
        case 'summary':
          result.summary = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAllDriversData extends GAllDriversData {
  @override
  final String G__typename;
  @override
  final BuiltList<GAllDriversData_driverInfo> driverInfo;

  factory _$GAllDriversData([void Function(GAllDriversDataBuilder)? updates]) =>
      (new GAllDriversDataBuilder()..update(updates))._build();

  _$GAllDriversData._({required this.G__typename, required this.driverInfo})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAllDriversData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        driverInfo, r'GAllDriversData', 'driverInfo');
  }

  @override
  GAllDriversData rebuild(void Function(GAllDriversDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllDriversDataBuilder toBuilder() =>
      new GAllDriversDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllDriversData &&
        G__typename == other.G__typename &&
        driverInfo == other.driverInfo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, driverInfo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAllDriversData')
          ..add('G__typename', G__typename)
          ..add('driverInfo', driverInfo))
        .toString();
  }
}

class GAllDriversDataBuilder
    implements Builder<GAllDriversData, GAllDriversDataBuilder> {
  _$GAllDriversData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GAllDriversData_driverInfo>? _driverInfo;
  ListBuilder<GAllDriversData_driverInfo> get driverInfo =>
      _$this._driverInfo ??= new ListBuilder<GAllDriversData_driverInfo>();
  set driverInfo(ListBuilder<GAllDriversData_driverInfo>? driverInfo) =>
      _$this._driverInfo = driverInfo;

  GAllDriversDataBuilder() {
    GAllDriversData._initializeBuilder(this);
  }

  GAllDriversDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _driverInfo = $v.driverInfo.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAllDriversData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAllDriversData;
  }

  @override
  void update(void Function(GAllDriversDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAllDriversData build() => _build();

  _$GAllDriversData _build() {
    _$GAllDriversData _$result;
    try {
      _$result = _$v ??
          new _$GAllDriversData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAllDriversData', 'G__typename'),
              driverInfo: driverInfo.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'driverInfo';
        driverInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAllDriversData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAllDriversData_driverInfo extends GAllDriversData_driverInfo {
  @override
  final String G__typename;
  @override
  final String name;
  @override
  final String summary;
  @override
  final String description;

  factory _$GAllDriversData_driverInfo(
          [void Function(GAllDriversData_driverInfoBuilder)? updates]) =>
      (new GAllDriversData_driverInfoBuilder()..update(updates))._build();

  _$GAllDriversData_driverInfo._(
      {required this.G__typename,
      required this.name,
      required this.summary,
      required this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAllDriversData_driverInfo', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GAllDriversData_driverInfo', 'name');
    BuiltValueNullFieldError.checkNotNull(
        summary, r'GAllDriversData_driverInfo', 'summary');
    BuiltValueNullFieldError.checkNotNull(
        description, r'GAllDriversData_driverInfo', 'description');
  }

  @override
  GAllDriversData_driverInfo rebuild(
          void Function(GAllDriversData_driverInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllDriversData_driverInfoBuilder toBuilder() =>
      new GAllDriversData_driverInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllDriversData_driverInfo &&
        G__typename == other.G__typename &&
        name == other.name &&
        summary == other.summary &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAllDriversData_driverInfo')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('summary', summary)
          ..add('description', description))
        .toString();
  }
}

class GAllDriversData_driverInfoBuilder
    implements
        Builder<GAllDriversData_driverInfo, GAllDriversData_driverInfoBuilder> {
  _$GAllDriversData_driverInfo? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  GAllDriversData_driverInfoBuilder() {
    GAllDriversData_driverInfo._initializeBuilder(this);
  }

  GAllDriversData_driverInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _summary = $v.summary;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAllDriversData_driverInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAllDriversData_driverInfo;
  }

  @override
  void update(void Function(GAllDriversData_driverInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAllDriversData_driverInfo build() => _build();

  _$GAllDriversData_driverInfo _build() {
    final _$result = _$v ??
        new _$GAllDriversData_driverInfo._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GAllDriversData_driverInfo', 'G__typename'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GAllDriversData_driverInfo', 'name'),
            summary: BuiltValueNullFieldError.checkNotNull(
                summary, r'GAllDriversData_driverInfo', 'summary'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'GAllDriversData_driverInfo', 'description'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
