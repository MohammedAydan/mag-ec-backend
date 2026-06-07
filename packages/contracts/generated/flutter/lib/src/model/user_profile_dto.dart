//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/user_role_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_profile_dto.g.dart';

/// UserProfileDto
///
/// Properties:
/// * [id]
/// * [email]
/// * [displayName]
/// * [userType]
/// * [status]
/// * [createdAt]
/// * [roles]
/// * [emailVerifiedAt]
/// * [lastLoginAt]
@BuiltValue()
abstract class UserProfileDto
    implements Built<UserProfileDto, UserProfileDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'displayName')
  String get displayName;

  @BuiltValueField(wireName: r'userType')
  String get userType;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'roles')
  BuiltList<UserRoleDto> get roles;

  @BuiltValueField(wireName: r'emailVerifiedAt')
  String? get emailVerifiedAt;

  @BuiltValueField(wireName: r'lastLoginAt')
  String? get lastLoginAt;

  UserProfileDto._();

  factory UserProfileDto([void updates(UserProfileDtoBuilder b)]) =
      _$UserProfileDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserProfileDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserProfileDto> get serializer =>
      _$UserProfileDtoSerializer();
}

class _$UserProfileDtoSerializer
    implements PrimitiveSerializer<UserProfileDto> {
  @override
  final Iterable<Type> types = const [UserProfileDto, _$UserProfileDto];

  @override
  final String wireName = r'UserProfileDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserProfileDto object, {
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
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(String),
    );
    yield r'roles';
    yield serializers.serialize(
      object.roles,
      specifiedType: const FullType(BuiltList, [FullType(UserRoleDto)]),
    );
    if (object.emailVerifiedAt != null) {
      yield r'emailVerifiedAt';
      yield serializers.serialize(
        object.emailVerifiedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.lastLoginAt != null) {
      yield r'lastLoginAt';
      yield serializers.serialize(
        object.lastLoginAt,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserProfileDto object, {
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
    required UserProfileDtoBuilder result,
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
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'roles':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UserRoleDto)]),
          ) as BuiltList<UserRoleDto>;
          result.roles.replace(valueDes);
          break;
        case r'emailVerifiedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.emailVerifiedAt = valueDes;
          break;
        case r'lastLoginAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.lastLoginAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserProfileDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserProfileDtoBuilder();
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
