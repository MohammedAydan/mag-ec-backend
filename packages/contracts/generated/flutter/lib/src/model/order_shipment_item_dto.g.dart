// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_shipment_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrderShipmentItemDto extends OrderShipmentItemDto {
  @override
  final String id;
  @override
  final String orderLineId;
  @override
  final num quantity;

  factory _$OrderShipmentItemDto(
          [void Function(OrderShipmentItemDtoBuilder)? updates]) =>
      (OrderShipmentItemDtoBuilder()..update(updates))._build();

  _$OrderShipmentItemDto._(
      {required this.id, required this.orderLineId, required this.quantity})
      : super._();
  @override
  OrderShipmentItemDto rebuild(
          void Function(OrderShipmentItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderShipmentItemDtoBuilder toBuilder() =>
      OrderShipmentItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderShipmentItemDto &&
        id == other.id &&
        orderLineId == other.orderLineId &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, orderLineId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderShipmentItemDto')
          ..add('id', id)
          ..add('orderLineId', orderLineId)
          ..add('quantity', quantity))
        .toString();
  }
}

class OrderShipmentItemDtoBuilder
    implements Builder<OrderShipmentItemDto, OrderShipmentItemDtoBuilder> {
  _$OrderShipmentItemDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _orderLineId;
  String? get orderLineId => _$this._orderLineId;
  set orderLineId(String? orderLineId) => _$this._orderLineId = orderLineId;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

  OrderShipmentItemDtoBuilder() {
    OrderShipmentItemDto._defaults(this);
  }

  OrderShipmentItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _orderLineId = $v.orderLineId;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderShipmentItemDto other) {
    _$v = other as _$OrderShipmentItemDto;
  }

  @override
  void update(void Function(OrderShipmentItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderShipmentItemDto build() => _build();

  _$OrderShipmentItemDto _build() {
    final _$result = _$v ??
        _$OrderShipmentItemDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'OrderShipmentItemDto', 'id'),
          orderLineId: BuiltValueNullFieldError.checkNotNull(
              orderLineId, r'OrderShipmentItemDto', 'orderLineId'),
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'OrderShipmentItemDto', 'quantity'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
