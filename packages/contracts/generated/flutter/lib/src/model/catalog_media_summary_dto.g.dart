// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_media_summary_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CatalogMediaSummaryDto extends CatalogMediaSummaryDto {
  @override
  final String id;
  @override
  final String objectKey;
  @override
  final String publicUrl;
  @override
  final String role;
  @override
  final String mediaType;
  @override
  final String mimeType;
  @override
  final String? altText;
  @override
  final String? title;

  factory _$CatalogMediaSummaryDto(
          [void Function(CatalogMediaSummaryDtoBuilder)? updates]) =>
      (CatalogMediaSummaryDtoBuilder()..update(updates))._build();

  _$CatalogMediaSummaryDto._(
      {required this.id,
      required this.objectKey,
      required this.publicUrl,
      required this.role,
      required this.mediaType,
      required this.mimeType,
      this.altText,
      this.title})
      : super._();
  @override
  CatalogMediaSummaryDto rebuild(
          void Function(CatalogMediaSummaryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CatalogMediaSummaryDtoBuilder toBuilder() =>
      CatalogMediaSummaryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CatalogMediaSummaryDto &&
        id == other.id &&
        objectKey == other.objectKey &&
        publicUrl == other.publicUrl &&
        role == other.role &&
        mediaType == other.mediaType &&
        mimeType == other.mimeType &&
        altText == other.altText &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, objectKey.hashCode);
    _$hash = $jc(_$hash, publicUrl.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, mediaType.hashCode);
    _$hash = $jc(_$hash, mimeType.hashCode);
    _$hash = $jc(_$hash, altText.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CatalogMediaSummaryDto')
          ..add('id', id)
          ..add('objectKey', objectKey)
          ..add('publicUrl', publicUrl)
          ..add('role', role)
          ..add('mediaType', mediaType)
          ..add('mimeType', mimeType)
          ..add('altText', altText)
          ..add('title', title))
        .toString();
  }
}

class CatalogMediaSummaryDtoBuilder
    implements Builder<CatalogMediaSummaryDto, CatalogMediaSummaryDtoBuilder> {
  _$CatalogMediaSummaryDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _objectKey;
  String? get objectKey => _$this._objectKey;
  set objectKey(String? objectKey) => _$this._objectKey = objectKey;

  String? _publicUrl;
  String? get publicUrl => _$this._publicUrl;
  set publicUrl(String? publicUrl) => _$this._publicUrl = publicUrl;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _mediaType;
  String? get mediaType => _$this._mediaType;
  set mediaType(String? mediaType) => _$this._mediaType = mediaType;

  String? _mimeType;
  String? get mimeType => _$this._mimeType;
  set mimeType(String? mimeType) => _$this._mimeType = mimeType;

  String? _altText;
  String? get altText => _$this._altText;
  set altText(String? altText) => _$this._altText = altText;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  CatalogMediaSummaryDtoBuilder() {
    CatalogMediaSummaryDto._defaults(this);
  }

  CatalogMediaSummaryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _objectKey = $v.objectKey;
      _publicUrl = $v.publicUrl;
      _role = $v.role;
      _mediaType = $v.mediaType;
      _mimeType = $v.mimeType;
      _altText = $v.altText;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CatalogMediaSummaryDto other) {
    _$v = other as _$CatalogMediaSummaryDto;
  }

  @override
  void update(void Function(CatalogMediaSummaryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CatalogMediaSummaryDto build() => _build();

  _$CatalogMediaSummaryDto _build() {
    final _$result = _$v ??
        _$CatalogMediaSummaryDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'CatalogMediaSummaryDto', 'id'),
          objectKey: BuiltValueNullFieldError.checkNotNull(
              objectKey, r'CatalogMediaSummaryDto', 'objectKey'),
          publicUrl: BuiltValueNullFieldError.checkNotNull(
              publicUrl, r'CatalogMediaSummaryDto', 'publicUrl'),
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'CatalogMediaSummaryDto', 'role'),
          mediaType: BuiltValueNullFieldError.checkNotNull(
              mediaType, r'CatalogMediaSummaryDto', 'mediaType'),
          mimeType: BuiltValueNullFieldError.checkNotNull(
              mimeType, r'CatalogMediaSummaryDto', 'mimeType'),
          altText: altText,
          title: title,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
