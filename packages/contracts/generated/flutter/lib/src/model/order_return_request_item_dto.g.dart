// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_return_request_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrderReturnRequestItemDto extends OrderReturnRequestItemDto {
  @override
  final String id;
  @override
  final String orderLineId;
  @override
  final num quantity;
  @override
  final String requestedDisposition;
  @override
  final num receivedQuantity;
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

  factory _$OrderReturnRequestItemDto(
          [void Function(OrderReturnRequestItemDtoBuilder)? updates]) =>
      (OrderReturnRequestItemDtoBuilder()..update(updates))._build();

  _$OrderReturnRequestItemDto._(
      {required this.id,
      required this.orderLineId,
      required this.quantity,
      required this.requestedDisposition,
      required this.receivedQuantity,
      this.finalDisposition,
      this.warehouseId,
      this.reason,
      this.conditionNotes,
      this.restockedAt})
      : super._();
  @override
  OrderReturnRequestItemDto rebuild(
          void Function(OrderReturnRequestItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderReturnRequestItemDtoBuilder toBuilder() =>
      OrderReturnRequestItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderReturnRequestItemDto &&
        id == other.id &&
        orderLineId == other.orderLineId &&
        quantity == other.quantity &&
        requestedDisposition == other.requestedDisposition &&
        receivedQuantity == other.receivedQuantity &&
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
    _$hash = $jc(_$hash, requestedDisposition.hashCode);
    _$hash = $jc(_$hash, receivedQuantity.hashCode);
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
    return (newBuiltValueToStringHelper(r'OrderReturnRequestItemDto')
          ..add('id', id)
          ..add('orderLineId', orderLineId)
          ..add('quantity', quantity)
          ..add('requestedDisposition', requestedDisposition)
          ..add('receivedQuantity', receivedQuantity)
          ..add('finalDisposition', finalDisposition)
          ..add('warehouseId', warehouseId)
          ..add('reason', reason)
          ..add('conditionNotes', conditionNotes)
          ..add('restockedAt', restockedAt))
        .toString();
  }
}

class OrderReturnRequestItemDtoBuilder
    implements
        Builder<OrderReturnRequestItemDto, OrderReturnRequestItemDtoBuilder> {
  _$OrderReturnRequestItemDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _orderLineId;
  String? get orderLineId => _$this._orderLineId;
  set orderLineId(String? orderLineId) => _$this._orderLineId = orderLineId;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

  String? _requestedDisposition;
  String? get requestedDisposition => _$this._requestedDisposition;
  set requestedDisposition(String? requestedDisposition) =>
      _$this._requestedDisposition = requestedDisposition;

  num? _receivedQuantity;
  num? get receivedQuantity => _$this._receivedQuantity;
  set receivedQuantity(num? receivedQuantity) =>
      _$this._receivedQuantity = receivedQuantity;

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

  OrderReturnRequestItemDtoBuilder() {
    OrderReturnRequestItemDto._defaults(this);
  }

  OrderReturnRequestItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _orderLineId = $v.orderLineId;
      _quantity = $v.quantity;
      _requestedDisposition = $v.requestedDisposition;
      _receivedQuantity = $v.receivedQuantity;
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
  void replace(OrderReturnRequestItemDto other) {
    _$v = other as _$OrderReturnRequestItemDto;
  }

  @override
  void update(void Function(OrderReturnRequestItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderReturnRequestItemDto build() => _build();

  _$OrderReturnRequestItemDto _build() {
    final _$result = _$v ??
        _$OrderReturnRequestItemDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'OrderReturnRequestItemDto', 'id'),
          orderLineId: BuiltValueNullFieldError.checkNotNull(
              orderLineId, r'OrderReturnRequestItemDto', 'orderLineId'),
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'OrderReturnRequestItemDto', 'quantity'),
          requestedDisposition: BuiltValueNullFieldError.checkNotNull(
              requestedDisposition,
              r'OrderReturnRequestItemDto',
              'requestedDisposition'),
          receivedQuantity: BuiltValueNullFieldError.checkNotNull(
              receivedQuantity,
              r'OrderReturnRequestItemDto',
              'receivedQuantity'),
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
