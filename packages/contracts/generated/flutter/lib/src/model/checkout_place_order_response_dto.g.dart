// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_place_order_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckoutPlaceOrderResponseDto extends CheckoutPlaceOrderResponseDto {
  @override
  final String id;
  @override
  final String orderNumber;
  @override
  final String cartId;
  @override
  final String status;
  @override
  final String paymentMethod;
  @override
  final String paymentStatus;
  @override
  final String fulfillmentStatus;
  @override
  final String customerEmail;
  @override
  final String customerName;
  @override
  final String customerPhone;
  @override
  final String currencyCode;
  @override
  final String countryCode;
  @override
  final OrderShippingMethodDetailsDto shippingMethod;
  @override
  final num subtotalAmount;
  @override
  final num subtotalDiscountAmount;
  @override
  final num discountedSubtotalAmount;
  @override
  final num shippingAmount;
  @override
  final num taxAmount;
  @override
  final num grandTotalAmount;
  @override
  final String placedAt;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final BuiltList<OrderAddressDto> addresses;
  @override
  final BuiltList<OrderLineItemDto> items;
  @override
  final BuiltList<OrderAppliedPromotionDto> appliedPromotions;
  @override
  final BuiltList<OrderShipmentDto> shipments;
  @override
  final BuiltList<OrderReturnRequestDto> returnRequests;
  @override
  final BuiltList<OrderRefundDto> refunds;
  @override
  final String? userId;
  @override
  final String? couponCode;
  @override
  final String? paidAt;
  @override
  final CheckoutPaymentAttemptDto? payment;

  factory _$CheckoutPlaceOrderResponseDto(
          [void Function(CheckoutPlaceOrderResponseDtoBuilder)? updates]) =>
      (CheckoutPlaceOrderResponseDtoBuilder()..update(updates))._build();

  _$CheckoutPlaceOrderResponseDto._(
      {required this.id,
      required this.orderNumber,
      required this.cartId,
      required this.status,
      required this.paymentMethod,
      required this.paymentStatus,
      required this.fulfillmentStatus,
      required this.customerEmail,
      required this.customerName,
      required this.customerPhone,
      required this.currencyCode,
      required this.countryCode,
      required this.shippingMethod,
      required this.subtotalAmount,
      required this.subtotalDiscountAmount,
      required this.discountedSubtotalAmount,
      required this.shippingAmount,
      required this.taxAmount,
      required this.grandTotalAmount,
      required this.placedAt,
      required this.createdAt,
      required this.updatedAt,
      required this.addresses,
      required this.items,
      required this.appliedPromotions,
      required this.shipments,
      required this.returnRequests,
      required this.refunds,
      this.userId,
      this.couponCode,
      this.paidAt,
      this.payment})
      : super._();
  @override
  CheckoutPlaceOrderResponseDto rebuild(
          void Function(CheckoutPlaceOrderResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutPlaceOrderResponseDtoBuilder toBuilder() =>
      CheckoutPlaceOrderResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutPlaceOrderResponseDto &&
        id == other.id &&
        orderNumber == other.orderNumber &&
        cartId == other.cartId &&
        status == other.status &&
        paymentMethod == other.paymentMethod &&
        paymentStatus == other.paymentStatus &&
        fulfillmentStatus == other.fulfillmentStatus &&
        customerEmail == other.customerEmail &&
        customerName == other.customerName &&
        customerPhone == other.customerPhone &&
        currencyCode == other.currencyCode &&
        countryCode == other.countryCode &&
        shippingMethod == other.shippingMethod &&
        subtotalAmount == other.subtotalAmount &&
        subtotalDiscountAmount == other.subtotalDiscountAmount &&
        discountedSubtotalAmount == other.discountedSubtotalAmount &&
        shippingAmount == other.shippingAmount &&
        taxAmount == other.taxAmount &&
        grandTotalAmount == other.grandTotalAmount &&
        placedAt == other.placedAt &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        addresses == other.addresses &&
        items == other.items &&
        appliedPromotions == other.appliedPromotions &&
        shipments == other.shipments &&
        returnRequests == other.returnRequests &&
        refunds == other.refunds &&
        userId == other.userId &&
        couponCode == other.couponCode &&
        paidAt == other.paidAt &&
        payment == other.payment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, orderNumber.hashCode);
    _$hash = $jc(_$hash, cartId.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jc(_$hash, paymentStatus.hashCode);
    _$hash = $jc(_$hash, fulfillmentStatus.hashCode);
    _$hash = $jc(_$hash, customerEmail.hashCode);
    _$hash = $jc(_$hash, customerName.hashCode);
    _$hash = $jc(_$hash, customerPhone.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, shippingMethod.hashCode);
    _$hash = $jc(_$hash, subtotalAmount.hashCode);
    _$hash = $jc(_$hash, subtotalDiscountAmount.hashCode);
    _$hash = $jc(_$hash, discountedSubtotalAmount.hashCode);
    _$hash = $jc(_$hash, shippingAmount.hashCode);
    _$hash = $jc(_$hash, taxAmount.hashCode);
    _$hash = $jc(_$hash, grandTotalAmount.hashCode);
    _$hash = $jc(_$hash, placedAt.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, addresses.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, appliedPromotions.hashCode);
    _$hash = $jc(_$hash, shipments.hashCode);
    _$hash = $jc(_$hash, returnRequests.hashCode);
    _$hash = $jc(_$hash, refunds.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, couponCode.hashCode);
    _$hash = $jc(_$hash, paidAt.hashCode);
    _$hash = $jc(_$hash, payment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckoutPlaceOrderResponseDto')
          ..add('id', id)
          ..add('orderNumber', orderNumber)
          ..add('cartId', cartId)
          ..add('status', status)
          ..add('paymentMethod', paymentMethod)
          ..add('paymentStatus', paymentStatus)
          ..add('fulfillmentStatus', fulfillmentStatus)
          ..add('customerEmail', customerEmail)
          ..add('customerName', customerName)
          ..add('customerPhone', customerPhone)
          ..add('currencyCode', currencyCode)
          ..add('countryCode', countryCode)
          ..add('shippingMethod', shippingMethod)
          ..add('subtotalAmount', subtotalAmount)
          ..add('subtotalDiscountAmount', subtotalDiscountAmount)
          ..add('discountedSubtotalAmount', discountedSubtotalAmount)
          ..add('shippingAmount', shippingAmount)
          ..add('taxAmount', taxAmount)
          ..add('grandTotalAmount', grandTotalAmount)
          ..add('placedAt', placedAt)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('addresses', addresses)
          ..add('items', items)
          ..add('appliedPromotions', appliedPromotions)
          ..add('shipments', shipments)
          ..add('returnRequests', returnRequests)
          ..add('refunds', refunds)
          ..add('userId', userId)
          ..add('couponCode', couponCode)
          ..add('paidAt', paidAt)
          ..add('payment', payment))
        .toString();
  }
}

