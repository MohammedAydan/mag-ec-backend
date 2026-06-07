//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'product_type_attribute_link_dto.g.dart';

/// ProductTypeAttributeLinkDto
///
/// Properties:
/// * [attributeId] 
/// * [isRequired] 
/// * [sortOrder] 
@BuiltValue()
abstract class ProductTypeAttributeLinkDto implements Built<ProductTypeAttributeLinkDto, ProductTypeAttributeLinkDtoBuilder> {
  @BuiltValueField(wireName: r'attributeId')
  String get attributeId;

  @BuiltValueField(wireName: r'isRequired')
  bool? get isRequired;

  @BuiltValueField(wireName: r'sortOrder')
  num? get sortOrder;

  ProductTypeAttributeLinkDto._();

  factory ProductTypeAttributeLinkDto([void updates(ProductTypeAttributeLinkDtoBuilder b)]) = _$ProductTypeAttributeLinkDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProductTypeAttributeLinkDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProductTypeAttributeLinkDto> get serializer => _$ProductTypeAttributeLinkDtoSerializer();
}

class _$ProductTypeAttributeLinkDtoSerializer implements PrimitiveSerializer<ProductTypeAttributeLinkDto> {
  @override
  final Iterable<Type> types = const [ProductTypeAttributeLinkDto, _$ProductTypeAttributeLinkDto];

  @override
  final String wireName = r'ProductTypeAttributeLinkDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProductTypeAttributeLinkDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'attributeId';
    yield serializers.serialize(
      object.attributeId,
      specifiedType: const FullType(String),
    );
    if (object.isRequired != null) {
      yield r'isRequired';
      yield serializers.serialize(
        object.isRequired,
        specifiedType: const FullType(bool),
      );
    }
    if (object.sortOrder != null) {
      yield r'sortOrder';
      yield serializers.serialize(
        object.sortOrder,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ProductTypeAttributeLinkDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ProductTypeAttributeLinkDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  ProductTypeAttributeLinkDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProductTypeAttributeLinkDtoBuilder();
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

