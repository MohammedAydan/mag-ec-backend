//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_staff_roles_dto.g.dart';

/// UpdateStaffRolesDto
///
/// Properties:
/// * [roleIds] - New set of role IDs for the staff member
@BuiltValue()
abstract class UpdateStaffRolesDto implements Built<UpdateStaffRolesDto, UpdateStaffRolesDtoBuilder> {
  /// New set of role IDs for the staff member
  @BuiltValueField(wireName: r'roleIds')
  BuiltList<String> get roleIds;

  UpdateStaffRolesDto._();

  factory UpdateStaffRolesDto([void updates(UpdateStaffRolesDtoBuilder b)]) = _$UpdateStaffRolesDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateStaffRolesDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateStaffRolesDto> get serializer => _$UpdateStaffRolesDtoSerializer();
}

class _$UpdateStaffRolesDtoSerializer implements PrimitiveSerializer<UpdateStaffRolesDto> {
  @override
  final Iterable<Type> types = const [UpdateStaffRolesDto, _$UpdateStaffRolesDto];

  @override
  final String wireName = r'UpdateStaffRolesDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateStaffRolesDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'roleIds';
    yield serializers.serialize(
      object.roleIds,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateStaffRolesDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateStaffRolesDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'roleIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.roleIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateStaffRolesDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateStaffRolesDtoBuilder();
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

