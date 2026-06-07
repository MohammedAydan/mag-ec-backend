// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fulfillment_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FulfillmentItemDto extends FulfillmentItemDto {
  @override
  final String id;
  @override
  final String orderLineId;
  @override
  final num quantity;
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

  factory _$FulfillmentItemDto(
          [void Function(FulfillmentItemDtoBuilder)? updates]) =>
      (FulfillmentItemDtoBuilder()..update(updates))._build();

  _$FulfillmentItemDto._(
      {required this.id,
      required this.orderLineId,
      required this.quantity,
      required this.productId,
      required this.variantId,
      required this.sku,
      required this.productName,
      required this.variantName})
      : super._();
  @override
  FulfillmentItemDto rebuild(
          void Function(FulfillmentItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FulfillmentItemDtoBuilder toBuilder() =>
      FulfillmentItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FulfillmentItemDto &&
        id == other.id &&
        orderLineId == other.orderLineId &&
        quantity == other.quantity &&
        productId == other.productId &&
        variantId == other.variantId &&
        sku == other.sku &&
        productName == other.productName &&
        variantName == other.variantName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, orderLineId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, productName.hashCode);
    _$hash = $jc(_$hash, variantName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FulfillmentItemDto')
          ..add('id', id)
          ..add('orderLineId', orderLineId)
          ..add('quantity', quantity)
          ..add('productId', productId)
          ..add('variantId', variantId)
          ..add('sku', sku)
          ..add('productName', productName)
          ..add('variantName', variantName))
        .toString();
  }
}

class FulfillmentItemDtoBuilder
    implements Builder<FulfillmentItemDto, FulfillmentItemDtoBuilder> {
  _$FulfillmentItemDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _orderLineId;
  String? get orderLineId => _$this._orderLineId;
  set orderLineId(String? orderLineId) => _$this._orderLineId = orderLineId;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

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

  FulfillmentItemDtoBuilder() {
    FulfillmentItemDto._defaults(this);
  }

  FulfillmentItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _orderLineId = $v.orderLineId;
      _quantity = $v.quantity;
      _productId = $v.productId;
      _variantId = $v.variantId;
      _sku = $v.sku;
      _productName = $v.productName;
      _variantName = $v.variantName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FulfillmentItemDto other) {
    _$v = other as _$FulfillmentItemDto;
  }

  @override
  void update(void Function(FulfillmentItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FulfillmentItemDto build() => _build();

  _$FulfillmentItemDto _build() {
    final _$result = _$v ??
        _$FulfillmentItemDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'FulfillmentItemDto', 'id'),
          orderLineId: BuiltValueNullFieldError.checkNotNull(
              orderLineId, r'FulfillmentItemDto', 'orderLineId'),
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'FulfillmentItemDto', 'quantity'),
          productId: BuiltValueNullFieldError.checkNotNull(
              productId, r'FulfillmentItemDto', 'productId'),
          variantId: BuiltValueNullFieldError.checkNotNull(
              variantId, r'FulfillmentItemDto', 'variantId'),
          sku: BuiltValueNullFieldError.checkNotNull(
              sku, r'FulfillmentItemDto', 'sku'),
          productName: BuiltValueNullFieldError.checkNotNull(
              productName, r'FulfillmentItemDto', 'productName'),
          variantName: BuiltValueNullFieldError.checkNotNull(
              variantName, r'FulfillmentItemDto', 'variantName'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
