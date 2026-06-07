// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_catalog_brand_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminCatalogBrandDto extends AdminCatalogBrandDto {
  @override
  final String id;
  @override
  final String key;
  @override
  final String status;
  @override
  final BuiltList<AdminCatalogTranslationDto> translations;

  factory _$AdminCatalogBrandDto(
          [void Function(AdminCatalogBrandDtoBuilder)? updates]) =>
      (AdminCatalogBrandDtoBuilder()..update(updates))._build();

  _$AdminCatalogBrandDto._(
      {required this.id,
      required this.key,
      required this.status,
      required this.translations})
      : super._();
  @override
  AdminCatalogBrandDto rebuild(
          void Function(AdminCatalogBrandDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminCatalogBrandDtoBuilder toBuilder() =>
      AdminCatalogBrandDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminCatalogBrandDto &&
        id == other.id &&
        key == other.key &&
        status == other.status &&
        translations == other.translations;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminCatalogBrandDto')
          ..add('id', id)
          ..add('key', key)
          ..add('status', status)
          ..add('translations', translations))
        .toString();
  }
}

class AdminCatalogBrandDtoBuilder
    implements Builder<AdminCatalogBrandDto, AdminCatalogBrandDtoBuilder> {
  _$AdminCatalogBrandDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  ListBuilder<AdminCatalogTranslationDto>? _translations;
  ListBuilder<AdminCatalogTranslationDto> get translations =>
      _$this._translations ??= ListBuilder<AdminCatalogTranslationDto>();
  set translations(ListBuilder<AdminCatalogTranslationDto>? translations) =>
      _$this._translations = translations;

  AdminCatalogBrandDtoBuilder() {
    AdminCatalogBrandDto._defaults(this);
  }

  AdminCatalogBrandDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _status = $v.status;
      _translations = $v.translations.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminCatalogBrandDto other) {
    _$v = other as _$AdminCatalogBrandDto;
  }

  @override
  void update(void Function(AdminCatalogBrandDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminCatalogBrandDto build() => _build();

  _$AdminCatalogBrandDto _build() {
    _$AdminCatalogBrandDto _$result;
    try {
      _$result = _$v ??
          _$AdminCatalogBrandDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AdminCatalogBrandDto', 'id'),
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'AdminCatalogBrandDto', 'key'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AdminCatalogBrandDto', 'status'),
            translations: translations.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AdminCatalogBrandDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
