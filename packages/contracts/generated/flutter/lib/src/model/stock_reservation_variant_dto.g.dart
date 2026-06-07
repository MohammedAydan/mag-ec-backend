// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_reservation_variant_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StockReservationVariantDto extends StockReservationVariantDto {
  @override
  final String id;
  @override
  final String sku;

  factory _$StockReservationVariantDto(
          [void Function(StockReservationVariantDtoBuilder)? updates]) =>
      (StockReservationVariantDtoBuilder()..update(updates))._build();

  _$StockReservationVariantDto._({required this.id, required this.sku})
      : super._();
  @override
  StockReservationVariantDto rebuild(
          void Function(StockReservationVariantDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockReservationVariantDtoBuilder toBuilder() =>
      StockReservationVariantDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockReservationVariantDto &&
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
    return (newBuiltValueToStringHelper(r'StockReservationVariantDto')
          ..add('id', id)
          ..add('sku', sku))
        .toString();
  }
}

class StockReservationVariantDtoBuilder
    implements
        Builder<StockReservationVariantDto, StockReservationVariantDtoBuilder> {
  _$StockReservationVariantDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  StockReservationVariantDtoBuilder() {
    StockReservationVariantDto._defaults(this);
  }

  StockReservationVariantDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _sku = $v.sku;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StockReservationVariantDto other) {
    _$v = other as _$StockReservationVariantDto;
  }

  @override
  void update(void Function(StockReservationVariantDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockReservationVariantDto build() => _build();

  _$StockReservationVariantDto _build() {
    final _$result = _$v ??
        _$StockReservationVariantDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'StockReservationVariantDto', 'id'),
          sku: BuiltValueNullFieldError.checkNotNull(
              sku, r'StockReservationVariantDto', 'sku'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
