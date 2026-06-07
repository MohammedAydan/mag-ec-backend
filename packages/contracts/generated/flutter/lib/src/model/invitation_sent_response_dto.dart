//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'invitation_sent_response_dto.g.dart';

/// InvitationSentResponseDto
///
/// Properties:
/// * [invitationSent]
@BuiltValue()
abstract class InvitationSentResponseDto
    implements
        Built<InvitationSentResponseDto, InvitationSentResponseDtoBuilder> {
  @BuiltValueField(wireName: r'invitationSent')
  bool get invitationSent;

  InvitationSentResponseDto._();

  factory InvitationSentResponseDto(
          [void updates(InvitationSentResponseDtoBuilder b)]) =
      _$InvitationSentResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InvitationSentResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InvitationSentResponseDto> get serializer =>
      _$InvitationSentResponseDtoSerializer();
}

class _$InvitationSentResponseDtoSerializer
    implements PrimitiveSerializer<InvitationSentResponseDto> {
  @override
  final Iterable<Type> types = const [
    InvitationSentResponseDto,
    _$InvitationSentResponseDto
  ];

  @override
  final String wireName = r'InvitationSentResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InvitationSentResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'invitationSent';
    yield serializers.serialize(
      object.invitationSent,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    InvitationSentResponseDto object, {
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
    required InvitationSentResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'invitationSent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.invitationSent = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InvitationSentResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InvitationSentResponseDtoBuilder();
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
