// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_permission_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminPermissionDto extends AdminPermissionDto {
  @override
  final String key;
  @override
  final String group;
  @override
  final String description;

  factory _$AdminPermissionDto(
          [void Function(AdminPermissionDtoBuilder)? updates]) =>
      (AdminPermissionDtoBuilder()..update(updates))._build();

  _$AdminPermissionDto._(
      {required this.key, required this.group, required this.description})
      : super._();
  @override
  AdminPermissionDto rebuild(
          void Function(AdminPermissionDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminPermissionDtoBuilder toBuilder() =>
      AdminPermissionDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminPermissionDto &&
        key == other.key &&
        group == other.group &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, group.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminPermissionDto')
          ..add('key', key)
          ..add('group', group)
          ..add('description', description))
        .toString();
  }
}

class AdminPermissionDtoBuilder
    implements Builder<AdminPermissionDto, AdminPermissionDtoBuilder> {
  _$AdminPermissionDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _group;
  String? get group => _$this._group;
  set group(String? group) => _$this._group = group;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  AdminPermissionDtoBuilder() {
    AdminPermissionDto._defaults(this);
  }

  AdminPermissionDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _group = $v.group;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminPermissionDto other) {
    _$v = other as _$AdminPermissionDto;
  }

  @override
  void update(void Function(AdminPermissionDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminPermissionDto build() => _build();

  _$AdminPermissionDto _build() {
    final _$result = _$v ??
        _$AdminPermissionDto._(
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'AdminPermissionDto', 'key'),
          group: BuiltValueNullFieldError.checkNotNull(
              group, r'AdminPermissionDto', 'group'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'AdminPermissionDto', 'description'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
