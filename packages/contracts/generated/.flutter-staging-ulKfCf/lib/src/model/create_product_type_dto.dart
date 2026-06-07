//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/translation_dto.dart';
import 'package:mag_api_client/src/model/product_type_attribute_link_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_product_type_dto.g.dart';

/// CreateProductTypeDto
///
/// Properties:
/// * [key] 
/// * [translations] 
/// * [sortOrder] 
/// * [attributes] 
@BuiltValue()
abstract class CreateProductTypeDto implements Built<CreateProductTypeDto, CreateProductTypeDtoBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'translations')
  BuiltList<TranslationDto> get translations;

  @BuiltValueField(wireName: r'sortOrder')
  num? get sortOrder;

  @BuiltValueField(wireName: r'attributes')
  BuiltList<ProductTypeAttributeLinkDto>? get attributes;

  CreateProductTypeDto._();

  factory CreateProductTypeDto([void updates(CreateProductTypeDtoBuilder b)]) = _$CreateProductTypeDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateProductTypeDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateProductTypeDto> get serializer => _$CreateProductTypeDtoSerializer();
}

class _$CreateProductTypeDtoSerializer implements PrimitiveSerializer<CreateProductTypeDto> {
  @override
  final Iterable<Type> types = const [CreateProductTypeDto, _$CreateProductTypeDto];

  @override
  final String wireName = r'CreateProductTypeDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateProductTypeDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'translations';
    yield serializers.serialize(
      object.translations,
      specifiedType: const FullType(BuiltList, [FullType(TranslationDto)]),
    );
    if (object.sortOrder != null) {
      yield r'sortOrder';
      yield serializers.serialize(
        object.sortOrder,
        specifiedType: const FullType(num),
      );
    }
    if (object.attributes != null) {
      yield r'attributes';
      yield serializers.serialize(
        object.attributes,
        specifiedType: const FullType(BuiltList, [FullType(ProductTypeAttributeLinkDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateProductTypeDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateProductTypeDtoBuilder result,
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
        case r'translations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(TranslationDto)]),
          ) as BuiltList<TranslationDto>;
          result.translations.replace(valueDes);
          break;
        case r'sortOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.sortOrder = valueDes;
          break;
        case r'attributes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ProductTypeAttributeLinkDto)]),
          ) as BuiltList<ProductTypeAttributeLinkDto>;
          result.attributes.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateProductTypeDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateProductTypeDtoBuilder();
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

