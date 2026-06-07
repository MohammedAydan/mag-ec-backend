// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_translation_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProductTranslationDto extends ProductTranslationDto {
  @override
  final String locale;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String? description;
  @override
  final String? shortDescription;
  @override
  final String? metaTitle;
  @override
  final String? metaDescription;

  factory _$ProductTranslationDto(
          [void Function(ProductTranslationDtoBuilder)? updates]) =>
      (ProductTranslationDtoBuilder()..update(updates))._build();

  _$ProductTranslationDto._(
      {required this.locale,
      required this.name,
      required this.slug,
      this.description,
      this.shortDescription,
      this.metaTitle,
      this.metaDescription})
      : super._();
  @override
  ProductTranslationDto rebuild(
          void Function(ProductTranslationDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductTranslationDtoBuilder toBuilder() =>
      ProductTranslationDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductTranslationDto &&
        locale == other.locale &&
        name == other.name &&
        slug == other.slug &&
        description == other.description &&
        shortDescription == other.shortDescription &&
        metaTitle == other.metaTitle &&
        metaDescription == other.metaDescription;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, locale.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, shortDescription.hashCode);
    _$hash = $jc(_$hash, metaTitle.hashCode);
    _$hash = $jc(_$hash, metaDescription.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductTranslationDto')
          ..add('locale', locale)
          ..add('name', name)
          ..add('slug', slug)
          ..add('description', description)
          ..add('shortDescription', shortDescription)
          ..add('metaTitle', metaTitle)
          ..add('metaDescription', metaDescription))
        .toString();
  }
}

class ProductTranslationDtoBuilder
    implements Builder<ProductTranslationDto, ProductTranslationDtoBuilder> {
  _$ProductTranslationDto? _$v;

  String? _locale;
  String? get locale => _$this._locale;
  set locale(String? locale) => _$this._locale = locale;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _shortDescription;
  String? get shortDescription => _$this._shortDescription;
  set shortDescription(String? shortDescription) =>
      _$this._shortDescription = shortDescription;

  String? _metaTitle;
  String? get metaTitle => _$this._metaTitle;
  set metaTitle(String? metaTitle) => _$this._metaTitle = metaTitle;

  String? _metaDescription;
  String? get metaDescription => _$this._metaDescription;
  set metaDescription(String? metaDescription) =>
      _$this._metaDescription = metaDescription;

  ProductTranslationDtoBuilder() {
    ProductTranslationDto._defaults(this);
  }

  ProductTranslationDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locale = $v.locale;
      _name = $v.name;
      _slug = $v.slug;
      _description = $v.description;
      _shortDescription = $v.shortDescription;
      _metaTitle = $v.metaTitle;
      _metaDescription = $v.metaDescription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductTranslationDto other) {
    _$v = other as _$ProductTranslationDto;
  }

  @override
  void update(void Function(ProductTranslationDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductTranslationDto build() => _build();

  _$ProductTranslationDto _build() {
    final _$result = _$v ??
        _$ProductTranslationDto._(
          locale: BuiltValueNullFieldError.checkNotNull(
              locale, r'ProductTranslationDto', 'locale'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'ProductTranslationDto', 'name'),
          slug: BuiltValueNullFieldError.checkNotNull(
              slug, r'ProductTranslationDto', 'slug'),
          description: description,
          shortDescription: shortDescription,
          metaTitle: metaTitle,
          metaDescription: metaDescription,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
