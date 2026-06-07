// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_preview_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PricingPreviewResponseDto extends PricingPreviewResponseDto {
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
  final BuiltList<PricingPreviewLineItemDto> items;
  @override
  final BuiltList<PricingPreviewAppliedPromotionDto> appliedPromotions;
  @override
  final BuiltList<String> rejectedPromotions;
  @override
  final BuiltList<PricingPreviewShippingMethodDto> shippingMethods;

  factory _$PricingPreviewResponseDto(
          [void Function(PricingPreviewResponseDtoBuilder)? updates]) =>
      (PricingPreviewResponseDtoBuilder()..update(updates))._build();

  _$PricingPreviewResponseDto._(
      {required this.currencyCode,
      required this.countryCode,
      required this.subtotalAmount,
      required this.subtotalDiscountAmount,
      required this.discountedSubtotalAmount,
      required this.taxAmount,
      required this.grandTotalExcludingShippingAmount,
      required this.items,
      required this.appliedPromotions,
      required this.rejectedPromotions,
      required this.shippingMethods})
      : super._();
  @override
  PricingPreviewResponseDto rebuild(
          void Function(PricingPreviewResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PricingPreviewResponseDtoBuilder toBuilder() =>
      PricingPreviewResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PricingPreviewResponseDto &&
        currencyCode == other.currencyCode &&
        countryCode == other.countryCode &&
        subtotalAmount == other.subtotalAmount &&
        subtotalDiscountAmount == other.subtotalDiscountAmount &&
        discountedSubtotalAmount == other.discountedSubtotalAmount &&
        taxAmount == other.taxAmount &&
        grandTotalExcludingShippingAmount ==
            other.grandTotalExcludingShippingAmount &&
        items == other.items &&
        appliedPromotions == other.appliedPromotions &&
        rejectedPromotions == other.rejectedPromotions &&
        shippingMethods == other.shippingMethods;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, subtotalAmount.hashCode);
    _$hash = $jc(_$hash, subtotalDiscountAmount.hashCode);
    _$hash = $jc(_$hash, discountedSubtotalAmount.hashCode);
    _$hash = $jc(_$hash, taxAmount.hashCode);
    _$hash = $jc(_$hash, grandTotalExcludingShippingAmount.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, appliedPromotions.hashCode);
    _$hash = $jc(_$hash, rejectedPromotions.hashCode);
    _$hash = $jc(_$hash, shippingMethods.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PricingPreviewResponseDto')
          ..add('currencyCode', currencyCode)
          ..add('countryCode', countryCode)
          ..add('subtotalAmount', subtotalAmount)
          ..add('subtotalDiscountAmount', subtotalDiscountAmount)
          ..add('discountedSubtotalAmount', discountedSubtotalAmount)
          ..add('taxAmount', taxAmount)
          ..add('grandTotalExcludingShippingAmount',
              grandTotalExcludingShippingAmount)
          ..add('items', items)
          ..add('appliedPromotions', appliedPromotions)
          ..add('rejectedPromotions', rejectedPromotions)
          ..add('shippingMethods', shippingMethods))
        .toString();
  }
}

