// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_performance_sum_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PromotionPerformanceSumDto extends PromotionPerformanceSumDto {
  @override
  final num? discountAmount;

  factory _$PromotionPerformanceSumDto(
          [void Function(PromotionPerformanceSumDtoBuilder)? updates]) =>
      (PromotionPerformanceSumDtoBuilder()..update(updates))._build();

  _$PromotionPerformanceSumDto._({this.discountAmount}) : super._();
  @override
  PromotionPerformanceSumDto rebuild(
          void Function(PromotionPerformanceSumDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PromotionPerformanceSumDtoBuilder toBuilder() =>
      PromotionPerformanceSumDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PromotionPerformanceSumDto &&
        discountAmount == other.discountAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, discountAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PromotionPerformanceSumDto')
          ..add('discountAmount', discountAmount))
        .toString();
  }
}

class PromotionPerformanceSumDtoBuilder
    implements
        Builder<PromotionPerformanceSumDto, PromotionPerformanceSumDtoBuilder> {
  _$PromotionPerformanceSumDto? _$v;

  num? _discountAmount;
  num? get discountAmount => _$this._discountAmount;
  set discountAmount(num? discountAmount) =>
      _$this._discountAmount = discountAmount;

  PromotionPerformanceSumDtoBuilder() {
    PromotionPerformanceSumDto._defaults(this);
  }

  PromotionPerformanceSumDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _discountAmount = $v.discountAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PromotionPerformanceSumDto other) {
    _$v = other as _$PromotionPerformanceSumDto;
  }

  @override
  void update(void Function(PromotionPerformanceSumDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PromotionPerformanceSumDto build() => _build();

  _$PromotionPerformanceSumDto _build() {
    final _$result = _$v ??
        _$PromotionPerformanceSumDto._(
          discountAmount: discountAmount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
