// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_level_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StockLevelResponseDto extends StockLevelResponseDto {
  @override
  final String warehouseId;
  @override
  final String variantId;
  @override
  final num quantityAvailable;
  @override
  final num quantityReserved;
  @override
  final num quantityIncoming;
  @override
  final StockLevelWarehouseDto warehouse;
  @override
  final StockLevelVariantDto variant;

  factory _$StockLevelResponseDto(
          [void Function(StockLevelResponseDtoBuilder)? updates]) =>
      (StockLevelResponseDtoBuilder()..update(updates))._build();

  _$StockLevelResponseDto._(
      {required this.warehouseId,
      required this.variantId,
      required this.quantityAvailable,
      required this.quantityReserved,
      required this.quantityIncoming,
      required this.warehouse,
      required this.variant})
      : super._();
  @override
  StockLevelResponseDto rebuild(
          void Function(StockLevelResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockLevelResponseDtoBuilder toBuilder() =>
      StockLevelResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockLevelResponseDto &&
        warehouseId == other.warehouseId &&
        variantId == other.variantId &&
        quantityAvailable == other.quantityAvailable &&
        quantityReserved == other.quantityReserved &&
        quantityIncoming == other.quantityIncoming &&
        warehouse == other.warehouse &&
        variant == other.variant;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, warehouseId.hashCode);
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, quantityAvailable.hashCode);
    _$hash = $jc(_$hash, quantityReserved.hashCode);
    _$hash = $jc(_$hash, quantityIncoming.hashCode);
    _$hash = $jc(_$hash, warehouse.hashCode);
    _$hash = $jc(_$hash, variant.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StockLevelResponseDto')
          ..add('warehouseId', warehouseId)
          ..add('variantId', variantId)
          ..add('quantityAvailable', quantityAvailable)
          ..add('quantityReserved', quantityReserved)
          ..add('quantityIncoming', quantityIncoming)
          ..add('warehouse', warehouse)
          ..add('variant', variant))
        .toString();
  }
}

class StockLevelResponseDtoBuilder
    implements Builder<StockLevelResponseDto, StockLevelResponseDtoBuilder> {
  _$StockLevelResponseDto? _$v;

  String? _warehouseId;
  String? get warehouseId => _$this._warehouseId;
  set warehouseId(String? warehouseId) => _$this._warehouseId = warehouseId;

  String? _variantId;
  String? get variantId => _$this._variantId;
  set variantId(String? variantId) => _$this._variantId = variantId;

  num? _quantityAvailable;
  num? get quantityAvailable => _$this._quantityAvailable;
  set quantityAvailable(num? quantityAvailable) =>
      _$this._quantityAvailable = quantityAvailable;

  num? _quantityReserved;
  num? get quantityReserved => _$this._quantityReserved;
  set quantityReserved(num? quantityReserved) =>
      _$this._quantityReserved = quantityReserved;

  num? _quantityIncoming;
  num? get quantityIncoming => _$this._quantityIncoming;
  set quantityIncoming(num? quantityIncoming) =>
      _$this._quantityIncoming = quantityIncoming;

  StockLevelWarehouseDtoBuilder? _warehouse;
  StockLevelWarehouseDtoBuilder get warehouse =>
      _$this._warehouse ??= StockLevelWarehouseDtoBuilder();
  set warehouse(StockLevelWarehouseDtoBuilder? warehouse) =>
      _$this._warehouse = warehouse;

  StockLevelVariantDtoBuilder? _variant;
  StockLevelVariantDtoBuilder get variant =>
      _$this._variant ??= StockLevelVariantDtoBuilder();
  set variant(StockLevelVariantDtoBuilder? variant) =>
      _$this._variant = variant;

  StockLevelResponseDtoBuilder() {
    StockLevelResponseDto._defaults(this);
  }

  StockLevelResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _warehouseId = $v.warehouseId;
      _variantId = $v.variantId;
      _quantityAvailable = $v.quantityAvailable;
      _quantityReserved = $v.quantityReserved;
      _quantityIncoming = $v.quantityIncoming;
      _warehouse = $v.warehouse.toBuilder();
      _variant = $v.variant.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StockLevelResponseDto other) {
    _$v = other as _$StockLevelResponseDto;
  }

  @override
  void update(void Function(StockLevelResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockLevelResponseDto build() => _build();

  _$StockLevelResponseDto _build() {
    _$StockLevelResponseDto _$result;
    try {
      _$result = _$v ??
          _$StockLevelResponseDto._(
            warehouseId: BuiltValueNullFieldError.checkNotNull(
                warehouseId, r'StockLevelResponseDto', 'warehouseId'),
            variantId: BuiltValueNullFieldError.checkNotNull(
                variantId, r'StockLevelResponseDto', 'variantId'),
            quantityAvailable: BuiltValueNullFieldError.checkNotNull(
                quantityAvailable,
                r'StockLevelResponseDto',
                'quantityAvailable'),
            quantityReserved: BuiltValueNullFieldError.checkNotNull(
                quantityReserved, r'StockLevelResponseDto', 'quantityReserved'),
            quantityIncoming: BuiltValueNullFieldError.checkNotNull(
                quantityIncoming, r'StockLevelResponseDto', 'quantityIncoming'),
            warehouse: warehouse.build(),
            variant: variant.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'warehouse';
        warehouse.build();
        _$failedField = 'variant';
        variant.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'StockLevelResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
