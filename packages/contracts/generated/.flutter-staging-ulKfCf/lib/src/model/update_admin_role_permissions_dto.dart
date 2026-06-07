//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_admin_role_permissions_dto.g.dart';

/// UpdateAdminRolePermissionsDto
///
/// Properties:
/// * [permissionKeys] - New set of permission keys for the role
@BuiltValue()
abstract class UpdateAdminRolePermissionsDto implements Built<UpdateAdminRolePermissionsDto, UpdateAdminRolePermissionsDtoBuilder> {
  /// New set of permission keys for the role
  @BuiltValueField(wireName: r'permissionKeys')
  BuiltList<String> get permissionKeys;

  UpdateAdminRolePermissionsDto._();

  factory UpdateAdminRolePermissionsDto([void updates(UpdateAdminRolePermissionsDtoBuilder b)]) = _$UpdateAdminRolePermissionsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateAdminRolePermissionsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateAdminRolePermissionsDto> get serializer => _$UpdateAdminRolePermissionsDtoSerializer();
}

class _$UpdateAdminRolePermissionsDtoSerializer implements PrimitiveSerializer<UpdateAdminRolePermissionsDto> {
  @override
  final Iterable<Type> types = const [UpdateAdminRolePermissionsDto, _$UpdateAdminRolePermissionsDto];

  @override
  final String wireName = r'UpdateAdminRolePermissionsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateAdminRolePermissionsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'permissionKeys';
    yield serializers.serialize(
      object.permissionKeys,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateAdminRolePermissionsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateAdminRolePermissionsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'permissionKeys':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.permissionKeys.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateAdminRolePermissionsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateAdminRolePermissionsDtoBuilder();
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

