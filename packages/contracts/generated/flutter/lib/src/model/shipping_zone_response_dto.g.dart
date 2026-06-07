// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_zone_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShippingZoneResponseDto extends ShippingZoneResponseDto {
  @override
  final String id;
  @override
  final String key;
  @override
  final String name;
  @override
  final bool isActive;
  @override
  final BuiltList<String> countryCodes;
  @override
  final String updatedAt;

  factory _$ShippingZoneResponseDto(
          [void Function(ShippingZoneResponseDtoBuilder)? updates]) =>
      (ShippingZoneResponseDtoBuilder()..update(updates))._build();

  _$ShippingZoneResponseDto._(
      {required this.id,
      required this.key,
      required this.name,
      required this.isActive,
      required this.countryCodes,
      required this.updatedAt})
      : super._();
  @override
  ShippingZoneResponseDto rebuild(
          void Function(ShippingZoneResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShippingZoneResponseDtoBuilder toBuilder() =>
      ShippingZoneResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShippingZoneResponseDto &&
        id == other.id &&
        key == other.key &&
        name == other.name &&
        isActive == other.isActive &&
        countryCodes == other.countryCodes &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jc(_$hash, countryCodes.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShippingZoneResponseDto')
          ..add('id', id)
          ..add('key', key)
          ..add('name', name)
          ..add('isActive', isActive)
          ..add('countryCodes', countryCodes)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class ShippingZoneResponseDtoBuilder
    implements
        Builder<ShippingZoneResponseDto, ShippingZoneResponseDtoBuilder> {
  _$ShippingZoneResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  ListBuilder<String>? _countryCodes;
  ListBuilder<String> get countryCodes =>
      _$this._countryCodes ??= ListBuilder<String>();
  set countryCodes(ListBuilder<String>? countryCodes) =>
      _$this._countryCodes = countryCodes;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ShippingZoneResponseDtoBuilder() {
    ShippingZoneResponseDto._defaults(this);
  }

  ShippingZoneResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _name = $v.name;
      _isActive = $v.isActive;
      _countryCodes = $v.countryCodes.toBuilder();
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShippingZoneResponseDto other) {
    _$v = other as _$ShippingZoneResponseDto;
  }

  @override
  void update(void Function(ShippingZoneResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShippingZoneResponseDto build() => _build();

  _$ShippingZoneResponseDto _build() {
    _$ShippingZoneResponseDto _$result;
    try {
      _$result = _$v ??
          _$ShippingZoneResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ShippingZoneResponseDto', 'id'),
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'ShippingZoneResponseDto', 'key'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ShippingZoneResponseDto', 'name'),
            isActive: BuiltValueNullFieldError.checkNotNull(
                isActive, r'ShippingZoneResponseDto', 'isActive'),
            countryCodes: countryCodes.build(),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'ShippingZoneResponseDto', 'updatedAt'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'countryCodes';
        countryCodes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ShippingZoneResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
