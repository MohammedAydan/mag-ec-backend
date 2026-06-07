//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/notification_user_brief_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notification_response_dto.g.dart';

/// NotificationResponseDto
///
/// Properties:
/// * [id]
/// * [channel]
/// * [eventType]
/// * [title]
/// * [status]
/// * [deduplicationKey]
/// * [attempts]
/// * [createdAt]
/// * [updatedAt]
/// * [userId]
/// * [recipientEmail]
/// * [body]
/// * [relatedEntityType]
/// * [relatedEntityId]
/// * [lastError]
/// * [availableAt]
/// * [processedAt]
/// * [user]
@BuiltValue()
abstract class NotificationResponseDto
    implements Built<NotificationResponseDto, NotificationResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'channel')
  String get channel;

  @BuiltValueField(wireName: r'eventType')
  String get eventType;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'deduplicationKey')
  String get deduplicationKey;

  @BuiltValueField(wireName: r'attempts')
  num get attempts;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  @BuiltValueField(wireName: r'userId')
  String? get userId;

  @BuiltValueField(wireName: r'recipientEmail')
  String? get recipientEmail;

  @BuiltValueField(wireName: r'body')
  String? get body;

  @BuiltValueField(wireName: r'relatedEntityType')
  String? get relatedEntityType;

  @BuiltValueField(wireName: r'relatedEntityId')
  String? get relatedEntityId;

  @BuiltValueField(wireName: r'lastError')
  String? get lastError;

  @BuiltValueField(wireName: r'availableAt')
  String? get availableAt;

  @BuiltValueField(wireName: r'processedAt')
  String? get processedAt;

  @BuiltValueField(wireName: r'user')
  NotificationUserBriefDto? get user;

  NotificationResponseDto._();

  factory NotificationResponseDto(
          [void updates(NotificationResponseDtoBuilder b)]) =
      _$NotificationResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NotificationResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NotificationResponseDto> get serializer =>
      _$NotificationResponseDtoSerializer();
}

class _$NotificationResponseDtoSerializer
    implements PrimitiveSerializer<NotificationResponseDto> {
  @override
  final Iterable<Type> types = const [
    NotificationResponseDto,
    _$NotificationResponseDto
  ];

  @override
  final String wireName = r'NotificationResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NotificationResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'channel';
    yield serializers.serialize(
      object.channel,
      specifiedType: const FullType(String),
    );
    yield r'eventType';
    yield serializers.serialize(
      object.eventType,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'deduplicationKey';
    yield serializers.serialize(
      object.deduplicationKey,
      specifiedType: const FullType(String),
    );
    yield r'attempts';
    yield serializers.serialize(
      object.attempts,
      specifiedType: const FullType(num),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(String),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(String),
    );
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.recipientEmail != null) {
      yield r'recipientEmail';
      yield serializers.serialize(
        object.recipientEmail,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.body != null) {
      yield r'body';
      yield serializers.serialize(
        object.body,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.relatedEntityType != null) {
      yield r'relatedEntityType';
      yield serializers.serialize(
        object.relatedEntityType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.relatedEntityId != null) {
      yield r'relatedEntityId';
      yield serializers.serialize(
        object.relatedEntityId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.lastError != null) {
      yield r'lastError';
      yield serializers.serialize(
        object.lastError,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.availableAt != null) {
      yield r'availableAt';
      yield serializers.serialize(
        object.availableAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.processedAt != null) {
      yield r'processedAt';
      yield serializers.serialize(
        object.processedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.user != null) {
      yield r'user';
      yield serializers.serialize(
        object.user,
        specifiedType: const FullType.nullable(NotificationUserBriefDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    NotificationResponseDto object, {
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
    required NotificationResponseDtoBuilder result,
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
        case r'channel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.channel = valueDes;
          break;
        case r'eventType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.eventType = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'deduplicationKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.deduplicationKey = valueDes;
          break;
        case r'attempts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.attempts = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.updatedAt = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'recipientEmail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.recipientEmail = valueDes;
          break;
        case r'body':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.body = valueDes;
          break;
        case r'relatedEntityType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.relatedEntityType = valueDes;
          break;
        case r'relatedEntityId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.relatedEntityId = valueDes;
          break;
        case r'lastError':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.lastError = valueDes;
          break;
        case r'availableAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.availableAt = valueDes;
          break;
        case r'processedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.processedAt = valueDes;
          break;
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(NotificationUserBriefDto),
          ) as NotificationUserBriefDto?;
          if (valueDes == null) continue;
          result.user.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NotificationResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NotificationResponseDtoBuilder();
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
