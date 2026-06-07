// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_option_translation_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AttributeOptionTranslationDto extends AttributeOptionTranslationDto {
  @override
  final String locale;
  @override
  final String label;

  factory _$AttributeOptionTranslationDto(
          [void Function(AttributeOptionTranslationDtoBuilder)? updates]) =>
      (AttributeOptionTranslationDtoBuilder()..update(updates))._build();

  _$AttributeOptionTranslationDto._({required this.locale, required this.label})
      : super._();
  @override
  AttributeOptionTranslationDto rebuild(
          void Function(AttributeOptionTranslationDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AttributeOptionTranslationDtoBuilder toBuilder() =>
      AttributeOptionTranslationDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AttributeOptionTranslationDto &&
        locale == other.locale &&
        label == other.label;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, locale.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AttributeOptionTranslationDto')
          ..add('locale', locale)
          ..add('label', label))
        .toString();
  }
}

class AttributeOptionTranslationDtoBuilder
    implements
        Builder<AttributeOptionTranslationDto,
            AttributeOptionTranslationDtoBuilder> {
  _$AttributeOptionTranslationDto? _$v;

  String? _locale;
  String? get locale => _$this._locale;
  set locale(String? locale) => _$this._locale = locale;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  AttributeOptionTranslationDtoBuilder() {
    AttributeOptionTranslationDto._defaults(this);
  }

  AttributeOptionTranslationDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locale = $v.locale;
      _label = $v.label;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AttributeOptionTranslationDto other) {
    _$v = other as _$AttributeOptionTranslationDto;
  }

  @override
  void update(void Function(AttributeOptionTranslationDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AttributeOptionTranslationDto build() => _build();

  _$AttributeOptionTranslationDto _build() {
    final _$result = _$v ??
        _$AttributeOptionTranslationDto._(
          locale: BuiltValueNullFieldError.checkNotNull(
              locale, r'AttributeOptionTranslationDto', 'locale'),
          label: BuiltValueNullFieldError.checkNotNull(
              label, r'AttributeOptionTranslationDto', 'label'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
