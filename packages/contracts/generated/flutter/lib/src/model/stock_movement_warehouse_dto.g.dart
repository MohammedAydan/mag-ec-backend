// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_movement_warehouse_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StockMovementWarehouseDto extends StockMovementWarehouseDto {
  @override
  final String id;
  @override
  final String key;
  @override
  final String name;

  factory _$StockMovementWarehouseDto(
          [void Function(StockMovementWarehouseDtoBuilder)? updates]) =>
      (StockMovementWarehouseDtoBuilder()..update(updates))._build();

  _$StockMovementWarehouseDto._(
      {required this.id, required this.key, required this.name})
      : super._();
  @override
  StockMovementWarehouseDto rebuild(
          void Function(StockMovementWarehouseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockMovementWarehouseDtoBuilder toBuilder() =>
      StockMovementWarehouseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockMovementWarehouseDto &&
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
    return (newBuiltValueToStringHelper(r'StockMovementWarehouseDto')
          ..add('id', id)
          ..add('key', key)
          ..add('name', name))
        .toString();
  }
}

class StockMovementWarehouseDtoBuilder
    implements
        Builder<StockMovementWarehouseDto, StockMovementWarehouseDtoBuilder> {
  _$StockMovementWarehouseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  StockMovementWarehouseDtoBuilder() {
    StockMovementWarehouseDto._defaults(this);
  }

  StockMovementWarehouseDtoBuilder get _$this {
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
  void replace(StockMovementWarehouseDto other) {
    _$v = other as _$StockMovementWarehouseDto;
  }

  @override
  void update(void Function(StockMovementWarehouseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockMovementWarehouseDto build() => _build();

  _$StockMovementWarehouseDto _build() {
    final _$result = _$v ??
        _$StockMovementWarehouseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'StockMovementWarehouseDto', 'id'),
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'StockMovementWarehouseDto', 'key'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'StockMovementWarehouseDto', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
