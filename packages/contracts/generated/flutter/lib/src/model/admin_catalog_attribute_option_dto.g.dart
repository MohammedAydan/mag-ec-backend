// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_catalog_attribute_option_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminCatalogAttributeOptionDto extends AdminCatalogAttributeOptionDto {
  @override
  final String id;
  @override
  final String key;
  @override
  final num sortOrder;
  @override
  final BuiltList<AdminCatalogTranslationDto> translations;
  @override
  final String? colorHex;

  factory _$AdminCatalogAttributeOptionDto(
          [void Function(AdminCatalogAttributeOptionDtoBuilder)? updates]) =>
      (AdminCatalogAttributeOptionDtoBuilder()..update(updates))._build();

  _$AdminCatalogAttributeOptionDto._(
      {required this.id,
      required this.key,
      required this.sortOrder,
      required this.translations,
      this.colorHex})
      : super._();
  @override
  AdminCatalogAttributeOptionDto rebuild(
          void Function(AdminCatalogAttributeOptionDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminCatalogAttributeOptionDtoBuilder toBuilder() =>
      AdminCatalogAttributeOptionDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminCatalogAttributeOptionDto &&
        id == other.id &&
        key == other.key &&
        sortOrder == other.sortOrder &&
        translations == other.translations &&
        colorHex == other.colorHex;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, colorHex.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminCatalogAttributeOptionDto')
          ..add('id', id)
          ..add('key', key)
          ..add('sortOrder', sortOrder)
          ..add('translations', translations)
          ..add('colorHex', colorHex))
        .toString();
  }
}

class AdminCatalogAttributeOptionDtoBuilder
    implements
        Builder<AdminCatalogAttributeOptionDto,
            AdminCatalogAttributeOptionDtoBuilder> {
  _$AdminCatalogAttributeOptionDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  ListBuilder<AdminCatalogTranslationDto>? _translations;
  ListBuilder<AdminCatalogTranslationDto> get translations =>
      _$this._translations ??= ListBuilder<AdminCatalogTranslationDto>();
  set translations(ListBuilder<AdminCatalogTranslationDto>? translations) =>
      _$this._translations = translations;

  String? _colorHex;
  String? get colorHex => _$this._colorHex;
  set colorHex(String? colorHex) => _$this._colorHex = colorHex;

  AdminCatalogAttributeOptionDtoBuilder() {
    AdminCatalogAttributeOptionDto._defaults(this);
  }

  AdminCatalogAttributeOptionDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _sortOrder = $v.sortOrder;
      _translations = $v.translations.toBuilder();
      _colorHex = $v.colorHex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminCatalogAttributeOptionDto other) {
    _$v = other as _$AdminCatalogAttributeOptionDto;
  }

  @override
  void update(void Function(AdminCatalogAttributeOptionDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminCatalogAttributeOptionDto build() => _build();

  _$AdminCatalogAttributeOptionDto _build() {
    _$AdminCatalogAttributeOptionDto _$result;
    try {
      _$result = _$v ??
          _$AdminCatalogAttributeOptionDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AdminCatalogAttributeOptionDto', 'id'),
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'AdminCatalogAttributeOptionDto', 'key'),
            sortOrder: BuiltValueNullFieldError.checkNotNull(
                sortOrder, r'AdminCatalogAttributeOptionDto', 'sortOrder'),
            translations: translations.build(),
            colorHex: colorHex,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AdminCatalogAttributeOptionDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
