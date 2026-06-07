// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_catalog_product_type_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminCatalogProductTypeDto extends AdminCatalogProductTypeDto {
  @override
  final String id;
  @override
  final String key;
  @override
  final String status;
  @override
  final num sortOrder;
  @override
  final BuiltList<AdminCatalogTranslationDto> translations;
  @override
  final BuiltList<AdminCatalogProductTypeAttributeDto>? attributes;

  factory _$AdminCatalogProductTypeDto(
          [void Function(AdminCatalogProductTypeDtoBuilder)? updates]) =>
      (AdminCatalogProductTypeDtoBuilder()..update(updates))._build();

  _$AdminCatalogProductTypeDto._(
      {required this.id,
      required this.key,
      required this.status,
      required this.sortOrder,
      required this.translations,
      this.attributes})
      : super._();
  @override
  AdminCatalogProductTypeDto rebuild(
          void Function(AdminCatalogProductTypeDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminCatalogProductTypeDtoBuilder toBuilder() =>
      AdminCatalogProductTypeDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminCatalogProductTypeDto &&
        id == other.id &&
        key == other.key &&
        status == other.status &&
        sortOrder == other.sortOrder &&
        translations == other.translations &&
        attributes == other.attributes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, attributes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminCatalogProductTypeDto')
          ..add('id', id)
          ..add('key', key)
          ..add('status', status)
          ..add('sortOrder', sortOrder)
          ..add('translations', translations)
          ..add('attributes', attributes))
        .toString();
  }
}

class AdminCatalogProductTypeDtoBuilder
    implements
        Builder<AdminCatalogProductTypeDto, AdminCatalogProductTypeDtoBuilder> {
  _$AdminCatalogProductTypeDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  ListBuilder<AdminCatalogTranslationDto>? _translations;
  ListBuilder<AdminCatalogTranslationDto> get translations =>
      _$this._translations ??= ListBuilder<AdminCatalogTranslationDto>();
  set translations(ListBuilder<AdminCatalogTranslationDto>? translations) =>
      _$this._translations = translations;

  ListBuilder<AdminCatalogProductTypeAttributeDto>? _attributes;
  ListBuilder<AdminCatalogProductTypeAttributeDto> get attributes =>
      _$this._attributes ??= ListBuilder<AdminCatalogProductTypeAttributeDto>();
  set attributes(
          ListBuilder<AdminCatalogProductTypeAttributeDto>? attributes) =>
      _$this._attributes = attributes;

  AdminCatalogProductTypeDtoBuilder() {
    AdminCatalogProductTypeDto._defaults(this);
  }

  AdminCatalogProductTypeDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _status = $v.status;
      _sortOrder = $v.sortOrder;
      _translations = $v.translations.toBuilder();
      _attributes = $v.attributes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminCatalogProductTypeDto other) {
    _$v = other as _$AdminCatalogProductTypeDto;
  }

  @override
  void update(void Function(AdminCatalogProductTypeDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminCatalogProductTypeDto build() => _build();

  _$AdminCatalogProductTypeDto _build() {
    _$AdminCatalogProductTypeDto _$result;
    try {
      _$result = _$v ??
          _$AdminCatalogProductTypeDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AdminCatalogProductTypeDto', 'id'),
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'AdminCatalogProductTypeDto', 'key'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AdminCatalogProductTypeDto', 'status'),
            sortOrder: BuiltValueNullFieldError.checkNotNull(
                sortOrder, r'AdminCatalogProductTypeDto', 'sortOrder'),
            translations: translations.build(),
            attributes: _attributes?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
        _$failedField = 'attributes';
        _attributes?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AdminCatalogProductTypeDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
