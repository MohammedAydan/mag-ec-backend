// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_catalog_media_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminCatalogMediaDto extends AdminCatalogMediaDto {
  @override
  final String id;
  @override
  final String objectKey;
  @override
  final String status;
  @override
  final String mediaType;
  @override
  final String role;
  @override
  final String mimeType;
  @override
  final num sortOrder;
  @override
  final BuiltList<AttachedMediaTranslationDto> translations;
  @override
  final String? variantId;
  @override
  final String? checksum;

  factory _$AdminCatalogMediaDto(
          [void Function(AdminCatalogMediaDtoBuilder)? updates]) =>
      (AdminCatalogMediaDtoBuilder()..update(updates))._build();

  _$AdminCatalogMediaDto._(
      {required this.id,
      required this.objectKey,
      required this.status,
      required this.mediaType,
      required this.role,
      required this.mimeType,
      required this.sortOrder,
      required this.translations,
      this.variantId,
      this.checksum})
      : super._();
  @override
  AdminCatalogMediaDto rebuild(
          void Function(AdminCatalogMediaDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminCatalogMediaDtoBuilder toBuilder() =>
      AdminCatalogMediaDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminCatalogMediaDto &&
        id == other.id &&
        objectKey == other.objectKey &&
        status == other.status &&
        mediaType == other.mediaType &&
        role == other.role &&
        mimeType == other.mimeType &&
        sortOrder == other.sortOrder &&
        translations == other.translations &&
        variantId == other.variantId &&
        checksum == other.checksum;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, objectKey.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, mediaType.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, mimeType.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, checksum.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminCatalogMediaDto')
          ..add('id', id)
          ..add('objectKey', objectKey)
          ..add('status', status)
          ..add('mediaType', mediaType)
          ..add('role', role)
          ..add('mimeType', mimeType)
          ..add('sortOrder', sortOrder)
          ..add('translations', translations)
          ..add('variantId', variantId)
          ..add('checksum', checksum))
        .toString();
  }
}

class AdminCatalogMediaDtoBuilder
    implements Builder<AdminCatalogMediaDto, AdminCatalogMediaDtoBuilder> {
  _$AdminCatalogMediaDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _objectKey;
  String? get objectKey => _$this._objectKey;
  set objectKey(String? objectKey) => _$this._objectKey = objectKey;

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

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

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

  AdminCatalogMediaDtoBuilder() {
    AdminCatalogMediaDto._defaults(this);
  }

  AdminCatalogMediaDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _objectKey = $v.objectKey;
      _status = $v.status;
      _mediaType = $v.mediaType;
      _role = $v.role;
      _mimeType = $v.mimeType;
      _sortOrder = $v.sortOrder;
      _translations = $v.translations.toBuilder();
      _variantId = $v.variantId;
      _checksum = $v.checksum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminCatalogMediaDto other) {
    _$v = other as _$AdminCatalogMediaDto;
  }

  @override
  void update(void Function(AdminCatalogMediaDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminCatalogMediaDto build() => _build();

  _$AdminCatalogMediaDto _build() {
    _$AdminCatalogMediaDto _$result;
    try {
      _$result = _$v ??
          _$AdminCatalogMediaDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AdminCatalogMediaDto', 'id'),
            objectKey: BuiltValueNullFieldError.checkNotNull(
                objectKey, r'AdminCatalogMediaDto', 'objectKey'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AdminCatalogMediaDto', 'status'),
            mediaType: BuiltValueNullFieldError.checkNotNull(
                mediaType, r'AdminCatalogMediaDto', 'mediaType'),
            role: BuiltValueNullFieldError.checkNotNull(
                role, r'AdminCatalogMediaDto', 'role'),
            mimeType: BuiltValueNullFieldError.checkNotNull(
                mimeType, r'AdminCatalogMediaDto', 'mimeType'),
            sortOrder: BuiltValueNullFieldError.checkNotNull(
                sortOrder, r'AdminCatalogMediaDto', 'sortOrder'),
            translations: translations.build(),
            variantId: variantId,
            checksum: checksum,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AdminCatalogMediaDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
