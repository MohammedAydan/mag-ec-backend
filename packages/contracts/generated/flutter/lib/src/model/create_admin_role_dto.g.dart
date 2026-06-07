// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_admin_role_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateAdminRoleDto extends CreateAdminRoleDto {
  @override
  final String key;
  @override
  final String name;
  @override
  final BuiltList<String> permissionKeys;
  @override
  final String? description;

  factory _$CreateAdminRoleDto(
          [void Function(CreateAdminRoleDtoBuilder)? updates]) =>
      (CreateAdminRoleDtoBuilder()..update(updates))._build();

  _$CreateAdminRoleDto._(
      {required this.key,
      required this.name,
      required this.permissionKeys,
      this.description})
      : super._();
  @override
  CreateAdminRoleDto rebuild(
          void Function(CreateAdminRoleDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateAdminRoleDtoBuilder toBuilder() =>
      CreateAdminRoleDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateAdminRoleDto &&
        key == other.key &&
        name == other.name &&
        permissionKeys == other.permissionKeys &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, permissionKeys.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateAdminRoleDto')
          ..add('key', key)
          ..add('name', name)
          ..add('permissionKeys', permissionKeys)
          ..add('description', description))
        .toString();
  }
}

class CreateAdminRoleDtoBuilder
    implements Builder<CreateAdminRoleDto, CreateAdminRoleDtoBuilder> {
  _$CreateAdminRoleDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _permissionKeys;
  ListBuilder<String> get permissionKeys =>
      _$this._permissionKeys ??= ListBuilder<String>();
  set permissionKeys(ListBuilder<String>? permissionKeys) =>
      _$this._permissionKeys = permissionKeys;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  CreateAdminRoleDtoBuilder() {
    CreateAdminRoleDto._defaults(this);
  }

  CreateAdminRoleDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _name = $v.name;
      _permissionKeys = $v.permissionKeys.toBuilder();
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateAdminRoleDto other) {
    _$v = other as _$CreateAdminRoleDto;
  }

  @override
  void update(void Function(CreateAdminRoleDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateAdminRoleDto build() => _build();

  _$CreateAdminRoleDto _build() {
    _$CreateAdminRoleDto _$result;
    try {
      _$result = _$v ??
          _$CreateAdminRoleDto._(
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'CreateAdminRoleDto', 'key'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'CreateAdminRoleDto', 'name'),
            permissionKeys: permissionKeys.build(),
            description: description,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'permissionKeys';
        permissionKeys.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CreateAdminRoleDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
