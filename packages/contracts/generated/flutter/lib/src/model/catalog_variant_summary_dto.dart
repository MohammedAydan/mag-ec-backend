//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/catalog_variant_price_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/catalog_variant_option_summary_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'catalog_variant_summary_dto.g.dart';

/// CatalogVariantSummaryDto
///
/// Properties:
/// * [id]
/// * [sku]
/// * [isDefault]
/// * [options]
/// * [name]
/// * [price]
@BuiltValue()
abstract class CatalogVariantSummaryDto
    implements
        Built<CatalogVariantSummaryDto, CatalogVariantSummaryDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'sku')
  String get sku;

  @BuiltValueField(wireName: r'isDefault')
  bool get isDefault;

  @BuiltValueField(wireName: r'options')
  BuiltList<CatalogVariantOptionSummaryDto> get options;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'price')
  CatalogVariantPriceDto? get price;

  CatalogVariantSummaryDto._();

  factory CatalogVariantSummaryDto(
          [void updates(CatalogVariantSummaryDtoBuilder b)]) =
      _$CatalogVariantSummaryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CatalogVariantSummaryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CatalogVariantSummaryDto> get serializer =>
      _$CatalogVariantSummaryDtoSerializer();
}

class _$CatalogVariantSummaryDtoSerializer
    implements PrimitiveSerializer<CatalogVariantSummaryDto> {
  @override
  final Iterable<Type> types = const [
    CatalogVariantSummaryDto,
    _$CatalogVariantSummaryDto
  ];

  @override
  final String wireName = r'CatalogVariantSummaryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CatalogVariantSummaryDto object, {
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
    yield r'isDefault';
    yield serializers.serialize(
      object.isDefault,
      specifiedType: const FullType(bool),
    );
    yield r'options';
    yield serializers.serialize(
      object.options,
      specifiedType:
          const FullType(BuiltList, [FullType(CatalogVariantOptionSummaryDto)]),
    );
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
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
    CatalogVariantSummaryDto object, {
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
    required CatalogVariantSummaryDtoBuilder result,
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
        case r'isDefault':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isDefault = valueDes;
          break;
        case r'options':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(CatalogVariantOptionSummaryDto)]),
          ) as BuiltList<CatalogVariantOptionSummaryDto>;
          result.options.replace(valueDes);
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
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
  CatalogVariantSummaryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CatalogVariantSummaryDtoBuilder();
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
