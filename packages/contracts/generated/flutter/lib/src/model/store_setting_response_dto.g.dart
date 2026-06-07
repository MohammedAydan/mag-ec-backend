// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_setting_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StoreSettingResponseDto extends StoreSettingResponseDto {
  @override
  final String id;
  @override
  final String key;
  @override
  final JsonObject value;
  @override
  final bool isPublic;
  @override
  final String updatedAt;
  @override
  final String? description;

  factory _$StoreSettingResponseDto(
          [void Function(StoreSettingResponseDtoBuilder)? updates]) =>
      (StoreSettingResponseDtoBuilder()..update(updates))._build();

  _$StoreSettingResponseDto._(
      {required this.id,
      required this.key,
      required this.value,
      required this.isPublic,
      required this.updatedAt,
      this.description})
      : super._();
  @override
  StoreSettingResponseDto rebuild(
          void Function(StoreSettingResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoreSettingResponseDtoBuilder toBuilder() =>
      StoreSettingResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreSettingResponseDto &&
        id == other.id &&
        key == other.key &&
        value == other.value &&
        isPublic == other.isPublic &&
        updatedAt == other.updatedAt &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, isPublic.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StoreSettingResponseDto')
          ..add('id', id)
          ..add('key', key)
          ..add('value', value)
          ..add('isPublic', isPublic)
          ..add('updatedAt', updatedAt)
          ..add('description', description))
        .toString();
  }
}

class StoreSettingResponseDtoBuilder
    implements
        Builder<StoreSettingResponseDto, StoreSettingResponseDtoBuilder> {
  _$StoreSettingResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  JsonObject? _value;
  JsonObject? get value => _$this._value;
  set value(JsonObject? value) => _$this._value = value;

  bool? _isPublic;
  bool? get isPublic => _$this._isPublic;
  set isPublic(bool? isPublic) => _$this._isPublic = isPublic;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  StoreSettingResponseDtoBuilder() {
    StoreSettingResponseDto._defaults(this);
  }

  StoreSettingResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _value = $v.value;
      _isPublic = $v.isPublic;
      _updatedAt = $v.updatedAt;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoreSettingResponseDto other) {
    _$v = other as _$StoreSettingResponseDto;
  }

  @override
  void update(void Function(StoreSettingResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StoreSettingResponseDto build() => _build();

  _$StoreSettingResponseDto _build() {
    final _$result = _$v ??
        _$StoreSettingResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'StoreSettingResponseDto', 'id'),
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'StoreSettingResponseDto', 'key'),
          value: BuiltValueNullFieldError.checkNotNull(
              value, r'StoreSettingResponseDto', 'value'),
          isPublic: BuiltValueNullFieldError.checkNotNull(
              isPublic, r'StoreSettingResponseDto', 'isPublic'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'StoreSettingResponseDto', 'updatedAt'),
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
