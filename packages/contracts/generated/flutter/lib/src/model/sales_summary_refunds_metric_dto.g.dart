// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_summary_refunds_metric_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SalesSummaryRefundsMetricDto extends SalesSummaryRefundsMetricDto {
  @override
  final ReportingCountMetricDto count;
  @override
  final SalesSummaryRefundsSumDto sum;

  factory _$SalesSummaryRefundsMetricDto(
          [void Function(SalesSummaryRefundsMetricDtoBuilder)? updates]) =>
      (SalesSummaryRefundsMetricDtoBuilder()..update(updates))._build();

  _$SalesSummaryRefundsMetricDto._({required this.count, required this.sum})
      : super._();
  @override
  SalesSummaryRefundsMetricDto rebuild(
          void Function(SalesSummaryRefundsMetricDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SalesSummaryRefundsMetricDtoBuilder toBuilder() =>
      SalesSummaryRefundsMetricDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SalesSummaryRefundsMetricDto &&
        count == other.count &&
        sum == other.sum;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, sum.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SalesSummaryRefundsMetricDto')
          ..add('count', count)
          ..add('sum', sum))
        .toString();
  }
}

class SalesSummaryRefundsMetricDtoBuilder
    implements
        Builder<SalesSummaryRefundsMetricDto,
            SalesSummaryRefundsMetricDtoBuilder> {
  _$SalesSummaryRefundsMetricDto? _$v;

  ReportingCountMetricDtoBuilder? _count;
  ReportingCountMetricDtoBuilder get count =>
      _$this._count ??= ReportingCountMetricDtoBuilder();
  set count(ReportingCountMetricDtoBuilder? count) => _$this._count = count;

  SalesSummaryRefundsSumDtoBuilder? _sum;
  SalesSummaryRefundsSumDtoBuilder get sum =>
      _$this._sum ??= SalesSummaryRefundsSumDtoBuilder();
  set sum(SalesSummaryRefundsSumDtoBuilder? sum) => _$this._sum = sum;

  SalesSummaryRefundsMetricDtoBuilder() {
    SalesSummaryRefundsMetricDto._defaults(this);
  }

  SalesSummaryRefundsMetricDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count.toBuilder();
      _sum = $v.sum.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SalesSummaryRefundsMetricDto other) {
    _$v = other as _$SalesSummaryRefundsMetricDto;
  }

  @override
  void update(void Function(SalesSummaryRefundsMetricDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SalesSummaryRefundsMetricDto build() => _build();

  _$SalesSummaryRefundsMetricDto _build() {
    _$SalesSummaryRefundsMetricDto _$result;
    try {
      _$result = _$v ??
          _$SalesSummaryRefundsMetricDto._(
            count: count.build(),
            sum: sum.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'count';
        count.build();
        _$failedField = 'sum';
        sum.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'SalesSummaryRefundsMetricDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
