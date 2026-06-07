// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attach_media_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AttachMediaDto extends AttachMediaDto {
  @override
  final String mediaId;
  @override
  final String uploadToken;
  @override
  final String? checksum;
  @override
  final BuiltList<MediaTranslationDto>? translations;

  factory _$AttachMediaDto([void Function(AttachMediaDtoBuilder)? updates]) =>
      (AttachMediaDtoBuilder()..update(updates))._build();

  _$AttachMediaDto._(
      {required this.mediaId,
      required this.uploadToken,
      this.checksum,
      this.translations})
      : super._();
  @override
  AttachMediaDto rebuild(void Function(AttachMediaDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AttachMediaDtoBuilder toBuilder() => AttachMediaDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AttachMediaDto &&
        mediaId == other.mediaId &&
        uploadToken == other.uploadToken &&
        checksum == other.checksum &&
        translations == other.translations;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mediaId.hashCode);
    _$hash = $jc(_$hash, uploadToken.hashCode);
    _$hash = $jc(_$hash, checksum.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AttachMediaDto')
          ..add('mediaId', mediaId)
          ..add('uploadToken', uploadToken)
          ..add('checksum', checksum)
          ..add('translations', translations))
        .toString();
  }
}

class AttachMediaDtoBuilder
    implements Builder<AttachMediaDto, AttachMediaDtoBuilder> {
  _$AttachMediaDto? _$v;

  String? _mediaId;
  String? get mediaId => _$this._mediaId;
  set mediaId(String? mediaId) => _$this._mediaId = mediaId;

  String? _uploadToken;
  String? get uploadToken => _$this._uploadToken;
  set uploadToken(String? uploadToken) => _$this._uploadToken = uploadToken;

  String? _checksum;
  String? get checksum => _$this._checksum;
  set checksum(String? checksum) => _$this._checksum = checksum;

  ListBuilder<MediaTranslationDto>? _translations;
  ListBuilder<MediaTranslationDto> get translations =>
      _$this._translations ??= ListBuilder<MediaTranslationDto>();
  set translations(ListBuilder<MediaTranslationDto>? translations) =>
      _$this._translations = translations;

  AttachMediaDtoBuilder() {
    AttachMediaDto._defaults(this);
  }

  AttachMediaDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mediaId = $v.mediaId;
      _uploadToken = $v.uploadToken;
      _checksum = $v.checksum;
      _translations = $v.translations?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AttachMediaDto other) {
    _$v = other as _$AttachMediaDto;
  }

  @override
  void update(void Function(AttachMediaDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AttachMediaDto build() => _build();

  _$AttachMediaDto _build() {
    _$AttachMediaDto _$result;
    try {
      _$result = _$v ??
          _$AttachMediaDto._(
            mediaId: BuiltValueNullFieldError.checkNotNull(
                mediaId, r'AttachMediaDto', 'mediaId'),
            uploadToken: BuiltValueNullFieldError.checkNotNull(
                uploadToken, r'AttachMediaDto', 'uploadToken'),
            checksum: checksum,
            translations: _translations?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        _translations?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AttachMediaDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
