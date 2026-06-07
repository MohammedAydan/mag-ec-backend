// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_preview_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckoutPreviewResponseDto extends CheckoutPreviewResponseDto {
  @override
  final String cartId;
  @override
  final CheckoutPaymentReadinessDto paymentReadiness;
  @override
  final String currencyCode;
  @override
  final String countryCode;
  @override
  final num subtotalAmount;
  @override
  final num subtotalDiscountAmount;
  @override
  final num discountedSubtotalAmount;
  @override
  final num taxAmount;
  @override
  final num grandTotalExcludingShippingAmount;
  @override
  final BuiltList<CheckoutPreviewAppliedPromotionDto> appliedPromotions;
  @override
  final BuiltList<String> rejectedPromotions;
  @override
  final BuiltList<CheckoutPreviewItemResponseDto> items;
  @override
  final BuiltList<CheckoutPreviewShippingMethodDto> shippingMethods;
  @override
  final String? reservationKey;
  @override
  final String? reservationExpiresAt;

  factory _$CheckoutPreviewResponseDto(
          [void Function(CheckoutPreviewResponseDtoBuilder)? updates]) =>
      (CheckoutPreviewResponseDtoBuilder()..update(updates))._build();

  _$CheckoutPreviewResponseDto._(
      {required this.cartId,
      required this.paymentReadiness,
      required this.currencyCode,
      required this.countryCode,
      required this.subtotalAmount,
      required this.subtotalDiscountAmount,
      required this.discountedSubtotalAmount,
      required this.taxAmount,
      required this.grandTotalExcludingShippingAmount,
      required this.appliedPromotions,
      required this.rejectedPromotions,
      required this.items,
      required this.shippingMethods,
      this.reservationKey,
      this.reservationExpiresAt})
      : super._();
  @override
  CheckoutPreviewResponseDto rebuild(
          void Function(CheckoutPreviewResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutPreviewResponseDtoBuilder toBuilder() =>
      CheckoutPreviewResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutPreviewResponseDto &&
        cartId == other.cartId &&
        paymentReadiness == other.paymentReadiness &&
        currencyCode == other.currencyCode &&
        countryCode == other.countryCode &&
        subtotalAmount == other.subtotalAmount &&
        subtotalDiscountAmount == other.subtotalDiscountAmount &&
        discountedSubtotalAmount == other.discountedSubtotalAmount &&
        taxAmount == other.taxAmount &&
        grandTotalExcludingShippingAmount ==
            other.grandTotalExcludingShippingAmount &&
        appliedPromotions == other.appliedPromotions &&
        rejectedPromotions == other.rejectedPromotions &&
        items == other.items &&
        shippingMethods == other.shippingMethods &&
        reservationKey == other.reservationKey &&
        reservationExpiresAt == other.reservationExpiresAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cartId.hashCode);
    _$hash = $jc(_$hash, paymentReadiness.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, subtotalAmount.hashCode);
    _$hash = $jc(_$hash, subtotalDiscountAmount.hashCode);
    _$hash = $jc(_$hash, discountedSubtotalAmount.hashCode);
    _$hash = $jc(_$hash, taxAmount.hashCode);
    _$hash = $jc(_$hash, grandTotalExcludingShippingAmount.hashCode);
    _$hash = $jc(_$hash, appliedPromotions.hashCode);
    _$hash = $jc(_$hash, rejectedPromotions.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, shippingMethods.hashCode);
    _$hash = $jc(_$hash, reservationKey.hashCode);
    _$hash = $jc(_$hash, reservationExpiresAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckoutPreviewResponseDto')
          ..add('cartId', cartId)
          ..add('paymentReadiness', paymentReadiness)
          ..add('currencyCode', currencyCode)
          ..add('countryCode', countryCode)
          ..add('subtotalAmount', subtotalAmount)
          ..add('subtotalDiscountAmount', subtotalDiscountAmount)
          ..add('discountedSubtotalAmount', discountedSubtotalAmount)
          ..add('taxAmount', taxAmount)
          ..add('grandTotalExcludingShippingAmount',
              grandTotalExcludingShippingAmount)
          ..add('appliedPromotions', appliedPromotions)
          ..add('rejectedPromotions', rejectedPromotions)
          ..add('items', items)
          ..add('shippingMethods', shippingMethods)
          ..add('reservationKey', reservationKey)
          ..add('reservationExpiresAt', reservationExpiresAt))
        .toString();
  }
}

