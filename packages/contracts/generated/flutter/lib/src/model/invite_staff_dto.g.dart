// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_staff_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InviteStaffDto extends InviteStaffDto {
  @override
  final String email;
  @override
  final String displayName;
  @override
  final BuiltList<String> roleIds;

  factory _$InviteStaffDto([void Function(InviteStaffDtoBuilder)? updates]) =>
      (InviteStaffDtoBuilder()..update(updates))._build();

  _$InviteStaffDto._(
      {required this.email, required this.displayName, required this.roleIds})
      : super._();
  @override
  InviteStaffDto rebuild(void Function(InviteStaffDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InviteStaffDtoBuilder toBuilder() => InviteStaffDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InviteStaffDto &&
        email == other.email &&
        displayName == other.displayName &&
        roleIds == other.roleIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, roleIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InviteStaffDto')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('roleIds', roleIds))
        .toString();
  }
}

class InviteStaffDtoBuilder
    implements Builder<InviteStaffDto, InviteStaffDtoBuilder> {
  _$InviteStaffDto? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  ListBuilder<String>? _roleIds;
  ListBuilder<String> get roleIds => _$this._roleIds ??= ListBuilder<String>();
  set roleIds(ListBuilder<String>? roleIds) => _$this._roleIds = roleIds;

  InviteStaffDtoBuilder() {
    InviteStaffDto._defaults(this);
  }

  InviteStaffDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _roleIds = $v.roleIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InviteStaffDto other) {
    _$v = other as _$InviteStaffDto;
  }

  @override
  void update(void Function(InviteStaffDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InviteStaffDto build() => _build();

  _$InviteStaffDto _build() {
    _$InviteStaffDto _$result;
    try {
      _$result = _$v ??
          _$InviteStaffDto._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'InviteStaffDto', 'email'),
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName, r'InviteStaffDto', 'displayName'),
            roleIds: roleIds.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'roleIds';
        roleIds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'InviteStaffDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
