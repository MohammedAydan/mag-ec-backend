//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/order_shipping_method_details_dto.dart';
import 'package:mag_api_client/src/model/order_shipment_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/order_refund_dto.dart';
import 'package:mag_api_client/src/model/checkout_payment_attempt_dto.dart';
import 'package:mag_api_client/src/model/order_return_request_dto.dart';
import 'package:mag_api_client/src/model/order_line_item_dto.dart';
import 'package:mag_api_client/src/model/order_address_dto.dart';
import 'package:mag_api_client/src/model/order_applied_promotion_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'checkout_place_order_response_dto.g.dart';

/// CheckoutPlaceOrderResponseDto
///
/// Properties:
/// * [id] 
/// * [orderNumber] 
/// * [cartId] 
/// * [status] 
/// * [paymentMethod] 
/// * [paymentStatus] 
/// * [fulfillmentStatus] 
/// * [customerEmail] 
/// * [customerName] 
/// * [customerPhone] 
/// * [currencyCode] 
/// * [countryCode] 
/// * [shippingMethod] 
/// * [subtotalAmount] 
/// * [subtotalDiscountAmount] 
/// * [discountedSubtotalAmount] 
/// * [shippingAmount] 
/// * [taxAmount] 
/// * [grandTotalAmount] 
/// * [placedAt] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [addresses] 
/// * [items] 
/// * [appliedPromotions] 
/// * [shipments] 
/// * [returnRequests] 
/// * [refunds] 
/// * [userId] 
/// * [couponCode] 
/// * [paidAt] 
/// * [payment] 
@BuiltValue()
abstract class CheckoutPlaceOrderResponseDto implements Built<CheckoutPlaceOrderResponseDto, CheckoutPlaceOrderResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'orderNumber')
  String get orderNumber;

  @BuiltValueField(wireName: r'cartId')
  String get cartId;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'paymentMethod')
  String get paymentMethod;

  @BuiltValueField(wireName: r'paymentStatus')
  String get paymentStatus;

  @BuiltValueField(wireName: r'fulfillmentStatus')
  String get fulfillmentStatus;

  @BuiltValueField(wireName: r'customerEmail')
  String get customerEmail;

  @BuiltValueField(wireName: r'customerName')
  String get customerName;

  @BuiltValueField(wireName: r'customerPhone')
  String get customerPhone;

  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  @BuiltValueField(wireName: r'countryCode')
  String get countryCode;

  @BuiltValueField(wireName: r'shippingMethod')
  OrderShippingMethodDetailsDto get shippingMethod;

  @BuiltValueField(wireName: r'subtotalAmount')
  num get subtotalAmount;

  @BuiltValueField(wireName: r'subtotalDiscountAmount')
  num get subtotalDiscountAmount;

  @BuiltValueField(wireName: r'discountedSubtotalAmount')
  num get discountedSubtotalAmount;

  @BuiltValueField(wireName: r'shippingAmount')
  num get shippingAmount;

  @BuiltValueField(wireName: r'taxAmount')
  num get taxAmount;

  @BuiltValueField(wireName: r'grandTotalAmount')
  num get grandTotalAmount;

  @BuiltValueField(wireName: r'placedAt')
  String get placedAt;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  @BuiltValueField(wireName: r'addresses')
  BuiltList<OrderAddressDto> get addresses;

  @BuiltValueField(wireName: r'items')
  BuiltList<OrderLineItemDto> get items;

  @BuiltValueField(wireName: r'appliedPromotions')
  BuiltList<OrderAppliedPromotionDto> get appliedPromotions;

  @BuiltValueField(wireName: r'shipments')
  BuiltList<OrderShipmentDto> get shipments;

  @BuiltValueField(wireName: r'returnRequests')
  BuiltList<OrderReturnRequestDto> get returnRequests;

  @BuiltValueField(wireName: r'refunds')
  BuiltList<OrderRefundDto> get refunds;

  @BuiltValueField(wireName: r'userId')
  String? get userId;

  @BuiltValueField(wireName: r'couponCode')
  String? get couponCode;

  @BuiltValueField(wireName: r'paidAt')
  String? get paidAt;

  @BuiltValueField(wireName: r'payment')
  CheckoutPaymentAttemptDto? get payment;

  CheckoutPlaceOrderResponseDto._();

  factory CheckoutPlaceOrderResponseDto([void updates(CheckoutPlaceOrderResponseDtoBuilder b)]) = _$CheckoutPlaceOrderResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckoutPlaceOrderResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckoutPlaceOrderResponseDto> get serializer => _$CheckoutPlaceOrderResponseDtoSerializer();
}

class _$CheckoutPlaceOrderResponseDtoSerializer implements PrimitiveSerializer<CheckoutPlaceOrderResponseDto> {
  @override
  final Iterable<Type> types = const [CheckoutPlaceOrderResponseDto, _$CheckoutPlaceOrderResponseDto];

