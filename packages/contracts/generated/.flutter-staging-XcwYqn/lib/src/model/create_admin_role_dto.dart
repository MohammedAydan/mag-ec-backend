//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_admin_role_dto.g.dart';

/// CreateAdminRoleDto
///
/// Properties:
/// * [key] - Unique role key (lowercase, snake_case)
/// * [name] - Human-readable role name
/// * [permissionKeys] - Permission keys assigned to this role
/// * [description] - Optional role description
@BuiltValue()
abstract class CreateAdminRoleDto implements Built<CreateAdminRoleDto, CreateAdminRoleDtoBuilder> {
  /// Unique role key (lowercase, snake_case)
  @BuiltValueField(wireName: r'key')
  String get key;

  /// Human-readable role name
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Permission keys assigned to this role
  @BuiltValueField(wireName: r'permissionKeys')
  BuiltList<String> get permissionKeys;

  /// Optional role description
  @BuiltValueField(wireName: r'description')
  String? get description;

  CreateAdminRoleDto._();

  factory CreateAdminRoleDto([void updates(CreateAdminRoleDtoBuilder b)]) = _$CreateAdminRoleDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateAdminRoleDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateAdminRoleDto> get serializer => _$CreateAdminRoleDtoSerializer();
}

class _$CreateAdminRoleDtoSerializer implements PrimitiveSerializer<CreateAdminRoleDto> {
  @override
  final Iterable<Type> types = const [CreateAdminRoleDto, _$CreateAdminRoleDto];

  @override
  final String wireName = r'CreateAdminRoleDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateAdminRoleDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'permissionKeys';
    yield serializers.serialize(
      object.permissionKeys,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateAdminRoleDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateAdminRoleDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'permissionKeys':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.permissionKeys.replace(valueDes);
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateAdminRoleDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateAdminRoleDtoBuilder();
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

