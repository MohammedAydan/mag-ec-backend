// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuditLogResponseDto extends AuditLogResponseDto {
  @override
  final String id;
  @override
  final String category;
  @override
  final String action;
  @override
  final String entityType;
  @override
  final String createdAt;
  @override
  final String? actorUserId;
  @override
  final String? entityId;
  @override
  final String? ipAddress;
  @override
  final String? userAgent;
  @override
  final JsonObject? metadata;
  @override
  final JsonObject? diff;
  @override
  final AuditLogActorDto? actorUser;

  factory _$AuditLogResponseDto(
          [void Function(AuditLogResponseDtoBuilder)? updates]) =>
      (AuditLogResponseDtoBuilder()..update(updates))._build();

  _$AuditLogResponseDto._(
      {required this.id,
      required this.category,
      required this.action,
      required this.entityType,
      required this.createdAt,
      this.actorUserId,
      this.entityId,
      this.ipAddress,
      this.userAgent,
      this.metadata,
      this.diff,
      this.actorUser})
      : super._();
  @override
  AuditLogResponseDto rebuild(
          void Function(AuditLogResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuditLogResponseDtoBuilder toBuilder() =>
      AuditLogResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuditLogResponseDto &&
        id == other.id &&
        category == other.category &&
        action == other.action &&
        entityType == other.entityType &&
        createdAt == other.createdAt &&
        actorUserId == other.actorUserId &&
        entityId == other.entityId &&
        ipAddress == other.ipAddress &&
        userAgent == other.userAgent &&
        metadata == other.metadata &&
        diff == other.diff &&
        actorUser == other.actorUser;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, action.hashCode);
    _$hash = $jc(_$hash, entityType.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, actorUserId.hashCode);
    _$hash = $jc(_$hash, entityId.hashCode);
    _$hash = $jc(_$hash, ipAddress.hashCode);
    _$hash = $jc(_$hash, userAgent.hashCode);
    _$hash = $jc(_$hash, metadata.hashCode);
    _$hash = $jc(_$hash, diff.hashCode);
    _$hash = $jc(_$hash, actorUser.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuditLogResponseDto')
          ..add('id', id)
          ..add('category', category)
          ..add('action', action)
          ..add('entityType', entityType)
          ..add('createdAt', createdAt)
          ..add('actorUserId', actorUserId)
          ..add('entityId', entityId)
          ..add('ipAddress', ipAddress)
          ..add('userAgent', userAgent)
          ..add('metadata', metadata)
          ..add('diff', diff)
          ..add('actorUser', actorUser))
        .toString();
  }
}

class AuditLogResponseDtoBuilder
    implements Builder<AuditLogResponseDto, AuditLogResponseDtoBuilder> {
  _$AuditLogResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _action;
  String? get action => _$this._action;
  set action(String? action) => _$this._action = action;

  String? _entityType;
  String? get entityType => _$this._entityType;
  set entityType(String? entityType) => _$this._entityType = entityType;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _actorUserId;
  String? get actorUserId => _$this._actorUserId;
  set actorUserId(String? actorUserId) => _$this._actorUserId = actorUserId;

  String? _entityId;
  String? get entityId => _$this._entityId;
  set entityId(String? entityId) => _$this._entityId = entityId;

  String? _ipAddress;
  String? get ipAddress => _$this._ipAddress;
  set ipAddress(String? ipAddress) => _$this._ipAddress = ipAddress;

  String? _userAgent;
  String? get userAgent => _$this._userAgent;
  set userAgent(String? userAgent) => _$this._userAgent = userAgent;

  JsonObject? _metadata;
  JsonObject? get metadata => _$this._metadata;
  set metadata(JsonObject? metadata) => _$this._metadata = metadata;

  JsonObject? _diff;
  JsonObject? get diff => _$this._diff;
  set diff(JsonObject? diff) => _$this._diff = diff;

  AuditLogActorDtoBuilder? _actorUser;
  AuditLogActorDtoBuilder get actorUser =>
      _$this._actorUser ??= AuditLogActorDtoBuilder();
  set actorUser(AuditLogActorDtoBuilder? actorUser) =>
      _$this._actorUser = actorUser;

  AuditLogResponseDtoBuilder() {
    AuditLogResponseDto._defaults(this);
  }

  AuditLogResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _category = $v.category;
      _action = $v.action;
      _entityType = $v.entityType;
      _createdAt = $v.createdAt;
      _actorUserId = $v.actorUserId;
      _entityId = $v.entityId;
      _ipAddress = $v.ipAddress;
      _userAgent = $v.userAgent;
      _metadata = $v.metadata;
      _diff = $v.diff;
      _actorUser = $v.actorUser?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuditLogResponseDto other) {
    _$v = other as _$AuditLogResponseDto;
  }

  @override
  void update(void Function(AuditLogResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuditLogResponseDto build() => _build();

  _$AuditLogResponseDto _build() {
    _$AuditLogResponseDto _$result;
    try {
      _$result = _$v ??
          _$AuditLogResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AuditLogResponseDto', 'id'),
            category: BuiltValueNullFieldError.checkNotNull(
                category, r'AuditLogResponseDto', 'category'),
            action: BuiltValueNullFieldError.checkNotNull(
                action, r'AuditLogResponseDto', 'action'),
            entityType: BuiltValueNullFieldError.checkNotNull(
                entityType, r'AuditLogResponseDto', 'entityType'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'AuditLogResponseDto', 'createdAt'),
            actorUserId: actorUserId,
            entityId: entityId,
            ipAddress: ipAddress,
            userAgent: userAgent,
            metadata: metadata,
            diff: diff,
            actorUser: _actorUser?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'actorUser';
        _actorUser?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AuditLogResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
