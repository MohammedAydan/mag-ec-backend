// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_order_line_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReviewOrderLineDto extends ReviewOrderLineDto {
  @override
  final String id;
  @override
  final String orderId;
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

  factory _$ReviewOrderLineDto(
          [void Function(ReviewOrderLineDtoBuilder)? updates]) =>
      (ReviewOrderLineDtoBuilder()..update(updates))._build();

  _$ReviewOrderLineDto._(
      {required this.id,
      required this.orderId,
      required this.productId,
      required this.variantId,
      required this.sku,
      required this.productName,
      required this.variantName,
      required this.quantity})
      : super._();
  @override
  ReviewOrderLineDto rebuild(
          void Function(ReviewOrderLineDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewOrderLineDtoBuilder toBuilder() =>
      ReviewOrderLineDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewOrderLineDto &&
        id == other.id &&
        orderId == other.orderId &&
        productId == other.productId &&
        variantId == other.variantId &&
        sku == other.sku &&
        productName == other.productName &&
        variantName == other.variantName &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, orderId.hashCode);
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, productName.hashCode);
    _$hash = $jc(_$hash, variantName.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewOrderLineDto')
          ..add('id', id)
          ..add('orderId', orderId)
          ..add('productId', productId)
          ..add('variantId', variantId)
          ..add('sku', sku)
          ..add('productName', productName)
          ..add('variantName', variantName)
          ..add('quantity', quantity))
        .toString();
  }
}

class ReviewOrderLineDtoBuilder
    implements Builder<ReviewOrderLineDto, ReviewOrderLineDtoBuilder> {
  _$ReviewOrderLineDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _orderId;
  String? get orderId => _$this._orderId;
  set orderId(String? orderId) => _$this._orderId = orderId;

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

  ReviewOrderLineDtoBuilder() {
    ReviewOrderLineDto._defaults(this);
  }

  ReviewOrderLineDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _orderId = $v.orderId;
      _productId = $v.productId;
      _variantId = $v.variantId;
      _sku = $v.sku;
      _productName = $v.productName;
      _variantName = $v.variantName;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewOrderLineDto other) {
    _$v = other as _$ReviewOrderLineDto;
  }

  @override
  void update(void Function(ReviewOrderLineDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewOrderLineDto build() => _build();

  _$ReviewOrderLineDto _build() {
    final _$result = _$v ??
        _$ReviewOrderLineDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ReviewOrderLineDto', 'id'),
          orderId: BuiltValueNullFieldError.checkNotNull(
              orderId, r'ReviewOrderLineDto', 'orderId'),
          productId: BuiltValueNullFieldError.checkNotNull(
              productId, r'ReviewOrderLineDto', 'productId'),
          variantId: BuiltValueNullFieldError.checkNotNull(
              variantId, r'ReviewOrderLineDto', 'variantId'),
          sku: BuiltValueNullFieldError.checkNotNull(
              sku, r'ReviewOrderLineDto', 'sku'),
          productName: BuiltValueNullFieldError.checkNotNull(
              productName, r'ReviewOrderLineDto', 'productName'),
          variantName: BuiltValueNullFieldError.checkNotNull(
              variantName, r'ReviewOrderLineDto', 'variantName'),
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'ReviewOrderLineDto', 'quantity'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
