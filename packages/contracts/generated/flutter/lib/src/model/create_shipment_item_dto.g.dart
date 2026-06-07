// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_shipment_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateShipmentItemDto extends CreateShipmentItemDto {
  @override
  final String orderLineId;
  @override
  final num quantity;

  factory _$CreateShipmentItemDto(
          [void Function(CreateShipmentItemDtoBuilder)? updates]) =>
      (CreateShipmentItemDtoBuilder()..update(updates))._build();

  _$CreateShipmentItemDto._({required this.orderLineId, required this.quantity})
      : super._();
  @override
  CreateShipmentItemDto rebuild(
          void Function(CreateShipmentItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateShipmentItemDtoBuilder toBuilder() =>
      CreateShipmentItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateShipmentItemDto &&
        orderLineId == other.orderLineId &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, orderLineId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateShipmentItemDto')
          ..add('orderLineId', orderLineId)
          ..add('quantity', quantity))
        .toString();
  }
}

class CreateShipmentItemDtoBuilder
    implements Builder<CreateShipmentItemDto, CreateShipmentItemDtoBuilder> {
  _$CreateShipmentItemDto? _$v;

  String? _orderLineId;
  String? get orderLineId => _$this._orderLineId;
  set orderLineId(String? orderLineId) => _$this._orderLineId = orderLineId;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

  CreateShipmentItemDtoBuilder() {
    CreateShipmentItemDto._defaults(this);
  }

  CreateShipmentItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderLineId = $v.orderLineId;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateShipmentItemDto other) {
    _$v = other as _$CreateShipmentItemDto;
  }

  @override
  void update(void Function(CreateShipmentItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateShipmentItemDto build() => _build();

  _$CreateShipmentItemDto _build() {
    final _$result = _$v ??
        _$CreateShipmentItemDto._(
          orderLineId: BuiltValueNullFieldError.checkNotNull(
              orderLineId, r'CreateShipmentItemDto', 'orderLineId'),
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'CreateShipmentItemDto', 'quantity'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
