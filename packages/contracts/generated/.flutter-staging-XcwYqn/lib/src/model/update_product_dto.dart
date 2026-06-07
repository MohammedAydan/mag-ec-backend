//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/product_translation_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_product_dto.g.dart';

/// UpdateProductDto
///
/// Properties:
/// * [brandId] 
/// * [isFeatured] 
/// * [categoryIds] 
/// * [collectionIds] 
/// * [tagIds] 
/// * [translations] 
@BuiltValue()
abstract class UpdateProductDto implements Built<UpdateProductDto, UpdateProductDtoBuilder> {
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

  @BuiltValueField(wireName: r'translations')
  BuiltList<ProductTranslationDto>? get translations;

  UpdateProductDto._();

  factory UpdateProductDto([void updates(UpdateProductDtoBuilder b)]) = _$UpdateProductDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateProductDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateProductDto> get serializer => _$UpdateProductDtoSerializer();
}

class _$UpdateProductDtoSerializer implements PrimitiveSerializer<UpdateProductDto> {
  @override
  final Iterable<Type> types = const [UpdateProductDto, _$UpdateProductDto];

  @override
  final String wireName = r'UpdateProductDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateProductDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.brandId != null) {
      yield r'brandId';
      yield serializers.serialize(
        object.brandId,
        specifiedType: const FullType.nullable(String),
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
    if (object.translations != null) {
      yield r'translations';
      yield serializers.serialize(
        object.translations,
        specifiedType: const FullType(BuiltList, [FullType(ProductTranslationDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateProductDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateProductDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'brandId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
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
        case r'translations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ProductTranslationDto)]),
          ) as BuiltList<ProductTranslationDto>;
          result.translations.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateProductDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateProductDtoBuilder();
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

