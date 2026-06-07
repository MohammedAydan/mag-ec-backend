// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_staff_roles_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateStaffRolesDto extends UpdateStaffRolesDto {
  @override
  final BuiltList<String> roleIds;

  factory _$UpdateStaffRolesDto(
          [void Function(UpdateStaffRolesDtoBuilder)? updates]) =>
      (UpdateStaffRolesDtoBuilder()..update(updates))._build();

  _$UpdateStaffRolesDto._({required this.roleIds}) : super._();
  @override
  UpdateStaffRolesDto rebuild(
          void Function(UpdateStaffRolesDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateStaffRolesDtoBuilder toBuilder() =>
      UpdateStaffRolesDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateStaffRolesDto && roleIds == other.roleIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, roleIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateStaffRolesDto')
          ..add('roleIds', roleIds))
        .toString();
  }
}

class UpdateStaffRolesDtoBuilder
    implements Builder<UpdateStaffRolesDto, UpdateStaffRolesDtoBuilder> {
  _$UpdateStaffRolesDto? _$v;

  ListBuilder<String>? _roleIds;
  ListBuilder<String> get roleIds => _$this._roleIds ??= ListBuilder<String>();
  set roleIds(ListBuilder<String>? roleIds) => _$this._roleIds = roleIds;

  UpdateStaffRolesDtoBuilder() {
    UpdateStaffRolesDto._defaults(this);
  }

  UpdateStaffRolesDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _roleIds = $v.roleIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateStaffRolesDto other) {
    _$v = other as _$UpdateStaffRolesDto;
  }

  @override
  void update(void Function(UpdateStaffRolesDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateStaffRolesDto build() => _build();

  _$UpdateStaffRolesDto _build() {
    _$UpdateStaffRolesDto _$result;
    try {
      _$result = _$v ??
          _$UpdateStaffRolesDto._(
            roleIds: roleIds.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'roleIds';
        roleIds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UpdateStaffRolesDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
