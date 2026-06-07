//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'health_indicator_detail_dto.g.dart';

/// HealthIndicatorDetailDto
///
/// Properties:
/// * [status] 
/// * [message] 
/// * [mode] 
/// * [redisRequired] 
@BuiltValue()
abstract class HealthIndicatorDetailDto implements Built<HealthIndicatorDetailDto, HealthIndicatorDetailDtoBuilder> {
  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'mode')
  String? get mode;

  @BuiltValueField(wireName: r'redisRequired')
  bool? get redisRequired;

  HealthIndicatorDetailDto._();

  factory HealthIndicatorDetailDto([void updates(HealthIndicatorDetailDtoBuilder b)]) = _$HealthIndicatorDetailDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HealthIndicatorDetailDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HealthIndicatorDetailDto> get serializer => _$HealthIndicatorDetailDtoSerializer();
}

class _$HealthIndicatorDetailDtoSerializer implements PrimitiveSerializer<HealthIndicatorDetailDto> {
  @override
  final Iterable<Type> types = const [HealthIndicatorDetailDto, _$HealthIndicatorDetailDto];

  @override
  final String wireName = r'HealthIndicatorDetailDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HealthIndicatorDetailDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
    if (object.mode != null) {
      yield r'mode';
      yield serializers.serialize(
        object.mode,
        specifiedType: const FullType(String),
      );
    }
    if (object.redisRequired != null) {
      yield r'redisRequired';
      yield serializers.serialize(
        object.redisRequired,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    HealthIndicatorDetailDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required HealthIndicatorDetailDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mode = valueDes;
          break;
        case r'redisRequired':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.redisRequired = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HealthIndicatorDetailDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HealthIndicatorDetailDtoBuilder();
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

