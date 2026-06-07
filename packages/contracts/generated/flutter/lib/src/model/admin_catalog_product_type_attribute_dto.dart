//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_catalog_product_type_attribute_dto.g.dart';

/// AdminCatalogProductTypeAttributeDto
///
/// Properties:
/// * [id]
/// * [attributeId]
/// * [isRequired]
/// * [sortOrder]
@BuiltValue()
abstract class AdminCatalogProductTypeAttributeDto
    implements
        Built<AdminCatalogProductTypeAttributeDto,
            AdminCatalogProductTypeAttributeDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'attributeId')
  String get attributeId;

  @BuiltValueField(wireName: r'isRequired')
  bool get isRequired;

  @BuiltValueField(wireName: r'sortOrder')
  num get sortOrder;

  AdminCatalogProductTypeAttributeDto._();

  factory AdminCatalogProductTypeAttributeDto(
          [void updates(AdminCatalogProductTypeAttributeDtoBuilder b)]) =
      _$AdminCatalogProductTypeAttributeDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminCatalogProductTypeAttributeDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminCatalogProductTypeAttributeDto> get serializer =>
      _$AdminCatalogProductTypeAttributeDtoSerializer();
}

class _$AdminCatalogProductTypeAttributeDtoSerializer
    implements PrimitiveSerializer<AdminCatalogProductTypeAttributeDto> {
  @override
  final Iterable<Type> types = const [
    AdminCatalogProductTypeAttributeDto,
    _$AdminCatalogProductTypeAttributeDto
  ];

  @override
  final String wireName = r'AdminCatalogProductTypeAttributeDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminCatalogProductTypeAttributeDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'attributeId';
    yield serializers.serialize(
      object.attributeId,
      specifiedType: const FullType(String),
    );
    yield r'isRequired';
    yield serializers.serialize(
      object.isRequired,
      specifiedType: const FullType(bool),
    );
    yield r'sortOrder';
    yield serializers.serialize(
      object.sortOrder,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminCatalogProductTypeAttributeDto object, {
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
    required AdminCatalogProductTypeAttributeDtoBuilder result,
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
        case r'attributeId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.attributeId = valueDes;
          break;
        case r'isRequired':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isRequired = valueDes;
          break;
        case r'sortOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.sortOrder = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminCatalogProductTypeAttributeDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminCatalogProductTypeAttributeDtoBuilder();
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
