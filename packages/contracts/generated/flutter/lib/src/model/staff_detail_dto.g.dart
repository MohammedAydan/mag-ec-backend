// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_detail_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StaffDetailDto extends StaffDetailDto {
  @override
  final String id;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String status;
  @override
  final BuiltList<UserRoleDto> roles;

  factory _$StaffDetailDto([void Function(StaffDetailDtoBuilder)? updates]) =>
      (StaffDetailDtoBuilder()..update(updates))._build();

  _$StaffDetailDto._(
      {required this.id,
      required this.email,
      required this.displayName,
      required this.status,
      required this.roles})
      : super._();
  @override
  StaffDetailDto rebuild(void Function(StaffDetailDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StaffDetailDtoBuilder toBuilder() => StaffDetailDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StaffDetailDto &&
        id == other.id &&
        email == other.email &&
        displayName == other.displayName &&
        status == other.status &&
        roles == other.roles;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, roles.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StaffDetailDto')
          ..add('id', id)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('status', status)
          ..add('roles', roles))
        .toString();
  }
}

class StaffDetailDtoBuilder
    implements Builder<StaffDetailDto, StaffDetailDtoBuilder> {
  _$StaffDetailDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  ListBuilder<UserRoleDto>? _roles;
  ListBuilder<UserRoleDto> get roles =>
      _$this._roles ??= ListBuilder<UserRoleDto>();
  set roles(ListBuilder<UserRoleDto>? roles) => _$this._roles = roles;

  StaffDetailDtoBuilder() {
    StaffDetailDto._defaults(this);
  }

  StaffDetailDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _displayName = $v.displayName;
      _status = $v.status;
      _roles = $v.roles.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StaffDetailDto other) {
    _$v = other as _$StaffDetailDto;
  }

  @override
  void update(void Function(StaffDetailDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StaffDetailDto build() => _build();

  _$StaffDetailDto _build() {
    _$StaffDetailDto _$result;
    try {
      _$result = _$v ??
          _$StaffDetailDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'StaffDetailDto', 'id'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'StaffDetailDto', 'email'),
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName, r'StaffDetailDto', 'displayName'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'StaffDetailDto', 'status'),
            roles: roles.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'roles';
        roles.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'StaffDetailDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