  @override
  final String wireName = r'CheckoutPlaceOrderResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckoutPlaceOrderResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'orderNumber';
    yield serializers.serialize(
      object.orderNumber,
      specifiedType: const FullType(String),
    );
    yield r'cartId';
    yield serializers.serialize(
      object.cartId,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'paymentMethod';
    yield serializers.serialize(
      object.paymentMethod,
      specifiedType: const FullType(String),
    );
    yield r'paymentStatus';
    yield serializers.serialize(
      object.paymentStatus,
      specifiedType: const FullType(String),
    );
    yield r'fulfillmentStatus';
    yield serializers.serialize(
      object.fulfillmentStatus,
      specifiedType: const FullType(String),
    );
    yield r'customerEmail';
    yield serializers.serialize(
      object.customerEmail,
      specifiedType: const FullType(String),
    );
    yield r'customerName';
    yield serializers.serialize(
      object.customerName,
      specifiedType: const FullType(String),
    );
    yield r'customerPhone';
    yield serializers.serialize(
      object.customerPhone,
      specifiedType: const FullType(String),
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
    yield r'shippingMethod';
    yield serializers.serialize(
      object.shippingMethod,
      specifiedType: const FullType(OrderShippingMethodDetailsDto),
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
    yield r'shippingAmount';
    yield serializers.serialize(
      object.shippingAmount,
      specifiedType: const FullType(num),
    );
    yield r'taxAmount';
    yield serializers.serialize(
      object.taxAmount,
      specifiedType: const FullType(num),
    );
    yield r'grandTotalAmount';
    yield serializers.serialize(
      object.grandTotalAmount,
      specifiedType: const FullType(num),
    );
    yield r'placedAt';
    yield serializers.serialize(
      object.placedAt,
      specifiedType: const FullType(String),
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
    yield r'addresses';
    yield serializers.serialize(
      object.addresses,
      specifiedType: const FullType(BuiltList, [FullType(OrderAddressDto)]),
    );
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(OrderLineItemDto)]),
    );
    yield r'appliedPromotions';
    yield serializers.serialize(
      object.appliedPromotions,
      specifiedType: const FullType(BuiltList, [FullType(OrderAppliedPromotionDto)]),
    );
    yield r'shipments';
    yield serializers.serialize(
      object.shipments,
      specifiedType: const FullType(BuiltList, [FullType(OrderShipmentDto)]),
    );
    yield r'returnRequests';
    yield serializers.serialize(
      object.returnRequests,
      specifiedType: const FullType(BuiltList, [FullType(OrderReturnRequestDto)]),
    );
    yield r'refunds';
    yield serializers.serialize(
      object.refunds,
      specifiedType: const FullType(BuiltList, [FullType(OrderRefundDto)]),
    );
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.couponCode != null) {
      yield r'couponCode';
      yield serializers.serialize(
        object.couponCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.paidAt != null) {
      yield r'paidAt';
      yield serializers.serialize(
        object.paidAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.payment != null) {
      yield r'payment';
      yield serializers.serialize(
        object.payment,
        specifiedType: const FullType(CheckoutPaymentAttemptDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CheckoutPlaceOrderResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CheckoutPlaceOrderResponseDtoBuilder result,
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
        case r'orderNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.orderNumber = valueDes;
          break;
        case r'cartId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.cartId = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'paymentMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.paymentMethod = valueDes;
          break;
        case r'paymentStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.paymentStatus = valueDes;
          break;
        case r'fulfillmentStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fulfillmentStatus = valueDes;
          break;
        case r'customerEmail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.customerEmail = valueDes;
          break;
        case r'customerName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.customerName = valueDes;
          break;
        case r'customerPhone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.customerPhone = valueDes;
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
        case r'shippingMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(OrderShippingMethodDetailsDto),
          ) as OrderShippingMethodDetailsDto;
          result.shippingMethod.replace(valueDes);
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
        case r'shippingAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.shippingAmount = valueDes;
          break;
        case r'taxAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.taxAmount = valueDes;
          break;
        case r'grandTotalAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.grandTotalAmount = valueDes;
          break;
        case r'placedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.placedAt = valueDes;
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
        case r'addresses':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(OrderAddressDto)]),
          ) as BuiltList<OrderAddressDto>;
          result.addresses.replace(valueDes);
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(OrderLineItemDto)]),
          ) as BuiltList<OrderLineItemDto>;
          result.items.replace(valueDes);
          break;
        case r'appliedPromotions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(OrderAppliedPromotionDto)]),
          ) as BuiltList<OrderAppliedPromotionDto>;
          result.appliedPromotions.replace(valueDes);
          break;
        case r'shipments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(OrderShipmentDto)]),
          ) as BuiltList<OrderShipmentDto>;
          result.shipments.replace(valueDes);
          break;
        case r'returnRequests':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(OrderReturnRequestDto)]),
          ) as BuiltList<OrderReturnRequestDto>;
          result.returnRequests.replace(valueDes);
          break;
        case r'refunds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(OrderRefundDto)]),
          ) as BuiltList<OrderRefundDto>;
          result.refunds.replace(valueDes);
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'couponCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.couponCode = valueDes;
          break;
        case r'paidAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.paidAt = valueDes;
          break;
        case r'payment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CheckoutPaymentAttemptDto),
          ) as CheckoutPaymentAttemptDto;
          result.payment.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CheckoutPlaceOrderResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckoutPlaceOrderResponseDtoBuilder();
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

