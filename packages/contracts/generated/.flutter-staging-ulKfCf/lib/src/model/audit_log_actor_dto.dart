//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'audit_log_actor_dto.g.dart';

/// AuditLogActorDto
///
/// Properties:
/// * [id] 
/// * [displayName] 
/// * [userType] 
/// * [status] 
@BuiltValue()
abstract class AuditLogActorDto implements Built<AuditLogActorDto, AuditLogActorDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'displayName')
  String get displayName;

  @BuiltValueField(wireName: r'userType')
  String get userType;

  @BuiltValueField(wireName: r'status')
  String get status;

  AuditLogActorDto._();

  factory AuditLogActorDto([void updates(AuditLogActorDtoBuilder b)]) = _$AuditLogActorDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuditLogActorDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuditLogActorDto> get serializer => _$AuditLogActorDtoSerializer();
}

class _$AuditLogActorDtoSerializer implements PrimitiveSerializer<AuditLogActorDto> {
  @override
  final Iterable<Type> types = const [AuditLogActorDto, _$AuditLogActorDto];

  @override
  final String wireName = r'AuditLogActorDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuditLogActorDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
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
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AuditLogActorDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AuditLogActorDtoBuilder result,
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
  AuditLogActorDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuditLogActorDtoBuilder();
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

