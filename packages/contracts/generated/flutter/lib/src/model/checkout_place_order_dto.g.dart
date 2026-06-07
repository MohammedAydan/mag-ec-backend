// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_place_order_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CheckoutPlaceOrderDtoPaymentMethodEnum
    _$checkoutPlaceOrderDtoPaymentMethodEnum_cashOnDelivery =
    const CheckoutPlaceOrderDtoPaymentMethodEnum._('cashOnDelivery');
const CheckoutPlaceOrderDtoPaymentMethodEnum
    _$checkoutPlaceOrderDtoPaymentMethodEnum_onlineCard =
    const CheckoutPlaceOrderDtoPaymentMethodEnum._('onlineCard');

CheckoutPlaceOrderDtoPaymentMethodEnum
    _$checkoutPlaceOrderDtoPaymentMethodEnumValueOf(String name) {
  switch (name) {
    case 'cashOnDelivery':
      return _$checkoutPlaceOrderDtoPaymentMethodEnum_cashOnDelivery;
    case 'onlineCard':
      return _$checkoutPlaceOrderDtoPaymentMethodEnum_onlineCard;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<CheckoutPlaceOrderDtoPaymentMethodEnum>
    _$checkoutPlaceOrderDtoPaymentMethodEnumValues = BuiltSet<
        CheckoutPlaceOrderDtoPaymentMethodEnum>(const <CheckoutPlaceOrderDtoPaymentMethodEnum>[
  _$checkoutPlaceOrderDtoPaymentMethodEnum_cashOnDelivery,
  _$checkoutPlaceOrderDtoPaymentMethodEnum_onlineCard,
]);

Serializer<CheckoutPlaceOrderDtoPaymentMethodEnum>
    _$checkoutPlaceOrderDtoPaymentMethodEnumSerializer =
    _$CheckoutPlaceOrderDtoPaymentMethodEnumSerializer();

class _$CheckoutPlaceOrderDtoPaymentMethodEnumSerializer
    implements PrimitiveSerializer<CheckoutPlaceOrderDtoPaymentMethodEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'cashOnDelivery': 'cash_on_delivery',
    'onlineCard': 'online_card',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'cash_on_delivery': 'cashOnDelivery',
    'online_card': 'onlineCard',
  };

  @override
  final Iterable<Type> types = const <Type>[
    CheckoutPlaceOrderDtoPaymentMethodEnum
  ];
  @override
  final String wireName = 'CheckoutPlaceOrderDtoPaymentMethodEnum';

  @override
  Object serialize(Serializers serializers,
          CheckoutPlaceOrderDtoPaymentMethodEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CheckoutPlaceOrderDtoPaymentMethodEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CheckoutPlaceOrderDtoPaymentMethodEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CheckoutPlaceOrderDto extends CheckoutPlaceOrderDto {
  @override
  final String cartId;
  @override
  final String currencyCode;
  @override
  final String countryCode;
  @override
  final String customerEmail;
  @override
  final String shippingMethodKey;
  @override
  final CheckoutPlaceOrderDtoPaymentMethodEnum paymentMethod;
  @override
  final CheckoutAddressDto shippingAddress;
  @override
  final String? customerLocale;
  @override
  final String? reservationKey;
  @override
  final CheckoutAddressDto? billingAddress;

  factory _$CheckoutPlaceOrderDto(
          [void Function(CheckoutPlaceOrderDtoBuilder)? updates]) =>
      (CheckoutPlaceOrderDtoBuilder()..update(updates))._build();

  _$CheckoutPlaceOrderDto._(
      {required this.cartId,
      required this.currencyCode,
      required this.countryCode,
      required this.customerEmail,
      required this.shippingMethodKey,
      required this.paymentMethod,
      required this.shippingAddress,
      this.customerLocale,
      this.reservationKey,
      this.billingAddress})
      : super._();
  @override
  CheckoutPlaceOrderDto rebuild(
          void Function(CheckoutPlaceOrderDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutPlaceOrderDtoBuilder toBuilder() =>
      CheckoutPlaceOrderDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutPlaceOrderDto &&
        cartId == other.cartId &&
        currencyCode == other.currencyCode &&
        countryCode == other.countryCode &&
        customerEmail == other.customerEmail &&
        shippingMethodKey == other.shippingMethodKey &&
        paymentMethod == other.paymentMethod &&
        shippingAddress == other.shippingAddress &&
        customerLocale == other.customerLocale &&
        reservationKey == other.reservationKey &&
        billingAddress == other.billingAddress;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cartId.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, customerEmail.hashCode);
    _$hash = $jc(_$hash, shippingMethodKey.hashCode);
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jc(_$hash, shippingAddress.hashCode);
    _$hash = $jc(_$hash, customerLocale.hashCode);
    _$hash = $jc(_$hash, reservationKey.hashCode);
    _$hash = $jc(_$hash, billingAddress.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckoutPlaceOrderDto')
          ..add('cartId', cartId)
          ..add('currencyCode', currencyCode)
          ..add('countryCode', countryCode)
          ..add('customerEmail', customerEmail)
          ..add('shippingMethodKey', shippingMethodKey)
          ..add('paymentMethod', paymentMethod)
          ..add('shippingAddress', shippingAddress)
          ..add('customerLocale', customerLocale)
          ..add('reservationKey', reservationKey)
          ..add('billingAddress', billingAddress))
        .toString();
  }
}

class CheckoutPlaceOrderDtoBuilder
    implements Builder<CheckoutPlaceOrderDto, CheckoutPlaceOrderDtoBuilder> {
  _$CheckoutPlaceOrderDto? _$v;

  String? _cartId;
  String? get cartId => _$this._cartId;
  set cartId(String? cartId) => _$this._cartId = cartId;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

  String? _customerEmail;
  String? get customerEmail => _$this._customerEmail;
  set customerEmail(String? customerEmail) =>
      _$this._customerEmail = customerEmail;

  String? _shippingMethodKey;
  String? get shippingMethodKey => _$this._shippingMethodKey;
  set shippingMethodKey(String? shippingMethodKey) =>
      _$this._shippingMethodKey = shippingMethodKey;

  CheckoutPlaceOrderDtoPaymentMethodEnum? _paymentMethod;
  CheckoutPlaceOrderDtoPaymentMethodEnum? get paymentMethod =>
      _$this._paymentMethod;
  set paymentMethod(CheckoutPlaceOrderDtoPaymentMethodEnum? paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  CheckoutAddressDtoBuilder? _shippingAddress;
  CheckoutAddressDtoBuilder get shippingAddress =>
      _$this._shippingAddress ??= CheckoutAddressDtoBuilder();
  set shippingAddress(CheckoutAddressDtoBuilder? shippingAddress) =>
      _$this._shippingAddress = shippingAddress;

  String? _customerLocale;
  String? get customerLocale => _$this._customerLocale;
  set customerLocale(String? customerLocale) =>
      _$this._customerLocale = customerLocale;

  String? _reservationKey;
  String? get reservationKey => _$this._reservationKey;
  set reservationKey(String? reservationKey) =>
      _$this._reservationKey = reservationKey;

  CheckoutAddressDtoBuilder? _billingAddress;
  CheckoutAddressDtoBuilder get billingAddress =>
      _$this._billingAddress ??= CheckoutAddressDtoBuilder();
  set billingAddress(CheckoutAddressDtoBuilder? billingAddress) =>
      _$this._billingAddress = billingAddress;

  CheckoutPlaceOrderDtoBuilder() {
    CheckoutPlaceOrderDto._defaults(this);
  }

  CheckoutPlaceOrderDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cartId = $v.cartId;
      _currencyCode = $v.currencyCode;
      _countryCode = $v.countryCode;
      _customerEmail = $v.customerEmail;
      _shippingMethodKey = $v.shippingMethodKey;
      _paymentMethod = $v.paymentMethod;
      _shippingAddress = $v.shippingAddress.toBuilder();
      _customerLocale = $v.customerLocale;
      _reservationKey = $v.reservationKey;
      _billingAddress = $v.billingAddress?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutPlaceOrderDto other) {
    _$v = other as _$CheckoutPlaceOrderDto;
  }

  @override
  void update(void Function(CheckoutPlaceOrderDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckoutPlaceOrderDto build() => _build();

  _$CheckoutPlaceOrderDto _build() {
    _$CheckoutPlaceOrderDto _$result;
    try {
      _$result = _$v ??
          _$CheckoutPlaceOrderDto._(
            cartId: BuiltValueNullFieldError.checkNotNull(
                cartId, r'CheckoutPlaceOrderDto', 'cartId'),
            currencyCode: BuiltValueNullFieldError.checkNotNull(
                currencyCode, r'CheckoutPlaceOrderDto', 'currencyCode'),
            countryCode: BuiltValueNullFieldError.checkNotNull(
                countryCode, r'CheckoutPlaceOrderDto', 'countryCode'),
            customerEmail: BuiltValueNullFieldError.checkNotNull(
                customerEmail, r'CheckoutPlaceOrderDto', 'customerEmail'),
            shippingMethodKey: BuiltValueNullFieldError.checkNotNull(
                shippingMethodKey,
                r'CheckoutPlaceOrderDto',
                'shippingMethodKey'),
            paymentMethod: BuiltValueNullFieldError.checkNotNull(
                paymentMethod, r'CheckoutPlaceOrderDto', 'paymentMethod'),
            shippingAddress: shippingAddress.build(),
            customerLocale: customerLocale,
            reservationKey: reservationKey,
            billingAddress: _billingAddress?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'shippingAddress';
        shippingAddress.build();

        _$failedField = 'billingAddress';
        _billingAddress?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CheckoutPlaceOrderDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
