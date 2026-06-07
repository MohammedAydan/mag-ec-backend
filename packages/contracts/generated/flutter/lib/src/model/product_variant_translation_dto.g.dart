// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_translation_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProductVariantTranslationDto extends ProductVariantTranslationDto {
  @override
  final String locale;
  @override
  final String name;

  factory _$ProductVariantTranslationDto(
          [void Function(ProductVariantTranslationDtoBuilder)? updates]) =>
      (ProductVariantTranslationDtoBuilder()..update(updates))._build();

  _$ProductVariantTranslationDto._({required this.locale, required this.name})
      : super._();
  @override
  ProductVariantTranslationDto rebuild(
          void Function(ProductVariantTranslationDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductVariantTranslationDtoBuilder toBuilder() =>
      ProductVariantTranslationDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductVariantTranslationDto &&
        locale == other.locale &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, locale.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductVariantTranslationDto')
          ..add('locale', locale)
          ..add('name', name))
        .toString();
  }
}

class ProductVariantTranslationDtoBuilder
    implements
        Builder<ProductVariantTranslationDto,
            ProductVariantTranslationDtoBuilder> {
  _$ProductVariantTranslationDto? _$v;

  String? _locale;
  String? get locale => _$this._locale;
  set locale(String? locale) => _$this._locale = locale;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ProductVariantTranslationDtoBuilder() {
    ProductVariantTranslationDto._defaults(this);
  }

  ProductVariantTranslationDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locale = $v.locale;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductVariantTranslationDto other) {
    _$v = other as _$ProductVariantTranslationDto;
  }

  @override
  void update(void Function(ProductVariantTranslationDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductVariantTranslationDto build() => _build();

  _$ProductVariantTranslationDto _build() {
    final _$result = _$v ??
        _$ProductVariantTranslationDto._(
          locale: BuiltValueNullFieldError.checkNotNull(
              locale, r'ProductVariantTranslationDto', 'locale'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'ProductVariantTranslationDto', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
