// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_tax_class_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpsertTaxClassDto extends UpsertTaxClassDto {
  @override
  final String name;
  @override
  final bool? isDefault;

  factory _$UpsertTaxClassDto(
          [void Function(UpsertTaxClassDtoBuilder)? updates]) =>
      (UpsertTaxClassDtoBuilder()..update(updates))._build();

  _$UpsertTaxClassDto._({required this.name, this.isDefault}) : super._();
  @override
  UpsertTaxClassDto rebuild(void Function(UpsertTaxClassDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpsertTaxClassDtoBuilder toBuilder() =>
      UpsertTaxClassDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpsertTaxClassDto &&
        name == other.name &&
        isDefault == other.isDefault;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, isDefault.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpsertTaxClassDto')
          ..add('name', name)
          ..add('isDefault', isDefault))
        .toString();
  }
}

class UpsertTaxClassDtoBuilder
    implements Builder<UpsertTaxClassDto, UpsertTaxClassDtoBuilder> {
  _$UpsertTaxClassDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _isDefault;
  bool? get isDefault => _$this._isDefault;
  set isDefault(bool? isDefault) => _$this._isDefault = isDefault;

  UpsertTaxClassDtoBuilder() {
    UpsertTaxClassDto._defaults(this);
  }

  UpsertTaxClassDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _isDefault = $v.isDefault;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpsertTaxClassDto other) {
    _$v = other as _$UpsertTaxClassDto;
  }

  @override
  void update(void Function(UpsertTaxClassDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpsertTaxClassDto build() => _build();

  _$UpsertTaxClassDto _build() {
    final _$result = _$v ??
        _$UpsertTaxClassDto._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'UpsertTaxClassDto', 'name'),
          isDefault: isDefault,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
