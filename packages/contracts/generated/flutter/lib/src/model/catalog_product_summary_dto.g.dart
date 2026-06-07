// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_product_summary_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CatalogProductSummaryDto extends CatalogProductSummaryDto {
  @override
  final String id;
  @override
  final String sku;
  @override
  final String status;
  @override
  final CatalogLocalizedReferenceDto productType;
  @override
  final BuiltList<CatalogLocalizedReferenceDto> categories;
  @override
  final BuiltList<CatalogLocalizedReferenceDto> collections;
  @override
  final BuiltList<CatalogLocalizedReferenceDto> tags;
  @override
  final BuiltList<CatalogMediaSummaryDto> media;
  @override
  final BuiltList<CatalogVariantSummaryDto> variants;
  @override
  final String? name;
  @override
  final String? slug;
  @override
  final String? shortDescription;
  @override
  final String? description;
  @override
  final CatalogLocalizedReferenceDto? brand;

  factory _$CatalogProductSummaryDto(
          [void Function(CatalogProductSummaryDtoBuilder)? updates]) =>
      (CatalogProductSummaryDtoBuilder()..update(updates))._build();

  _$CatalogProductSummaryDto._(
      {required this.id,
      required this.sku,
      required this.status,
      required this.productType,
      required this.categories,
      required this.collections,
      required this.tags,
      required this.media,
      required this.variants,
      this.name,
      this.slug,
      this.shortDescription,
      this.description,
      this.brand})
      : super._();
  @override
  CatalogProductSummaryDto rebuild(
          void Function(CatalogProductSummaryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CatalogProductSummaryDtoBuilder toBuilder() =>
      CatalogProductSummaryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CatalogProductSummaryDto &&
        id == other.id &&
        sku == other.sku &&
        status == other.status &&
        productType == other.productType &&
        categories == other.categories &&
        collections == other.collections &&
        tags == other.tags &&
        media == other.media &&
        variants == other.variants &&
        name == other.name &&
        slug == other.slug &&
        shortDescription == other.shortDescription &&
        description == other.description &&
        brand == other.brand;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, productType.hashCode);
    _$hash = $jc(_$hash, categories.hashCode);
    _$hash = $jc(_$hash, collections.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, media.hashCode);
    _$hash = $jc(_$hash, variants.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, shortDescription.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, brand.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CatalogProductSummaryDto')
          ..add('id', id)
          ..add('sku', sku)
          ..add('status', status)
          ..add('productType', productType)
          ..add('categories', categories)
          ..add('collections', collections)
          ..add('tags', tags)
          ..add('media', media)
          ..add('variants', variants)
          ..add('name', name)
          ..add('slug', slug)
          ..add('shortDescription', shortDescription)
          ..add('description', description)
          ..add('brand', brand))
        .toString();
  }
}

class CatalogProductSummaryDtoBuilder
    implements
        Builder<CatalogProductSummaryDto, CatalogProductSummaryDtoBuilder> {
  _$CatalogProductSummaryDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  CatalogLocalizedReferenceDtoBuilder? _productType;
  CatalogLocalizedReferenceDtoBuilder get productType =>
      _$this._productType ??= CatalogLocalizedReferenceDtoBuilder();
  set productType(CatalogLocalizedReferenceDtoBuilder? productType) =>
      _$this._productType = productType;

  ListBuilder<CatalogLocalizedReferenceDto>? _categories;
  ListBuilder<CatalogLocalizedReferenceDto> get categories =>
      _$this._categories ??= ListBuilder<CatalogLocalizedReferenceDto>();
  set categories(ListBuilder<CatalogLocalizedReferenceDto>? categories) =>
      _$this._categories = categories;

  ListBuilder<CatalogLocalizedReferenceDto>? _collections;
  ListBuilder<CatalogLocalizedReferenceDto> get collections =>
      _$this._collections ??= ListBuilder<CatalogLocalizedReferenceDto>();
  set collections(ListBuilder<CatalogLocalizedReferenceDto>? collections) =>
      _$this._collections = collections;

  ListBuilder<CatalogLocalizedReferenceDto>? _tags;
  ListBuilder<CatalogLocalizedReferenceDto> get tags =>
      _$this._tags ??= ListBuilder<CatalogLocalizedReferenceDto>();
  set tags(ListBuilder<CatalogLocalizedReferenceDto>? tags) =>
      _$this._tags = tags;

  ListBuilder<CatalogMediaSummaryDto>? _media;
  ListBuilder<CatalogMediaSummaryDto> get media =>
      _$this._media ??= ListBuilder<CatalogMediaSummaryDto>();
  set media(ListBuilder<CatalogMediaSummaryDto>? media) =>
      _$this._media = media;

  ListBuilder<CatalogVariantSummaryDto>? _variants;
  ListBuilder<CatalogVariantSummaryDto> get variants =>
      _$this._variants ??= ListBuilder<CatalogVariantSummaryDto>();
  set variants(ListBuilder<CatalogVariantSummaryDto>? variants) =>
      _$this._variants = variants;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  String? _shortDescription;
  String? get shortDescription => _$this._shortDescription;
  set shortDescription(String? shortDescription) =>
      _$this._shortDescription = shortDescription;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  CatalogLocalizedReferenceDtoBuilder? _brand;
  CatalogLocalizedReferenceDtoBuilder get brand =>
      _$this._brand ??= CatalogLocalizedReferenceDtoBuilder();
  set brand(CatalogLocalizedReferenceDtoBuilder? brand) =>
      _$this._brand = brand;

  CatalogProductSummaryDtoBuilder() {
    CatalogProductSummaryDto._defaults(this);
  }

  CatalogProductSummaryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _sku = $v.sku;
      _status = $v.status;
      _productType = $v.productType.toBuilder();
      _categories = $v.categories.toBuilder();
      _collections = $v.collections.toBuilder();
      _tags = $v.tags.toBuilder();
      _media = $v.media.toBuilder();
      _variants = $v.variants.toBuilder();
      _name = $v.name;
      _slug = $v.slug;
      _shortDescription = $v.shortDescription;
      _description = $v.description;
      _brand = $v.brand?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CatalogProductSummaryDto other) {
    _$v = other as _$CatalogProductSummaryDto;
  }

  @override
  void update(void Function(CatalogProductSummaryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CatalogProductSummaryDto build() => _build();

  _$CatalogProductSummaryDto _build() {
    _$CatalogProductSummaryDto _$result;
    try {
      _$result = _$v ??
          _$CatalogProductSummaryDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CatalogProductSummaryDto', 'id'),
            sku: BuiltValueNullFieldError.checkNotNull(
                sku, r'CatalogProductSummaryDto', 'sku'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'CatalogProductSummaryDto', 'status'),
            productType: productType.build(),
            categories: categories.build(),
            collections: collections.build(),
            tags: tags.build(),
            media: media.build(),
            variants: variants.build(),
            name: name,
            slug: slug,
            shortDescription: shortDescription,
            description: description,
            brand: _brand?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'productType';
        productType.build();
        _$failedField = 'categories';
        categories.build();
        _$failedField = 'collections';
        collections.build();
        _$failedField = 'tags';
        tags.build();
        _$failedField = 'media';
        media.build();
        _$failedField = 'variants';
        variants.build();

        _$failedField = 'brand';
        _brand?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CatalogProductSummaryDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
