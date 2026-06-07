// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_type_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateProductTypeDto extends CreateProductTypeDto {
  @override
  final String key;
  @override
  final BuiltList<TranslationDto> translations;
  @override
  final num? sortOrder;
  @override
  final BuiltList<ProductTypeAttributeLinkDto>? attributes;

  factory _$CreateProductTypeDto(
          [void Function(CreateProductTypeDtoBuilder)? updates]) =>
      (CreateProductTypeDtoBuilder()..update(updates))._build();

  _$CreateProductTypeDto._(
      {required this.key,
      required this.translations,
      this.sortOrder,
      this.attributes})
      : super._();
  @override
  CreateProductTypeDto rebuild(
          void Function(CreateProductTypeDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateProductTypeDtoBuilder toBuilder() =>
      CreateProductTypeDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateProductTypeDto &&
        key == other.key &&
        translations == other.translations &&
        sortOrder == other.sortOrder &&
        attributes == other.attributes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, attributes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateProductTypeDto')
          ..add('key', key)
          ..add('translations', translations)
          ..add('sortOrder', sortOrder)
          ..add('attributes', attributes))
        .toString();
  }
}

class CreateProductTypeDtoBuilder
    implements Builder<CreateProductTypeDto, CreateProductTypeDtoBuilder> {
  _$CreateProductTypeDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  ListBuilder<TranslationDto>? _translations;
  ListBuilder<TranslationDto> get translations =>
      _$this._translations ??= ListBuilder<TranslationDto>();
  set translations(ListBuilder<TranslationDto>? translations) =>
      _$this._translations = translations;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  ListBuilder<ProductTypeAttributeLinkDto>? _attributes;
  ListBuilder<ProductTypeAttributeLinkDto> get attributes =>
      _$this._attributes ??= ListBuilder<ProductTypeAttributeLinkDto>();
  set attributes(ListBuilder<ProductTypeAttributeLinkDto>? attributes) =>
      _$this._attributes = attributes;

  CreateProductTypeDtoBuilder() {
    CreateProductTypeDto._defaults(this);
  }

  CreateProductTypeDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _translations = $v.translations.toBuilder();
      _sortOrder = $v.sortOrder;
      _attributes = $v.attributes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateProductTypeDto other) {
    _$v = other as _$CreateProductTypeDto;
  }

  @override
  void update(void Function(CreateProductTypeDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateProductTypeDto build() => _build();

  _$CreateProductTypeDto _build() {
    _$CreateProductTypeDto _$result;
    try {
      _$result = _$v ??
          _$CreateProductTypeDto._(
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'CreateProductTypeDto', 'key'),
            translations: translations.build(),
            sortOrder: sortOrder,
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
            r'CreateProductTypeDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
