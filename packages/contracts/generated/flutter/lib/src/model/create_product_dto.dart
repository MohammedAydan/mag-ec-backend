//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/product_translation_dto.dart';
import 'package:mag_api_client/src/model/product_variant_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_product_dto.g.dart';

/// CreateProductDto
///
/// Properties:
/// * [productTypeId]
/// * [sku]
/// * [translations]
/// * [variants]
/// * [brandId]
/// * [isFeatured]
/// * [categoryIds]
/// * [collectionIds]
/// * [tagIds]
@BuiltValue()
abstract class CreateProductDto
    implements Built<CreateProductDto, CreateProductDtoBuilder> {
  @BuiltValueField(wireName: r'productTypeId')
  String get productTypeId;

  @BuiltValueField(wireName: r'sku')
  String get sku;

  @BuiltValueField(wireName: r'translations')
  BuiltList<ProductTranslationDto> get translations;

  @BuiltValueField(wireName: r'variants')
  BuiltList<ProductVariantDto> get variants;

  @BuiltValueField(wireName: r'brandId')
  String? get brandId;

  @BuiltValueField(wireName: r'isFeatured')
  bool? get isFeatured;

  @BuiltValueField(wireName: r'categoryIds')
  BuiltList<String>? get categoryIds;

  @BuiltValueField(wireName: r'collectionIds')
  BuiltList<String>? get collectionIds;

  @BuiltValueField(wireName: r'tagIds')
  BuiltList<String>? get tagIds;

  CreateProductDto._();

  factory CreateProductDto([void updates(CreateProductDtoBuilder b)]) =
      _$CreateProductDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateProductDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateProductDto> get serializer =>
      _$CreateProductDtoSerializer();
}

class _$CreateProductDtoSerializer
    implements PrimitiveSerializer<CreateProductDto> {
  @override
  final Iterable<Type> types = const [CreateProductDto, _$CreateProductDto];

  @override
  final String wireName = r'CreateProductDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateProductDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'productTypeId';
    yield serializers.serialize(
      object.productTypeId,
      specifiedType: const FullType(String),
    );
    yield r'sku';
    yield serializers.serialize(
      object.sku,
      specifiedType: const FullType(String),
    );
    yield r'translations';
    yield serializers.serialize(
      object.translations,
      specifiedType:
          const FullType(BuiltList, [FullType(ProductTranslationDto)]),
    );
    yield r'variants';
    yield serializers.serialize(
      object.variants,
      specifiedType: const FullType(BuiltList, [FullType(ProductVariantDto)]),
    );
    if (object.brandId != null) {
      yield r'brandId';
      yield serializers.serialize(
        object.brandId,
        specifiedType: const FullType(String),
      );
    }
    if (object.isFeatured != null) {
      yield r'isFeatured';
      yield serializers.serialize(
        object.isFeatured,
        specifiedType: const FullType(bool),
      );
    }
    if (object.categoryIds != null) {
      yield r'categoryIds';
      yield serializers.serialize(
        object.categoryIds,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.collectionIds != null) {
      yield r'collectionIds';
      yield serializers.serialize(
        object.collectionIds,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.tagIds != null) {
      yield r'tagIds';
      yield serializers.serialize(
        object.tagIds,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateProductDto object, {
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
    required CreateProductDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'productTypeId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.productTypeId = valueDes;
          break;
        case r'sku':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sku = valueDes;
          break;
        case r'translations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(ProductTranslationDto)]),
          ) as BuiltList<ProductTranslationDto>;
          result.translations.replace(valueDes);
          break;
        case r'variants':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(ProductVariantDto)]),
          ) as BuiltList<ProductVariantDto>;
          result.variants.replace(valueDes);
          break;
        case r'brandId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.brandId = valueDes;
          break;
        case r'isFeatured':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isFeatured = valueDes;
          break;
        case r'categoryIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.categoryIds.replace(valueDes);
          break;
        case r'collectionIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.collectionIds.replace(valueDes);
          break;
        case r'tagIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.tagIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateProductDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateProductDtoBuilder();
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
