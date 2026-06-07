//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'password_reset_confirm_response_dto.g.dart';

/// PasswordResetConfirmResponseDto
///
/// Properties:
/// * [passwordReset] 
@BuiltValue()
abstract class PasswordResetConfirmResponseDto implements Built<PasswordResetConfirmResponseDto, PasswordResetConfirmResponseDtoBuilder> {
  @BuiltValueField(wireName: r'passwordReset')
  bool get passwordReset;

  PasswordResetConfirmResponseDto._();

  factory PasswordResetConfirmResponseDto([void updates(PasswordResetConfirmResponseDtoBuilder b)]) = _$PasswordResetConfirmResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PasswordResetConfirmResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PasswordResetConfirmResponseDto> get serializer => _$PasswordResetConfirmResponseDtoSerializer();
}

class _$PasswordResetConfirmResponseDtoSerializer implements PrimitiveSerializer<PasswordResetConfirmResponseDto> {
  @override
  final Iterable<Type> types = const [PasswordResetConfirmResponseDto, _$PasswordResetConfirmResponseDto];

  @override
  final String wireName = r'PasswordResetConfirmResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PasswordResetConfirmResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'passwordReset';
    yield serializers.serialize(
      object.passwordReset,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PasswordResetConfirmResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PasswordResetConfirmResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'passwordReset':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.passwordReset = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PasswordResetConfirmResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PasswordResetConfirmResponseDtoBuilder();
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

