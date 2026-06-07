// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_class_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaxClassResponseDto extends TaxClassResponseDto {
  @override
  final String id;
  @override
  final String key;
  @override
  final String name;
  @override
  final bool isDefault;
  @override
  final String updatedAt;

  factory _$TaxClassResponseDto(
          [void Function(TaxClassResponseDtoBuilder)? updates]) =>
      (TaxClassResponseDtoBuilder()..update(updates))._build();

  _$TaxClassResponseDto._(
      {required this.id,
      required this.key,
      required this.name,
      required this.isDefault,
      required this.updatedAt})
      : super._();
  @override
  TaxClassResponseDto rebuild(
          void Function(TaxClassResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaxClassResponseDtoBuilder toBuilder() =>
      TaxClassResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaxClassResponseDto &&
        id == other.id &&
        key == other.key &&
        name == other.name &&
        isDefault == other.isDefault &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, isDefault.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaxClassResponseDto')
          ..add('id', id)
          ..add('key', key)
          ..add('name', name)
          ..add('isDefault', isDefault)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class TaxClassResponseDtoBuilder
    implements Builder<TaxClassResponseDto, TaxClassResponseDtoBuilder> {
  _$TaxClassResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _isDefault;
  bool? get isDefault => _$this._isDefault;
  set isDefault(bool? isDefault) => _$this._isDefault = isDefault;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  TaxClassResponseDtoBuilder() {
    TaxClassResponseDto._defaults(this);
  }

  TaxClassResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _name = $v.name;
      _isDefault = $v.isDefault;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaxClassResponseDto other) {
    _$v = other as _$TaxClassResponseDto;
  }

  @override
  void update(void Function(TaxClassResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaxClassResponseDto build() => _build();

  _$TaxClassResponseDto _build() {
    final _$result = _$v ??
        _$TaxClassResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'TaxClassResponseDto', 'id'),
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'TaxClassResponseDto', 'key'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'TaxClassResponseDto', 'name'),
          isDefault: BuiltValueNullFieldError.checkNotNull(
              isDefault, r'TaxClassResponseDto', 'isDefault'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'TaxClassResponseDto', 'updatedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
