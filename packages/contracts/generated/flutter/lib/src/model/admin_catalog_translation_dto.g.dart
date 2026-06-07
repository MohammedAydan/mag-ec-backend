// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_catalog_translation_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminCatalogTranslationDto extends AdminCatalogTranslationDto {
  @override
  final String id;
  @override
  final String locale;
  @override
  final String? name;
  @override
  final String? label;
  @override
  final String? slug;
  @override
  final String? description;
  @override
  final String? shortDescription;
  @override
  final String? metaTitle;
  @override
  final String? metaDescription;

  factory _$AdminCatalogTranslationDto(
          [void Function(AdminCatalogTranslationDtoBuilder)? updates]) =>
      (AdminCatalogTranslationDtoBuilder()..update(updates))._build();

  _$AdminCatalogTranslationDto._(
      {required this.id,
      required this.locale,
      this.name,
      this.label,
      this.slug,
      this.description,
      this.shortDescription,
      this.metaTitle,
      this.metaDescription})
      : super._();
  @override
  AdminCatalogTranslationDto rebuild(
          void Function(AdminCatalogTranslationDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminCatalogTranslationDtoBuilder toBuilder() =>
      AdminCatalogTranslationDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminCatalogTranslationDto &&
        id == other.id &&
        locale == other.locale &&
        name == other.name &&
        label == other.label &&
        slug == other.slug &&
        description == other.description &&
        shortDescription == other.shortDescription &&
        metaTitle == other.metaTitle &&
        metaDescription == other.metaDescription;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, locale.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
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
    return (newBuiltValueToStringHelper(r'AdminCatalogTranslationDto')
          ..add('id', id)
          ..add('locale', locale)
          ..add('name', name)
          ..add('label', label)
          ..add('slug', slug)
          ..add('description', description)
          ..add('shortDescription', shortDescription)
          ..add('metaTitle', metaTitle)
          ..add('metaDescription', metaDescription))
        .toString();
  }
}

class AdminCatalogTranslationDtoBuilder
    implements
        Builder<AdminCatalogTranslationDto, AdminCatalogTranslationDtoBuilder> {
  _$AdminCatalogTranslationDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _locale;
  String? get locale => _$this._locale;
  set locale(String? locale) => _$this._locale = locale;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

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

  AdminCatalogTranslationDtoBuilder() {
    AdminCatalogTranslationDto._defaults(this);
  }

  AdminCatalogTranslationDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _locale = $v.locale;
      _name = $v.name;
      _label = $v.label;
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
  void replace(AdminCatalogTranslationDto other) {
    _$v = other as _$AdminCatalogTranslationDto;
  }

  @override
  void update(void Function(AdminCatalogTranslationDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminCatalogTranslationDto build() => _build();

  _$AdminCatalogTranslationDto _build() {
    final _$result = _$v ??
        _$AdminCatalogTranslationDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'AdminCatalogTranslationDto', 'id'),
          locale: BuiltValueNullFieldError.checkNotNull(
              locale, r'AdminCatalogTranslationDto', 'locale'),
          name: name,
          label: label,
          slug: slug,
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
