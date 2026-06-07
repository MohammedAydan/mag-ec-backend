// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_summary_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SalesSummaryResponseDto extends SalesSummaryResponseDto {
  @override
  final SalesSummaryMetricDto orders;
  @override
  final SalesSummaryLinesMetricDto orderLines;
  @override
  final SalesSummaryRefundsMetricDto refunds;

  factory _$SalesSummaryResponseDto(
          [void Function(SalesSummaryResponseDtoBuilder)? updates]) =>
      (SalesSummaryResponseDtoBuilder()..update(updates))._build();

  _$SalesSummaryResponseDto._(
      {required this.orders, required this.orderLines, required this.refunds})
      : super._();
  @override
  SalesSummaryResponseDto rebuild(
          void Function(SalesSummaryResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SalesSummaryResponseDtoBuilder toBuilder() =>
      SalesSummaryResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SalesSummaryResponseDto &&
        orders == other.orders &&
        orderLines == other.orderLines &&
        refunds == other.refunds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, orders.hashCode);
    _$hash = $jc(_$hash, orderLines.hashCode);
    _$hash = $jc(_$hash, refunds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SalesSummaryResponseDto')
          ..add('orders', orders)
          ..add('orderLines', orderLines)
          ..add('refunds', refunds))
        .toString();
  }
}

class SalesSummaryResponseDtoBuilder
    implements
        Builder<SalesSummaryResponseDto, SalesSummaryResponseDtoBuilder> {
  _$SalesSummaryResponseDto? _$v;

  SalesSummaryMetricDtoBuilder? _orders;
  SalesSummaryMetricDtoBuilder get orders =>
      _$this._orders ??= SalesSummaryMetricDtoBuilder();
  set orders(SalesSummaryMetricDtoBuilder? orders) => _$this._orders = orders;

  SalesSummaryLinesMetricDtoBuilder? _orderLines;
  SalesSummaryLinesMetricDtoBuilder get orderLines =>
      _$this._orderLines ??= SalesSummaryLinesMetricDtoBuilder();
  set orderLines(SalesSummaryLinesMetricDtoBuilder? orderLines) =>
      _$this._orderLines = orderLines;

  SalesSummaryRefundsMetricDtoBuilder? _refunds;
  SalesSummaryRefundsMetricDtoBuilder get refunds =>
      _$this._refunds ??= SalesSummaryRefundsMetricDtoBuilder();
  set refunds(SalesSummaryRefundsMetricDtoBuilder? refunds) =>
      _$this._refunds = refunds;

  SalesSummaryResponseDtoBuilder() {
    SalesSummaryResponseDto._defaults(this);
  }

  SalesSummaryResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orders = $v.orders.toBuilder();
      _orderLines = $v.orderLines.toBuilder();
      _refunds = $v.refunds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SalesSummaryResponseDto other) {
    _$v = other as _$SalesSummaryResponseDto;
  }

  @override
  void update(void Function(SalesSummaryResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SalesSummaryResponseDto build() => _build();

  _$SalesSummaryResponseDto _build() {
    _$SalesSummaryResponseDto _$result;
    try {
      _$result = _$v ??
          _$SalesSummaryResponseDto._(
            orders: orders.build(),
            orderLines: orderLines.build(),
            refunds: refunds.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'orders';
        orders.build();
        _$failedField = 'orderLines';
        orderLines.build();
        _$failedField = 'refunds';
        refunds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SalesSummaryResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
