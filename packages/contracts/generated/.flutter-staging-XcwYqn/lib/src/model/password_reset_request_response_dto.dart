//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'password_reset_request_response_dto.g.dart';

/// PasswordResetRequestResponseDto
///
/// Properties:
/// * [accepted] 
@BuiltValue()
abstract class PasswordResetRequestResponseDto implements Built<PasswordResetRequestResponseDto, PasswordResetRequestResponseDtoBuilder> {
  @BuiltValueField(wireName: r'accepted')
  bool get accepted;

  PasswordResetRequestResponseDto._();

  factory PasswordResetRequestResponseDto([void updates(PasswordResetRequestResponseDtoBuilder b)]) = _$PasswordResetRequestResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PasswordResetRequestResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PasswordResetRequestResponseDto> get serializer => _$PasswordResetRequestResponseDtoSerializer();
}

class _$PasswordResetRequestResponseDtoSerializer implements PrimitiveSerializer<PasswordResetRequestResponseDto> {
  @override
  final Iterable<Type> types = const [PasswordResetRequestResponseDto, _$PasswordResetRequestResponseDto];

  @override
  final String wireName = r'PasswordResetRequestResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PasswordResetRequestResponseDto object, {
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
    PasswordResetRequestResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PasswordResetRequestResponseDtoBuilder result,
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
  PasswordResetRequestResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PasswordResetRequestResponseDtoBuilder();
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

