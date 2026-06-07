// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthUserDto extends AuthUserDto {
  @override
  final String id;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String userType;

  factory _$AuthUserDto([void Function(AuthUserDtoBuilder)? updates]) =>
      (AuthUserDtoBuilder()..update(updates))._build();

  _$AuthUserDto._(
      {required this.id,
      required this.email,
      required this.displayName,
      required this.userType})
      : super._();
  @override
  AuthUserDto rebuild(void Function(AuthUserDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthUserDtoBuilder toBuilder() => AuthUserDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthUserDto &&
        id == other.id &&
        email == other.email &&
        displayName == other.displayName &&
        userType == other.userType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, userType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthUserDto')
          ..add('id', id)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('userType', userType))
        .toString();
  }
}

class AuthUserDtoBuilder implements Builder<AuthUserDto, AuthUserDtoBuilder> {
  _$AuthUserDto? _$v;

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

  AuthUserDtoBuilder() {
    AuthUserDto._defaults(this);
  }

  AuthUserDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _displayName = $v.displayName;
      _userType = $v.userType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthUserDto other) {
    _$v = other as _$AuthUserDto;
  }

  @override
  void update(void Function(AuthUserDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthUserDto build() => _build();

  _$AuthUserDto _build() {
    final _$result = _$v ??
        _$AuthUserDto._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'AuthUserDto', 'id'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'AuthUserDto', 'email'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'AuthUserDto', 'displayName'),
          userType: BuiltValueNullFieldError.checkNotNull(
              userType, r'AuthUserDto', 'userType'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
