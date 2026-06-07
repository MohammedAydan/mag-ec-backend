// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reporting_count_metric_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReportingCountMetricDto extends ReportingCountMetricDto {
  @override
  final num all;

  factory _$ReportingCountMetricDto(
          [void Function(ReportingCountMetricDtoBuilder)? updates]) =>
      (ReportingCountMetricDtoBuilder()..update(updates))._build();

  _$ReportingCountMetricDto._({required this.all}) : super._();
  @override
  ReportingCountMetricDto rebuild(
          void Function(ReportingCountMetricDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportingCountMetricDtoBuilder toBuilder() =>
      ReportingCountMetricDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportingCountMetricDto && all == other.all;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, all.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportingCountMetricDto')
          ..add('all', all))
        .toString();
  }
}

class ReportingCountMetricDtoBuilder
    implements
        Builder<ReportingCountMetricDto, ReportingCountMetricDtoBuilder> {
  _$ReportingCountMetricDto? _$v;

  num? _all;
  num? get all => _$this._all;
  set all(num? all) => _$this._all = all;

  ReportingCountMetricDtoBuilder() {
    ReportingCountMetricDto._defaults(this);
  }

  ReportingCountMetricDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _all = $v.all;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportingCountMetricDto other) {
    _$v = other as _$ReportingCountMetricDto;
  }

  @override
  void update(void Function(ReportingCountMetricDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportingCountMetricDto build() => _build();

  _$ReportingCountMetricDto _build() {
    final _$result = _$v ??
        _$ReportingCountMetricDto._(
          all: BuiltValueNullFieldError.checkNotNull(
              all, r'ReportingCountMetricDto', 'all'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
