// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_cart_preview_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckoutCartPreviewDto extends CheckoutCartPreviewDto {
  @override
  final String cartId;
  @override
  final String currencyCode;
  @override
  final String countryCode;
  @override
  final String? customerLocale;
  @override
  final bool? reserveStockOnPreview;

  factory _$CheckoutCartPreviewDto(
          [void Function(CheckoutCartPreviewDtoBuilder)? updates]) =>
      (CheckoutCartPreviewDtoBuilder()..update(updates))._build();

  _$CheckoutCartPreviewDto._(
      {required this.cartId,
      required this.currencyCode,
      required this.countryCode,
      this.customerLocale,
      this.reserveStockOnPreview})
      : super._();
  @override
  CheckoutCartPreviewDto rebuild(
          void Function(CheckoutCartPreviewDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutCartPreviewDtoBuilder toBuilder() =>
      CheckoutCartPreviewDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutCartPreviewDto &&
        cartId == other.cartId &&
        currencyCode == other.currencyCode &&
        countryCode == other.countryCode &&
        customerLocale == other.customerLocale &&
        reserveStockOnPreview == other.reserveStockOnPreview;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cartId.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, customerLocale.hashCode);
    _$hash = $jc(_$hash, reserveStockOnPreview.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckoutCartPreviewDto')
          ..add('cartId', cartId)
          ..add('currencyCode', currencyCode)
          ..add('countryCode', countryCode)
          ..add('customerLocale', customerLocale)
          ..add('reserveStockOnPreview', reserveStockOnPreview))
        .toString();
  }
}

class CheckoutCartPreviewDtoBuilder
    implements Builder<CheckoutCartPreviewDto, CheckoutCartPreviewDtoBuilder> {
  _$CheckoutCartPreviewDto? _$v;

  String? _cartId;
  String? get cartId => _$this._cartId;
  set cartId(String? cartId) => _$this._cartId = cartId;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

  String? _customerLocale;
  String? get customerLocale => _$this._customerLocale;
  set customerLocale(String? customerLocale) =>
      _$this._customerLocale = customerLocale;

  bool? _reserveStockOnPreview;
  bool? get reserveStockOnPreview => _$this._reserveStockOnPreview;
  set reserveStockOnPreview(bool? reserveStockOnPreview) =>
      _$this._reserveStockOnPreview = reserveStockOnPreview;

  CheckoutCartPreviewDtoBuilder() {
    CheckoutCartPreviewDto._defaults(this);
  }

  CheckoutCartPreviewDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cartId = $v.cartId;
      _currencyCode = $v.currencyCode;
      _countryCode = $v.countryCode;
      _customerLocale = $v.customerLocale;
      _reserveStockOnPreview = $v.reserveStockOnPreview;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutCartPreviewDto other) {
    _$v = other as _$CheckoutCartPreviewDto;
  }

  @override
  void update(void Function(CheckoutCartPreviewDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckoutCartPreviewDto build() => _build();

  _$CheckoutCartPreviewDto _build() {
    final _$result = _$v ??
        _$CheckoutCartPreviewDto._(
          cartId: BuiltValueNullFieldError.checkNotNull(
              cartId, r'CheckoutCartPreviewDto', 'cartId'),
          currencyCode: BuiltValueNullFieldError.checkNotNull(
              currencyCode, r'CheckoutCartPreviewDto', 'currencyCode'),
          countryCode: BuiltValueNullFieldError.checkNotNull(
              countryCode, r'CheckoutCartPreviewDto', 'countryCode'),
          customerLocale: customerLocale,
          reserveStockOnPreview: reserveStockOnPreview,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
