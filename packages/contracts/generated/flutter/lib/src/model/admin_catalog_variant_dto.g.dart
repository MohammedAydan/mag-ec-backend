// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_catalog_variant_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminCatalogVariantDto extends AdminCatalogVariantDto {
  @override
  final String id;
  @override
  final String productId;
  @override
  final String sku;
  @override
  final String status;
  @override
  final bool isDefault;
  @override
  final num position;
  @override
  final BuiltList<AdminCatalogTranslationDto> translations;
  @override
  final BuiltList<AdminCatalogProductVariantOptionValueDto>? optionValues;
  @override
  final CatalogVariantPriceDto? price;

  factory _$AdminCatalogVariantDto(
          [void Function(AdminCatalogVariantDtoBuilder)? updates]) =>
      (AdminCatalogVariantDtoBuilder()..update(updates))._build();

  _$AdminCatalogVariantDto._(
      {required this.id,
      required this.productId,
      required this.sku,
      required this.status,
      required this.isDefault,
      required this.position,
      required this.translations,
      this.optionValues,
      this.price})
      : super._();
  @override
  AdminCatalogVariantDto rebuild(
          void Function(AdminCatalogVariantDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminCatalogVariantDtoBuilder toBuilder() =>
      AdminCatalogVariantDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminCatalogVariantDto &&
        id == other.id &&
        productId == other.productId &&
        sku == other.sku &&
        status == other.status &&
        isDefault == other.isDefault &&
        position == other.position &&
        translations == other.translations &&
        optionValues == other.optionValues &&
        price == other.price;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, isDefault.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, optionValues.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminCatalogVariantDto')
          ..add('id', id)
          ..add('productId', productId)
          ..add('sku', sku)
          ..add('status', status)
          ..add('isDefault', isDefault)
          ..add('position', position)
          ..add('translations', translations)
          ..add('optionValues', optionValues)
          ..add('price', price))
        .toString();
  }
}

class AdminCatalogVariantDtoBuilder
    implements Builder<AdminCatalogVariantDto, AdminCatalogVariantDtoBuilder> {
  _$AdminCatalogVariantDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _productId;
  String? get productId => _$this._productId;
  set productId(String? productId) => _$this._productId = productId;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  bool? _isDefault;
  bool? get isDefault => _$this._isDefault;
  set isDefault(bool? isDefault) => _$this._isDefault = isDefault;

  num? _position;
  num? get position => _$this._position;
  set position(num? position) => _$this._position = position;

  ListBuilder<AdminCatalogTranslationDto>? _translations;
  ListBuilder<AdminCatalogTranslationDto> get translations =>
      _$this._translations ??= ListBuilder<AdminCatalogTranslationDto>();
  set translations(ListBuilder<AdminCatalogTranslationDto>? translations) =>
      _$this._translations = translations;

  ListBuilder<AdminCatalogProductVariantOptionValueDto>? _optionValues;
  ListBuilder<AdminCatalogProductVariantOptionValueDto> get optionValues =>
      _$this._optionValues ??=
          ListBuilder<AdminCatalogProductVariantOptionValueDto>();
  set optionValues(
          ListBuilder<AdminCatalogProductVariantOptionValueDto>?
              optionValues) =>
      _$this._optionValues = optionValues;

  CatalogVariantPriceDtoBuilder? _price;
  CatalogVariantPriceDtoBuilder get price =>
      _$this._price ??= CatalogVariantPriceDtoBuilder();
  set price(CatalogVariantPriceDtoBuilder? price) => _$this._price = price;

  AdminCatalogVariantDtoBuilder() {
    AdminCatalogVariantDto._defaults(this);
  }

  AdminCatalogVariantDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _productId = $v.productId;
      _sku = $v.sku;
      _status = $v.status;
      _isDefault = $v.isDefault;
      _position = $v.position;
      _translations = $v.translations.toBuilder();
      _optionValues = $v.optionValues?.toBuilder();
      _price = $v.price?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminCatalogVariantDto other) {
    _$v = other as _$AdminCatalogVariantDto;
  }

  @override
  void update(void Function(AdminCatalogVariantDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminCatalogVariantDto build() => _build();

  _$AdminCatalogVariantDto _build() {
    _$AdminCatalogVariantDto _$result;
    try {
      _$result = _$v ??
          _$AdminCatalogVariantDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AdminCatalogVariantDto', 'id'),
            productId: BuiltValueNullFieldError.checkNotNull(
                productId, r'AdminCatalogVariantDto', 'productId'),
            sku: BuiltValueNullFieldError.checkNotNull(
                sku, r'AdminCatalogVariantDto', 'sku'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AdminCatalogVariantDto', 'status'),
            isDefault: BuiltValueNullFieldError.checkNotNull(
                isDefault, r'AdminCatalogVariantDto', 'isDefault'),
            position: BuiltValueNullFieldError.checkNotNull(
                position, r'AdminCatalogVariantDto', 'position'),
            translations: translations.build(),
            optionValues: _optionValues?.build(),
            price: _price?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
        _$failedField = 'optionValues';
        _optionValues?.build();
        _$failedField = 'price';
        _price?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AdminCatalogVariantDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
