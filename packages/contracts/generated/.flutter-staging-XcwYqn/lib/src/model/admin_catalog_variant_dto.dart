//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/admin_catalog_product_variant_option_value_dto.dart';
import 'package:mag_api_client/src/model/catalog_variant_price_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/admin_catalog_translation_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_catalog_variant_dto.g.dart';

/// AdminCatalogVariantDto
///
/// Properties:
/// * [id] 
/// * [productId] 
/// * [sku] 
/// * [status] 
/// * [isDefault] 
/// * [position] 
/// * [translations] 
/// * [optionValues] 
/// * [price] 
@BuiltValue()
abstract class AdminCatalogVariantDto implements Built<AdminCatalogVariantDto, AdminCatalogVariantDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'productId')
  String get productId;

  @BuiltValueField(wireName: r'sku')
  String get sku;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'isDefault')
  bool get isDefault;

  @BuiltValueField(wireName: r'position')
  num get position;

  @BuiltValueField(wireName: r'translations')
  BuiltList<AdminCatalogTranslationDto> get translations;

  @BuiltValueField(wireName: r'optionValues')
  BuiltList<AdminCatalogProductVariantOptionValueDto>? get optionValues;

  @BuiltValueField(wireName: r'price')
  CatalogVariantPriceDto? get price;

  AdminCatalogVariantDto._();

  factory AdminCatalogVariantDto([void updates(AdminCatalogVariantDtoBuilder b)]) = _$AdminCatalogVariantDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminCatalogVariantDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminCatalogVariantDto> get serializer => _$AdminCatalogVariantDtoSerializer();
}

class _$AdminCatalogVariantDtoSerializer implements PrimitiveSerializer<AdminCatalogVariantDto> {
  @override
  final Iterable<Type> types = const [AdminCatalogVariantDto, _$AdminCatalogVariantDto];

  @override
  final String wireName = r'AdminCatalogVariantDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminCatalogVariantDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'productId';
    yield serializers.serialize(
      object.productId,
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
    yield r'isDefault';
    yield serializers.serialize(
      object.isDefault,
      specifiedType: const FullType(bool),
    );
    yield r'position';
    yield serializers.serialize(
      object.position,
      specifiedType: const FullType(num),
    );
    yield r'translations';
    yield serializers.serialize(
      object.translations,
      specifiedType: const FullType(BuiltList, [FullType(AdminCatalogTranslationDto)]),
    );
    if (object.optionValues != null) {
      yield r'optionValues';
      yield serializers.serialize(
        object.optionValues,
        specifiedType: const FullType(BuiltList, [FullType(AdminCatalogProductVariantOptionValueDto)]),
      );
    }
    if (object.price != null) {
      yield r'price';
      yield serializers.serialize(
        object.price,
        specifiedType: const FullType.nullable(CatalogVariantPriceDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminCatalogVariantDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminCatalogVariantDtoBuilder result,
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
        case r'productId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.productId = valueDes;
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
        case r'isDefault':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isDefault = valueDes;
          break;
        case r'position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.position = valueDes;
          break;
        case r'translations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AdminCatalogTranslationDto)]),
          ) as BuiltList<AdminCatalogTranslationDto>;
          result.translations.replace(valueDes);
          break;
        case r'optionValues':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AdminCatalogProductVariantOptionValueDto)]),
          ) as BuiltList<AdminCatalogProductVariantOptionValueDto>;
          result.optionValues.replace(valueDes);
          break;
        case r'price':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(CatalogVariantPriceDto),
          ) as CatalogVariantPriceDto?;
          if (valueDes == null) continue;
          result.price.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminCatalogVariantDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminCatalogVariantDtoBuilder();
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

