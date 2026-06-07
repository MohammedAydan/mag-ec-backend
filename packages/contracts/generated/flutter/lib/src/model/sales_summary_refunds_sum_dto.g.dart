// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_summary_refunds_sum_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SalesSummaryRefundsSumDto extends SalesSummaryRefundsSumDto {
  @override
  final num? amount;

  factory _$SalesSummaryRefundsSumDto(
          [void Function(SalesSummaryRefundsSumDtoBuilder)? updates]) =>
      (SalesSummaryRefundsSumDtoBuilder()..update(updates))._build();

  _$SalesSummaryRefundsSumDto._({this.amount}) : super._();
  @override
  SalesSummaryRefundsSumDto rebuild(
          void Function(SalesSummaryRefundsSumDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SalesSummaryRefundsSumDtoBuilder toBuilder() =>
      SalesSummaryRefundsSumDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SalesSummaryRefundsSumDto && amount == other.amount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SalesSummaryRefundsSumDto')
          ..add('amount', amount))
        .toString();
  }
}

class SalesSummaryRefundsSumDtoBuilder
    implements
        Builder<SalesSummaryRefundsSumDto, SalesSummaryRefundsSumDtoBuilder> {
  _$SalesSummaryRefundsSumDto? _$v;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

  SalesSummaryRefundsSumDtoBuilder() {
    SalesSummaryRefundsSumDto._defaults(this);
  }

  SalesSummaryRefundsSumDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SalesSummaryRefundsSumDto other) {
    _$v = other as _$SalesSummaryRefundsSumDto;
  }

  @override
  void update(void Function(SalesSummaryRefundsSumDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SalesSummaryRefundsSumDto build() => _build();

  _$SalesSummaryRefundsSumDto _build() {
    final _$result = _$v ??
        _$SalesSummaryRefundsSumDto._(
          amount: amount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
