// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_reservation_warehouse_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StockReservationWarehouseDto extends StockReservationWarehouseDto {
  @override
  final String id;
  @override
  final String key;
  @override
  final String name;

  factory _$StockReservationWarehouseDto(
          [void Function(StockReservationWarehouseDtoBuilder)? updates]) =>
      (StockReservationWarehouseDtoBuilder()..update(updates))._build();

  _$StockReservationWarehouseDto._(
      {required this.id, required this.key, required this.name})
      : super._();
  @override
  StockReservationWarehouseDto rebuild(
          void Function(StockReservationWarehouseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockReservationWarehouseDtoBuilder toBuilder() =>
      StockReservationWarehouseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockReservationWarehouseDto &&
        id == other.id &&
        key == other.key &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StockReservationWarehouseDto')
          ..add('id', id)
          ..add('key', key)
          ..add('name', name))
        .toString();
  }
}

class StockReservationWarehouseDtoBuilder
    implements
        Builder<StockReservationWarehouseDto,
            StockReservationWarehouseDtoBuilder> {
  _$StockReservationWarehouseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  StockReservationWarehouseDtoBuilder() {
    StockReservationWarehouseDto._defaults(this);
  }

  StockReservationWarehouseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StockReservationWarehouseDto other) {
    _$v = other as _$StockReservationWarehouseDto;
  }

  @override
  void update(void Function(StockReservationWarehouseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockReservationWarehouseDto build() => _build();

  _$StockReservationWarehouseDto _build() {
    final _$result = _$v ??
        _$StockReservationWarehouseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'StockReservationWarehouseDto', 'id'),
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'StockReservationWarehouseDto', 'key'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'StockReservationWarehouseDto', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
