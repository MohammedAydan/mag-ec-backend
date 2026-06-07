// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_upload_intent_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MediaUploadIntentResponseDto extends MediaUploadIntentResponseDto {
  @override
  final String mediaId;
  @override
  final String objectKey;
  @override
  final String uploadUrl;
  @override
  final String publicUrl;
  @override
  final String uploadToken;
  @override
  final String expiresAt;
  @override
  final MediaUploadHeadersDto headers;

  factory _$MediaUploadIntentResponseDto(
          [void Function(MediaUploadIntentResponseDtoBuilder)? updates]) =>
      (MediaUploadIntentResponseDtoBuilder()..update(updates))._build();

  _$MediaUploadIntentResponseDto._(
      {required this.mediaId,
      required this.objectKey,
      required this.uploadUrl,
      required this.publicUrl,
      required this.uploadToken,
      required this.expiresAt,
      required this.headers})
      : super._();
  @override
  MediaUploadIntentResponseDto rebuild(
          void Function(MediaUploadIntentResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MediaUploadIntentResponseDtoBuilder toBuilder() =>
      MediaUploadIntentResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MediaUploadIntentResponseDto &&
        mediaId == other.mediaId &&
        objectKey == other.objectKey &&
        uploadUrl == other.uploadUrl &&
        publicUrl == other.publicUrl &&
        uploadToken == other.uploadToken &&
        expiresAt == other.expiresAt &&
        headers == other.headers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mediaId.hashCode);
    _$hash = $jc(_$hash, objectKey.hashCode);
    _$hash = $jc(_$hash, uploadUrl.hashCode);
    _$hash = $jc(_$hash, publicUrl.hashCode);
    _$hash = $jc(_$hash, uploadToken.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jc(_$hash, headers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MediaUploadIntentResponseDto')
          ..add('mediaId', mediaId)
          ..add('objectKey', objectKey)
          ..add('uploadUrl', uploadUrl)
          ..add('publicUrl', publicUrl)
          ..add('uploadToken', uploadToken)
          ..add('expiresAt', expiresAt)
          ..add('headers', headers))
        .toString();
  }
}

class MediaUploadIntentResponseDtoBuilder
    implements
        Builder<MediaUploadIntentResponseDto,
            MediaUploadIntentResponseDtoBuilder> {
  _$MediaUploadIntentResponseDto? _$v;

  String? _mediaId;
  String? get mediaId => _$this._mediaId;
  set mediaId(String? mediaId) => _$this._mediaId = mediaId;

  String? _objectKey;
  String? get objectKey => _$this._objectKey;
  set objectKey(String? objectKey) => _$this._objectKey = objectKey;

  String? _uploadUrl;
  String? get uploadUrl => _$this._uploadUrl;
  set uploadUrl(String? uploadUrl) => _$this._uploadUrl = uploadUrl;

  String? _publicUrl;
  String? get publicUrl => _$this._publicUrl;
  set publicUrl(String? publicUrl) => _$this._publicUrl = publicUrl;

  String? _uploadToken;
  String? get uploadToken => _$this._uploadToken;
  set uploadToken(String? uploadToken) => _$this._uploadToken = uploadToken;

  String? _expiresAt;
  String? get expiresAt => _$this._expiresAt;
  set expiresAt(String? expiresAt) => _$this._expiresAt = expiresAt;

  MediaUploadHeadersDtoBuilder? _headers;
  MediaUploadHeadersDtoBuilder get headers =>
      _$this._headers ??= MediaUploadHeadersDtoBuilder();
  set headers(MediaUploadHeadersDtoBuilder? headers) =>
      _$this._headers = headers;

  MediaUploadIntentResponseDtoBuilder() {
    MediaUploadIntentResponseDto._defaults(this);
  }

  MediaUploadIntentResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mediaId = $v.mediaId;
      _objectKey = $v.objectKey;
      _uploadUrl = $v.uploadUrl;
      _publicUrl = $v.publicUrl;
      _uploadToken = $v.uploadToken;
      _expiresAt = $v.expiresAt;
      _headers = $v.headers.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MediaUploadIntentResponseDto other) {
    _$v = other as _$MediaUploadIntentResponseDto;
  }

  @override
  void update(void Function(MediaUploadIntentResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MediaUploadIntentResponseDto build() => _build();

  _$MediaUploadIntentResponseDto _build() {
    _$MediaUploadIntentResponseDto _$result;
    try {
      _$result = _$v ??
          _$MediaUploadIntentResponseDto._(
            mediaId: BuiltValueNullFieldError.checkNotNull(
                mediaId, r'MediaUploadIntentResponseDto', 'mediaId'),
            objectKey: BuiltValueNullFieldError.checkNotNull(
                objectKey, r'MediaUploadIntentResponseDto', 'objectKey'),
            uploadUrl: BuiltValueNullFieldError.checkNotNull(
                uploadUrl, r'MediaUploadIntentResponseDto', 'uploadUrl'),
            publicUrl: BuiltValueNullFieldError.checkNotNull(
                publicUrl, r'MediaUploadIntentResponseDto', 'publicUrl'),
            uploadToken: BuiltValueNullFieldError.checkNotNull(
                uploadToken, r'MediaUploadIntentResponseDto', 'uploadToken'),
            expiresAt: BuiltValueNullFieldError.checkNotNull(
                expiresAt, r'MediaUploadIntentResponseDto', 'expiresAt'),
            headers: headers.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'headers';
        headers.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'MediaUploadIntentResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
