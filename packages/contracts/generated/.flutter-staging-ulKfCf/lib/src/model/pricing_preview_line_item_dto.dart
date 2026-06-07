//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pricing_preview_line_item_dto.g.dart';

/// PricingPreviewLineItemDto
///
/// Properties:
/// * [variantId] 
/// * [sku] 
/// * [quantity] 
/// * [currencyCode] 
/// * [unitBaseAmount] 
/// * [effectiveUnitAmount] 
/// * [lineSubtotalAmount] 
/// * [taxAmount] 
/// * [taxRateBps] 
/// * [taxIncludedInPrice] 
/// * [unitSaleAmount] 
@BuiltValue()
abstract class PricingPreviewLineItemDto implements Built<PricingPreviewLineItemDto, PricingPreviewLineItemDtoBuilder> {
  @BuiltValueField(wireName: r'variantId')
  String get variantId;

  @BuiltValueField(wireName: r'sku')
  String get sku;

  @BuiltValueField(wireName: r'quantity')
  num get quantity;

  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  @BuiltValueField(wireName: r'unitBaseAmount')
  num get unitBaseAmount;

  @BuiltValueField(wireName: r'effectiveUnitAmount')
  num get effectiveUnitAmount;

  @BuiltValueField(wireName: r'lineSubtotalAmount')
  num get lineSubtotalAmount;

  @BuiltValueField(wireName: r'taxAmount')
  num get taxAmount;

  @BuiltValueField(wireName: r'taxRateBps')
  num get taxRateBps;

  @BuiltValueField(wireName: r'taxIncludedInPrice')
  bool get taxIncludedInPrice;

  @BuiltValueField(wireName: r'unitSaleAmount')
  num? get unitSaleAmount;

  PricingPreviewLineItemDto._();

  factory PricingPreviewLineItemDto([void updates(PricingPreviewLineItemDtoBuilder b)]) = _$PricingPreviewLineItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PricingPreviewLineItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PricingPreviewLineItemDto> get serializer => _$PricingPreviewLineItemDtoSerializer();
}

class _$PricingPreviewLineItemDtoSerializer implements PrimitiveSerializer<PricingPreviewLineItemDto> {
  @override
  final Iterable<Type> types = const [PricingPreviewLineItemDto, _$PricingPreviewLineItemDto];

  @override
  final String wireName = r'PricingPreviewLineItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PricingPreviewLineItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'variantId';
    yield serializers.serialize(
      object.variantId,
      specifiedType: const FullType(String),
    );
    yield r'sku';
    yield serializers.serialize(
      object.sku,
      specifiedType: const FullType(String),
    );
    yield r'quantity';
    yield serializers.serialize(
      object.quantity,
      specifiedType: const FullType(num),
    );
    yield r'currencyCode';
    yield serializers.serialize(
      object.currencyCode,
      specifiedType: const FullType(String),
    );
    yield r'unitBaseAmount';
    yield serializers.serialize(
      object.unitBaseAmount,
      specifiedType: const FullType(num),
    );
    yield r'effectiveUnitAmount';
    yield serializers.serialize(
      object.effectiveUnitAmount,
      specifiedType: const FullType(num),
    );
    yield r'lineSubtotalAmount';
    yield serializers.serialize(
      object.lineSubtotalAmount,
      specifiedType: const FullType(num),
    );
    yield r'taxAmount';
    yield serializers.serialize(
      object.taxAmount,
      specifiedType: const FullType(num),
    );
    yield r'taxRateBps';
    yield serializers.serialize(
      object.taxRateBps,
      specifiedType: const FullType(num),
    );
    yield r'taxIncludedInPrice';
    yield serializers.serialize(
      object.taxIncludedInPrice,
      specifiedType: const FullType(bool),
    );
    if (object.unitSaleAmount != null) {
      yield r'unitSaleAmount';
      yield serializers.serialize(
        object.unitSaleAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PricingPreviewLineItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PricingPreviewLineItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'variantId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.variantId = valueDes;
          break;
        case r'sku':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sku = valueDes;
          break;
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.quantity = valueDes;
          break;
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyCode = valueDes;
          break;
        case r'unitBaseAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.unitBaseAmount = valueDes;
          break;
        case r'effectiveUnitAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.effectiveUnitAmount = valueDes;
          break;
        case r'lineSubtotalAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.lineSubtotalAmount = valueDes;
          break;
        case r'taxAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.taxAmount = valueDes;
          break;
        case r'taxRateBps':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.taxRateBps = valueDes;
          break;
        case r'taxIncludedInPrice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.taxIncludedInPrice = valueDes;
          break;
        case r'unitSaleAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.unitSaleAmount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PricingPreviewLineItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PricingPreviewLineItemDtoBuilder();
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

