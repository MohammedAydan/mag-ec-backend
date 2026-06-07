// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_shipping_zone_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpsertShippingZoneDto extends UpsertShippingZoneDto {
  @override
  final String name;
  @override
  final BuiltList<String> countryCodes;
  @override
  final bool? isActive;

  factory _$UpsertShippingZoneDto(
          [void Function(UpsertShippingZoneDtoBuilder)? updates]) =>
      (UpsertShippingZoneDtoBuilder()..update(updates))._build();

  _$UpsertShippingZoneDto._(
      {required this.name, required this.countryCodes, this.isActive})
      : super._();
  @override
  UpsertShippingZoneDto rebuild(
          void Function(UpsertShippingZoneDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpsertShippingZoneDtoBuilder toBuilder() =>
      UpsertShippingZoneDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpsertShippingZoneDto &&
        name == other.name &&
        countryCodes == other.countryCodes &&
        isActive == other.isActive;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, countryCodes.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpsertShippingZoneDto')
          ..add('name', name)
          ..add('countryCodes', countryCodes)
          ..add('isActive', isActive))
        .toString();
  }
}

class UpsertShippingZoneDtoBuilder
    implements Builder<UpsertShippingZoneDto, UpsertShippingZoneDtoBuilder> {
  _$UpsertShippingZoneDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _countryCodes;
  ListBuilder<String> get countryCodes =>
      _$this._countryCodes ??= ListBuilder<String>();
  set countryCodes(ListBuilder<String>? countryCodes) =>
      _$this._countryCodes = countryCodes;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  UpsertShippingZoneDtoBuilder() {
    UpsertShippingZoneDto._defaults(this);
  }

  UpsertShippingZoneDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _countryCodes = $v.countryCodes.toBuilder();
      _isActive = $v.isActive;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpsertShippingZoneDto other) {
    _$v = other as _$UpsertShippingZoneDto;
  }

  @override
  void update(void Function(UpsertShippingZoneDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpsertShippingZoneDto build() => _build();

  _$UpsertShippingZoneDto _build() {
    _$UpsertShippingZoneDto _$result;
    try {
      _$result = _$v ??
          _$UpsertShippingZoneDto._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'UpsertShippingZoneDto', 'name'),
            countryCodes: countryCodes.build(),
            isActive: isActive,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'countryCodes';
        countryCodes.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UpsertShippingZoneDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
