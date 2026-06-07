// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_performance_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PromotionPerformanceDto extends PromotionPerformanceDto {
  @override
  final String promotionId;
  @override
  final String key;
  @override
  final String name;
  @override
  final String source_;
  @override
  final ReportingCountMetricDto count;
  @override
  final PromotionPerformanceSumDto sum;

  factory _$PromotionPerformanceDto(
          [void Function(PromotionPerformanceDtoBuilder)? updates]) =>
      (PromotionPerformanceDtoBuilder()..update(updates))._build();

  _$PromotionPerformanceDto._(
      {required this.promotionId,
      required this.key,
      required this.name,
      required this.source_,
      required this.count,
      required this.sum})
      : super._();
  @override
  PromotionPerformanceDto rebuild(
          void Function(PromotionPerformanceDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PromotionPerformanceDtoBuilder toBuilder() =>
      PromotionPerformanceDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PromotionPerformanceDto &&
        promotionId == other.promotionId &&
        key == other.key &&
        name == other.name &&
        source_ == other.source_ &&
        count == other.count &&
        sum == other.sum;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, promotionId.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, source_.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, sum.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PromotionPerformanceDto')
          ..add('promotionId', promotionId)
          ..add('key', key)
          ..add('name', name)
          ..add('source_', source_)
          ..add('count', count)
          ..add('sum', sum))
        .toString();
  }
}

class PromotionPerformanceDtoBuilder
    implements
        Builder<PromotionPerformanceDto, PromotionPerformanceDtoBuilder> {
  _$PromotionPerformanceDto? _$v;

  String? _promotionId;
  String? get promotionId => _$this._promotionId;
  set promotionId(String? promotionId) => _$this._promotionId = promotionId;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _source_;
  String? get source_ => _$this._source_;
  set source_(String? source_) => _$this._source_ = source_;

  ReportingCountMetricDtoBuilder? _count;
  ReportingCountMetricDtoBuilder get count =>
      _$this._count ??= ReportingCountMetricDtoBuilder();
  set count(ReportingCountMetricDtoBuilder? count) => _$this._count = count;

  PromotionPerformanceSumDtoBuilder? _sum;
  PromotionPerformanceSumDtoBuilder get sum =>
      _$this._sum ??= PromotionPerformanceSumDtoBuilder();
  set sum(PromotionPerformanceSumDtoBuilder? sum) => _$this._sum = sum;

  PromotionPerformanceDtoBuilder() {
    PromotionPerformanceDto._defaults(this);
  }

  PromotionPerformanceDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _promotionId = $v.promotionId;
      _key = $v.key;
      _name = $v.name;
      _source_ = $v.source_;
      _count = $v.count.toBuilder();
      _sum = $v.sum.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PromotionPerformanceDto other) {
    _$v = other as _$PromotionPerformanceDto;
  }

  @override
  void update(void Function(PromotionPerformanceDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PromotionPerformanceDto build() => _build();

  _$PromotionPerformanceDto _build() {
    _$PromotionPerformanceDto _$result;
    try {
      _$result = _$v ??
          _$PromotionPerformanceDto._(
            promotionId: BuiltValueNullFieldError.checkNotNull(
                promotionId, r'PromotionPerformanceDto', 'promotionId'),
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'PromotionPerformanceDto', 'key'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'PromotionPerformanceDto', 'name'),
            source_: BuiltValueNullFieldError.checkNotNull(
                source_, r'PromotionPerformanceDto', 'source_'),
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
            r'PromotionPerformanceDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
