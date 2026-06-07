// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_pricing_behavior_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdatePricingBehaviorDto extends UpdatePricingBehaviorDto {
  @override
  final bool pricesIncludeTax;
  @override
  final String? defaultTaxCountryCode;
  @override
  final String? shippingCurrencyCode;

  factory _$UpdatePricingBehaviorDto(
          [void Function(UpdatePricingBehaviorDtoBuilder)? updates]) =>
      (UpdatePricingBehaviorDtoBuilder()..update(updates))._build();

  _$UpdatePricingBehaviorDto._(
      {required this.pricesIncludeTax,
      this.defaultTaxCountryCode,
      this.shippingCurrencyCode})
      : super._();
  @override
  UpdatePricingBehaviorDto rebuild(
          void Function(UpdatePricingBehaviorDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdatePricingBehaviorDtoBuilder toBuilder() =>
      UpdatePricingBehaviorDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdatePricingBehaviorDto &&
        pricesIncludeTax == other.pricesIncludeTax &&
        defaultTaxCountryCode == other.defaultTaxCountryCode &&
        shippingCurrencyCode == other.shippingCurrencyCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pricesIncludeTax.hashCode);
    _$hash = $jc(_$hash, defaultTaxCountryCode.hashCode);
    _$hash = $jc(_$hash, shippingCurrencyCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdatePricingBehaviorDto')
          ..add('pricesIncludeTax', pricesIncludeTax)
          ..add('defaultTaxCountryCode', defaultTaxCountryCode)
          ..add('shippingCurrencyCode', shippingCurrencyCode))
        .toString();
  }
}

class UpdatePricingBehaviorDtoBuilder
    implements
        Builder<UpdatePricingBehaviorDto, UpdatePricingBehaviorDtoBuilder> {
  _$UpdatePricingBehaviorDto? _$v;

  bool? _pricesIncludeTax;
  bool? get pricesIncludeTax => _$this._pricesIncludeTax;
  set pricesIncludeTax(bool? pricesIncludeTax) =>
      _$this._pricesIncludeTax = pricesIncludeTax;

  String? _defaultTaxCountryCode;
  String? get defaultTaxCountryCode => _$this._defaultTaxCountryCode;
  set defaultTaxCountryCode(String? defaultTaxCountryCode) =>
      _$this._defaultTaxCountryCode = defaultTaxCountryCode;

  String? _shippingCurrencyCode;
  String? get shippingCurrencyCode => _$this._shippingCurrencyCode;
  set shippingCurrencyCode(String? shippingCurrencyCode) =>
      _$this._shippingCurrencyCode = shippingCurrencyCode;

  UpdatePricingBehaviorDtoBuilder() {
    UpdatePricingBehaviorDto._defaults(this);
  }

  UpdatePricingBehaviorDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pricesIncludeTax = $v.pricesIncludeTax;
      _defaultTaxCountryCode = $v.defaultTaxCountryCode;
      _shippingCurrencyCode = $v.shippingCurrencyCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdatePricingBehaviorDto other) {
    _$v = other as _$UpdatePricingBehaviorDto;
  }

  @override
  void update(void Function(UpdatePricingBehaviorDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdatePricingBehaviorDto build() => _build();

  _$UpdatePricingBehaviorDto _build() {
    final _$result = _$v ??
        _$UpdatePricingBehaviorDto._(
          pricesIncludeTax: BuiltValueNullFieldError.checkNotNull(
              pricesIncludeTax,
              r'UpdatePricingBehaviorDto',
              'pricesIncludeTax'),
          defaultTaxCountryCode: defaultTaxCountryCode,
          shippingCurrencyCode: shippingCurrencyCode,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
