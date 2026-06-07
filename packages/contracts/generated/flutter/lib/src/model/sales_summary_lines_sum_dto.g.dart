// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_summary_lines_sum_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SalesSummaryLinesSumDto extends SalesSummaryLinesSumDto {
  @override
  final num? quantity;
  @override
  final num? lineSubtotalAmount;
  @override
  final num? taxAmount;

  factory _$SalesSummaryLinesSumDto(
          [void Function(SalesSummaryLinesSumDtoBuilder)? updates]) =>
      (SalesSummaryLinesSumDtoBuilder()..update(updates))._build();

  _$SalesSummaryLinesSumDto._(
      {this.quantity, this.lineSubtotalAmount, this.taxAmount})
      : super._();
  @override
  SalesSummaryLinesSumDto rebuild(
          void Function(SalesSummaryLinesSumDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SalesSummaryLinesSumDtoBuilder toBuilder() =>
      SalesSummaryLinesSumDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SalesSummaryLinesSumDto &&
        quantity == other.quantity &&
        lineSubtotalAmount == other.lineSubtotalAmount &&
        taxAmount == other.taxAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, lineSubtotalAmount.hashCode);
    _$hash = $jc(_$hash, taxAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SalesSummaryLinesSumDto')
          ..add('quantity', quantity)
          ..add('lineSubtotalAmount', lineSubtotalAmount)
          ..add('taxAmount', taxAmount))
        .toString();
  }
}

class SalesSummaryLinesSumDtoBuilder
    implements
        Builder<SalesSummaryLinesSumDto, SalesSummaryLinesSumDtoBuilder> {
  _$SalesSummaryLinesSumDto? _$v;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

  num? _lineSubtotalAmount;
  num? get lineSubtotalAmount => _$this._lineSubtotalAmount;
  set lineSubtotalAmount(num? lineSubtotalAmount) =>
      _$this._lineSubtotalAmount = lineSubtotalAmount;

  num? _taxAmount;
  num? get taxAmount => _$this._taxAmount;
  set taxAmount(num? taxAmount) => _$this._taxAmount = taxAmount;

  SalesSummaryLinesSumDtoBuilder() {
    SalesSummaryLinesSumDto._defaults(this);
  }

  SalesSummaryLinesSumDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _quantity = $v.quantity;
      _lineSubtotalAmount = $v.lineSubtotalAmount;
      _taxAmount = $v.taxAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SalesSummaryLinesSumDto other) {
    _$v = other as _$SalesSummaryLinesSumDto;
  }

  @override
  void update(void Function(SalesSummaryLinesSumDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SalesSummaryLinesSumDto build() => _build();

  _$SalesSummaryLinesSumDto _build() {
    final _$result = _$v ??
        _$SalesSummaryLinesSumDto._(
          quantity: quantity,
          lineSubtotalAmount: lineSubtotalAmount,
          taxAmount: taxAmount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
