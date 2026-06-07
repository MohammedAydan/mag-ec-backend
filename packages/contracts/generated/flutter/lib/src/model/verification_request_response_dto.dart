//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'verification_request_response_dto.g.dart';

/// VerificationRequestResponseDto
///
/// Properties:
/// * [accepted]
@BuiltValue()
abstract class VerificationRequestResponseDto
    implements
        Built<VerificationRequestResponseDto,
            VerificationRequestResponseDtoBuilder> {
  @BuiltValueField(wireName: r'accepted')
  bool get accepted;

  VerificationRequestResponseDto._();

  factory VerificationRequestResponseDto(
          [void updates(VerificationRequestResponseDtoBuilder b)]) =
      _$VerificationRequestResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VerificationRequestResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VerificationRequestResponseDto> get serializer =>
      _$VerificationRequestResponseDtoSerializer();
}

class _$VerificationRequestResponseDtoSerializer
    implements PrimitiveSerializer<VerificationRequestResponseDto> {
  @override
  final Iterable<Type> types = const [
    VerificationRequestResponseDto,
    _$VerificationRequestResponseDto
  ];

  @override
  final String wireName = r'VerificationRequestResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VerificationRequestResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'accepted';
    yield serializers.serialize(
      object.accepted,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    VerificationRequestResponseDto object, {
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
    required VerificationRequestResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'accepted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.accepted = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VerificationRequestResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VerificationRequestResponseDtoBuilder();
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
