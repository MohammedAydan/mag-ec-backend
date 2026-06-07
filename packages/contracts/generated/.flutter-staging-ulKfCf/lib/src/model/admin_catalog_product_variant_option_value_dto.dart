//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/admin_catalog_attribute_option_dto.dart';
import 'package:mag_api_client/src/model/admin_catalog_attribute_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_catalog_product_variant_option_value_dto.g.dart';

/// AdminCatalogProductVariantOptionValueDto
///
/// Properties:
/// * [id] 
/// * [attributeId] 
/// * [optionId] 
/// * [attribute] 
/// * [option] 
@BuiltValue()
abstract class AdminCatalogProductVariantOptionValueDto implements Built<AdminCatalogProductVariantOptionValueDto, AdminCatalogProductVariantOptionValueDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'attributeId')
  String get attributeId;

  @BuiltValueField(wireName: r'optionId')
  String get optionId;

  @BuiltValueField(wireName: r'attribute')
  AdminCatalogAttributeDto? get attribute;

  @BuiltValueField(wireName: r'option')
  AdminCatalogAttributeOptionDto? get option;

  AdminCatalogProductVariantOptionValueDto._();

  factory AdminCatalogProductVariantOptionValueDto([void updates(AdminCatalogProductVariantOptionValueDtoBuilder b)]) = _$AdminCatalogProductVariantOptionValueDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminCatalogProductVariantOptionValueDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminCatalogProductVariantOptionValueDto> get serializer => _$AdminCatalogProductVariantOptionValueDtoSerializer();
}

class _$AdminCatalogProductVariantOptionValueDtoSerializer implements PrimitiveSerializer<AdminCatalogProductVariantOptionValueDto> {
  @override
  final Iterable<Type> types = const [AdminCatalogProductVariantOptionValueDto, _$AdminCatalogProductVariantOptionValueDto];

  @override
  final String wireName = r'AdminCatalogProductVariantOptionValueDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminCatalogProductVariantOptionValueDto object, {
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
    yield r'optionId';
    yield serializers.serialize(
      object.optionId,
      specifiedType: const FullType(String),
    );
    if (object.attribute != null) {
      yield r'attribute';
      yield serializers.serialize(
        object.attribute,
        specifiedType: const FullType(AdminCatalogAttributeDto),
      );
    }
    if (object.option != null) {
      yield r'option';
      yield serializers.serialize(
        object.option,
        specifiedType: const FullType(AdminCatalogAttributeOptionDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminCatalogProductVariantOptionValueDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminCatalogProductVariantOptionValueDtoBuilder result,
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
        case r'optionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.optionId = valueDes;
          break;
        case r'attribute':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdminCatalogAttributeDto),
          ) as AdminCatalogAttributeDto;
          result.attribute.replace(valueDes);
          break;
        case r'option':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdminCatalogAttributeOptionDto),
          ) as AdminCatalogAttributeOptionDto;
          result.option.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminCatalogProductVariantOptionValueDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminCatalogProductVariantOptionValueDtoBuilder();
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

