//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'catalog_variant_price_dto.g.dart';

/// CatalogVariantPriceDto
///
/// Properties:
/// * [currencyCode]
/// * [baseAmount]
/// * [saleAmount]
@BuiltValue()
abstract class CatalogVariantPriceDto
    implements Built<CatalogVariantPriceDto, CatalogVariantPriceDtoBuilder> {
  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  @BuiltValueField(wireName: r'baseAmount')
  num get baseAmount;

  @BuiltValueField(wireName: r'saleAmount')
  num? get saleAmount;

  CatalogVariantPriceDto._();

  factory CatalogVariantPriceDto(
          [void updates(CatalogVariantPriceDtoBuilder b)]) =
      _$CatalogVariantPriceDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CatalogVariantPriceDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CatalogVariantPriceDto> get serializer =>
      _$CatalogVariantPriceDtoSerializer();
}

class _$CatalogVariantPriceDtoSerializer
    implements PrimitiveSerializer<CatalogVariantPriceDto> {
  @override
  final Iterable<Type> types = const [
    CatalogVariantPriceDto,
    _$CatalogVariantPriceDto
  ];

  @override
  final String wireName = r'CatalogVariantPriceDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CatalogVariantPriceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'currencyCode';
    yield serializers.serialize(
      object.currencyCode,
      specifiedType: const FullType(String),
    );
    yield r'baseAmount';
    yield serializers.serialize(
      object.baseAmount,
      specifiedType: const FullType(num),
    );
    if (object.saleAmount != null) {
      yield r'saleAmount';
      yield serializers.serialize(
        object.saleAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CatalogVariantPriceDto object, {
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
    required CatalogVariantPriceDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyCode = valueDes;
          break;
        case r'baseAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.baseAmount = valueDes;
          break;
        case r'saleAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.saleAmount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CatalogVariantPriceDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CatalogVariantPriceDtoBuilder();
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
