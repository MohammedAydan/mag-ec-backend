// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_preview_item_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckoutPreviewItemResponseDto extends CheckoutPreviewItemResponseDto {
  @override
  final String variantId;
  @override
  final String sku;
  @override
  final num quantity;
  @override
  final String currencyCode;
  @override
  final num unitBaseAmount;
  @override
  final num effectiveUnitAmount;
  @override
  final num lineSubtotalAmount;
  @override
  final num taxAmount;
  @override
  final num taxRateBps;
  @override
  final bool taxIncludedInPrice;
  @override
  final CheckoutPreviewItemStockDto stockAvailability;
  @override
  final num? unitSaleAmount;

  factory _$CheckoutPreviewItemResponseDto(
          [void Function(CheckoutPreviewItemResponseDtoBuilder)? updates]) =>
      (CheckoutPreviewItemResponseDtoBuilder()..update(updates))._build();

  _$CheckoutPreviewItemResponseDto._(
      {required this.variantId,
      required this.sku,
      required this.quantity,
      required this.currencyCode,
      required this.unitBaseAmount,
      required this.effectiveUnitAmount,
      required this.lineSubtotalAmount,
      required this.taxAmount,
      required this.taxRateBps,
      required this.taxIncludedInPrice,
      required this.stockAvailability,
      this.unitSaleAmount})
      : super._();
  @override
  CheckoutPreviewItemResponseDto rebuild(
          void Function(CheckoutPreviewItemResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutPreviewItemResponseDtoBuilder toBuilder() =>
      CheckoutPreviewItemResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutPreviewItemResponseDto &&
        variantId == other.variantId &&
        sku == other.sku &&
        quantity == other.quantity &&
        currencyCode == other.currencyCode &&
        unitBaseAmount == other.unitBaseAmount &&
        effectiveUnitAmount == other.effectiveUnitAmount &&
        lineSubtotalAmount == other.lineSubtotalAmount &&
        taxAmount == other.taxAmount &&
        taxRateBps == other.taxRateBps &&
        taxIncludedInPrice == other.taxIncludedInPrice &&
        stockAvailability == other.stockAvailability &&
        unitSaleAmount == other.unitSaleAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, unitBaseAmount.hashCode);
    _$hash = $jc(_$hash, effectiveUnitAmount.hashCode);
    _$hash = $jc(_$hash, lineSubtotalAmount.hashCode);
    _$hash = $jc(_$hash, taxAmount.hashCode);
    _$hash = $jc(_$hash, taxRateBps.hashCode);
    _$hash = $jc(_$hash, taxIncludedInPrice.hashCode);
    _$hash = $jc(_$hash, stockAvailability.hashCode);
    _$hash = $jc(_$hash, unitSaleAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckoutPreviewItemResponseDto')
          ..add('variantId', variantId)
          ..add('sku', sku)
          ..add('quantity', quantity)
          ..add('currencyCode', currencyCode)
          ..add('unitBaseAmount', unitBaseAmount)
          ..add('effectiveUnitAmount', effectiveUnitAmount)
          ..add('lineSubtotalAmount', lineSubtotalAmount)
          ..add('taxAmount', taxAmount)
          ..add('taxRateBps', taxRateBps)
          ..add('taxIncludedInPrice', taxIncludedInPrice)
          ..add('stockAvailability', stockAvailability)
          ..add('unitSaleAmount', unitSaleAmount))
        .toString();
  }
}

