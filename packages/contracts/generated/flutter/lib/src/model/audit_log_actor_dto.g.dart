// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_actor_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuditLogActorDto extends AuditLogActorDto {
  @override
  final String id;
  @override
  final String displayName;
  @override
  final String userType;
  @override
  final String status;

  factory _$AuditLogActorDto(
          [void Function(AuditLogActorDtoBuilder)? updates]) =>
      (AuditLogActorDtoBuilder()..update(updates))._build();

  _$AuditLogActorDto._(
      {required this.id,
      required this.displayName,
      required this.userType,
      required this.status})
      : super._();
  @override
  AuditLogActorDto rebuild(void Function(AuditLogActorDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuditLogActorDtoBuilder toBuilder() =>
      AuditLogActorDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuditLogActorDto &&
        id == other.id &&
        displayName == other.displayName &&
        userType == other.userType &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, userType.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuditLogActorDto')
          ..add('id', id)
          ..add('displayName', displayName)
          ..add('userType', userType)
          ..add('status', status))
        .toString();
  }
}

class AuditLogActorDtoBuilder
    implements Builder<AuditLogActorDto, AuditLogActorDtoBuilder> {
  _$AuditLogActorDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _userType;
  String? get userType => _$this._userType;
  set userType(String? userType) => _$this._userType = userType;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  AuditLogActorDtoBuilder() {
    AuditLogActorDto._defaults(this);
  }

  AuditLogActorDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _displayName = $v.displayName;
      _userType = $v.userType;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuditLogActorDto other) {
    _$v = other as _$AuditLogActorDto;
  }

  @override
  void update(void Function(AuditLogActorDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuditLogActorDto build() => _build();

  _$AuditLogActorDto _build() {
    final _$result = _$v ??
        _$AuditLogActorDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'AuditLogActorDto', 'id'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'AuditLogActorDto', 'displayName'),
          userType: BuiltValueNullFieldError.checkNotNull(
              userType, r'AuditLogActorDto', 'userType'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'AuditLogActorDto', 'status'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
