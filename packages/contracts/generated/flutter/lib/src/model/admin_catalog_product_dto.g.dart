// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_catalog_product_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminCatalogProductDto extends AdminCatalogProductDto {
  @override
  final String id;
  @override
  final String productTypeId;
  @override
  final String sku;
  @override
  final String status;
  @override
  final bool isFeatured;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final BuiltList<AdminCatalogTranslationDto> translations;
  @override
  final String? brandId;
  @override
  final String? publishedAt;
  @override
  final String? archivedAt;
  @override
  final AdminCatalogProductTypeDto? productType;
  @override
  final AdminCatalogBrandDto? brand;
  @override
  final BuiltList<AdminCatalogVariantDto>? variants;
  @override
  final BuiltList<AdminCatalogRelationLinkDto>? categoryLinks;
  @override
  final BuiltList<AdminCatalogRelationLinkDto>? collectionLinks;
  @override
  final BuiltList<AdminCatalogRelationLinkDto>? tagLinks;
  @override
  final BuiltList<AdminCatalogMediaDto>? media;

  factory _$AdminCatalogProductDto(
          [void Function(AdminCatalogProductDtoBuilder)? updates]) =>
      (AdminCatalogProductDtoBuilder()..update(updates))._build();

  _$AdminCatalogProductDto._(
      {required this.id,
      required this.productTypeId,
      required this.sku,
      required this.status,
      required this.isFeatured,
      required this.createdAt,
      required this.updatedAt,
      required this.translations,
      this.brandId,
      this.publishedAt,
      this.archivedAt,
      this.productType,
      this.brand,
      this.variants,
      this.categoryLinks,
      this.collectionLinks,
      this.tagLinks,
      this.media})
      : super._();
  @override
  AdminCatalogProductDto rebuild(
          void Function(AdminCatalogProductDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminCatalogProductDtoBuilder toBuilder() =>
      AdminCatalogProductDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminCatalogProductDto &&
        id == other.id &&
        productTypeId == other.productTypeId &&
        sku == other.sku &&
        status == other.status &&
        isFeatured == other.isFeatured &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        translations == other.translations &&
        brandId == other.brandId &&
        publishedAt == other.publishedAt &&
        archivedAt == other.archivedAt &&
        productType == other.productType &&
        brand == other.brand &&
        variants == other.variants &&
        categoryLinks == other.categoryLinks &&
        collectionLinks == other.collectionLinks &&
        tagLinks == other.tagLinks &&
        media == other.media;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, productTypeId.hashCode);
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, isFeatured.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, brandId.hashCode);
    _$hash = $jc(_$hash, publishedAt.hashCode);
    _$hash = $jc(_$hash, archivedAt.hashCode);
    _$hash = $jc(_$hash, productType.hashCode);
    _$hash = $jc(_$hash, brand.hashCode);
    _$hash = $jc(_$hash, variants.hashCode);
    _$hash = $jc(_$hash, categoryLinks.hashCode);
    _$hash = $jc(_$hash, collectionLinks.hashCode);
    _$hash = $jc(_$hash, tagLinks.hashCode);
    _$hash = $jc(_$hash, media.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminCatalogProductDto')
          ..add('id', id)
          ..add('productTypeId', productTypeId)
          ..add('sku', sku)
          ..add('status', status)
          ..add('isFeatured', isFeatured)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('translations', translations)
          ..add('brandId', brandId)
          ..add('publishedAt', publishedAt)
          ..add('archivedAt', archivedAt)
          ..add('productType', productType)
          ..add('brand', brand)
          ..add('variants', variants)
          ..add('categoryLinks', categoryLinks)
          ..add('collectionLinks', collectionLinks)
          ..add('tagLinks', tagLinks)
          ..add('media', media))
        .toString();
  }
}

