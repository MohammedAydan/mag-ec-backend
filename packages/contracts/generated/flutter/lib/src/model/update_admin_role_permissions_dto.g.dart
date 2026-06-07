// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_admin_role_permissions_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateAdminRolePermissionsDto extends UpdateAdminRolePermissionsDto {
  @override
  final BuiltList<String> permissionKeys;

  factory _$UpdateAdminRolePermissionsDto(
          [void Function(UpdateAdminRolePermissionsDtoBuilder)? updates]) =>
      (UpdateAdminRolePermissionsDtoBuilder()..update(updates))._build();

  _$UpdateAdminRolePermissionsDto._({required this.permissionKeys}) : super._();
  @override
  UpdateAdminRolePermissionsDto rebuild(
          void Function(UpdateAdminRolePermissionsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateAdminRolePermissionsDtoBuilder toBuilder() =>
      UpdateAdminRolePermissionsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateAdminRolePermissionsDto &&
        permissionKeys == other.permissionKeys;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, permissionKeys.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateAdminRolePermissionsDto')
          ..add('permissionKeys', permissionKeys))
        .toString();
  }
}

class UpdateAdminRolePermissionsDtoBuilder
    implements
        Builder<UpdateAdminRolePermissionsDto,
            UpdateAdminRolePermissionsDtoBuilder> {
  _$UpdateAdminRolePermissionsDto? _$v;

  ListBuilder<String>? _permissionKeys;
  ListBuilder<String> get permissionKeys =>
      _$this._permissionKeys ??= ListBuilder<String>();
  set permissionKeys(ListBuilder<String>? permissionKeys) =>
      _$this._permissionKeys = permissionKeys;

  UpdateAdminRolePermissionsDtoBuilder() {
    UpdateAdminRolePermissionsDto._defaults(this);
  }

  UpdateAdminRolePermissionsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _permissionKeys = $v.permissionKeys.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateAdminRolePermissionsDto other) {
    _$v = other as _$UpdateAdminRolePermissionsDto;
  }

  @override
  void update(void Function(UpdateAdminRolePermissionsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateAdminRolePermissionsDto build() => _build();

  _$UpdateAdminRolePermissionsDto _build() {
    _$UpdateAdminRolePermissionsDto _$result;
    try {
      _$result = _$v ??
          _$UpdateAdminRolePermissionsDto._(
            permissionKeys: permissionKeys.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'permissionKeys';
        permissionKeys.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UpdateAdminRolePermissionsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
