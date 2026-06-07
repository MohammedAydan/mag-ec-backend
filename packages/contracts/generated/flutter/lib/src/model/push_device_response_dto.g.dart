// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_device_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PushDeviceResponseDto extends PushDeviceResponseDto {
  @override
  final String id;
  @override
  final String userId;
  @override
  final String token;
  @override
  final String platform;
  @override
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  factory _$PushDeviceResponseDto(
          [void Function(PushDeviceResponseDtoBuilder)? updates]) =>
      (PushDeviceResponseDtoBuilder()..update(updates))._build();

  _$PushDeviceResponseDto._(
      {required this.id,
      required this.userId,
      required this.token,
      required this.platform,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt})
      : super._();
  @override
  PushDeviceResponseDto rebuild(
          void Function(PushDeviceResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PushDeviceResponseDtoBuilder toBuilder() =>
      PushDeviceResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PushDeviceResponseDto &&
        id == other.id &&
        userId == other.userId &&
        token == other.token &&
        platform == other.platform &&
        isActive == other.isActive &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, platform.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PushDeviceResponseDto')
          ..add('id', id)
          ..add('userId', userId)
          ..add('token', token)
          ..add('platform', platform)
          ..add('isActive', isActive)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class PushDeviceResponseDtoBuilder
    implements Builder<PushDeviceResponseDto, PushDeviceResponseDtoBuilder> {
  _$PushDeviceResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _platform;
  String? get platform => _$this._platform;
  set platform(String? platform) => _$this._platform = platform;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  PushDeviceResponseDtoBuilder() {
    PushDeviceResponseDto._defaults(this);
  }

  PushDeviceResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _token = $v.token;
      _platform = $v.platform;
      _isActive = $v.isActive;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PushDeviceResponseDto other) {
    _$v = other as _$PushDeviceResponseDto;
  }

  @override
  void update(void Function(PushDeviceResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PushDeviceResponseDto build() => _build();

  _$PushDeviceResponseDto _build() {
    final _$result = _$v ??
        _$PushDeviceResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'PushDeviceResponseDto', 'id'),
          userId: BuiltValueNullFieldError.checkNotNull(
              userId, r'PushDeviceResponseDto', 'userId'),
          token: BuiltValueNullFieldError.checkNotNull(
              token, r'PushDeviceResponseDto', 'token'),
          platform: BuiltValueNullFieldError.checkNotNull(
              platform, r'PushDeviceResponseDto', 'platform'),
          isActive: BuiltValueNullFieldError.checkNotNull(
              isActive, r'PushDeviceResponseDto', 'isActive'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'PushDeviceResponseDto', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'PushDeviceResponseDto', 'updatedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
