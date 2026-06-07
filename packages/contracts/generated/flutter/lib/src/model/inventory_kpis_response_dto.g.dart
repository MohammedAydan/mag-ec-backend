// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_kpis_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InventoryKpisResponseDto extends InventoryKpisResponseDto {
  @override
  final InventoryKpisStockMetricDto stock;
  @override
  final num warehouses;

  factory _$InventoryKpisResponseDto(
          [void Function(InventoryKpisResponseDtoBuilder)? updates]) =>
      (InventoryKpisResponseDtoBuilder()..update(updates))._build();

  _$InventoryKpisResponseDto._({required this.stock, required this.warehouses})
      : super._();
  @override
  InventoryKpisResponseDto rebuild(
          void Function(InventoryKpisResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InventoryKpisResponseDtoBuilder toBuilder() =>
      InventoryKpisResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InventoryKpisResponseDto &&
        stock == other.stock &&
        warehouses == other.warehouses;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, stock.hashCode);
    _$hash = $jc(_$hash, warehouses.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InventoryKpisResponseDto')
          ..add('stock', stock)
          ..add('warehouses', warehouses))
        .toString();
  }
}

class InventoryKpisResponseDtoBuilder
    implements
        Builder<InventoryKpisResponseDto, InventoryKpisResponseDtoBuilder> {
  _$InventoryKpisResponseDto? _$v;

  InventoryKpisStockMetricDtoBuilder? _stock;
  InventoryKpisStockMetricDtoBuilder get stock =>
      _$this._stock ??= InventoryKpisStockMetricDtoBuilder();
  set stock(InventoryKpisStockMetricDtoBuilder? stock) => _$this._stock = stock;

  num? _warehouses;
  num? get warehouses => _$this._warehouses;
  set warehouses(num? warehouses) => _$this._warehouses = warehouses;

  InventoryKpisResponseDtoBuilder() {
    InventoryKpisResponseDto._defaults(this);
  }

  InventoryKpisResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stock = $v.stock.toBuilder();
      _warehouses = $v.warehouses;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InventoryKpisResponseDto other) {
    _$v = other as _$InventoryKpisResponseDto;
  }

  @override
  void update(void Function(InventoryKpisResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InventoryKpisResponseDto build() => _build();

  _$InventoryKpisResponseDto _build() {
    _$InventoryKpisResponseDto _$result;
    try {
      _$result = _$v ??
          _$InventoryKpisResponseDto._(
            stock: stock.build(),
            warehouses: BuiltValueNullFieldError.checkNotNull(
                warehouses, r'InventoryKpisResponseDto', 'warehouses'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'stock';
        stock.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'InventoryKpisResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
