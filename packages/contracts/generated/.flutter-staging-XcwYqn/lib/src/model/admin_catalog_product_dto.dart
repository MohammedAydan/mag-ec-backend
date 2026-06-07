//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/admin_catalog_media_dto.dart';
import 'package:mag_api_client/src/model/admin_catalog_product_type_dto.dart';
import 'package:mag_api_client/src/model/admin_catalog_translation_dto.dart';
import 'package:mag_api_client/src/model/admin_catalog_relation_link_dto.dart';
import 'package:mag_api_client/src/model/admin_catalog_brand_dto.dart';
import 'package:mag_api_client/src/model/admin_catalog_variant_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_catalog_product_dto.g.dart';

/// AdminCatalogProductDto
///
/// Properties:
/// * [id] 
/// * [productTypeId] 
/// * [sku] 
/// * [status] 
/// * [isFeatured] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [translations] 
/// * [brandId] 
/// * [publishedAt] 
/// * [archivedAt] 
/// * [productType] 
/// * [brand] 
/// * [variants] 
/// * [categoryLinks] 
/// * [collectionLinks] 
/// * [tagLinks] 
/// * [media] 
@BuiltValue()
abstract class AdminCatalogProductDto implements Built<AdminCatalogProductDto, AdminCatalogProductDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'productTypeId')
  String get productTypeId;

  @BuiltValueField(wireName: r'sku')
  String get sku;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'isFeatured')
  bool get isFeatured;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  @BuiltValueField(wireName: r'translations')
  BuiltList<AdminCatalogTranslationDto> get translations;

  @BuiltValueField(wireName: r'brandId')
  String? get brandId;

  @BuiltValueField(wireName: r'publishedAt')
  String? get publishedAt;

  @BuiltValueField(wireName: r'archivedAt')
  String? get archivedAt;

  @BuiltValueField(wireName: r'productType')
  AdminCatalogProductTypeDto? get productType;

  @BuiltValueField(wireName: r'brand')
  AdminCatalogBrandDto? get brand;

  @BuiltValueField(wireName: r'variants')
  BuiltList<AdminCatalogVariantDto>? get variants;

  @BuiltValueField(wireName: r'categoryLinks')
  BuiltList<AdminCatalogRelationLinkDto>? get categoryLinks;

  @BuiltValueField(wireName: r'collectionLinks')
  BuiltList<AdminCatalogRelationLinkDto>? get collectionLinks;

  @BuiltValueField(wireName: r'tagLinks')
  BuiltList<AdminCatalogRelationLinkDto>? get tagLinks;

  @BuiltValueField(wireName: r'media')
  BuiltList<AdminCatalogMediaDto>? get media;

  AdminCatalogProductDto._();

  factory AdminCatalogProductDto([void updates(AdminCatalogProductDtoBuilder b)]) = _$AdminCatalogProductDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminCatalogProductDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminCatalogProductDto> get serializer => _$AdminCatalogProductDtoSerializer();
}

class _$AdminCatalogProductDtoSerializer implements PrimitiveSerializer<AdminCatalogProductDto> {
  @override
  final Iterable<Type> types = const [AdminCatalogProductDto, _$AdminCatalogProductDto];

  @override
  final String wireName = r'AdminCatalogProductDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminCatalogProductDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
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
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'isFeatured';
    yield serializers.serialize(
      object.isFeatured,
      specifiedType: const FullType(bool),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(String),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(String),
    );
    yield r'translations';
    yield serializers.serialize(
      object.translations,
      specifiedType: const FullType(BuiltList, [FullType(AdminCatalogTranslationDto)]),
    );
    if (object.brandId != null) {
      yield r'brandId';
      yield serializers.serialize(
        object.brandId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.publishedAt != null) {
      yield r'publishedAt';
      yield serializers.serialize(
        object.publishedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.archivedAt != null) {
      yield r'archivedAt';
      yield serializers.serialize(
        object.archivedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.productType != null) {
      yield r'productType';
      yield serializers.serialize(
        object.productType,
        specifiedType: const FullType(AdminCatalogProductTypeDto),
      );
    }
    if (object.brand != null) {
      yield r'brand';
      yield serializers.serialize(
        object.brand,
        specifiedType: const FullType.nullable(AdminCatalogBrandDto),
      );
    }
    if (object.variants != null) {
      yield r'variants';
      yield serializers.serialize(
        object.variants,
        specifiedType: const FullType(BuiltList, [FullType(AdminCatalogVariantDto)]),
      );
    }
    if (object.categoryLinks != null) {
      yield r'categoryLinks';
      yield serializers.serialize(
        object.categoryLinks,
        specifiedType: const FullType(BuiltList, [FullType(AdminCatalogRelationLinkDto)]),
      );
    }
    if (object.collectionLinks != null) {
      yield r'collectionLinks';
      yield serializers.serialize(
        object.collectionLinks,
        specifiedType: const FullType(BuiltList, [FullType(AdminCatalogRelationLinkDto)]),
      );
    }
    if (object.tagLinks != null) {
      yield r'tagLinks';
      yield serializers.serialize(
        object.tagLinks,
        specifiedType: const FullType(BuiltList, [FullType(AdminCatalogRelationLinkDto)]),
      );
    }
    if (object.media != null) {
      yield r'media';
      yield serializers.serialize(
        object.media,
        specifiedType: const FullType(BuiltList, [FullType(AdminCatalogMediaDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminCatalogProductDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminCatalogProductDtoBuilder result,
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
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'isFeatured':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isFeatured = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.updatedAt = valueDes;
          break;
        case r'translations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AdminCatalogTranslationDto)]),
          ) as BuiltList<AdminCatalogTranslationDto>;
          result.translations.replace(valueDes);
          break;
        case r'brandId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.brandId = valueDes;
          break;
        case r'publishedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.publishedAt = valueDes;
          break;
        case r'archivedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.archivedAt = valueDes;
          break;
        case r'productType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdminCatalogProductTypeDto),
          ) as AdminCatalogProductTypeDto;
          result.productType.replace(valueDes);
          break;
        case r'brand':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AdminCatalogBrandDto),
          ) as AdminCatalogBrandDto?;
          if (valueDes == null) continue;
          result.brand.replace(valueDes);
          break;
        case r'variants':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AdminCatalogVariantDto)]),
          ) as BuiltList<AdminCatalogVariantDto>;
          result.variants.replace(valueDes);
          break;
        case r'categoryLinks':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AdminCatalogRelationLinkDto)]),
          ) as BuiltList<AdminCatalogRelationLinkDto>;
          result.categoryLinks.replace(valueDes);
          break;
        case r'collectionLinks':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AdminCatalogRelationLinkDto)]),
          ) as BuiltList<AdminCatalogRelationLinkDto>;
          result.collectionLinks.replace(valueDes);
          break;
        case r'tagLinks':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AdminCatalogRelationLinkDto)]),
          ) as BuiltList<AdminCatalogRelationLinkDto>;
          result.tagLinks.replace(valueDes);
          break;
        case r'media':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AdminCatalogMediaDto)]),
          ) as BuiltList<AdminCatalogMediaDto>;
          result.media.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminCatalogProductDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminCatalogProductDtoBuilder();
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

