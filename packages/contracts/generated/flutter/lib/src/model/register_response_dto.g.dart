// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegisterResponseDto extends RegisterResponseDto {
  @override
  final String id;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String userType;

  factory _$RegisterResponseDto(
          [void Function(RegisterResponseDtoBuilder)? updates]) =>
      (RegisterResponseDtoBuilder()..update(updates))._build();

  _$RegisterResponseDto._(
      {required this.id,
      required this.email,
      required this.displayName,
      required this.userType})
      : super._();
  @override
  RegisterResponseDto rebuild(
          void Function(RegisterResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterResponseDtoBuilder toBuilder() =>
      RegisterResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterResponseDto &&
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
    return (newBuiltValueToStringHelper(r'RegisterResponseDto')
          ..add('id', id)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('userType', userType))
        .toString();
  }
}

class RegisterResponseDtoBuilder
    implements Builder<RegisterResponseDto, RegisterResponseDtoBuilder> {
  _$RegisterResponseDto? _$v;

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

  RegisterResponseDtoBuilder() {
    RegisterResponseDto._defaults(this);
  }

  RegisterResponseDtoBuilder get _$this {
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
  void replace(RegisterResponseDto other) {
    _$v = other as _$RegisterResponseDto;
  }

  @override
  void update(void Function(RegisterResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterResponseDto build() => _build();

  _$RegisterResponseDto _build() {
    final _$result = _$v ??
        _$RegisterResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'RegisterResponseDto', 'id'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'RegisterResponseDto', 'email'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'RegisterResponseDto', 'displayName'),
          userType: BuiltValueNullFieldError.checkNotNull(
              userType, r'RegisterResponseDto', 'userType'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