class AdminCatalogProductDtoBuilder
    implements Builder<AdminCatalogProductDto, AdminCatalogProductDtoBuilder> {
  _$AdminCatalogProductDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _productTypeId;
  String? get productTypeId => _$this._productTypeId;
  set productTypeId(String? productTypeId) =>
      _$this._productTypeId = productTypeId;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  bool? _isFeatured;
  bool? get isFeatured => _$this._isFeatured;
  set isFeatured(bool? isFeatured) => _$this._isFeatured = isFeatured;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<AdminCatalogTranslationDto>? _translations;
  ListBuilder<AdminCatalogTranslationDto> get translations =>
      _$this._translations ??= ListBuilder<AdminCatalogTranslationDto>();
  set translations(ListBuilder<AdminCatalogTranslationDto>? translations) =>
      _$this._translations = translations;

  String? _brandId;
  String? get brandId => _$this._brandId;
  set brandId(String? brandId) => _$this._brandId = brandId;

  String? _publishedAt;
  String? get publishedAt => _$this._publishedAt;
  set publishedAt(String? publishedAt) => _$this._publishedAt = publishedAt;

  String? _archivedAt;
  String? get archivedAt => _$this._archivedAt;
  set archivedAt(String? archivedAt) => _$this._archivedAt = archivedAt;

  AdminCatalogProductTypeDtoBuilder? _productType;
  AdminCatalogProductTypeDtoBuilder get productType =>
      _$this._productType ??= AdminCatalogProductTypeDtoBuilder();
  set productType(AdminCatalogProductTypeDtoBuilder? productType) =>
      _$this._productType = productType;

  AdminCatalogBrandDtoBuilder? _brand;
  AdminCatalogBrandDtoBuilder get brand =>
      _$this._brand ??= AdminCatalogBrandDtoBuilder();
  set brand(AdminCatalogBrandDtoBuilder? brand) => _$this._brand = brand;

  ListBuilder<AdminCatalogVariantDto>? _variants;
  ListBuilder<AdminCatalogVariantDto> get variants =>
      _$this._variants ??= ListBuilder<AdminCatalogVariantDto>();
  set variants(ListBuilder<AdminCatalogVariantDto>? variants) =>
      _$this._variants = variants;

  ListBuilder<AdminCatalogRelationLinkDto>? _categoryLinks;
  ListBuilder<AdminCatalogRelationLinkDto> get categoryLinks =>
      _$this._categoryLinks ??= ListBuilder<AdminCatalogRelationLinkDto>();
  set categoryLinks(ListBuilder<AdminCatalogRelationLinkDto>? categoryLinks) =>
      _$this._categoryLinks = categoryLinks;

  ListBuilder<AdminCatalogRelationLinkDto>? _collectionLinks;
  ListBuilder<AdminCatalogRelationLinkDto> get collectionLinks =>
      _$this._collectionLinks ??= ListBuilder<AdminCatalogRelationLinkDto>();
  set collectionLinks(
          ListBuilder<AdminCatalogRelationLinkDto>? collectionLinks) =>
      _$this._collectionLinks = collectionLinks;

  ListBuilder<AdminCatalogRelationLinkDto>? _tagLinks;
  ListBuilder<AdminCatalogRelationLinkDto> get tagLinks =>
      _$this._tagLinks ??= ListBuilder<AdminCatalogRelationLinkDto>();
  set tagLinks(ListBuilder<AdminCatalogRelationLinkDto>? tagLinks) =>
      _$this._tagLinks = tagLinks;

  ListBuilder<AdminCatalogMediaDto>? _media;
  ListBuilder<AdminCatalogMediaDto> get media =>
      _$this._media ??= ListBuilder<AdminCatalogMediaDto>();
  set media(ListBuilder<AdminCatalogMediaDto>? media) => _$this._media = media;

  AdminCatalogProductDtoBuilder() {
    AdminCatalogProductDto._defaults(this);
  }

  AdminCatalogProductDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _productTypeId = $v.productTypeId;
      _sku = $v.sku;
      _status = $v.status;
      _isFeatured = $v.isFeatured;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _translations = $v.translations.toBuilder();
      _brandId = $v.brandId;
      _publishedAt = $v.publishedAt;
      _archivedAt = $v.archivedAt;
      _productType = $v.productType?.toBuilder();
      _brand = $v.brand?.toBuilder();
      _variants = $v.variants?.toBuilder();
      _categoryLinks = $v.categoryLinks?.toBuilder();
      _collectionLinks = $v.collectionLinks?.toBuilder();
      _tagLinks = $v.tagLinks?.toBuilder();
      _media = $v.media?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminCatalogProductDto other) {
    _$v = other as _$AdminCatalogProductDto;
  }

  @override
  void update(void Function(AdminCatalogProductDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminCatalogProductDto build() => _build();

  _$AdminCatalogProductDto _build() {
    _$AdminCatalogProductDto _$result;
    try {
      _$result = _$v ??
          _$AdminCatalogProductDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AdminCatalogProductDto', 'id'),
            productTypeId: BuiltValueNullFieldError.checkNotNull(
                productTypeId, r'AdminCatalogProductDto', 'productTypeId'),
            sku: BuiltValueNullFieldError.checkNotNull(
                sku, r'AdminCatalogProductDto', 'sku'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AdminCatalogProductDto', 'status'),
            isFeatured: BuiltValueNullFieldError.checkNotNull(
                isFeatured, r'AdminCatalogProductDto', 'isFeatured'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'AdminCatalogProductDto', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'AdminCatalogProductDto', 'updatedAt'),
            translations: translations.build(),
            brandId: brandId,
            publishedAt: publishedAt,
            archivedAt: archivedAt,
            productType: _productType?.build(),
            brand: _brand?.build(),
            variants: _variants?.build(),
            categoryLinks: _categoryLinks?.build(),
            collectionLinks: _collectionLinks?.build(),
            tagLinks: _tagLinks?.build(),
            media: _media?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();

        _$failedField = 'productType';
        _productType?.build();
        _$failedField = 'brand';
        _brand?.build();
        _$failedField = 'variants';
        _variants?.build();
        _$failedField = 'categoryLinks';
        _categoryLinks?.build();
        _$failedField = 'collectionLinks';
        _collectionLinks?.build();
        _$failedField = 'tagLinks';
        _tagLinks?.build();
        _$failedField = 'media';
        _media?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AdminCatalogProductDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
