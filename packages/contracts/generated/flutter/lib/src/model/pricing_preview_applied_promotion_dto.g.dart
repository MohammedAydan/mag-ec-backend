// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_preview_applied_promotion_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PricingPreviewAppliedPromotionDto
    extends PricingPreviewAppliedPromotionDto {
  @override
  final String key;
  @override
  final String name;
  @override
  final num subtotalDiscountAmount;
  @override
  final bool freeShipping;

  factory _$PricingPreviewAppliedPromotionDto(
          [void Function(PricingPreviewAppliedPromotionDtoBuilder)? updates]) =>
      (PricingPreviewAppliedPromotionDtoBuilder()..update(updates))._build();

  _$PricingPreviewAppliedPromotionDto._(
      {required this.key,
      required this.name,
      required this.subtotalDiscountAmount,
      required this.freeShipping})
      : super._();
  @override
  PricingPreviewAppliedPromotionDto rebuild(
          void Function(PricingPreviewAppliedPromotionDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PricingPreviewAppliedPromotionDtoBuilder toBuilder() =>
      PricingPreviewAppliedPromotionDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PricingPreviewAppliedPromotionDto &&
        key == other.key &&
        name == other.name &&
        subtotalDiscountAmount == other.subtotalDiscountAmount &&
        freeShipping == other.freeShipping;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, subtotalDiscountAmount.hashCode);
    _$hash = $jc(_$hash, freeShipping.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PricingPreviewAppliedPromotionDto')
          ..add('key', key)
          ..add('name', name)
          ..add('subtotalDiscountAmount', subtotalDiscountAmount)
          ..add('freeShipping', freeShipping))
        .toString();
  }
}

class PricingPreviewAppliedPromotionDtoBuilder
    implements
        Builder<PricingPreviewAppliedPromotionDto,
            PricingPreviewAppliedPromotionDtoBuilder> {
  _$PricingPreviewAppliedPromotionDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  num? _subtotalDiscountAmount;
  num? get subtotalDiscountAmount => _$this._subtotalDiscountAmount;
  set subtotalDiscountAmount(num? subtotalDiscountAmount) =>
      _$this._subtotalDiscountAmount = subtotalDiscountAmount;

  bool? _freeShipping;
  bool? get freeShipping => _$this._freeShipping;
  set freeShipping(bool? freeShipping) => _$this._freeShipping = freeShipping;

  PricingPreviewAppliedPromotionDtoBuilder() {
    PricingPreviewAppliedPromotionDto._defaults(this);
  }

  PricingPreviewAppliedPromotionDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _name = $v.name;
      _subtotalDiscountAmount = $v.subtotalDiscountAmount;
      _freeShipping = $v.freeShipping;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PricingPreviewAppliedPromotionDto other) {
    _$v = other as _$PricingPreviewAppliedPromotionDto;
  }

  @override
  void update(
      void Function(PricingPreviewAppliedPromotionDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PricingPreviewAppliedPromotionDto build() => _build();

  _$PricingPreviewAppliedPromotionDto _build() {
    final _$result = _$v ??
        _$PricingPreviewAppliedPromotionDto._(
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'PricingPreviewAppliedPromotionDto', 'key'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'PricingPreviewAppliedPromotionDto', 'name'),
          subtotalDiscountAmount: BuiltValueNullFieldError.checkNotNull(
              subtotalDiscountAmount,
              r'PricingPreviewAppliedPromotionDto',
              'subtotalDiscountAmount'),
          freeShipping: BuiltValueNullFieldError.checkNotNull(freeShipping,
              r'PricingPreviewAppliedPromotionDto', 'freeShipping'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
