// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_push_device_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RegisterPushDeviceDtoPlatformEnum
    _$registerPushDeviceDtoPlatformEnum_android =
    const RegisterPushDeviceDtoPlatformEnum._('android');
const RegisterPushDeviceDtoPlatformEnum
    _$registerPushDeviceDtoPlatformEnum_ios =
    const RegisterPushDeviceDtoPlatformEnum._('ios');
const RegisterPushDeviceDtoPlatformEnum
    _$registerPushDeviceDtoPlatformEnum_web =
    const RegisterPushDeviceDtoPlatformEnum._('web');

RegisterPushDeviceDtoPlatformEnum _$registerPushDeviceDtoPlatformEnumValueOf(
    String name) {
  switch (name) {
    case 'android':
      return _$registerPushDeviceDtoPlatformEnum_android;
    case 'ios':
      return _$registerPushDeviceDtoPlatformEnum_ios;
    case 'web':
      return _$registerPushDeviceDtoPlatformEnum_web;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<RegisterPushDeviceDtoPlatformEnum>
    _$registerPushDeviceDtoPlatformEnumValues = BuiltSet<
        RegisterPushDeviceDtoPlatformEnum>(const <RegisterPushDeviceDtoPlatformEnum>[
  _$registerPushDeviceDtoPlatformEnum_android,
  _$registerPushDeviceDtoPlatformEnum_ios,
  _$registerPushDeviceDtoPlatformEnum_web,
]);

Serializer<RegisterPushDeviceDtoPlatformEnum>
    _$registerPushDeviceDtoPlatformEnumSerializer =
    _$RegisterPushDeviceDtoPlatformEnumSerializer();

class _$RegisterPushDeviceDtoPlatformEnumSerializer
    implements PrimitiveSerializer<RegisterPushDeviceDtoPlatformEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'android': 'android',
    'ios': 'ios',
    'web': 'web',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'android': 'android',
    'ios': 'ios',
    'web': 'web',
  };

  @override
  final Iterable<Type> types = const <Type>[RegisterPushDeviceDtoPlatformEnum];
  @override
  final String wireName = 'RegisterPushDeviceDtoPlatformEnum';

  @override
  Object serialize(
          Serializers serializers, RegisterPushDeviceDtoPlatformEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  RegisterPushDeviceDtoPlatformEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      RegisterPushDeviceDtoPlatformEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$RegisterPushDeviceDto extends RegisterPushDeviceDto {
  @override
  final String token;
  @override
  final RegisterPushDeviceDtoPlatformEnum platform;

  factory _$RegisterPushDeviceDto(
          [void Function(RegisterPushDeviceDtoBuilder)? updates]) =>
      (RegisterPushDeviceDtoBuilder()..update(updates))._build();

  _$RegisterPushDeviceDto._({required this.token, required this.platform})
      : super._();
  @override
  RegisterPushDeviceDto rebuild(
          void Function(RegisterPushDeviceDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterPushDeviceDtoBuilder toBuilder() =>
      RegisterPushDeviceDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterPushDeviceDto &&
        token == other.token &&
        platform == other.platform;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, platform.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterPushDeviceDto')
          ..add('token', token)
          ..add('platform', platform))
        .toString();
  }
}

class RegisterPushDeviceDtoBuilder
    implements Builder<RegisterPushDeviceDto, RegisterPushDeviceDtoBuilder> {
  _$RegisterPushDeviceDto? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  RegisterPushDeviceDtoPlatformEnum? _platform;
  RegisterPushDeviceDtoPlatformEnum? get platform => _$this._platform;
  set platform(RegisterPushDeviceDtoPlatformEnum? platform) =>
      _$this._platform = platform;

  RegisterPushDeviceDtoBuilder() {
    RegisterPushDeviceDto._defaults(this);
  }

  RegisterPushDeviceDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _platform = $v.platform;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterPushDeviceDto other) {
    _$v = other as _$RegisterPushDeviceDto;
  }

  @override
  void update(void Function(RegisterPushDeviceDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterPushDeviceDto build() => _build();

  _$RegisterPushDeviceDto _build() {
    final _$result = _$v ??
        _$RegisterPushDeviceDto._(
          token: BuiltValueNullFieldError.checkNotNull(
              token, r'RegisterPushDeviceDto', 'token'),
          platform: BuiltValueNullFieldError.checkNotNull(
              platform, r'RegisterPushDeviceDto', 'platform'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
