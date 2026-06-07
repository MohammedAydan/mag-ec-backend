//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/pricing_preview_applied_promotion_dto.dart';
import 'package:mag_api_client/src/model/pricing_preview_line_item_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/pricing_preview_shipping_method_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pricing_preview_response_dto.g.dart';

/// PricingPreviewResponseDto
///
/// Properties:
/// * [currencyCode]
/// * [countryCode]
/// * [subtotalAmount]
/// * [subtotalDiscountAmount]
/// * [discountedSubtotalAmount]
/// * [taxAmount]
/// * [grandTotalExcludingShippingAmount]
/// * [items]
/// * [appliedPromotions]
/// * [rejectedPromotions]
/// * [shippingMethods]
@BuiltValue()
abstract class PricingPreviewResponseDto
    implements
        Built<PricingPreviewResponseDto, PricingPreviewResponseDtoBuilder> {
  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  @BuiltValueField(wireName: r'countryCode')
  String get countryCode;

  @BuiltValueField(wireName: r'subtotalAmount')
  num get subtotalAmount;

  @BuiltValueField(wireName: r'subtotalDiscountAmount')
  num get subtotalDiscountAmount;

  @BuiltValueField(wireName: r'discountedSubtotalAmount')
  num get discountedSubtotalAmount;

  @BuiltValueField(wireName: r'taxAmount')
  num get taxAmount;

  @BuiltValueField(wireName: r'grandTotalExcludingShippingAmount')
  num get grandTotalExcludingShippingAmount;

  @BuiltValueField(wireName: r'items')
  BuiltList<PricingPreviewLineItemDto> get items;

  @BuiltValueField(wireName: r'appliedPromotions')
  BuiltList<PricingPreviewAppliedPromotionDto> get appliedPromotions;

  @BuiltValueField(wireName: r'rejectedPromotions')
  BuiltList<String> get rejectedPromotions;

  @BuiltValueField(wireName: r'shippingMethods')
  BuiltList<PricingPreviewShippingMethodDto> get shippingMethods;

  PricingPreviewResponseDto._();

  factory PricingPreviewResponseDto(
          [void updates(PricingPreviewResponseDtoBuilder b)]) =
      _$PricingPreviewResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PricingPreviewResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PricingPreviewResponseDto> get serializer =>
      _$PricingPreviewResponseDtoSerializer();
}

class _$PricingPreviewResponseDtoSerializer
    implements PrimitiveSerializer<PricingPreviewResponseDto> {
  @override
  final Iterable<Type> types = const [
    PricingPreviewResponseDto,
    _$PricingPreviewResponseDto
  ];

  @override
  final String wireName = r'PricingPreviewResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PricingPreviewResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'currencyCode';
    yield serializers.serialize(
      object.currencyCode,
      specifiedType: const FullType(String),
    );
    yield r'countryCode';
    yield serializers.serialize(
      object.countryCode,
      specifiedType: const FullType(String),
    );
    yield r'subtotalAmount';
    yield serializers.serialize(
      object.subtotalAmount,
      specifiedType: const FullType(num),
    );
    yield r'subtotalDiscountAmount';
    yield serializers.serialize(
      object.subtotalDiscountAmount,
      specifiedType: const FullType(num),
    );
    yield r'discountedSubtotalAmount';
    yield serializers.serialize(
      object.discountedSubtotalAmount,
      specifiedType: const FullType(num),
    );
    yield r'taxAmount';
    yield serializers.serialize(
      object.taxAmount,
      specifiedType: const FullType(num),
    );
    yield r'grandTotalExcludingShippingAmount';
    yield serializers.serialize(
      object.grandTotalExcludingShippingAmount,
      specifiedType: const FullType(num),
    );
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(PricingPreviewLineItemDto)]),
    );
    yield r'appliedPromotions';
    yield serializers.serialize(
      object.appliedPromotions,
      specifiedType: const FullType(
          BuiltList, [FullType(PricingPreviewAppliedPromotionDto)]),
    );
    yield r'rejectedPromotions';
    yield serializers.serialize(
      object.rejectedPromotions,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'shippingMethods';
    yield serializers.serialize(
      object.shippingMethods,
      specifiedType: const FullType(
          BuiltList, [FullType(PricingPreviewShippingMethodDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PricingPreviewResponseDto object, {
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
    required PricingPreviewResponseDtoBuilder result,
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
        case r'countryCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.countryCode = valueDes;
          break;
        case r'subtotalAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.subtotalAmount = valueDes;
          break;
        case r'subtotalDiscountAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.subtotalDiscountAmount = valueDes;
          break;
        case r'discountedSubtotalAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.discountedSubtotalAmount = valueDes;
          break;
        case r'taxAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.taxAmount = valueDes;
          break;
        case r'grandTotalExcludingShippingAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.grandTotalExcludingShippingAmount = valueDes;
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(PricingPreviewLineItemDto)]),
          ) as BuiltList<PricingPreviewLineItemDto>;
          result.items.replace(valueDes);
          break;
        case r'appliedPromotions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(PricingPreviewAppliedPromotionDto)]),
          ) as BuiltList<PricingPreviewAppliedPromotionDto>;
          result.appliedPromotions.replace(valueDes);
          break;
        case r'rejectedPromotions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.rejectedPromotions.replace(valueDes);
          break;
        case r'shippingMethods':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(PricingPreviewShippingMethodDto)]),
          ) as BuiltList<PricingPreviewShippingMethodDto>;
          result.shippingMethods.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PricingPreviewResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PricingPreviewResponseDtoBuilder();
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
