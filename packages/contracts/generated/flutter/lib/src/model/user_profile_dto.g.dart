// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserProfileDto extends UserProfileDto {
  @override
  final String id;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String userType;
  @override
  final String status;
  @override
  final String createdAt;
  @override
  final BuiltList<UserRoleDto> roles;
  @override
  final String? emailVerifiedAt;
  @override
  final String? lastLoginAt;

  factory _$UserProfileDto([void Function(UserProfileDtoBuilder)? updates]) =>
      (UserProfileDtoBuilder()..update(updates))._build();

  _$UserProfileDto._(
      {required this.id,
      required this.email,
      required this.displayName,
      required this.userType,
      required this.status,
      required this.createdAt,
      required this.roles,
      this.emailVerifiedAt,
      this.lastLoginAt})
      : super._();
  @override
  UserProfileDto rebuild(void Function(UserProfileDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserProfileDtoBuilder toBuilder() => UserProfileDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserProfileDto &&
        id == other.id &&
        email == other.email &&
        displayName == other.displayName &&
        userType == other.userType &&
        status == other.status &&
        createdAt == other.createdAt &&
        roles == other.roles &&
        emailVerifiedAt == other.emailVerifiedAt &&
        lastLoginAt == other.lastLoginAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, userType.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, roles.hashCode);
    _$hash = $jc(_$hash, emailVerifiedAt.hashCode);
    _$hash = $jc(_$hash, lastLoginAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserProfileDto')
          ..add('id', id)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('userType', userType)
          ..add('status', status)
          ..add('createdAt', createdAt)
          ..add('roles', roles)
          ..add('emailVerifiedAt', emailVerifiedAt)
          ..add('lastLoginAt', lastLoginAt))
        .toString();
  }
}

class UserProfileDtoBuilder
    implements Builder<UserProfileDto, UserProfileDtoBuilder> {
  _$UserProfileDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _userType;
  String? get userType => _$this._userType;
  set userType(String? userType) => _$this._userType = userType;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  ListBuilder<UserRoleDto>? _roles;
  ListBuilder<UserRoleDto> get roles =>
      _$this._roles ??= ListBuilder<UserRoleDto>();
  set roles(ListBuilder<UserRoleDto>? roles) => _$this._roles = roles;

  String? _emailVerifiedAt;
  String? get emailVerifiedAt => _$this._emailVerifiedAt;
  set emailVerifiedAt(String? emailVerifiedAt) =>
      _$this._emailVerifiedAt = emailVerifiedAt;

  String? _lastLoginAt;
  String? get lastLoginAt => _$this._lastLoginAt;
  set lastLoginAt(String? lastLoginAt) => _$this._lastLoginAt = lastLoginAt;

  UserProfileDtoBuilder() {
    UserProfileDto._defaults(this);
  }

  UserProfileDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _displayName = $v.displayName;
      _userType = $v.userType;
      _status = $v.status;
      _createdAt = $v.createdAt;
      _roles = $v.roles.toBuilder();
      _emailVerifiedAt = $v.emailVerifiedAt;
      _lastLoginAt = $v.lastLoginAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserProfileDto other) {
    _$v = other as _$UserProfileDto;
  }

  @override
  void update(void Function(UserProfileDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserProfileDto build() => _build();

  _$UserProfileDto _build() {
    _$UserProfileDto _$result;
    try {
      _$result = _$v ??
          _$UserProfileDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'UserProfileDto', 'id'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'UserProfileDto', 'email'),
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName, r'UserProfileDto', 'displayName'),
            userType: BuiltValueNullFieldError.checkNotNull(
                userType, r'UserProfileDto', 'userType'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'UserProfileDto', 'status'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'UserProfileDto', 'createdAt'),
            roles: roles.build(),
            emailVerifiedAt: emailVerifiedAt,
            lastLoginAt: lastLoginAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'roles';
        roles.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserProfileDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
