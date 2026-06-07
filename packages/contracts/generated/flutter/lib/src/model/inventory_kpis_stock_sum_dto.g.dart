// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_kpis_stock_sum_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InventoryKpisStockSumDto extends InventoryKpisStockSumDto {
  @override
  final num? quantityOnHand;
  @override
  final num? quantityReserved;

  factory _$InventoryKpisStockSumDto(
          [void Function(InventoryKpisStockSumDtoBuilder)? updates]) =>
      (InventoryKpisStockSumDtoBuilder()..update(updates))._build();

  _$InventoryKpisStockSumDto._({this.quantityOnHand, this.quantityReserved})
      : super._();
  @override
  InventoryKpisStockSumDto rebuild(
          void Function(InventoryKpisStockSumDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InventoryKpisStockSumDtoBuilder toBuilder() =>
      InventoryKpisStockSumDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InventoryKpisStockSumDto &&
        quantityOnHand == other.quantityOnHand &&
        quantityReserved == other.quantityReserved;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, quantityOnHand.hashCode);
    _$hash = $jc(_$hash, quantityReserved.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InventoryKpisStockSumDto')
          ..add('quantityOnHand', quantityOnHand)
          ..add('quantityReserved', quantityReserved))
        .toString();
  }
}

class InventoryKpisStockSumDtoBuilder
    implements
        Builder<InventoryKpisStockSumDto, InventoryKpisStockSumDtoBuilder> {
  _$InventoryKpisStockSumDto? _$v;

  num? _quantityOnHand;
  num? get quantityOnHand => _$this._quantityOnHand;
  set quantityOnHand(num? quantityOnHand) =>
      _$this._quantityOnHand = quantityOnHand;

  num? _quantityReserved;
  num? get quantityReserved => _$this._quantityReserved;
  set quantityReserved(num? quantityReserved) =>
      _$this._quantityReserved = quantityReserved;

  InventoryKpisStockSumDtoBuilder() {
    InventoryKpisStockSumDto._defaults(this);
  }

  InventoryKpisStockSumDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _quantityOnHand = $v.quantityOnHand;
      _quantityReserved = $v.quantityReserved;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InventoryKpisStockSumDto other) {
    _$v = other as _$InventoryKpisStockSumDto;
  }

  @override
  void update(void Function(InventoryKpisStockSumDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InventoryKpisStockSumDto build() => _build();

  _$InventoryKpisStockSumDto _build() {
    final _$result = _$v ??
        _$InventoryKpisStockSumDto._(
          quantityOnHand: quantityOnHand,
          quantityReserved: quantityReserved,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
