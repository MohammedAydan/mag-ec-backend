// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attached_media_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AttachedMediaResponseDto extends AttachedMediaResponseDto {
  @override
  final String id;
  @override
  final String productId;
  @override
  final String status;
  @override
  final String mediaType;
  @override
  final String role;
  @override
  final String mimeType;
  @override
  final String objectKey;
  @override
  final String publicUrl;
  @override
  final BuiltList<AttachedMediaTranslationDto> translations;
  @override
  final String? variantId;
  @override
  final String? checksum;
  @override
  final String? attachedAt;

  factory _$AttachedMediaResponseDto(
          [void Function(AttachedMediaResponseDtoBuilder)? updates]) =>
      (AttachedMediaResponseDtoBuilder()..update(updates))._build();

  _$AttachedMediaResponseDto._(
      {required this.id,
      required this.productId,
      required this.status,
      required this.mediaType,
      required this.role,
      required this.mimeType,
      required this.objectKey,
      required this.publicUrl,
      required this.translations,
      this.variantId,
      this.checksum,
      this.attachedAt})
      : super._();
  @override
  AttachedMediaResponseDto rebuild(
          void Function(AttachedMediaResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AttachedMediaResponseDtoBuilder toBuilder() =>
      AttachedMediaResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AttachedMediaResponseDto &&
        id == other.id &&
        productId == other.productId &&
        status == other.status &&
        mediaType == other.mediaType &&
        role == other.role &&
        mimeType == other.mimeType &&
        objectKey == other.objectKey &&
        publicUrl == other.publicUrl &&
        translations == other.translations &&
        variantId == other.variantId &&
        checksum == other.checksum &&
        attachedAt == other.attachedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, mediaType.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, mimeType.hashCode);
    _$hash = $jc(_$hash, objectKey.hashCode);
    _$hash = $jc(_$hash, publicUrl.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, checksum.hashCode);
    _$hash = $jc(_$hash, attachedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AttachedMediaResponseDto')
          ..add('id', id)
          ..add('productId', productId)
          ..add('status', status)
          ..add('mediaType', mediaType)
          ..add('role', role)
          ..add('mimeType', mimeType)
          ..add('objectKey', objectKey)
          ..add('publicUrl', publicUrl)
          ..add('translations', translations)
          ..add('variantId', variantId)
          ..add('checksum', checksum)
          ..add('attachedAt', attachedAt))
        .toString();
  }
}

class AttachedMediaResponseDtoBuilder
    implements
        Builder<AttachedMediaResponseDto, AttachedMediaResponseDtoBuilder> {
  _$AttachedMediaResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _productId;
  String? get productId => _$this._productId;
  set productId(String? productId) => _$this._productId = productId;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _mediaType;
  String? get mediaType => _$this._mediaType;
  set mediaType(String? mediaType) => _$this._mediaType = mediaType;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _mimeType;
  String? get mimeType => _$this._mimeType;
  set mimeType(String? mimeType) => _$this._mimeType = mimeType;

  String? _objectKey;
  String? get objectKey => _$this._objectKey;
  set objectKey(String? objectKey) => _$this._objectKey = objectKey;

  String? _publicUrl;
  String? get publicUrl => _$this._publicUrl;
  set publicUrl(String? publicUrl) => _$this._publicUrl = publicUrl;

  ListBuilder<AttachedMediaTranslationDto>? _translations;
  ListBuilder<AttachedMediaTranslationDto> get translations =>
      _$this._translations ??= ListBuilder<AttachedMediaTranslationDto>();
  set translations(ListBuilder<AttachedMediaTranslationDto>? translations) =>
      _$this._translations = translations;

  String? _variantId;
  String? get variantId => _$this._variantId;
  set variantId(String? variantId) => _$this._variantId = variantId;

  String? _checksum;
  String? get checksum => _$this._checksum;
  set checksum(String? checksum) => _$this._checksum = checksum;

  String? _attachedAt;
  String? get attachedAt => _$this._attachedAt;
  set attachedAt(String? attachedAt) => _$this._attachedAt = attachedAt;

  AttachedMediaResponseDtoBuilder() {
    AttachedMediaResponseDto._defaults(this);
  }

  AttachedMediaResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _productId = $v.productId;
      _status = $v.status;
      _mediaType = $v.mediaType;
      _role = $v.role;
      _mimeType = $v.mimeType;
      _objectKey = $v.objectKey;
      _publicUrl = $v.publicUrl;
      _translations = $v.translations.toBuilder();
      _variantId = $v.variantId;
      _checksum = $v.checksum;
      _attachedAt = $v.attachedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AttachedMediaResponseDto other) {
    _$v = other as _$AttachedMediaResponseDto;
  }

  @override
  void update(void Function(AttachedMediaResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AttachedMediaResponseDto build() => _build();

  _$AttachedMediaResponseDto _build() {
    _$AttachedMediaResponseDto _$result;
    try {
      _$result = _$v ??
          _$AttachedMediaResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AttachedMediaResponseDto', 'id'),
            productId: BuiltValueNullFieldError.checkNotNull(
                productId, r'AttachedMediaResponseDto', 'productId'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AttachedMediaResponseDto', 'status'),
            mediaType: BuiltValueNullFieldError.checkNotNull(
                mediaType, r'AttachedMediaResponseDto', 'mediaType'),
            role: BuiltValueNullFieldError.checkNotNull(
                role, r'AttachedMediaResponseDto', 'role'),
            mimeType: BuiltValueNullFieldError.checkNotNull(
                mimeType, r'AttachedMediaResponseDto', 'mimeType'),
            objectKey: BuiltValueNullFieldError.checkNotNull(
                objectKey, r'AttachedMediaResponseDto', 'objectKey'),
            publicUrl: BuiltValueNullFieldError.checkNotNull(
                publicUrl, r'AttachedMediaResponseDto', 'publicUrl'),
            translations: translations.build(),
            variantId: variantId,
            checksum: checksum,
            attachedAt: attachedAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AttachedMediaResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
