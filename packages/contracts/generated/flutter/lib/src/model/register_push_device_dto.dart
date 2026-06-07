//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_push_device_dto.g.dart';

/// RegisterPushDeviceDto
///
/// Properties:
/// * [token] - Push notification device token
/// * [platform] - Push device platform
@BuiltValue()
abstract class RegisterPushDeviceDto
    implements Built<RegisterPushDeviceDto, RegisterPushDeviceDtoBuilder> {
  /// Push notification device token
  @BuiltValueField(wireName: r'token')
  String get token;

  /// Push device platform
  @BuiltValueField(wireName: r'platform')
  RegisterPushDeviceDtoPlatformEnum get platform;
  // enum platformEnum {  android,  ios,  web,  };

  RegisterPushDeviceDto._();

  factory RegisterPushDeviceDto(
      [void updates(RegisterPushDeviceDtoBuilder b)]) = _$RegisterPushDeviceDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterPushDeviceDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterPushDeviceDto> get serializer =>
      _$RegisterPushDeviceDtoSerializer();
}

class _$RegisterPushDeviceDtoSerializer
    implements PrimitiveSerializer<RegisterPushDeviceDto> {
  @override
  final Iterable<Type> types = const [
    RegisterPushDeviceDto,
    _$RegisterPushDeviceDto
  ];

  @override
  final String wireName = r'RegisterPushDeviceDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterPushDeviceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'token';
    yield serializers.serialize(
      object.token,
      specifiedType: const FullType(String),
    );
    yield r'platform';
    yield serializers.serialize(
      object.platform,
      specifiedType: const FullType(RegisterPushDeviceDtoPlatformEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterPushDeviceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterPushDeviceDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.token = valueDes;
          break;
        case r'platform':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RegisterPushDeviceDtoPlatformEnum),
          ) as RegisterPushDeviceDtoPlatformEnum;
          result.platform = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterPushDeviceDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterPushDeviceDtoBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

class RegisterPushDeviceDtoPlatformEnum extends EnumClass {
  /// Push device platform
  @BuiltValueEnumConst(wireName: r'android')
  static const RegisterPushDeviceDtoPlatformEnum android =
      _$registerPushDeviceDtoPlatformEnum_android;

  /// Push device platform
  @BuiltValueEnumConst(wireName: r'ios')
  static const RegisterPushDeviceDtoPlatformEnum ios =
      _$registerPushDeviceDtoPlatformEnum_ios;

  /// Push device platform
  @BuiltValueEnumConst(wireName: r'web')
  static const RegisterPushDeviceDtoPlatformEnum web =
      _$registerPushDeviceDtoPlatformEnum_web;

  static Serializer<RegisterPushDeviceDtoPlatformEnum> get serializer =>
      _$registerPushDeviceDtoPlatformEnumSerializer;

  const RegisterPushDeviceDtoPlatformEnum._(String name) : super(name);

  static BuiltSet<RegisterPushDeviceDtoPlatformEnum> get values =>
      _$registerPushDeviceDtoPlatformEnumValues;
  static RegisterPushDeviceDtoPlatformEnum valueOf(String name) =>
      _$registerPushDeviceDtoPlatformEnumValueOf(name);
}
