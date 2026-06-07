// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_translation_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AttributeTranslationDto extends AttributeTranslationDto {
  @override
  final String locale;
  @override
  final String name;
  @override
  final String? description;

  factory _$AttributeTranslationDto(
          [void Function(AttributeTranslationDtoBuilder)? updates]) =>
      (AttributeTranslationDtoBuilder()..update(updates))._build();

  _$AttributeTranslationDto._(
      {required this.locale, required this.name, this.description})
      : super._();
  @override
  AttributeTranslationDto rebuild(
          void Function(AttributeTranslationDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AttributeTranslationDtoBuilder toBuilder() =>
      AttributeTranslationDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AttributeTranslationDto &&
        locale == other.locale &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, locale.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AttributeTranslationDto')
          ..add('locale', locale)
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class AttributeTranslationDtoBuilder
    implements
        Builder<AttributeTranslationDto, AttributeTranslationDtoBuilder> {
  _$AttributeTranslationDto? _$v;

  String? _locale;
  String? get locale => _$this._locale;
  set locale(String? locale) => _$this._locale = locale;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  AttributeTranslationDtoBuilder() {
    AttributeTranslationDto._defaults(this);
  }

  AttributeTranslationDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locale = $v.locale;
      _name = $v.name;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AttributeTranslationDto other) {
    _$v = other as _$AttributeTranslationDto;
  }

  @override
  void update(void Function(AttributeTranslationDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AttributeTranslationDto build() => _build();

  _$AttributeTranslationDto _build() {
    final _$result = _$v ??
        _$AttributeTranslationDto._(
          locale: BuiltValueNullFieldError.checkNotNull(
              locale, r'AttributeTranslationDto', 'locale'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'AttributeTranslationDto', 'name'),
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
