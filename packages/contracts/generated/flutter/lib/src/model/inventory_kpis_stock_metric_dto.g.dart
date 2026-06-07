// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_kpis_stock_metric_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InventoryKpisStockMetricDto extends InventoryKpisStockMetricDto {
  @override
  final ReportingCountMetricDto count;
  @override
  final InventoryKpisStockSumDto sum;

  factory _$InventoryKpisStockMetricDto(
          [void Function(InventoryKpisStockMetricDtoBuilder)? updates]) =>
      (InventoryKpisStockMetricDtoBuilder()..update(updates))._build();

  _$InventoryKpisStockMetricDto._({required this.count, required this.sum})
      : super._();
  @override
  InventoryKpisStockMetricDto rebuild(
          void Function(InventoryKpisStockMetricDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InventoryKpisStockMetricDtoBuilder toBuilder() =>
      InventoryKpisStockMetricDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InventoryKpisStockMetricDto &&
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
    return (newBuiltValueToStringHelper(r'InventoryKpisStockMetricDto')
          ..add('count', count)
          ..add('sum', sum))
        .toString();
  }
}

class InventoryKpisStockMetricDtoBuilder
    implements
        Builder<InventoryKpisStockMetricDto,
            InventoryKpisStockMetricDtoBuilder> {
  _$InventoryKpisStockMetricDto? _$v;

  ReportingCountMetricDtoBuilder? _count;
  ReportingCountMetricDtoBuilder get count =>
      _$this._count ??= ReportingCountMetricDtoBuilder();
  set count(ReportingCountMetricDtoBuilder? count) => _$this._count = count;

  InventoryKpisStockSumDtoBuilder? _sum;
  InventoryKpisStockSumDtoBuilder get sum =>
      _$this._sum ??= InventoryKpisStockSumDtoBuilder();
  set sum(InventoryKpisStockSumDtoBuilder? sum) => _$this._sum = sum;

  InventoryKpisStockMetricDtoBuilder() {
    InventoryKpisStockMetricDto._defaults(this);
  }

  InventoryKpisStockMetricDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count.toBuilder();
      _sum = $v.sum.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InventoryKpisStockMetricDto other) {
    _$v = other as _$InventoryKpisStockMetricDto;
  }

  @override
  void update(void Function(InventoryKpisStockMetricDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InventoryKpisStockMetricDto build() => _build();

  _$InventoryKpisStockMetricDto _build() {
    _$InventoryKpisStockMetricDto _$result;
    try {
      _$result = _$v ??
          _$InventoryKpisStockMetricDto._(
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
            r'InventoryKpisStockMetricDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
