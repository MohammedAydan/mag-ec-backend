// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_request_item_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReturnRequestItemResponseDto extends ReturnRequestItemResponseDto {
  @override
  final String id;
  @override
  final String orderLineId;
  @override
  final num quantity;
  @override
  final num receivedQuantity;
  @override
  final String requestedDisposition;
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
  final String? finalDisposition;
  @override
  final String? warehouseId;
  @override
  final String? reason;
  @override
  final String? conditionNotes;
  @override
  final String? restockedAt;

  factory _$ReturnRequestItemResponseDto(
          [void Function(ReturnRequestItemResponseDtoBuilder)? updates]) =>
      (ReturnRequestItemResponseDtoBuilder()..update(updates))._build();

  _$ReturnRequestItemResponseDto._(
      {required this.id,
      required this.orderLineId,
      required this.quantity,
      required this.receivedQuantity,
      required this.requestedDisposition,
      required this.productId,
      required this.variantId,
      required this.sku,
      required this.productName,
      required this.variantName,
      this.finalDisposition,
      this.warehouseId,
      this.reason,
      this.conditionNotes,
      this.restockedAt})
      : super._();
  @override
  ReturnRequestItemResponseDto rebuild(
          void Function(ReturnRequestItemResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReturnRequestItemResponseDtoBuilder toBuilder() =>
      ReturnRequestItemResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReturnRequestItemResponseDto &&
        id == other.id &&
        orderLineId == other.orderLineId &&
        quantity == other.quantity &&
        receivedQuantity == other.receivedQuantity &&
        requestedDisposition == other.requestedDisposition &&
        productId == other.productId &&
        variantId == other.variantId &&
        sku == other.sku &&
        productName == other.productName &&
        variantName == other.variantName &&
        finalDisposition == other.finalDisposition &&
        warehouseId == other.warehouseId &&
        reason == other.reason &&
        conditionNotes == other.conditionNotes &&
        restockedAt == other.restockedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, orderLineId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, receivedQuantity.hashCode);
    _$hash = $jc(_$hash, requestedDisposition.hashCode);
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, productName.hashCode);
    _$hash = $jc(_$hash, variantName.hashCode);
    _$hash = $jc(_$hash, finalDisposition.hashCode);
    _$hash = $jc(_$hash, warehouseId.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, conditionNotes.hashCode);
    _$hash = $jc(_$hash, restockedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReturnRequestItemResponseDto')
          ..add('id', id)
          ..add('orderLineId', orderLineId)
          ..add('quantity', quantity)
          ..add('receivedQuantity', receivedQuantity)
          ..add('requestedDisposition', requestedDisposition)
          ..add('productId', productId)
          ..add('variantId', variantId)
          ..add('sku', sku)
          ..add('productName', productName)
          ..add('variantName', variantName)
          ..add('finalDisposition', finalDisposition)
          ..add('warehouseId', warehouseId)
          ..add('reason', reason)
          ..add('conditionNotes', conditionNotes)
          ..add('restockedAt', restockedAt))
        .toString();
  }
}

class ReturnRequestItemResponseDtoBuilder
    implements
        Builder<ReturnRequestItemResponseDto,
            ReturnRequestItemResponseDtoBuilder> {
  _$ReturnRequestItemResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _orderLineId;
  String? get orderLineId => _$this._orderLineId;
  set orderLineId(String? orderLineId) => _$this._orderLineId = orderLineId;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

  num? _receivedQuantity;
  num? get receivedQuantity => _$this._receivedQuantity;
  set receivedQuantity(num? receivedQuantity) =>
      _$this._receivedQuantity = receivedQuantity;

  String? _requestedDisposition;
  String? get requestedDisposition => _$this._requestedDisposition;
  set requestedDisposition(String? requestedDisposition) =>
      _$this._requestedDisposition = requestedDisposition;

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

  String? _finalDisposition;
  String? get finalDisposition => _$this._finalDisposition;
  set finalDisposition(String? finalDisposition) =>
      _$this._finalDisposition = finalDisposition;

  String? _warehouseId;
  String? get warehouseId => _$this._warehouseId;
  set warehouseId(String? warehouseId) => _$this._warehouseId = warehouseId;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  String? _conditionNotes;
  String? get conditionNotes => _$this._conditionNotes;
  set conditionNotes(String? conditionNotes) =>
      _$this._conditionNotes = conditionNotes;

  String? _restockedAt;
  String? get restockedAt => _$this._restockedAt;
  set restockedAt(String? restockedAt) => _$this._restockedAt = restockedAt;

  ReturnRequestItemResponseDtoBuilder() {
    ReturnRequestItemResponseDto._defaults(this);
  }

  ReturnRequestItemResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _orderLineId = $v.orderLineId;
      _quantity = $v.quantity;
      _receivedQuantity = $v.receivedQuantity;
      _requestedDisposition = $v.requestedDisposition;
      _productId = $v.productId;
      _variantId = $v.variantId;
      _sku = $v.sku;
      _productName = $v.productName;
      _variantName = $v.variantName;
      _finalDisposition = $v.finalDisposition;
      _warehouseId = $v.warehouseId;
      _reason = $v.reason;
      _conditionNotes = $v.conditionNotes;
      _restockedAt = $v.restockedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReturnRequestItemResponseDto other) {
    _$v = other as _$ReturnRequestItemResponseDto;
  }

  @override
  void update(void Function(ReturnRequestItemResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReturnRequestItemResponseDto build() => _build();

  _$ReturnRequestItemResponseDto _build() {
    final _$result = _$v ??
        _$ReturnRequestItemResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ReturnRequestItemResponseDto', 'id'),
          orderLineId: BuiltValueNullFieldError.checkNotNull(
              orderLineId, r'ReturnRequestItemResponseDto', 'orderLineId'),
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'ReturnRequestItemResponseDto', 'quantity'),
          receivedQuantity: BuiltValueNullFieldError.checkNotNull(
              receivedQuantity,
              r'ReturnRequestItemResponseDto',
              'receivedQuantity'),
          requestedDisposition: BuiltValueNullFieldError.checkNotNull(
              requestedDisposition,
              r'ReturnRequestItemResponseDto',
              'requestedDisposition'),
          productId: BuiltValueNullFieldError.checkNotNull(
              productId, r'ReturnRequestItemResponseDto', 'productId'),
          variantId: BuiltValueNullFieldError.checkNotNull(
              variantId, r'ReturnRequestItemResponseDto', 'variantId'),
          sku: BuiltValueNullFieldError.checkNotNull(
              sku, r'ReturnRequestItemResponseDto', 'sku'),
          productName: BuiltValueNullFieldError.checkNotNull(
              productName, r'ReturnRequestItemResponseDto', 'productName'),
          variantName: BuiltValueNullFieldError.checkNotNull(
              variantName, r'ReturnRequestItemResponseDto', 'variantName'),
          finalDisposition: finalDisposition,
          warehouseId: warehouseId,
          reason: reason,
          conditionNotes: conditionNotes,
          restockedAt: restockedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
