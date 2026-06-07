// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserRoleDto extends UserRoleDto {
  @override
  final String id;
  @override
  final String key;
  @override
  final String name;

  factory _$UserRoleDto([void Function(UserRoleDtoBuilder)? updates]) =>
      (UserRoleDtoBuilder()..update(updates))._build();

  _$UserRoleDto._({required this.id, required this.key, required this.name})
      : super._();
  @override
  UserRoleDto rebuild(void Function(UserRoleDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserRoleDtoBuilder toBuilder() => UserRoleDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserRoleDto &&
        id == other.id &&
        key == other.key &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserRoleDto')
          ..add('id', id)
          ..add('key', key)
          ..add('name', name))
        .toString();
  }
}

class UserRoleDtoBuilder implements Builder<UserRoleDto, UserRoleDtoBuilder> {
  _$UserRoleDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  UserRoleDtoBuilder() {
    UserRoleDto._defaults(this);
  }

  UserRoleDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserRoleDto other) {
    _$v = other as _$UserRoleDto;
  }

  @override
  void update(void Function(UserRoleDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserRoleDto build() => _build();

  _$UserRoleDto _build() {
    final _$result = _$v ??
        _$UserRoleDto._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'UserRoleDto', 'id'),
          key:
              BuiltValueNullFieldError.checkNotNull(key, r'UserRoleDto', 'key'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'UserRoleDto', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
