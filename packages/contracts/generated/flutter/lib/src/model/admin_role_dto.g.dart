// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_role_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminRoleDto extends AdminRoleDto {
  @override
  final String id;
  @override
  final String key;
  @override
  final String name;
  @override
  final BuiltList<AdminPermissionDto> permissions;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String? description;
  @override
  final num? staffCount;

  factory _$AdminRoleDto([void Function(AdminRoleDtoBuilder)? updates]) =>
      (AdminRoleDtoBuilder()..update(updates))._build();

  _$AdminRoleDto._(
      {required this.id,
      required this.key,
      required this.name,
      required this.permissions,
      required this.createdAt,
      required this.updatedAt,
      this.description,
      this.staffCount})
      : super._();
  @override
  AdminRoleDto rebuild(void Function(AdminRoleDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminRoleDtoBuilder toBuilder() => AdminRoleDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminRoleDto &&
        id == other.id &&
        key == other.key &&
        name == other.name &&
        permissions == other.permissions &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        description == other.description &&
        staffCount == other.staffCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, permissions.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, staffCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminRoleDto')
          ..add('id', id)
          ..add('key', key)
          ..add('name', name)
          ..add('permissions', permissions)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('description', description)
          ..add('staffCount', staffCount))
        .toString();
  }
}

class AdminRoleDtoBuilder
    implements Builder<AdminRoleDto, AdminRoleDtoBuilder> {
  _$AdminRoleDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<AdminPermissionDto>? _permissions;
  ListBuilder<AdminPermissionDto> get permissions =>
      _$this._permissions ??= ListBuilder<AdminPermissionDto>();
  set permissions(ListBuilder<AdminPermissionDto>? permissions) =>
      _$this._permissions = permissions;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  num? _staffCount;
  num? get staffCount => _$this._staffCount;
  set staffCount(num? staffCount) => _$this._staffCount = staffCount;

  AdminRoleDtoBuilder() {
    AdminRoleDto._defaults(this);
  }

  AdminRoleDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _name = $v.name;
      _permissions = $v.permissions.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _description = $v.description;
      _staffCount = $v.staffCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminRoleDto other) {
    _$v = other as _$AdminRoleDto;
  }

  @override
  void update(void Function(AdminRoleDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminRoleDto build() => _build();

  _$AdminRoleDto _build() {
    _$AdminRoleDto _$result;
    try {
      _$result = _$v ??
          _$AdminRoleDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AdminRoleDto', 'id'),
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'AdminRoleDto', 'key'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'AdminRoleDto', 'name'),
            permissions: permissions.build(),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'AdminRoleDto', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'AdminRoleDto', 'updatedAt'),
            description: description,
            staffCount: staffCount,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'permissions';
        permissions.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AdminRoleDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
