// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateProductDto extends CreateProductDto {
  @override
  final String productTypeId;
  @override
  final String sku;
  @override
  final BuiltList<ProductTranslationDto> translations;
  @override
  final BuiltList<ProductVariantDto> variants;
  @override
  final String? brandId;
  @override
  final bool? isFeatured;
  @override
  final BuiltList<String>? categoryIds;
  @override
  final BuiltList<String>? collectionIds;
  @override
  final BuiltList<String>? tagIds;

  factory _$CreateProductDto(
          [void Function(CreateProductDtoBuilder)? updates]) =>
      (CreateProductDtoBuilder()..update(updates))._build();

  _$CreateProductDto._(
      {required this.productTypeId,
      required this.sku,
      required this.translations,
      required this.variants,
      this.brandId,
      this.isFeatured,
      this.categoryIds,
      this.collectionIds,
      this.tagIds})
      : super._();
  @override
  CreateProductDto rebuild(void Function(CreateProductDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateProductDtoBuilder toBuilder() =>
      CreateProductDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateProductDto &&
        productTypeId == other.productTypeId &&
        sku == other.sku &&
        translations == other.translations &&
        variants == other.variants &&
        brandId == other.brandId &&
        isFeatured == other.isFeatured &&
        categoryIds == other.categoryIds &&
        collectionIds == other.collectionIds &&
        tagIds == other.tagIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, productTypeId.hashCode);
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, variants.hashCode);
    _$hash = $jc(_$hash, brandId.hashCode);
    _$hash = $jc(_$hash, isFeatured.hashCode);
    _$hash = $jc(_$hash, categoryIds.hashCode);
    _$hash = $jc(_$hash, collectionIds.hashCode);
    _$hash = $jc(_$hash, tagIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateProductDto')
          ..add('productTypeId', productTypeId)
          ..add('sku', sku)
          ..add('translations', translations)
          ..add('variants', variants)
          ..add('brandId', brandId)
          ..add('isFeatured', isFeatured)
          ..add('categoryIds', categoryIds)
          ..add('collectionIds', collectionIds)
          ..add('tagIds', tagIds))
        .toString();
  }
}

class CreateProductDtoBuilder
    implements Builder<CreateProductDto, CreateProductDtoBuilder> {
  _$CreateProductDto? _$v;

  String? _productTypeId;
  String? get productTypeId => _$this._productTypeId;
  set productTypeId(String? productTypeId) =>
      _$this._productTypeId = productTypeId;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  ListBuilder<ProductTranslationDto>? _translations;
  ListBuilder<ProductTranslationDto> get translations =>
      _$this._translations ??= ListBuilder<ProductTranslationDto>();
  set translations(ListBuilder<ProductTranslationDto>? translations) =>
      _$this._translations = translations;

  ListBuilder<ProductVariantDto>? _variants;
  ListBuilder<ProductVariantDto> get variants =>
      _$this._variants ??= ListBuilder<ProductVariantDto>();
  set variants(ListBuilder<ProductVariantDto>? variants) =>
      _$this._variants = variants;

  String? _brandId;
  String? get brandId => _$this._brandId;
  set brandId(String? brandId) => _$this._brandId = brandId;

  bool? _isFeatured;
  bool? get isFeatured => _$this._isFeatured;
  set isFeatured(bool? isFeatured) => _$this._isFeatured = isFeatured;

  ListBuilder<String>? _categoryIds;
  ListBuilder<String> get categoryIds =>
      _$this._categoryIds ??= ListBuilder<String>();
  set categoryIds(ListBuilder<String>? categoryIds) =>
      _$this._categoryIds = categoryIds;

  ListBuilder<String>? _collectionIds;
  ListBuilder<String> get collectionIds =>
      _$this._collectionIds ??= ListBuilder<String>();
  set collectionIds(ListBuilder<String>? collectionIds) =>
      _$this._collectionIds = collectionIds;

  ListBuilder<String>? _tagIds;
  ListBuilder<String> get tagIds => _$this._tagIds ??= ListBuilder<String>();
  set tagIds(ListBuilder<String>? tagIds) => _$this._tagIds = tagIds;

  CreateProductDtoBuilder() {
    CreateProductDto._defaults(this);
  }

  CreateProductDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _productTypeId = $v.productTypeId;
      _sku = $v.sku;
      _translations = $v.translations.toBuilder();
      _variants = $v.variants.toBuilder();
      _brandId = $v.brandId;
      _isFeatured = $v.isFeatured;
      _categoryIds = $v.categoryIds?.toBuilder();
      _collectionIds = $v.collectionIds?.toBuilder();
      _tagIds = $v.tagIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateProductDto other) {
    _$v = other as _$CreateProductDto;
  }

  @override
  void update(void Function(CreateProductDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateProductDto build() => _build();

  _$CreateProductDto _build() {
    _$CreateProductDto _$result;
    try {
      _$result = _$v ??
          _$CreateProductDto._(
            productTypeId: BuiltValueNullFieldError.checkNotNull(
                productTypeId, r'CreateProductDto', 'productTypeId'),
            sku: BuiltValueNullFieldError.checkNotNull(
                sku, r'CreateProductDto', 'sku'),
            translations: translations.build(),
            variants: variants.build(),
            brandId: brandId,
            isFeatured: isFeatured,
            categoryIds: _categoryIds?.build(),
            collectionIds: _collectionIds?.build(),
            tagIds: _tagIds?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
        _$failedField = 'variants';
        variants.build();

        _$failedField = 'categoryIds';
        _categoryIds?.build();
        _$failedField = 'collectionIds';
        _collectionIds?.build();
        _$failedField = 'tagIds';
        _tagIds?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CreateProductDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
