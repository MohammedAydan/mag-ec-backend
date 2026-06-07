//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/checkout_preview_applied_promotion_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/checkout_payment_readiness_dto.dart';
import 'package:mag_api_client/src/model/checkout_preview_item_response_dto.dart';
import 'package:mag_api_client/src/model/checkout_preview_shipping_method_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'checkout_preview_response_dto.g.dart';

/// CheckoutPreviewResponseDto
///
/// Properties:
/// * [cartId]
/// * [paymentReadiness]
/// * [currencyCode]
/// * [countryCode]
/// * [subtotalAmount]
/// * [subtotalDiscountAmount]
/// * [discountedSubtotalAmount]
/// * [taxAmount]
/// * [grandTotalExcludingShippingAmount]
/// * [appliedPromotions]
/// * [rejectedPromotions]
/// * [items]
/// * [shippingMethods]
/// * [reservationKey]
/// * [reservationExpiresAt]
@BuiltValue()
abstract class CheckoutPreviewResponseDto
    implements
        Built<CheckoutPreviewResponseDto, CheckoutPreviewResponseDtoBuilder> {
  @BuiltValueField(wireName: r'cartId')
  String get cartId;

  @BuiltValueField(wireName: r'paymentReadiness')
  CheckoutPaymentReadinessDto get paymentReadiness;

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

  @BuiltValueField(wireName: r'appliedPromotions')
  BuiltList<CheckoutPreviewAppliedPromotionDto> get appliedPromotions;

  @BuiltValueField(wireName: r'rejectedPromotions')
  BuiltList<String> get rejectedPromotions;

  @BuiltValueField(wireName: r'items')
  BuiltList<CheckoutPreviewItemResponseDto> get items;

  @BuiltValueField(wireName: r'shippingMethods')
  BuiltList<CheckoutPreviewShippingMethodDto> get shippingMethods;

  @BuiltValueField(wireName: r'reservationKey')
  String? get reservationKey;

  @BuiltValueField(wireName: r'reservationExpiresAt')
  String? get reservationExpiresAt;

  CheckoutPreviewResponseDto._();

  factory CheckoutPreviewResponseDto(
          [void updates(CheckoutPreviewResponseDtoBuilder b)]) =
      _$CheckoutPreviewResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckoutPreviewResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckoutPreviewResponseDto> get serializer =>
      _$CheckoutPreviewResponseDtoSerializer();
}

class _$CheckoutPreviewResponseDtoSerializer
    implements PrimitiveSerializer<CheckoutPreviewResponseDto> {
  @override
  final Iterable<Type> types = const [
    CheckoutPreviewResponseDto,
    _$CheckoutPreviewResponseDto
  ];

  @override
  final String wireName = r'CheckoutPreviewResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckoutPreviewResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cartId';
    yield serializers.serialize(
      object.cartId,
      specifiedType: const FullType(String),
    );
    yield r'paymentReadiness';
    yield serializers.serialize(
      object.paymentReadiness,
      specifiedType: const FullType(CheckoutPaymentReadinessDto),
    );
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
    yield r'appliedPromotions';
    yield serializers.serialize(
      object.appliedPromotions,
      specifiedType: const FullType(
          BuiltList, [FullType(CheckoutPreviewAppliedPromotionDto)]),
    );
    yield r'rejectedPromotions';
    yield serializers.serialize(
      object.rejectedPromotions,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(CheckoutPreviewItemResponseDto)]),
    );
    yield r'shippingMethods';
    yield serializers.serialize(
      object.shippingMethods,
      specifiedType: const FullType(
          BuiltList, [FullType(CheckoutPreviewShippingMethodDto)]),
    );
    if (object.reservationKey != null) {
      yield r'reservationKey';
      yield serializers.serialize(
        object.reservationKey,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.reservationExpiresAt != null) {
      yield r'reservationExpiresAt';
      yield serializers.serialize(
        object.reservationExpiresAt,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CheckoutPreviewResponseDto object, {
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
    required CheckoutPreviewResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'cartId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.cartId = valueDes;
          break;
        case r'paymentReadiness':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CheckoutPaymentReadinessDto),
          ) as CheckoutPaymentReadinessDto;
          result.paymentReadiness.replace(valueDes);
          break;
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
        case r'appliedPromotions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(CheckoutPreviewAppliedPromotionDto)]),
          ) as BuiltList<CheckoutPreviewAppliedPromotionDto>;
          result.appliedPromotions.replace(valueDes);
          break;
        case r'rejectedPromotions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.rejectedPromotions.replace(valueDes);
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(CheckoutPreviewItemResponseDto)]),
          ) as BuiltList<CheckoutPreviewItemResponseDto>;
          result.items.replace(valueDes);
          break;
        case r'shippingMethods':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(CheckoutPreviewShippingMethodDto)]),
          ) as BuiltList<CheckoutPreviewShippingMethodDto>;
          result.shippingMethods.replace(valueDes);
          break;
        case r'reservationKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reservationKey = valueDes;
          break;
        case r'reservationExpiresAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reservationExpiresAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CheckoutPreviewResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckoutPreviewResponseDtoBuilder();
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
