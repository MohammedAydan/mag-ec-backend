// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_line_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrderLineItemDto extends OrderLineItemDto {
  @override
  final String id;
  @override
  final String productId;
  @override
  final String variantId;
  @override
  final String sku;
  @override
  final String productName;
  @override
  final String variantName;
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
  final num? unitSaleAmount;

  factory _$OrderLineItemDto(
          [void Function(OrderLineItemDtoBuilder)? updates]) =>
      (OrderLineItemDtoBuilder()..update(updates))._build();

  _$OrderLineItemDto._(
      {required this.id,
      required this.productId,
      required this.variantId,
      required this.sku,
      required this.productName,
      required this.variantName,
      required this.quantity,
      required this.currencyCode,
      required this.unitBaseAmount,
      required this.effectiveUnitAmount,
      required this.lineSubtotalAmount,
      required this.taxAmount,
      this.unitSaleAmount})
      : super._();
  @override
  OrderLineItemDto rebuild(void Function(OrderLineItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderLineItemDtoBuilder toBuilder() =>
      OrderLineItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderLineItemDto &&
        id == other.id &&
        productId == other.productId &&
        variantId == other.variantId &&
        sku == other.sku &&
        productName == other.productName &&
        variantName == other.variantName &&
        quantity == other.quantity &&
        currencyCode == other.currencyCode &&
        unitBaseAmount == other.unitBaseAmount &&
        effectiveUnitAmount == other.effectiveUnitAmount &&
        lineSubtotalAmount == other.lineSubtotalAmount &&
        taxAmount == other.taxAmount &&
        unitSaleAmount == other.unitSaleAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, productName.hashCode);
    _$hash = $jc(_$hash, variantName.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, unitBaseAmount.hashCode);
    _$hash = $jc(_$hash, effectiveUnitAmount.hashCode);
    _$hash = $jc(_$hash, lineSubtotalAmount.hashCode);
    _$hash = $jc(_$hash, taxAmount.hashCode);
    _$hash = $jc(_$hash, unitSaleAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderLineItemDto')
          ..add('id', id)
          ..add('productId', productId)
          ..add('variantId', variantId)
          ..add('sku', sku)
          ..add('productName', productName)
          ..add('variantName', variantName)
          ..add('quantity', quantity)
          ..add('currencyCode', currencyCode)
          ..add('unitBaseAmount', unitBaseAmount)
          ..add('effectiveUnitAmount', effectiveUnitAmount)
          ..add('lineSubtotalAmount', lineSubtotalAmount)
          ..add('taxAmount', taxAmount)
          ..add('unitSaleAmount', unitSaleAmount))
        .toString();
  }
}

class OrderLineItemDtoBuilder
    implements Builder<OrderLineItemDto, OrderLineItemDtoBuilder> {
  _$OrderLineItemDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _productId;
  String? get productId => _$this._productId;
  set productId(String? productId) => _$this._productId = productId;

  String? _variantId;
  String? get variantId => _$this._variantId;
  set variantId(String? variantId) => _$this._variantId = variantId;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  String? _productName;
  String? get productName => _$this._productName;
  set productName(String? productName) => _$this._productName = productName;

  String? _variantName;
  String? get variantName => _$this._variantName;
  set variantName(String? variantName) => _$this._variantName = variantName;

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

  num? _unitSaleAmount;
  num? get unitSaleAmount => _$this._unitSaleAmount;
  set unitSaleAmount(num? unitSaleAmount) =>
      _$this._unitSaleAmount = unitSaleAmount;

  OrderLineItemDtoBuilder() {
    OrderLineItemDto._defaults(this);
  }

  OrderLineItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _productId = $v.productId;
      _variantId = $v.variantId;
      _sku = $v.sku;
      _productName = $v.productName;
      _variantName = $v.variantName;
      _quantity = $v.quantity;
      _currencyCode = $v.currencyCode;
      _unitBaseAmount = $v.unitBaseAmount;
      _effectiveUnitAmount = $v.effectiveUnitAmount;
      _lineSubtotalAmount = $v.lineSubtotalAmount;
      _taxAmount = $v.taxAmount;
      _unitSaleAmount = $v.unitSaleAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderLineItemDto other) {
    _$v = other as _$OrderLineItemDto;
  }

  @override
  void update(void Function(OrderLineItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderLineItemDto build() => _build();

  _$OrderLineItemDto _build() {
    final _$result = _$v ??
        _$OrderLineItemDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'OrderLineItemDto', 'id'),
          productId: BuiltValueNullFieldError.checkNotNull(
              productId, r'OrderLineItemDto', 'productId'),
          variantId: BuiltValueNullFieldError.checkNotNull(
              variantId, r'OrderLineItemDto', 'variantId'),
          sku: BuiltValueNullFieldError.checkNotNull(
              sku, r'OrderLineItemDto', 'sku'),
          productName: BuiltValueNullFieldError.checkNotNull(
              productName, r'OrderLineItemDto', 'productName'),
          variantName: BuiltValueNullFieldError.checkNotNull(
              variantName, r'OrderLineItemDto', 'variantName'),
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'OrderLineItemDto', 'quantity'),
          currencyCode: BuiltValueNullFieldError.checkNotNull(
              currencyCode, r'OrderLineItemDto', 'currencyCode'),
          unitBaseAmount: BuiltValueNullFieldError.checkNotNull(
              unitBaseAmount, r'OrderLineItemDto', 'unitBaseAmount'),
          effectiveUnitAmount: BuiltValueNullFieldError.checkNotNull(
              effectiveUnitAmount, r'OrderLineItemDto', 'effectiveUnitAmount'),
          lineSubtotalAmount: BuiltValueNullFieldError.checkNotNull(
              lineSubtotalAmount, r'OrderLineItemDto', 'lineSubtotalAmount'),
          taxAmount: BuiltValueNullFieldError.checkNotNull(
              taxAmount, r'OrderLineItemDto', 'taxAmount'),
          unitSaleAmount: unitSaleAmount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
