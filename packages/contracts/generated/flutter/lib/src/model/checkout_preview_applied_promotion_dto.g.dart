// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_preview_applied_promotion_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckoutPreviewAppliedPromotionDto
    extends CheckoutPreviewAppliedPromotionDto {
  @override
  final String promotionId;
  @override
  final String key;
  @override
  final String name;
  @override
  final String rewardType;
  @override
  final num discountAmount;
  @override
  final bool freeShipping;
  @override
  final String source_;
  @override
  final String? couponCode;

  factory _$CheckoutPreviewAppliedPromotionDto(
          [void Function(CheckoutPreviewAppliedPromotionDtoBuilder)?
              updates]) =>
      (CheckoutPreviewAppliedPromotionDtoBuilder()..update(updates))._build();

  _$CheckoutPreviewAppliedPromotionDto._(
      {required this.promotionId,
      required this.key,
      required this.name,
      required this.rewardType,
      required this.discountAmount,
      required this.freeShipping,
      required this.source_,
      this.couponCode})
      : super._();
  @override
  CheckoutPreviewAppliedPromotionDto rebuild(
          void Function(CheckoutPreviewAppliedPromotionDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutPreviewAppliedPromotionDtoBuilder toBuilder() =>
      CheckoutPreviewAppliedPromotionDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutPreviewAppliedPromotionDto &&
        promotionId == other.promotionId &&
        key == other.key &&
        name == other.name &&
        rewardType == other.rewardType &&
        discountAmount == other.discountAmount &&
        freeShipping == other.freeShipping &&
        source_ == other.source_ &&
        couponCode == other.couponCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, promotionId.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, rewardType.hashCode);
    _$hash = $jc(_$hash, discountAmount.hashCode);
    _$hash = $jc(_$hash, freeShipping.hashCode);
    _$hash = $jc(_$hash, source_.hashCode);
    _$hash = $jc(_$hash, couponCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckoutPreviewAppliedPromotionDto')
          ..add('promotionId', promotionId)
          ..add('key', key)
          ..add('name', name)
          ..add('rewardType', rewardType)
          ..add('discountAmount', discountAmount)
          ..add('freeShipping', freeShipping)
          ..add('source_', source_)
          ..add('couponCode', couponCode))
        .toString();
  }
}

class CheckoutPreviewAppliedPromotionDtoBuilder
    implements
        Builder<CheckoutPreviewAppliedPromotionDto,
            CheckoutPreviewAppliedPromotionDtoBuilder> {
  _$CheckoutPreviewAppliedPromotionDto? _$v;

  String? _promotionId;
  String? get promotionId => _$this._promotionId;
  set promotionId(String? promotionId) => _$this._promotionId = promotionId;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _rewardType;
  String? get rewardType => _$this._rewardType;
  set rewardType(String? rewardType) => _$this._rewardType = rewardType;

  num? _discountAmount;
  num? get discountAmount => _$this._discountAmount;
  set discountAmount(num? discountAmount) =>
      _$this._discountAmount = discountAmount;

  bool? _freeShipping;
  bool? get freeShipping => _$this._freeShipping;
  set freeShipping(bool? freeShipping) => _$this._freeShipping = freeShipping;

  String? _source_;
  String? get source_ => _$this._source_;
  set source_(String? source_) => _$this._source_ = source_;

  String? _couponCode;
  String? get couponCode => _$this._couponCode;
  set couponCode(String? couponCode) => _$this._couponCode = couponCode;

  CheckoutPreviewAppliedPromotionDtoBuilder() {
    CheckoutPreviewAppliedPromotionDto._defaults(this);
  }

  CheckoutPreviewAppliedPromotionDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _promotionId = $v.promotionId;
      _key = $v.key;
      _name = $v.name;
      _rewardType = $v.rewardType;
      _discountAmount = $v.discountAmount;
      _freeShipping = $v.freeShipping;
      _source_ = $v.source_;
      _couponCode = $v.couponCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutPreviewAppliedPromotionDto other) {
    _$v = other as _$CheckoutPreviewAppliedPromotionDto;
  }

  @override
  void update(
      void Function(CheckoutPreviewAppliedPromotionDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckoutPreviewAppliedPromotionDto build() => _build();

  _$CheckoutPreviewAppliedPromotionDto _build() {
    final _$result = _$v ??
        _$CheckoutPreviewAppliedPromotionDto._(
          promotionId: BuiltValueNullFieldError.checkNotNull(promotionId,
              r'CheckoutPreviewAppliedPromotionDto', 'promotionId'),
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'CheckoutPreviewAppliedPromotionDto', 'key'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'CheckoutPreviewAppliedPromotionDto', 'name'),
          rewardType: BuiltValueNullFieldError.checkNotNull(
              rewardType, r'CheckoutPreviewAppliedPromotionDto', 'rewardType'),
          discountAmount: BuiltValueNullFieldError.checkNotNull(discountAmount,
              r'CheckoutPreviewAppliedPromotionDto', 'discountAmount'),
          freeShipping: BuiltValueNullFieldError.checkNotNull(freeShipping,
              r'CheckoutPreviewAppliedPromotionDto', 'freeShipping'),
          source_: BuiltValueNullFieldError.checkNotNull(
              source_, r'CheckoutPreviewAppliedPromotionDto', 'source_'),
          couponCode: couponCode,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
