// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_summary_amount_sum_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SalesSummaryAmountSumDto extends SalesSummaryAmountSumDto {
  @override
  final num? grandTotalAmount;
  @override
  final num? subtotalAmount;
  @override
  final num? taxAmount;
  @override
  final num? shippingAmount;

  factory _$SalesSummaryAmountSumDto(
          [void Function(SalesSummaryAmountSumDtoBuilder)? updates]) =>
      (SalesSummaryAmountSumDtoBuilder()..update(updates))._build();

  _$SalesSummaryAmountSumDto._(
      {this.grandTotalAmount,
      this.subtotalAmount,
      this.taxAmount,
      this.shippingAmount})
      : super._();
  @override
  SalesSummaryAmountSumDto rebuild(
          void Function(SalesSummaryAmountSumDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SalesSummaryAmountSumDtoBuilder toBuilder() =>
      SalesSummaryAmountSumDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SalesSummaryAmountSumDto &&
        grandTotalAmount == other.grandTotalAmount &&
        subtotalAmount == other.subtotalAmount &&
        taxAmount == other.taxAmount &&
        shippingAmount == other.shippingAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, grandTotalAmount.hashCode);
    _$hash = $jc(_$hash, subtotalAmount.hashCode);
    _$hash = $jc(_$hash, taxAmount.hashCode);
    _$hash = $jc(_$hash, shippingAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SalesSummaryAmountSumDto')
          ..add('grandTotalAmount', grandTotalAmount)
          ..add('subtotalAmount', subtotalAmount)
          ..add('taxAmount', taxAmount)
          ..add('shippingAmount', shippingAmount))
        .toString();
  }
}

class SalesSummaryAmountSumDtoBuilder
    implements
        Builder<SalesSummaryAmountSumDto, SalesSummaryAmountSumDtoBuilder> {
  _$SalesSummaryAmountSumDto? _$v;

  num? _grandTotalAmount;
  num? get grandTotalAmount => _$this._grandTotalAmount;
  set grandTotalAmount(num? grandTotalAmount) =>
      _$this._grandTotalAmount = grandTotalAmount;

  num? _subtotalAmount;
  num? get subtotalAmount => _$this._subtotalAmount;
  set subtotalAmount(num? subtotalAmount) =>
      _$this._subtotalAmount = subtotalAmount;

  num? _taxAmount;
  num? get taxAmount => _$this._taxAmount;
  set taxAmount(num? taxAmount) => _$this._taxAmount = taxAmount;

  num? _shippingAmount;
  num? get shippingAmount => _$this._shippingAmount;
  set shippingAmount(num? shippingAmount) =>
      _$this._shippingAmount = shippingAmount;

  SalesSummaryAmountSumDtoBuilder() {
    SalesSummaryAmountSumDto._defaults(this);
  }

  SalesSummaryAmountSumDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _grandTotalAmount = $v.grandTotalAmount;
      _subtotalAmount = $v.subtotalAmount;
      _taxAmount = $v.taxAmount;
      _shippingAmount = $v.shippingAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SalesSummaryAmountSumDto other) {
    _$v = other as _$SalesSummaryAmountSumDto;
  }

  @override
  void update(void Function(SalesSummaryAmountSumDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SalesSummaryAmountSumDto build() => _build();

  _$SalesSummaryAmountSumDto _build() {
    final _$result = _$v ??
        _$SalesSummaryAmountSumDto._(
          grandTotalAmount: grandTotalAmount,
          subtotalAmount: subtotalAmount,
          taxAmount: taxAmount,
          shippingAmount: shippingAmount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
