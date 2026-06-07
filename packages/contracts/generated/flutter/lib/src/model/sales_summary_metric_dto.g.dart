// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_summary_metric_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SalesSummaryMetricDto extends SalesSummaryMetricDto {
  @override
  final ReportingCountMetricDto count;
  @override
  final SalesSummaryAmountSumDto sum;

  factory _$SalesSummaryMetricDto(
          [void Function(SalesSummaryMetricDtoBuilder)? updates]) =>
      (SalesSummaryMetricDtoBuilder()..update(updates))._build();

  _$SalesSummaryMetricDto._({required this.count, required this.sum})
      : super._();
  @override
  SalesSummaryMetricDto rebuild(
          void Function(SalesSummaryMetricDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SalesSummaryMetricDtoBuilder toBuilder() =>
      SalesSummaryMetricDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SalesSummaryMetricDto &&
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
    return (newBuiltValueToStringHelper(r'SalesSummaryMetricDto')
          ..add('count', count)
          ..add('sum', sum))
        .toString();
  }
}

class SalesSummaryMetricDtoBuilder
    implements Builder<SalesSummaryMetricDto, SalesSummaryMetricDtoBuilder> {
  _$SalesSummaryMetricDto? _$v;

  ReportingCountMetricDtoBuilder? _count;
  ReportingCountMetricDtoBuilder get count =>
      _$this._count ??= ReportingCountMetricDtoBuilder();
  set count(ReportingCountMetricDtoBuilder? count) => _$this._count = count;

  SalesSummaryAmountSumDtoBuilder? _sum;
  SalesSummaryAmountSumDtoBuilder get sum =>
      _$this._sum ??= SalesSummaryAmountSumDtoBuilder();
  set sum(SalesSummaryAmountSumDtoBuilder? sum) => _$this._sum = sum;

  SalesSummaryMetricDtoBuilder() {
    SalesSummaryMetricDto._defaults(this);
  }

  SalesSummaryMetricDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count.toBuilder();
      _sum = $v.sum.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SalesSummaryMetricDto other) {
    _$v = other as _$SalesSummaryMetricDto;
  }

  @override
  void update(void Function(SalesSummaryMetricDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SalesSummaryMetricDto build() => _build();

  _$SalesSummaryMetricDto _build() {
    _$SalesSummaryMetricDto _$result;
    try {
      _$result = _$v ??
          _$SalesSummaryMetricDto._(
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
            r'SalesSummaryMetricDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