class CheckoutPreviewItemResponseDtoBuilder
    implements
        Builder<CheckoutPreviewItemResponseDto,
            CheckoutPreviewItemResponseDtoBuilder> {
  _$CheckoutPreviewItemResponseDto? _$v;

  String? _variantId;
  String? get variantId => _$this._variantId;
  set variantId(String? variantId) => _$this._variantId = variantId;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  num? _unitBaseAmount;
  num? get unitBaseAmount => _$this._unitBaseAmount;
  set unitBaseAmount(num? unitBaseAmount) =>
      _$this._unitBaseAmount = unitBaseAmount;

  num? _effectiveUnitAmount;
  num? get effectiveUnitAmount => _$this._effectiveUnitAmount;
  set effectiveUnitAmount(num? effectiveUnitAmount) =>
      _$this._effectiveUnitAmount = effectiveUnitAmount;

  num? _lineSubtotalAmount;
  num? get lineSubtotalAmount => _$this._lineSubtotalAmount;
  set lineSubtotalAmount(num? lineSubtotalAmount) =>
      _$this._lineSubtotalAmount = lineSubtotalAmount;

  num? _taxAmount;
  num? get taxAmount => _$this._taxAmount;
  set taxAmount(num? taxAmount) => _$this._taxAmount = taxAmount;

  num? _taxRateBps;
  num? get taxRateBps => _$this._taxRateBps;
  set taxRateBps(num? taxRateBps) => _$this._taxRateBps = taxRateBps;

  bool? _taxIncludedInPrice;
  bool? get taxIncludedInPrice => _$this._taxIncludedInPrice;
  set taxIncludedInPrice(bool? taxIncludedInPrice) =>
      _$this._taxIncludedInPrice = taxIncludedInPrice;

  CheckoutPreviewItemStockDtoBuilder? _stockAvailability;
  CheckoutPreviewItemStockDtoBuilder get stockAvailability =>
      _$this._stockAvailability ??= CheckoutPreviewItemStockDtoBuilder();
  set stockAvailability(
          CheckoutPreviewItemStockDtoBuilder? stockAvailability) =>
      _$this._stockAvailability = stockAvailability;

  num? _unitSaleAmount;
  num? get unitSaleAmount => _$this._unitSaleAmount;
  set unitSaleAmount(num? unitSaleAmount) =>
      _$this._unitSaleAmount = unitSaleAmount;

  CheckoutPreviewItemResponseDtoBuilder() {
    CheckoutPreviewItemResponseDto._defaults(this);
  }

  CheckoutPreviewItemResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _variantId = $v.variantId;
      _sku = $v.sku;
      _quantity = $v.quantity;
      _currencyCode = $v.currencyCode;
      _unitBaseAmount = $v.unitBaseAmount;
      _effectiveUnitAmount = $v.effectiveUnitAmount;
      _lineSubtotalAmount = $v.lineSubtotalAmount;
      _taxAmount = $v.taxAmount;
      _taxRateBps = $v.taxRateBps;
      _taxIncludedInPrice = $v.taxIncludedInPrice;
      _stockAvailability = $v.stockAvailability.toBuilder();
      _unitSaleAmount = $v.unitSaleAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutPreviewItemResponseDto other) {
    _$v = other as _$CheckoutPreviewItemResponseDto;
  }

  @override
  void update(void Function(CheckoutPreviewItemResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckoutPreviewItemResponseDto build() => _build();

  _$CheckoutPreviewItemResponseDto _build() {
    _$CheckoutPreviewItemResponseDto _$result;
    try {
      _$result = _$v ??
          _$CheckoutPreviewItemResponseDto._(
            variantId: BuiltValueNullFieldError.checkNotNull(
                variantId, r'CheckoutPreviewItemResponseDto', 'variantId'),
            sku: BuiltValueNullFieldError.checkNotNull(
                sku, r'CheckoutPreviewItemResponseDto', 'sku'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'CheckoutPreviewItemResponseDto', 'quantity'),
            currencyCode: BuiltValueNullFieldError.checkNotNull(currencyCode,
                r'CheckoutPreviewItemResponseDto', 'currencyCode'),
            unitBaseAmount: BuiltValueNullFieldError.checkNotNull(
                unitBaseAmount,
                r'CheckoutPreviewItemResponseDto',
                'unitBaseAmount'),
            effectiveUnitAmount: BuiltValueNullFieldError.checkNotNull(
                effectiveUnitAmount,
                r'CheckoutPreviewItemResponseDto',
                'effectiveUnitAmount'),
            lineSubtotalAmount: BuiltValueNullFieldError.checkNotNull(
                lineSubtotalAmount,
                r'CheckoutPreviewItemResponseDto',
                'lineSubtotalAmount'),
            taxAmount: BuiltValueNullFieldError.checkNotNull(
                taxAmount, r'CheckoutPreviewItemResponseDto', 'taxAmount'),
            taxRateBps: BuiltValueNullFieldError.checkNotNull(
                taxRateBps, r'CheckoutPreviewItemResponseDto', 'taxRateBps'),
            taxIncludedInPrice: BuiltValueNullFieldError.checkNotNull(
                taxIncludedInPrice,
                r'CheckoutPreviewItemResponseDto',
                'taxIncludedInPrice'),
            stockAvailability: stockAvailability.build(),
            unitSaleAmount: unitSaleAmount,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'stockAvailability';
        stockAvailability.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CheckoutPreviewItemResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
