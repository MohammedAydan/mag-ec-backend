// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_summary_lines_metric_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SalesSummaryLinesMetricDto extends SalesSummaryLinesMetricDto {
  @override
  final ReportingCountMetricDto count;
  @override
  final SalesSummaryLinesSumDto sum;

  factory _$SalesSummaryLinesMetricDto(
          [void Function(SalesSummaryLinesMetricDtoBuilder)? updates]) =>
      (SalesSummaryLinesMetricDtoBuilder()..update(updates))._build();

  _$SalesSummaryLinesMetricDto._({required this.count, required this.sum})
      : super._();
  @override
  SalesSummaryLinesMetricDto rebuild(
          void Function(SalesSummaryLinesMetricDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SalesSummaryLinesMetricDtoBuilder toBuilder() =>
      SalesSummaryLinesMetricDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SalesSummaryLinesMetricDto &&
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
    return (newBuiltValueToStringHelper(r'SalesSummaryLinesMetricDto')
          ..add('count', count)
          ..add('sum', sum))
        .toString();
  }
}

class SalesSummaryLinesMetricDtoBuilder
    implements
        Builder<SalesSummaryLinesMetricDto, SalesSummaryLinesMetricDtoBuilder> {
  _$SalesSummaryLinesMetricDto? _$v;

  ReportingCountMetricDtoBuilder? _count;
  ReportingCountMetricDtoBuilder get count =>
      _$this._count ??= ReportingCountMetricDtoBuilder();
  set count(ReportingCountMetricDtoBuilder? count) => _$this._count = count;

  SalesSummaryLinesSumDtoBuilder? _sum;
  SalesSummaryLinesSumDtoBuilder get sum =>
      _$this._sum ??= SalesSummaryLinesSumDtoBuilder();
  set sum(SalesSummaryLinesSumDtoBuilder? sum) => _$this._sum = sum;

  SalesSummaryLinesMetricDtoBuilder() {
    SalesSummaryLinesMetricDto._defaults(this);
  }

  SalesSummaryLinesMetricDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count.toBuilder();
      _sum = $v.sum.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SalesSummaryLinesMetricDto other) {
    _$v = other as _$SalesSummaryLinesMetricDto;
  }

  @override
  void update(void Function(SalesSummaryLinesMetricDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SalesSummaryLinesMetricDto build() => _build();

  _$SalesSummaryLinesMetricDto _build() {
    _$SalesSummaryLinesMetricDto _$result;
    try {
      _$result = _$v ??
          _$SalesSummaryLinesMetricDto._(
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
            r'SalesSummaryLinesMetricDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
