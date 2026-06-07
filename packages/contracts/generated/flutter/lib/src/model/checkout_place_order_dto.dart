//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/checkout_address_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'checkout_place_order_dto.g.dart';

/// CheckoutPlaceOrderDto
///
/// Properties:
/// * [cartId] - Cart ID to place the order from
/// * [currencyCode] - ISO 4217 currency code
/// * [countryCode] - ISO 3166-1 alpha-2 country code
/// * [customerEmail] - Customer email address
/// * [shippingMethodKey] - Selected shipping-method key
/// * [paymentMethod] - Payment method
/// * [shippingAddress] - Shipping destination address
/// * [customerLocale] - Customer locale
/// * [reservationKey] - Reservation key from a prior /checkout/reserve call
/// * [billingAddress] - Billing address (if different from shipping)
@BuiltValue()
abstract class CheckoutPlaceOrderDto
    implements Built<CheckoutPlaceOrderDto, CheckoutPlaceOrderDtoBuilder> {
  /// Cart ID to place the order from
  @BuiltValueField(wireName: r'cartId')
  String get cartId;

  /// ISO 4217 currency code
  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  /// ISO 3166-1 alpha-2 country code
  @BuiltValueField(wireName: r'countryCode')
  String get countryCode;

  /// Customer email address
  @BuiltValueField(wireName: r'customerEmail')
  String get customerEmail;

  /// Selected shipping-method key
  @BuiltValueField(wireName: r'shippingMethodKey')
  String get shippingMethodKey;

  /// Payment method
  @BuiltValueField(wireName: r'paymentMethod')
  CheckoutPlaceOrderDtoPaymentMethodEnum get paymentMethod;
  // enum paymentMethodEnum {  cash_on_delivery,  online_card,  };

  /// Shipping destination address
  @BuiltValueField(wireName: r'shippingAddress')
  CheckoutAddressDto get shippingAddress;

  /// Customer locale
  @BuiltValueField(wireName: r'customerLocale')
  String? get customerLocale;

  /// Reservation key from a prior /checkout/reserve call
  @BuiltValueField(wireName: r'reservationKey')
  String? get reservationKey;

  /// Billing address (if different from shipping)
  @BuiltValueField(wireName: r'billingAddress')
  CheckoutAddressDto? get billingAddress;

  CheckoutPlaceOrderDto._();

  factory CheckoutPlaceOrderDto(
      [void updates(CheckoutPlaceOrderDtoBuilder b)]) = _$CheckoutPlaceOrderDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckoutPlaceOrderDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckoutPlaceOrderDto> get serializer =>
      _$CheckoutPlaceOrderDtoSerializer();
}

class _$CheckoutPlaceOrderDtoSerializer
    implements PrimitiveSerializer<CheckoutPlaceOrderDto> {
  @override
  final Iterable<Type> types = const [
    CheckoutPlaceOrderDto,
    _$CheckoutPlaceOrderDto
  ];

  @override
  final String wireName = r'CheckoutPlaceOrderDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckoutPlaceOrderDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cartId';
    yield serializers.serialize(
      object.cartId,
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
    yield r'customerEmail';
    yield serializers.serialize(
      object.customerEmail,
      specifiedType: const FullType(String),
    );
    yield r'shippingMethodKey';
    yield serializers.serialize(
      object.shippingMethodKey,
      specifiedType: const FullType(String),
    );
    yield r'paymentMethod';
    yield serializers.serialize(
      object.paymentMethod,
      specifiedType: const FullType(CheckoutPlaceOrderDtoPaymentMethodEnum),
    );
    yield r'shippingAddress';
    yield serializers.serialize(
      object.shippingAddress,
      specifiedType: const FullType(CheckoutAddressDto),
    );
    if (object.customerLocale != null) {
      yield r'customerLocale';
      yield serializers.serialize(
        object.customerLocale,
        specifiedType: const FullType(String),
      );
    }
    if (object.reservationKey != null) {
      yield r'reservationKey';
      yield serializers.serialize(
        object.reservationKey,
        specifiedType: const FullType(String),
      );
    }
    if (object.billingAddress != null) {
      yield r'billingAddress';
      yield serializers.serialize(
        object.billingAddress,
        specifiedType: const FullType(CheckoutAddressDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CheckoutPlaceOrderDto object, {
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
    required CheckoutPlaceOrderDtoBuilder result,
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
        case r'customerEmail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.customerEmail = valueDes;
          break;
        case r'shippingMethodKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.shippingMethodKey = valueDes;
          break;
        case r'paymentMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(CheckoutPlaceOrderDtoPaymentMethodEnum),
          ) as CheckoutPlaceOrderDtoPaymentMethodEnum;
          result.paymentMethod = valueDes;
          break;
        case r'shippingAddress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CheckoutAddressDto),
          ) as CheckoutAddressDto;
          result.shippingAddress.replace(valueDes);
          break;
        case r'customerLocale':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.customerLocale = valueDes;
          break;
        case r'reservationKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reservationKey = valueDes;
          break;
        case r'billingAddress':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CheckoutAddressDto),
          ) as CheckoutAddressDto;
          result.billingAddress.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CheckoutPlaceOrderDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckoutPlaceOrderDtoBuilder();
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

class CheckoutPlaceOrderDtoPaymentMethodEnum extends EnumClass {
  /// Payment method
  @BuiltValueEnumConst(wireName: r'cash_on_delivery')
  static const CheckoutPlaceOrderDtoPaymentMethodEnum cashOnDelivery =
      _$checkoutPlaceOrderDtoPaymentMethodEnum_cashOnDelivery;

  /// Payment method
  @BuiltValueEnumConst(wireName: r'online_card')
  static const CheckoutPlaceOrderDtoPaymentMethodEnum onlineCard =
      _$checkoutPlaceOrderDtoPaymentMethodEnum_onlineCard;

  static Serializer<CheckoutPlaceOrderDtoPaymentMethodEnum> get serializer =>
      _$checkoutPlaceOrderDtoPaymentMethodEnumSerializer;

  const CheckoutPlaceOrderDtoPaymentMethodEnum._(String name) : super(name);

  static BuiltSet<CheckoutPlaceOrderDtoPaymentMethodEnum> get values =>
      _$checkoutPlaceOrderDtoPaymentMethodEnumValues;
  static CheckoutPlaceOrderDtoPaymentMethodEnum valueOf(String name) =>
      _$checkoutPlaceOrderDtoPaymentMethodEnumValueOf(name);
}
