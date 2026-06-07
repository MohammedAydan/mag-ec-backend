//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'health_liveness_response_dto.g.dart';

/// HealthLivenessResponseDto
///
/// Properties:
/// * [status] 
@BuiltValue()
abstract class HealthLivenessResponseDto implements Built<HealthLivenessResponseDto, HealthLivenessResponseDtoBuilder> {
  @BuiltValueField(wireName: r'status')
  String get status;

  HealthLivenessResponseDto._();

  factory HealthLivenessResponseDto([void updates(HealthLivenessResponseDtoBuilder b)]) = _$HealthLivenessResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HealthLivenessResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HealthLivenessResponseDto> get serializer => _$HealthLivenessResponseDtoSerializer();
}

class _$HealthLivenessResponseDtoSerializer implements PrimitiveSerializer<HealthLivenessResponseDto> {
  @override
  final Iterable<Type> types = const [HealthLivenessResponseDto, _$HealthLivenessResponseDto];

  @override
  final String wireName = r'HealthLivenessResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HealthLivenessResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    HealthLivenessResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required HealthLivenessResponseDtoBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HealthLivenessResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HealthLivenessResponseDtoBuilder();
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

