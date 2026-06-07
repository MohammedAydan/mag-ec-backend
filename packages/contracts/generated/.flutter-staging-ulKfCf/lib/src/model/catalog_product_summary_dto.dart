//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/catalog_media_summary_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/catalog_variant_summary_dto.dart';
import 'package:mag_api_client/src/model/catalog_localized_reference_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'catalog_product_summary_dto.g.dart';

/// CatalogProductSummaryDto
///
/// Properties:
/// * [id] 
/// * [sku] 
/// * [status] 
/// * [productType] 
/// * [categories] 
/// * [collections] 
/// * [tags] 
/// * [media] 
/// * [variants] 
/// * [name] 
/// * [slug] 
/// * [shortDescription] 
/// * [description] 
/// * [brand] 
@BuiltValue()
abstract class CatalogProductSummaryDto implements Built<CatalogProductSummaryDto, CatalogProductSummaryDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'sku')
  String get sku;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'productType')
  CatalogLocalizedReferenceDto get productType;

  @BuiltValueField(wireName: r'categories')
  BuiltList<CatalogLocalizedReferenceDto> get categories;

  @BuiltValueField(wireName: r'collections')
  BuiltList<CatalogLocalizedReferenceDto> get collections;

  @BuiltValueField(wireName: r'tags')
  BuiltList<CatalogLocalizedReferenceDto> get tags;

  @BuiltValueField(wireName: r'media')
  BuiltList<CatalogMediaSummaryDto> get media;

  @BuiltValueField(wireName: r'variants')
  BuiltList<CatalogVariantSummaryDto> get variants;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'slug')
  String? get slug;

  @BuiltValueField(wireName: r'shortDescription')
  String? get shortDescription;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'brand')
  CatalogLocalizedReferenceDto? get brand;

  CatalogProductSummaryDto._();

  factory CatalogProductSummaryDto([void updates(CatalogProductSummaryDtoBuilder b)]) = _$CatalogProductSummaryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CatalogProductSummaryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CatalogProductSummaryDto> get serializer => _$CatalogProductSummaryDtoSerializer();
}

class _$CatalogProductSummaryDtoSerializer implements PrimitiveSerializer<CatalogProductSummaryDto> {
  @override
  final Iterable<Type> types = const [CatalogProductSummaryDto, _$CatalogProductSummaryDto];

  @override
  final String wireName = r'CatalogProductSummaryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CatalogProductSummaryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'sku';
    yield serializers.serialize(
      object.sku,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'productType';
    yield serializers.serialize(
      object.productType,
      specifiedType: const FullType(CatalogLocalizedReferenceDto),
    );
    yield r'categories';
    yield serializers.serialize(
      object.categories,
      specifiedType: const FullType(BuiltList, [FullType(CatalogLocalizedReferenceDto)]),
    );
    yield r'collections';
    yield serializers.serialize(
      object.collections,
      specifiedType: const FullType(BuiltList, [FullType(CatalogLocalizedReferenceDto)]),
    );
    yield r'tags';
    yield serializers.serialize(
      object.tags,
      specifiedType: const FullType(BuiltList, [FullType(CatalogLocalizedReferenceDto)]),
    );
    yield r'media';
    yield serializers.serialize(
      object.media,
      specifiedType: const FullType(BuiltList, [FullType(CatalogMediaSummaryDto)]),
    );
    yield r'variants';
    yield serializers.serialize(
      object.variants,
      specifiedType: const FullType(BuiltList, [FullType(CatalogVariantSummaryDto)]),
    );
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.slug != null) {
      yield r'slug';
      yield serializers.serialize(
        object.slug,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.shortDescription != null) {
      yield r'shortDescription';
      yield serializers.serialize(
        object.shortDescription,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.brand != null) {
      yield r'brand';
      yield serializers.serialize(
        object.brand,
        specifiedType: const FullType.nullable(CatalogLocalizedReferenceDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CatalogProductSummaryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CatalogProductSummaryDtoBuilder result,
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
        case r'sku':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sku = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'productType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CatalogLocalizedReferenceDto),
          ) as CatalogLocalizedReferenceDto;
          result.productType.replace(valueDes);
          break;
        case r'categories':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CatalogLocalizedReferenceDto)]),
          ) as BuiltList<CatalogLocalizedReferenceDto>;
          result.categories.replace(valueDes);
          break;
        case r'collections':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CatalogLocalizedReferenceDto)]),
          ) as BuiltList<CatalogLocalizedReferenceDto>;
          result.collections.replace(valueDes);
          break;
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CatalogLocalizedReferenceDto)]),
          ) as BuiltList<CatalogLocalizedReferenceDto>;
          result.tags.replace(valueDes);
          break;
        case r'media':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CatalogMediaSummaryDto)]),
          ) as BuiltList<CatalogMediaSummaryDto>;
          result.media.replace(valueDes);
          break;
        case r'variants':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CatalogVariantSummaryDto)]),
          ) as BuiltList<CatalogVariantSummaryDto>;
          result.variants.replace(valueDes);
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'slug':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.slug = valueDes;
          break;
        case r'shortDescription':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.shortDescription = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'brand':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(CatalogLocalizedReferenceDto),
          ) as CatalogLocalizedReferenceDto?;
          if (valueDes == null) continue;
          result.brand.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CatalogProductSummaryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CatalogProductSummaryDtoBuilder();
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

