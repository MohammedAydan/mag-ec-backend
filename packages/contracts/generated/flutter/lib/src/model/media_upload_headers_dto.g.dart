// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_upload_headers_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MediaUploadHeadersDto extends MediaUploadHeadersDto {
  @override
  final String contentType;

  factory _$MediaUploadHeadersDto(
          [void Function(MediaUploadHeadersDtoBuilder)? updates]) =>
      (MediaUploadHeadersDtoBuilder()..update(updates))._build();

  _$MediaUploadHeadersDto._({required this.contentType}) : super._();
  @override
  MediaUploadHeadersDto rebuild(
          void Function(MediaUploadHeadersDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MediaUploadHeadersDtoBuilder toBuilder() =>
      MediaUploadHeadersDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MediaUploadHeadersDto && contentType == other.contentType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, contentType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MediaUploadHeadersDto')
          ..add('contentType', contentType))
        .toString();
  }
}

class MediaUploadHeadersDtoBuilder
    implements Builder<MediaUploadHeadersDto, MediaUploadHeadersDtoBuilder> {
  _$MediaUploadHeadersDto? _$v;

  String? _contentType;
  String? get contentType => _$this._contentType;
  set contentType(String? contentType) => _$this._contentType = contentType;

  MediaUploadHeadersDtoBuilder() {
    MediaUploadHeadersDto._defaults(this);
  }

  MediaUploadHeadersDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contentType = $v.contentType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MediaUploadHeadersDto other) {
    _$v = other as _$MediaUploadHeadersDto;
  }

  @override
  void update(void Function(MediaUploadHeadersDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MediaUploadHeadersDto build() => _build();

  _$MediaUploadHeadersDto _build() {
    final _$result = _$v ??
        _$MediaUploadHeadersDto._(
          contentType: BuiltValueNullFieldError.checkNotNull(
              contentType, r'MediaUploadHeadersDto', 'contentType'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
