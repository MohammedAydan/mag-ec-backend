//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_permission_dto.g.dart';

/// AdminPermissionDto
///
/// Properties:
/// * [key] 
/// * [group] 
/// * [description] 
@BuiltValue()
abstract class AdminPermissionDto implements Built<AdminPermissionDto, AdminPermissionDtoBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'group')
  String get group;

  @BuiltValueField(wireName: r'description')
  String get description;

  AdminPermissionDto._();

  factory AdminPermissionDto([void updates(AdminPermissionDtoBuilder b)]) = _$AdminPermissionDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminPermissionDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminPermissionDto> get serializer => _$AdminPermissionDtoSerializer();
}

class _$AdminPermissionDtoSerializer implements PrimitiveSerializer<AdminPermissionDto> {
  @override
  final Iterable<Type> types = const [AdminPermissionDto, _$AdminPermissionDto];

  @override
  final String wireName = r'AdminPermissionDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminPermissionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'group';
    yield serializers.serialize(
      object.group,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminPermissionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminPermissionDtoBuilder result,
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
        case r'group':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.group = valueDes;
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
  AdminPermissionDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminPermissionDtoBuilder();
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

