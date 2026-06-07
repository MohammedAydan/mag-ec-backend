// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product_variant_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateProductVariantDto extends UpdateProductVariantDto {
  @override
  final String? sku;
  @override
  final bool? isDefault;
  @override
  final num? position;
  @override
  final BuiltList<ProductVariantTranslationDto>? translations;
  @override
  final BuiltList<VariantOptionValueDto>? optionValues;

  factory _$UpdateProductVariantDto(
          [void Function(UpdateProductVariantDtoBuilder)? updates]) =>
      (UpdateProductVariantDtoBuilder()..update(updates))._build();

  _$UpdateProductVariantDto._(
      {this.sku,
      this.isDefault,
      this.position,
      this.translations,
      this.optionValues})
      : super._();
  @override
  UpdateProductVariantDto rebuild(
          void Function(UpdateProductVariantDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateProductVariantDtoBuilder toBuilder() =>
      UpdateProductVariantDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateProductVariantDto &&
        sku == other.sku &&
        isDefault == other.isDefault &&
        position == other.position &&
        translations == other.translations &&
        optionValues == other.optionValues;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, isDefault.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, optionValues.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateProductVariantDto')
          ..add('sku', sku)
          ..add('isDefault', isDefault)
          ..add('position', position)
          ..add('translations', translations)
          ..add('optionValues', optionValues))
        .toString();
  }
}

class UpdateProductVariantDtoBuilder
    implements
        Builder<UpdateProductVariantDto, UpdateProductVariantDtoBuilder> {
  _$UpdateProductVariantDto? _$v;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  bool? _isDefault;
  bool? get isDefault => _$this._isDefault;
  set isDefault(bool? isDefault) => _$this._isDefault = isDefault;

  num? _position;
  num? get position => _$this._position;
  set position(num? position) => _$this._position = position;

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

  UpdateProductVariantDtoBuilder() {
    UpdateProductVariantDto._defaults(this);
  }

  UpdateProductVariantDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sku = $v.sku;
      _isDefault = $v.isDefault;
      _position = $v.position;
      _translations = $v.translations?.toBuilder();
      _optionValues = $v.optionValues?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateProductVariantDto other) {
    _$v = other as _$UpdateProductVariantDto;
  }

  @override
  void update(void Function(UpdateProductVariantDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateProductVariantDto build() => _build();

  _$UpdateProductVariantDto _build() {
    _$UpdateProductVariantDto _$result;
    try {
      _$result = _$v ??
          _$UpdateProductVariantDto._(
            sku: sku,
            isDefault: isDefault,
            position: position,
            translations: _translations?.build(),
            optionValues: _optionValues?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        _translations?.build();
        _$failedField = 'optionValues';
        _optionValues?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UpdateProductVariantDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