class CheckoutPreviewResponseDtoBuilder
    implements
        Builder<CheckoutPreviewResponseDto, CheckoutPreviewResponseDtoBuilder> {
  _$CheckoutPreviewResponseDto? _$v;

  String? _cartId;
  String? get cartId => _$this._cartId;
  set cartId(String? cartId) => _$this._cartId = cartId;

  CheckoutPaymentReadinessDtoBuilder? _paymentReadiness;
  CheckoutPaymentReadinessDtoBuilder get paymentReadiness =>
      _$this._paymentReadiness ??= CheckoutPaymentReadinessDtoBuilder();
  set paymentReadiness(CheckoutPaymentReadinessDtoBuilder? paymentReadiness) =>
      _$this._paymentReadiness = paymentReadiness;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

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

  num? _taxAmount;
  num? get taxAmount => _$this._taxAmount;
  set taxAmount(num? taxAmount) => _$this._taxAmount = taxAmount;

  num? _grandTotalExcludingShippingAmount;
  num? get grandTotalExcludingShippingAmount =>
      _$this._grandTotalExcludingShippingAmount;
  set grandTotalExcludingShippingAmount(
          num? grandTotalExcludingShippingAmount) =>
      _$this._grandTotalExcludingShippingAmount =
          grandTotalExcludingShippingAmount;

  ListBuilder<CheckoutPreviewAppliedPromotionDto>? _appliedPromotions;
  ListBuilder<CheckoutPreviewAppliedPromotionDto> get appliedPromotions =>
      _$this._appliedPromotions ??=
          ListBuilder<CheckoutPreviewAppliedPromotionDto>();
  set appliedPromotions(
          ListBuilder<CheckoutPreviewAppliedPromotionDto>? appliedPromotions) =>
      _$this._appliedPromotions = appliedPromotions;

  ListBuilder<String>? _rejectedPromotions;
  ListBuilder<String> get rejectedPromotions =>
      _$this._rejectedPromotions ??= ListBuilder<String>();
  set rejectedPromotions(ListBuilder<String>? rejectedPromotions) =>
      _$this._rejectedPromotions = rejectedPromotions;

  ListBuilder<CheckoutPreviewItemResponseDto>? _items;
  ListBuilder<CheckoutPreviewItemResponseDto> get items =>
      _$this._items ??= ListBuilder<CheckoutPreviewItemResponseDto>();
  set items(ListBuilder<CheckoutPreviewItemResponseDto>? items) =>
      _$this._items = items;

  ListBuilder<CheckoutPreviewShippingMethodDto>? _shippingMethods;
  ListBuilder<CheckoutPreviewShippingMethodDto> get shippingMethods =>
      _$this._shippingMethods ??=
          ListBuilder<CheckoutPreviewShippingMethodDto>();
  set shippingMethods(
          ListBuilder<CheckoutPreviewShippingMethodDto>? shippingMethods) =>
      _$this._shippingMethods = shippingMethods;

  String? _reservationKey;
  String? get reservationKey => _$this._reservationKey;
  set reservationKey(String? reservationKey) =>
      _$this._reservationKey = reservationKey;

  String? _reservationExpiresAt;
  String? get reservationExpiresAt => _$this._reservationExpiresAt;
  set reservationExpiresAt(String? reservationExpiresAt) =>
      _$this._reservationExpiresAt = reservationExpiresAt;

  CheckoutPreviewResponseDtoBuilder() {
    CheckoutPreviewResponseDto._defaults(this);
  }

  CheckoutPreviewResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cartId = $v.cartId;
      _paymentReadiness = $v.paymentReadiness.toBuilder();
      _currencyCode = $v.currencyCode;
      _countryCode = $v.countryCode;
      _subtotalAmount = $v.subtotalAmount;
      _subtotalDiscountAmount = $v.subtotalDiscountAmount;
      _discountedSubtotalAmount = $v.discountedSubtotalAmount;
      _taxAmount = $v.taxAmount;
      _grandTotalExcludingShippingAmount = $v.grandTotalExcludingShippingAmount;
      _appliedPromotions = $v.appliedPromotions.toBuilder();
      _rejectedPromotions = $v.rejectedPromotions.toBuilder();
      _items = $v.items.toBuilder();
      _shippingMethods = $v.shippingMethods.toBuilder();
      _reservationKey = $v.reservationKey;
      _reservationExpiresAt = $v.reservationExpiresAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutPreviewResponseDto other) {
    _$v = other as _$CheckoutPreviewResponseDto;
  }

  @override
  void update(void Function(CheckoutPreviewResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckoutPreviewResponseDto build() => _build();

  _$CheckoutPreviewResponseDto _build() {
    _$CheckoutPreviewResponseDto _$result;
    try {
      _$result = _$v ??
          _$CheckoutPreviewResponseDto._(
            cartId: BuiltValueNullFieldError.checkNotNull(
                cartId, r'CheckoutPreviewResponseDto', 'cartId'),
            paymentReadiness: paymentReadiness.build(),
            currencyCode: BuiltValueNullFieldError.checkNotNull(
                currencyCode, r'CheckoutPreviewResponseDto', 'currencyCode'),
            countryCode: BuiltValueNullFieldError.checkNotNull(
                countryCode, r'CheckoutPreviewResponseDto', 'countryCode'),
            subtotalAmount: BuiltValueNullFieldError.checkNotNull(
                subtotalAmount,
                r'CheckoutPreviewResponseDto',
                'subtotalAmount'),
            subtotalDiscountAmount: BuiltValueNullFieldError.checkNotNull(
                subtotalDiscountAmount,
                r'CheckoutPreviewResponseDto',
                'subtotalDiscountAmount'),
            discountedSubtotalAmount: BuiltValueNullFieldError.checkNotNull(
                discountedSubtotalAmount,
                r'CheckoutPreviewResponseDto',
                'discountedSubtotalAmount'),
            taxAmount: BuiltValueNullFieldError.checkNotNull(
                taxAmount, r'CheckoutPreviewResponseDto', 'taxAmount'),
            grandTotalExcludingShippingAmount:
                BuiltValueNullFieldError.checkNotNull(
                    grandTotalExcludingShippingAmount,
                    r'CheckoutPreviewResponseDto',
                    'grandTotalExcludingShippingAmount'),
            appliedPromotions: appliedPromotions.build(),
            rejectedPromotions: rejectedPromotions.build(),
            items: items.build(),
            shippingMethods: shippingMethods.build(),
            reservationKey: reservationKey,
            reservationExpiresAt: reservationExpiresAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'paymentReadiness';
        paymentReadiness.build();

        _$failedField = 'appliedPromotions';
        appliedPromotions.build();
        _$failedField = 'rejectedPromotions';
        rejectedPromotions.build();
        _$failedField = 'items';
        items.build();
        _$failedField = 'shippingMethods';
        shippingMethods.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CheckoutPreviewResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
