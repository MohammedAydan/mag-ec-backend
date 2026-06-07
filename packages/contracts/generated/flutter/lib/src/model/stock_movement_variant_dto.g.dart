// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_movement_variant_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StockMovementVariantDto extends StockMovementVariantDto {
  @override
  final String id;
  @override
  final String sku;

  factory _$StockMovementVariantDto(
          [void Function(StockMovementVariantDtoBuilder)? updates]) =>
      (StockMovementVariantDtoBuilder()..update(updates))._build();

  _$StockMovementVariantDto._({required this.id, required this.sku})
      : super._();
  @override
  StockMovementVariantDto rebuild(
          void Function(StockMovementVariantDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockMovementVariantDtoBuilder toBuilder() =>
      StockMovementVariantDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockMovementVariantDto &&
        id == other.id &&
        sku == other.sku;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StockMovementVariantDto')
          ..add('id', id)
          ..add('sku', sku))
        .toString();
  }
}

class StockMovementVariantDtoBuilder
    implements
        Builder<StockMovementVariantDto, StockMovementVariantDtoBuilder> {
  _$StockMovementVariantDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  StockMovementVariantDtoBuilder() {
    StockMovementVariantDto._defaults(this);
  }

  StockMovementVariantDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _sku = $v.sku;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StockMovementVariantDto other) {
    _$v = other as _$StockMovementVariantDto;
  }

  @override
  void update(void Function(StockMovementVariantDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockMovementVariantDto build() => _build();

  _$StockMovementVariantDto _build() {
    final _$result = _$v ??
        _$StockMovementVariantDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'StockMovementVariantDto', 'id'),
          sku: BuiltValueNullFieldError.checkNotNull(
              sku, r'StockMovementVariantDto', 'sku'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
