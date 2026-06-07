// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_product_sum_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TopProductSumDto extends TopProductSumDto {
  @override
  final num? quantity;
  @override
  final num? lineSubtotalAmount;

  factory _$TopProductSumDto(
          [void Function(TopProductSumDtoBuilder)? updates]) =>
      (TopProductSumDtoBuilder()..update(updates))._build();

  _$TopProductSumDto._({this.quantity, this.lineSubtotalAmount}) : super._();
  @override
  TopProductSumDto rebuild(void Function(TopProductSumDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TopProductSumDtoBuilder toBuilder() =>
      TopProductSumDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TopProductSumDto &&
        quantity == other.quantity &&
        lineSubtotalAmount == other.lineSubtotalAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, lineSubtotalAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TopProductSumDto')
          ..add('quantity', quantity)
          ..add('lineSubtotalAmount', lineSubtotalAmount))
        .toString();
  }
}

class TopProductSumDtoBuilder
    implements Builder<TopProductSumDto, TopProductSumDtoBuilder> {
  _$TopProductSumDto? _$v;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

  num? _lineSubtotalAmount;
  num? get lineSubtotalAmount => _$this._lineSubtotalAmount;
  set lineSubtotalAmount(num? lineSubtotalAmount) =>
      _$this._lineSubtotalAmount = lineSubtotalAmount;

  TopProductSumDtoBuilder() {
    TopProductSumDto._defaults(this);
  }

  TopProductSumDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _quantity = $v.quantity;
      _lineSubtotalAmount = $v.lineSubtotalAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TopProductSumDto other) {
    _$v = other as _$TopProductSumDto;
  }

  @override
  void update(void Function(TopProductSumDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TopProductSumDto build() => _build();

  _$TopProductSumDto _build() {
    final _$result = _$v ??
        _$TopProductSumDto._(
          quantity: quantity,
          lineSubtotalAmount: lineSubtotalAmount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
