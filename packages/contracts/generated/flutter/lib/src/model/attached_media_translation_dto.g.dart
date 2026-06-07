// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attached_media_translation_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AttachedMediaTranslationDto extends AttachedMediaTranslationDto {
  @override
  final String mediaId;
  @override
  final String locale;
  @override
  final String? altText;
  @override
  final String? title;

  factory _$AttachedMediaTranslationDto(
          [void Function(AttachedMediaTranslationDtoBuilder)? updates]) =>
      (AttachedMediaTranslationDtoBuilder()..update(updates))._build();

  _$AttachedMediaTranslationDto._(
      {required this.mediaId, required this.locale, this.altText, this.title})
      : super._();
  @override
  AttachedMediaTranslationDto rebuild(
          void Function(AttachedMediaTranslationDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AttachedMediaTranslationDtoBuilder toBuilder() =>
      AttachedMediaTranslationDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AttachedMediaTranslationDto &&
        mediaId == other.mediaId &&
        locale == other.locale &&
        altText == other.altText &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mediaId.hashCode);
    _$hash = $jc(_$hash, locale.hashCode);
    _$hash = $jc(_$hash, altText.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AttachedMediaTranslationDto')
          ..add('mediaId', mediaId)
          ..add('locale', locale)
          ..add('altText', altText)
          ..add('title', title))
        .toString();
  }
}

class AttachedMediaTranslationDtoBuilder
    implements
        Builder<AttachedMediaTranslationDto,
            AttachedMediaTranslationDtoBuilder> {
  _$AttachedMediaTranslationDto? _$v;

  String? _mediaId;
  String? get mediaId => _$this._mediaId;
  set mediaId(String? mediaId) => _$this._mediaId = mediaId;

  String? _locale;
  String? get locale => _$this._locale;
  set locale(String? locale) => _$this._locale = locale;

  String? _altText;
  String? get altText => _$this._altText;
  set altText(String? altText) => _$this._altText = altText;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  AttachedMediaTranslationDtoBuilder() {
    AttachedMediaTranslationDto._defaults(this);
  }

  AttachedMediaTranslationDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mediaId = $v.mediaId;
      _locale = $v.locale;
      _altText = $v.altText;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AttachedMediaTranslationDto other) {
    _$v = other as _$AttachedMediaTranslationDto;
  }

  @override
  void update(void Function(AttachedMediaTranslationDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AttachedMediaTranslationDto build() => _build();

  _$AttachedMediaTranslationDto _build() {
    final _$result = _$v ??
        _$AttachedMediaTranslationDto._(
          mediaId: BuiltValueNullFieldError.checkNotNull(
              mediaId, r'AttachedMediaTranslationDto', 'mediaId'),
          locale: BuiltValueNullFieldError.checkNotNull(
              locale, r'AttachedMediaTranslationDto', 'locale'),
          altText: altText,
          title: title,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
