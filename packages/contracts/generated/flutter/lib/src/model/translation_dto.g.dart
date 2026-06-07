// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TranslationDto extends TranslationDto {
  @override
  final String locale;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String? description;

  factory _$TranslationDto([void Function(TranslationDtoBuilder)? updates]) =>
      (TranslationDtoBuilder()..update(updates))._build();

  _$TranslationDto._(
      {required this.locale,
      required this.name,
      required this.slug,
      this.description})
      : super._();
  @override
  TranslationDto rebuild(void Function(TranslationDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TranslationDtoBuilder toBuilder() => TranslationDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TranslationDto &&
        locale == other.locale &&
        name == other.name &&
        slug == other.slug &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, locale.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TranslationDto')
          ..add('locale', locale)
          ..add('name', name)
          ..add('slug', slug)
          ..add('description', description))
        .toString();
  }
}

class TranslationDtoBuilder
    implements Builder<TranslationDto, TranslationDtoBuilder> {
  _$TranslationDto? _$v;

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

  TranslationDtoBuilder() {
    TranslationDto._defaults(this);
  }

  TranslationDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locale = $v.locale;
      _name = $v.name;
      _slug = $v.slug;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TranslationDto other) {
    _$v = other as _$TranslationDto;
  }

  @override
  void update(void Function(TranslationDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TranslationDto build() => _build();

  _$TranslationDto _build() {
    final _$result = _$v ??
        _$TranslationDto._(
          locale: BuiltValueNullFieldError.checkNotNull(
              locale, r'TranslationDto', 'locale'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'TranslationDto', 'name'),
          slug: BuiltValueNullFieldError.checkNotNull(
              slug, r'TranslationDto', 'slug'),
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
