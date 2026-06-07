// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_translation_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MediaTranslationDto extends MediaTranslationDto {
  @override
  final String locale;
  @override
  final String? altText;
  @override
  final String? title;

  factory _$MediaTranslationDto(
          [void Function(MediaTranslationDtoBuilder)? updates]) =>
      (MediaTranslationDtoBuilder()..update(updates))._build();

  _$MediaTranslationDto._({required this.locale, this.altText, this.title})
      : super._();
  @override
  MediaTranslationDto rebuild(
          void Function(MediaTranslationDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MediaTranslationDtoBuilder toBuilder() =>
      MediaTranslationDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MediaTranslationDto &&
        locale == other.locale &&
        altText == other.altText &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, locale.hashCode);
    _$hash = $jc(_$hash, altText.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MediaTranslationDto')
          ..add('locale', locale)
          ..add('altText', altText)
          ..add('title', title))
        .toString();
  }
}

class MediaTranslationDtoBuilder
    implements Builder<MediaTranslationDto, MediaTranslationDtoBuilder> {
  _$MediaTranslationDto? _$v;

  String? _locale;
  String? get locale => _$this._locale;
  set locale(String? locale) => _$this._locale = locale;

  String? _altText;
  String? get altText => _$this._altText;
  set altText(String? altText) => _$this._altText = altText;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  MediaTranslationDtoBuilder() {
    MediaTranslationDto._defaults(this);
  }

  MediaTranslationDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locale = $v.locale;
      _altText = $v.altText;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MediaTranslationDto other) {
    _$v = other as _$MediaTranslationDto;
  }

  @override
  void update(void Function(MediaTranslationDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MediaTranslationDto build() => _build();

  _$MediaTranslationDto _build() {
    final _$result = _$v ??
        _$MediaTranslationDto._(
          locale: BuiltValueNullFieldError.checkNotNull(
              locale, r'MediaTranslationDto', 'locale'),
          altText: altText,
          title: title,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
