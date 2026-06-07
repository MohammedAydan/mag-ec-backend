// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProductVariantDto extends ProductVariantDto {
  @override
  final String sku;
  @override
  final BuiltList<ProductVariantTranslationDto> translations;
  @override
  final BuiltList<VariantOptionValueDto> optionValues;
  @override
  final bool? isDefault;
  @override
  final num? position;

  factory _$ProductVariantDto(
          [void Function(ProductVariantDtoBuilder)? updates]) =>
      (ProductVariantDtoBuilder()..update(updates))._build();

  _$ProductVariantDto._(
      {required this.sku,
      required this.translations,
      required this.optionValues,
      this.isDefault,
      this.position})
      : super._();
  @override
  ProductVariantDto rebuild(void Function(ProductVariantDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductVariantDtoBuilder toBuilder() =>
      ProductVariantDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductVariantDto &&
        sku == other.sku &&
        translations == other.translations &&
        optionValues == other.optionValues &&
        isDefault == other.isDefault &&
        position == other.position;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, optionValues.hashCode);
    _$hash = $jc(_$hash, isDefault.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductVariantDto')
          ..add('sku', sku)
          ..add('translations', translations)
          ..add('optionValues', optionValues)
          ..add('isDefault', isDefault)
          ..add('position', position))
        .toString();
  }
}

class ProductVariantDtoBuilder
    implements Builder<ProductVariantDto, ProductVariantDtoBuilder> {
  _$ProductVariantDto? _$v;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  ListBuilder<ProductVariantTranslationDto>? _translations;
  ListBuilder<ProductVariantTranslationDto> get translations =>
      _$this._translations ??= ListBuilder<ProductVariantTranslationDto>();
  set translations(ListBuilder<ProductVariantTranslationDto>? translations) =>
      _$this._translations = translations;

  ListBuilder<VariantOptionValueDto>? _optionValues;
  ListBuilder<VariantOptionValueDto> get optionValues =>
      _$this._optionValues ??= ListBuilder<VariantOptionValueDto>();
  set optionValues(ListBuilder<VariantOptionValueDto>? optionValues) =>
      _$this._optionValues = optionValues;

  bool? _isDefault;
  bool? get isDefault => _$this._isDefault;
  set isDefault(bool? isDefault) => _$this._isDefault = isDefault;

  num? _position;
  num? get position => _$this._position;
  set position(num? position) => _$this._position = position;

  ProductVariantDtoBuilder() {
    ProductVariantDto._defaults(this);
  }

  ProductVariantDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sku = $v.sku;
      _translations = $v.translations.toBuilder();
      _optionValues = $v.optionValues.toBuilder();
      _isDefault = $v.isDefault;
      _position = $v.position;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductVariantDto other) {
    _$v = other as _$ProductVariantDto;
  }

  @override
  void update(void Function(ProductVariantDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductVariantDto build() => _build();

  _$ProductVariantDto _build() {
    _$ProductVariantDto _$result;
    try {
      _$result = _$v ??
          _$ProductVariantDto._(
            sku: BuiltValueNullFieldError.checkNotNull(
                sku, r'ProductVariantDto', 'sku'),
            translations: translations.build(),
            optionValues: optionValues.build(),
            isDefault: isDefault,
            position: position,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
        _$failedField = 'optionValues';
        optionValues.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ProductVariantDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
