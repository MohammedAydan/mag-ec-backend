//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/audit_log_actor_dto.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'audit_log_response_dto.g.dart';

/// AuditLogResponseDto
///
/// Properties:
/// * [id]
/// * [category]
/// * [action]
/// * [entityType]
/// * [createdAt]
/// * [actorUserId]
/// * [entityId]
/// * [ipAddress]
/// * [userAgent]
/// * [metadata]
/// * [diff]
/// * [actorUser]
@BuiltValue()
abstract class AuditLogResponseDto
    implements Built<AuditLogResponseDto, AuditLogResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'category')
  String get category;

  @BuiltValueField(wireName: r'action')
  String get action;

  @BuiltValueField(wireName: r'entityType')
  String get entityType;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'actorUserId')
  String? get actorUserId;

  @BuiltValueField(wireName: r'entityId')
  String? get entityId;

  @BuiltValueField(wireName: r'ipAddress')
  String? get ipAddress;

  @BuiltValueField(wireName: r'userAgent')
  String? get userAgent;

  @BuiltValueField(wireName: r'metadata')
  JsonObject? get metadata;

  @BuiltValueField(wireName: r'diff')
  JsonObject? get diff;

  @BuiltValueField(wireName: r'actorUser')
  AuditLogActorDto? get actorUser;

  AuditLogResponseDto._();

  factory AuditLogResponseDto([void updates(AuditLogResponseDtoBuilder b)]) =
      _$AuditLogResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuditLogResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuditLogResponseDto> get serializer =>
      _$AuditLogResponseDtoSerializer();
}

class _$AuditLogResponseDtoSerializer
    implements PrimitiveSerializer<AuditLogResponseDto> {
  @override
  final Iterable<Type> types = const [
    AuditLogResponseDto,
    _$AuditLogResponseDto
  ];

  @override
  final String wireName = r'AuditLogResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuditLogResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'category';
    yield serializers.serialize(
      object.category,
      specifiedType: const FullType(String),
    );
    yield r'action';
    yield serializers.serialize(
      object.action,
      specifiedType: const FullType(String),
    );
    yield r'entityType';
    yield serializers.serialize(
      object.entityType,
      specifiedType: const FullType(String),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(String),
    );
    if (object.actorUserId != null) {
      yield r'actorUserId';
      yield serializers.serialize(
        object.actorUserId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.entityId != null) {
      yield r'entityId';
      yield serializers.serialize(
        object.entityId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.ipAddress != null) {
      yield r'ipAddress';
      yield serializers.serialize(
        object.ipAddress,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.userAgent != null) {
      yield r'userAgent';
      yield serializers.serialize(
        object.userAgent,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.metadata != null) {
      yield r'metadata';
      yield serializers.serialize(
        object.metadata,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.diff != null) {
      yield r'diff';
      yield serializers.serialize(
        object.diff,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.actorUser != null) {
      yield r'actorUser';
      yield serializers.serialize(
        object.actorUser,
        specifiedType: const FullType.nullable(AuditLogActorDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AuditLogResponseDto object, {
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
    required AuditLogResponseDtoBuilder result,
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
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.category = valueDes;
          break;
        case r'action':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.action = valueDes;
          break;
        case r'entityType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.entityType = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'actorUserId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.actorUserId = valueDes;
          break;
        case r'entityId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.entityId = valueDes;
          break;
        case r'ipAddress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ipAddress = valueDes;
          break;
        case r'userAgent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userAgent = valueDes;
          break;
        case r'metadata':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.metadata = valueDes;
          break;
        case r'diff':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.diff = valueDes;
          break;
        case r'actorUser':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AuditLogActorDto),
          ) as AuditLogActorDto?;
          if (valueDes == null) continue;
          result.actorUser.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AuditLogResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuditLogResponseDtoBuilder();
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
