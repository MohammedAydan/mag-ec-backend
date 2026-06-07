// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_level_warehouse_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StockLevelWarehouseDto extends StockLevelWarehouseDto {
  @override
  final String id;
  @override
  final String key;
  @override
  final String name;

  factory _$StockLevelWarehouseDto(
          [void Function(StockLevelWarehouseDtoBuilder)? updates]) =>
      (StockLevelWarehouseDtoBuilder()..update(updates))._build();

  _$StockLevelWarehouseDto._(
      {required this.id, required this.key, required this.name})
      : super._();
  @override
  StockLevelWarehouseDto rebuild(
          void Function(StockLevelWarehouseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockLevelWarehouseDtoBuilder toBuilder() =>
      StockLevelWarehouseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockLevelWarehouseDto &&
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
    return (newBuiltValueToStringHelper(r'StockLevelWarehouseDto')
          ..add('id', id)
          ..add('key', key)
          ..add('name', name))
        .toString();
  }
}

class StockLevelWarehouseDtoBuilder
    implements Builder<StockLevelWarehouseDto, StockLevelWarehouseDtoBuilder> {
  _$StockLevelWarehouseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  StockLevelWarehouseDtoBuilder() {
    StockLevelWarehouseDto._defaults(this);
  }

  StockLevelWarehouseDtoBuilder get _$this {
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
  void replace(StockLevelWarehouseDto other) {
    _$v = other as _$StockLevelWarehouseDto;
  }

  @override
  void update(void Function(StockLevelWarehouseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockLevelWarehouseDto build() => _build();

  _$StockLevelWarehouseDto _build() {
    final _$result = _$v ??
        _$StockLevelWarehouseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'StockLevelWarehouseDto', 'id'),
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'StockLevelWarehouseDto', 'key'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'StockLevelWarehouseDto', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