class PricingPreviewResponseDtoBuilder
    implements
        Builder<PricingPreviewResponseDto, PricingPreviewResponseDtoBuilder> {
  _$PricingPreviewResponseDto? _$v;

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

  ListBuilder<PricingPreviewLineItemDto>? _items;
  ListBuilder<PricingPreviewLineItemDto> get items =>
      _$this._items ??= ListBuilder<PricingPreviewLineItemDto>();
  set items(ListBuilder<PricingPreviewLineItemDto>? items) =>
      _$this._items = items;

  ListBuilder<PricingPreviewAppliedPromotionDto>? _appliedPromotions;
  ListBuilder<PricingPreviewAppliedPromotionDto> get appliedPromotions =>
      _$this._appliedPromotions ??=
          ListBuilder<PricingPreviewAppliedPromotionDto>();
  set appliedPromotions(
          ListBuilder<PricingPreviewAppliedPromotionDto>? appliedPromotions) =>
      _$this._appliedPromotions = appliedPromotions;

  ListBuilder<String>? _rejectedPromotions;
  ListBuilder<String> get rejectedPromotions =>
      _$this._rejectedPromotions ??= ListBuilder<String>();
  set rejectedPromotions(ListBuilder<String>? rejectedPromotions) =>
      _$this._rejectedPromotions = rejectedPromotions;

  ListBuilder<PricingPreviewShippingMethodDto>? _shippingMethods;
  ListBuilder<PricingPreviewShippingMethodDto> get shippingMethods =>
      _$this._shippingMethods ??=
          ListBuilder<PricingPreviewShippingMethodDto>();
  set shippingMethods(
          ListBuilder<PricingPreviewShippingMethodDto>? shippingMethods) =>
      _$this._shippingMethods = shippingMethods;

  PricingPreviewResponseDtoBuilder() {
    PricingPreviewResponseDto._defaults(this);
  }

  PricingPreviewResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyCode = $v.currencyCode;
      _countryCode = $v.countryCode;
      _subtotalAmount = $v.subtotalAmount;
      _subtotalDiscountAmount = $v.subtotalDiscountAmount;
      _discountedSubtotalAmount = $v.discountedSubtotalAmount;
      _taxAmount = $v.taxAmount;
      _grandTotalExcludingShippingAmount = $v.grandTotalExcludingShippingAmount;
      _items = $v.items.toBuilder();
      _appliedPromotions = $v.appliedPromotions.toBuilder();
      _rejectedPromotions = $v.rejectedPromotions.toBuilder();
      _shippingMethods = $v.shippingMethods.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PricingPreviewResponseDto other) {
    _$v = other as _$PricingPreviewResponseDto;
  }

  @override
  void update(void Function(PricingPreviewResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PricingPreviewResponseDto build() => _build();

  _$PricingPreviewResponseDto _build() {
    _$PricingPreviewResponseDto _$result;
    try {
      _$result = _$v ??
          _$PricingPreviewResponseDto._(
            currencyCode: BuiltValueNullFieldError.checkNotNull(
                currencyCode, r'PricingPreviewResponseDto', 'currencyCode'),
            countryCode: BuiltValueNullFieldError.checkNotNull(
                countryCode, r'PricingPreviewResponseDto', 'countryCode'),
            subtotalAmount: BuiltValueNullFieldError.checkNotNull(
                subtotalAmount, r'PricingPreviewResponseDto', 'subtotalAmount'),
            subtotalDiscountAmount: BuiltValueNullFieldError.checkNotNull(
                subtotalDiscountAmount,
                r'PricingPreviewResponseDto',
                'subtotalDiscountAmount'),
            discountedSubtotalAmount: BuiltValueNullFieldError.checkNotNull(
                discountedSubtotalAmount,
                r'PricingPreviewResponseDto',
                'discountedSubtotalAmount'),
            taxAmount: BuiltValueNullFieldError.checkNotNull(
                taxAmount, r'PricingPreviewResponseDto', 'taxAmount'),
            grandTotalExcludingShippingAmount:
                BuiltValueNullFieldError.checkNotNull(
                    grandTotalExcludingShippingAmount,
                    r'PricingPreviewResponseDto',
                    'grandTotalExcludingShippingAmount'),
            items: items.build(),
            appliedPromotions: appliedPromotions.build(),
            rejectedPromotions: rejectedPromotions.build(),
            shippingMethods: shippingMethods.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
        _$failedField = 'appliedPromotions';
        appliedPromotions.build();
        _$failedField = 'rejectedPromotions';
        rejectedPromotions.build();
        _$failedField = 'shippingMethods';
        shippingMethods.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PricingPreviewResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
