//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notification_user_brief_dto.g.dart';

/// NotificationUserBriefDto
///
/// Properties:
/// * [id]
/// * [email]
/// * [displayName]
/// * [userType]
@BuiltValue()
abstract class NotificationUserBriefDto
    implements
        Built<NotificationUserBriefDto, NotificationUserBriefDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'displayName')
  String get displayName;

  @BuiltValueField(wireName: r'userType')
  String get userType;

  NotificationUserBriefDto._();

  factory NotificationUserBriefDto(
          [void updates(NotificationUserBriefDtoBuilder b)]) =
      _$NotificationUserBriefDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NotificationUserBriefDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NotificationUserBriefDto> get serializer =>
      _$NotificationUserBriefDtoSerializer();
}

class _$NotificationUserBriefDtoSerializer
    implements PrimitiveSerializer<NotificationUserBriefDto> {
  @override
  final Iterable<Type> types = const [
    NotificationUserBriefDto,
    _$NotificationUserBriefDto
  ];

  @override
  final String wireName = r'NotificationUserBriefDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NotificationUserBriefDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'displayName';
    yield serializers.serialize(
      object.displayName,
      specifiedType: const FullType(String),
    );
    yield r'userType';
    yield serializers.serialize(
      object.userType,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NotificationUserBriefDto object, {
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
    required NotificationUserBriefDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'displayName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.displayName = valueDes;
          break;
        case r'userType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NotificationUserBriefDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NotificationUserBriefDtoBuilder();
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