class CheckoutPlaceOrderResponseDtoBuilder
    implements
        Builder<CheckoutPlaceOrderResponseDto,
            CheckoutPlaceOrderResponseDtoBuilder> {
  _$CheckoutPlaceOrderResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _orderNumber;
  String? get orderNumber => _$this._orderNumber;
  set orderNumber(String? orderNumber) => _$this._orderNumber = orderNumber;

  String? _cartId;
  String? get cartId => _$this._cartId;
  set cartId(String? cartId) => _$this._cartId = cartId;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _paymentMethod;
  String? get paymentMethod => _$this._paymentMethod;
  set paymentMethod(String? paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  String? _paymentStatus;
  String? get paymentStatus => _$this._paymentStatus;
  set paymentStatus(String? paymentStatus) =>
      _$this._paymentStatus = paymentStatus;

  String? _fulfillmentStatus;
  String? get fulfillmentStatus => _$this._fulfillmentStatus;
  set fulfillmentStatus(String? fulfillmentStatus) =>
      _$this._fulfillmentStatus = fulfillmentStatus;

  String? _customerEmail;
  String? get customerEmail => _$this._customerEmail;
  set customerEmail(String? customerEmail) =>
      _$this._customerEmail = customerEmail;

  String? _customerName;
  String? get customerName => _$this._customerName;
  set customerName(String? customerName) => _$this._customerName = customerName;

  String? _customerPhone;
  String? get customerPhone => _$this._customerPhone;
  set customerPhone(String? customerPhone) =>
      _$this._customerPhone = customerPhone;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

  OrderShippingMethodDetailsDtoBuilder? _shippingMethod;
  OrderShippingMethodDetailsDtoBuilder get shippingMethod =>
      _$this._shippingMethod ??= OrderShippingMethodDetailsDtoBuilder();
  set shippingMethod(OrderShippingMethodDetailsDtoBuilder? shippingMethod) =>
      _$this._shippingMethod = shippingMethod;

  num? _subtotalAmount;
  num? get subtotalAmount => _$this._subtotalAmount;
  set subtotalAmount(num? subtotalAmount) =>
      _$this._subtotalAmount = subtotalAmount;

  num? _subtotalDiscountAmount;
  num? get subtotalDiscountAmount => _$this._subtotalDiscountAmount;
  set subtotalDiscountAmount(num? subtotalDiscountAmount) =>
      _$this._subtotalDiscountAmount = subtotalDiscountAmount;

  num? _discountedSubtotalAmount;
  num? get discountedSubtotalAmount => _$this._discountedSubtotalAmount;
  set discountedSubtotalAmount(num? discountedSubtotalAmount) =>
      _$this._discountedSubtotalAmount = discountedSubtotalAmount;

  num? _shippingAmount;
  num? get shippingAmount => _$this._shippingAmount;
  set shippingAmount(num? shippingAmount) =>
      _$this._shippingAmount = shippingAmount;

  num? _taxAmount;
  num? get taxAmount => _$this._taxAmount;
  set taxAmount(num? taxAmount) => _$this._taxAmount = taxAmount;

  num? _grandTotalAmount;
  num? get grandTotalAmount => _$this._grandTotalAmount;
  set grandTotalAmount(num? grandTotalAmount) =>
      _$this._grandTotalAmount = grandTotalAmount;

  String? _placedAt;
  String? get placedAt => _$this._placedAt;
  set placedAt(String? placedAt) => _$this._placedAt = placedAt;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<OrderAddressDto>? _addresses;
  ListBuilder<OrderAddressDto> get addresses =>
      _$this._addresses ??= ListBuilder<OrderAddressDto>();
  set addresses(ListBuilder<OrderAddressDto>? addresses) =>
      _$this._addresses = addresses;

  ListBuilder<OrderLineItemDto>? _items;
  ListBuilder<OrderLineItemDto> get items =>
      _$this._items ??= ListBuilder<OrderLineItemDto>();
  set items(ListBuilder<OrderLineItemDto>? items) => _$this._items = items;

  ListBuilder<OrderAppliedPromotionDto>? _appliedPromotions;
  ListBuilder<OrderAppliedPromotionDto> get appliedPromotions =>
      _$this._appliedPromotions ??= ListBuilder<OrderAppliedPromotionDto>();
  set appliedPromotions(
          ListBuilder<OrderAppliedPromotionDto>? appliedPromotions) =>
      _$this._appliedPromotions = appliedPromotions;

  ListBuilder<OrderShipmentDto>? _shipments;
  ListBuilder<OrderShipmentDto> get shipments =>
      _$this._shipments ??= ListBuilder<OrderShipmentDto>();
  set shipments(ListBuilder<OrderShipmentDto>? shipments) =>
      _$this._shipments = shipments;

  ListBuilder<OrderReturnRequestDto>? _returnRequests;
  ListBuilder<OrderReturnRequestDto> get returnRequests =>
      _$this._returnRequests ??= ListBuilder<OrderReturnRequestDto>();
  set returnRequests(ListBuilder<OrderReturnRequestDto>? returnRequests) =>
      _$this._returnRequests = returnRequests;

  ListBuilder<OrderRefundDto>? _refunds;
  ListBuilder<OrderRefundDto> get refunds =>
      _$this._refunds ??= ListBuilder<OrderRefundDto>();
  set refunds(ListBuilder<OrderRefundDto>? refunds) =>
      _$this._refunds = refunds;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _couponCode;
  String? get couponCode => _$this._couponCode;
  set couponCode(String? couponCode) => _$this._couponCode = couponCode;

  String? _paidAt;
  String? get paidAt => _$this._paidAt;
  set paidAt(String? paidAt) => _$this._paidAt = paidAt;

  CheckoutPaymentAttemptDtoBuilder? _payment;
  CheckoutPaymentAttemptDtoBuilder get payment =>
      _$this._payment ??= CheckoutPaymentAttemptDtoBuilder();
  set payment(CheckoutPaymentAttemptDtoBuilder? payment) =>
      _$this._payment = payment;

  CheckoutPlaceOrderResponseDtoBuilder() {
    CheckoutPlaceOrderResponseDto._defaults(this);
  }

  CheckoutPlaceOrderResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _orderNumber = $v.orderNumber;
      _cartId = $v.cartId;
      _status = $v.status;
      _paymentMethod = $v.paymentMethod;
      _paymentStatus = $v.paymentStatus;
      _fulfillmentStatus = $v.fulfillmentStatus;
      _customerEmail = $v.customerEmail;
      _customerName = $v.customerName;
      _customerPhone = $v.customerPhone;
      _currencyCode = $v.currencyCode;
      _countryCode = $v.countryCode;
      _shippingMethod = $v.shippingMethod.toBuilder();
      _subtotalAmount = $v.subtotalAmount;
      _subtotalDiscountAmount = $v.subtotalDiscountAmount;
      _discountedSubtotalAmount = $v.discountedSubtotalAmount;
      _shippingAmount = $v.shippingAmount;
      _taxAmount = $v.taxAmount;
      _grandTotalAmount = $v.grandTotalAmount;
      _placedAt = $v.placedAt;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _addresses = $v.addresses.toBuilder();
      _items = $v.items.toBuilder();
      _appliedPromotions = $v.appliedPromotions.toBuilder();
      _shipments = $v.shipments.toBuilder();
      _returnRequests = $v.returnRequests.toBuilder();
      _refunds = $v.refunds.toBuilder();
      _userId = $v.userId;
      _couponCode = $v.couponCode;
      _paidAt = $v.paidAt;
      _payment = $v.payment?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutPlaceOrderResponseDto other) {
    _$v = other as _$CheckoutPlaceOrderResponseDto;
  }

  @override
  void update(void Function(CheckoutPlaceOrderResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckoutPlaceOrderResponseDto build() => _build();

  _$CheckoutPlaceOrderResponseDto _build() {
    _$CheckoutPlaceOrderResponseDto _$result;
    try {
      _$result = _$v ??
          _$CheckoutPlaceOrderResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CheckoutPlaceOrderResponseDto', 'id'),
            orderNumber: BuiltValueNullFieldError.checkNotNull(
                orderNumber, r'CheckoutPlaceOrderResponseDto', 'orderNumber'),
            cartId: BuiltValueNullFieldError.checkNotNull(
                cartId, r'CheckoutPlaceOrderResponseDto', 'cartId'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'CheckoutPlaceOrderResponseDto', 'status'),
            paymentMethod: BuiltValueNullFieldError.checkNotNull(paymentMethod,
                r'CheckoutPlaceOrderResponseDto', 'paymentMethod'),
            paymentStatus: BuiltValueNullFieldError.checkNotNull(paymentStatus,
                r'CheckoutPlaceOrderResponseDto', 'paymentStatus'),
            fulfillmentStatus: BuiltValueNullFieldError.checkNotNull(
                fulfillmentStatus,
                r'CheckoutPlaceOrderResponseDto',
                'fulfillmentStatus'),
            customerEmail: BuiltValueNullFieldError.checkNotNull(customerEmail,
                r'CheckoutPlaceOrderResponseDto', 'customerEmail'),
            customerName: BuiltValueNullFieldError.checkNotNull(
                customerName, r'CheckoutPlaceOrderResponseDto', 'customerName'),
            customerPhone: BuiltValueNullFieldError.checkNotNull(customerPhone,
                r'CheckoutPlaceOrderResponseDto', 'customerPhone'),
            currencyCode: BuiltValueNullFieldError.checkNotNull(
                currencyCode, r'CheckoutPlaceOrderResponseDto', 'currencyCode'),
            countryCode: BuiltValueNullFieldError.checkNotNull(
                countryCode, r'CheckoutPlaceOrderResponseDto', 'countryCode'),
            shippingMethod: shippingMethod.build(),
            subtotalAmount: BuiltValueNullFieldError.checkNotNull(
                subtotalAmount,
                r'CheckoutPlaceOrderResponseDto',
                'subtotalAmount'),
            subtotalDiscountAmount: BuiltValueNullFieldError.checkNotNull(
                subtotalDiscountAmount,
                r'CheckoutPlaceOrderResponseDto',
                'subtotalDiscountAmount'),
            discountedSubtotalAmount: BuiltValueNullFieldError.checkNotNull(
                discountedSubtotalAmount,
                r'CheckoutPlaceOrderResponseDto',
                'discountedSubtotalAmount'),
            shippingAmount: BuiltValueNullFieldError.checkNotNull(
                shippingAmount,
                r'CheckoutPlaceOrderResponseDto',
                'shippingAmount'),
            taxAmount: BuiltValueNullFieldError.checkNotNull(
                taxAmount, r'CheckoutPlaceOrderResponseDto', 'taxAmount'),
            grandTotalAmount: BuiltValueNullFieldError.checkNotNull(
                grandTotalAmount,
                r'CheckoutPlaceOrderResponseDto',
                'grandTotalAmount'),
            placedAt: BuiltValueNullFieldError.checkNotNull(
                placedAt, r'CheckoutPlaceOrderResponseDto', 'placedAt'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'CheckoutPlaceOrderResponseDto', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'CheckoutPlaceOrderResponseDto', 'updatedAt'),
            addresses: addresses.build(),
            items: items.build(),
            appliedPromotions: appliedPromotions.build(),
            shipments: shipments.build(),
            returnRequests: returnRequests.build(),
            refunds: refunds.build(),
            userId: userId,
            couponCode: couponCode,
            paidAt: paidAt,
            payment: _payment?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'shippingMethod';
        shippingMethod.build();

        _$failedField = 'addresses';
        addresses.build();
        _$failedField = 'items';
        items.build();
        _$failedField = 'appliedPromotions';
        appliedPromotions.build();
        _$failedField = 'shipments';
        shipments.build();
        _$failedField = 'returnRequests';
        returnRequests.build();
        _$failedField = 'refunds';
        refunds.build();

        _$failedField = 'payment';
        _payment?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CheckoutPlaceOrderResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
