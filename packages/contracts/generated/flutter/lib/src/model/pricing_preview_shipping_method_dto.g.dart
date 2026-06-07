// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_preview_shipping_method_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PricingPreviewShippingMethodDto
    extends PricingPreviewShippingMethodDto {
  @override
  final String key;
  @override
  final String name;
  @override
  final String rateType;
  @override
  final num amount;
  @override
  final num totalAmount;

  factory _$PricingPreviewShippingMethodDto(
          [void Function(PricingPreviewShippingMethodDtoBuilder)? updates]) =>
      (PricingPreviewShippingMethodDtoBuilder()..update(updates))._build();

  _$PricingPreviewShippingMethodDto._(
      {required this.key,
      required this.name,
      required this.rateType,
      required this.amount,
      required this.totalAmount})
      : super._();
  @override
  PricingPreviewShippingMethodDto rebuild(
          void Function(PricingPreviewShippingMethodDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PricingPreviewShippingMethodDtoBuilder toBuilder() =>
      PricingPreviewShippingMethodDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PricingPreviewShippingMethodDto &&
        key == other.key &&
        name == other.name &&
        rateType == other.rateType &&
        amount == other.amount &&
        totalAmount == other.totalAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, rateType.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, totalAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PricingPreviewShippingMethodDto')
          ..add('key', key)
          ..add('name', name)
          ..add('rateType', rateType)
          ..add('amount', amount)
          ..add('totalAmount', totalAmount))
        .toString();
  }
}

class PricingPreviewShippingMethodDtoBuilder
    implements
        Builder<PricingPreviewShippingMethodDto,
            PricingPreviewShippingMethodDtoBuilder> {
  _$PricingPreviewShippingMethodDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _rateType;
  String? get rateType => _$this._rateType;
  set rateType(String? rateType) => _$this._rateType = rateType;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

  num? _totalAmount;
  num? get totalAmount => _$this._totalAmount;
  set totalAmount(num? totalAmount) => _$this._totalAmount = totalAmount;

  PricingPreviewShippingMethodDtoBuilder() {
    PricingPreviewShippingMethodDto._defaults(this);
  }

  PricingPreviewShippingMethodDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _name = $v.name;
      _rateType = $v.rateType;
      _amount = $v.amount;
      _totalAmount = $v.totalAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PricingPreviewShippingMethodDto other) {
    _$v = other as _$PricingPreviewShippingMethodDto;
  }

  @override
  void update(void Function(PricingPreviewShippingMethodDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PricingPreviewShippingMethodDto build() => _build();

  _$PricingPreviewShippingMethodDto _build() {
    final _$result = _$v ??
        _$PricingPreviewShippingMethodDto._(
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'PricingPreviewShippingMethodDto', 'key'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'PricingPreviewShippingMethodDto', 'name'),
          rateType: BuiltValueNullFieldError.checkNotNull(
              rateType, r'PricingPreviewShippingMethodDto', 'rateType'),
          amount: BuiltValueNullFieldError.checkNotNull(
              amount, r'PricingPreviewShippingMethodDto', 'amount'),
          totalAmount: BuiltValueNullFieldError.checkNotNull(
              totalAmount, r'PricingPreviewShippingMethodDto', 'totalAmount'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
