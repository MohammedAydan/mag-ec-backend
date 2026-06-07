// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_preview_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckoutPreviewDto extends CheckoutPreviewDto {
  @override
  final String currencyCode;
  @override
  final String countryCode;
  @override
  final BuiltList<CheckoutPreviewItemDto> items;
  @override
  final String? customerLocale;
  @override
  final String? customerId;
  @override
  final BuiltList<String>? couponCodes;

  factory _$CheckoutPreviewDto(
          [void Function(CheckoutPreviewDtoBuilder)? updates]) =>
      (CheckoutPreviewDtoBuilder()..update(updates))._build();

  _$CheckoutPreviewDto._(
      {required this.currencyCode,
      required this.countryCode,
      required this.items,
      this.customerLocale,
      this.customerId,
      this.couponCodes})
      : super._();
  @override
  CheckoutPreviewDto rebuild(
          void Function(CheckoutPreviewDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutPreviewDtoBuilder toBuilder() =>
      CheckoutPreviewDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutPreviewDto &&
        currencyCode == other.currencyCode &&
        countryCode == other.countryCode &&
        items == other.items &&
        customerLocale == other.customerLocale &&
        customerId == other.customerId &&
        couponCodes == other.couponCodes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, customerLocale.hashCode);
    _$hash = $jc(_$hash, customerId.hashCode);
    _$hash = $jc(_$hash, couponCodes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckoutPreviewDto')
          ..add('currencyCode', currencyCode)
          ..add('countryCode', countryCode)
          ..add('items', items)
          ..add('customerLocale', customerLocale)
          ..add('customerId', customerId)
          ..add('couponCodes', couponCodes))
        .toString();
  }
}

class CheckoutPreviewDtoBuilder
    implements Builder<CheckoutPreviewDto, CheckoutPreviewDtoBuilder> {
  _$CheckoutPreviewDto? _$v;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

  ListBuilder<CheckoutPreviewItemDto>? _items;
  ListBuilder<CheckoutPreviewItemDto> get items =>
      _$this._items ??= ListBuilder<CheckoutPreviewItemDto>();
  set items(ListBuilder<CheckoutPreviewItemDto>? items) =>
      _$this._items = items;

  String? _customerLocale;
  String? get customerLocale => _$this._customerLocale;
  set customerLocale(String? customerLocale) =>
      _$this._customerLocale = customerLocale;

  String? _customerId;
  String? get customerId => _$this._customerId;
  set customerId(String? customerId) => _$this._customerId = customerId;

  ListBuilder<String>? _couponCodes;
  ListBuilder<String> get couponCodes =>
      _$this._couponCodes ??= ListBuilder<String>();
  set couponCodes(ListBuilder<String>? couponCodes) =>
      _$this._couponCodes = couponCodes;

  CheckoutPreviewDtoBuilder() {
    CheckoutPreviewDto._defaults(this);
  }

  CheckoutPreviewDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyCode = $v.currencyCode;
      _countryCode = $v.countryCode;
      _items = $v.items.toBuilder();
      _customerLocale = $v.customerLocale;
      _customerId = $v.customerId;
      _couponCodes = $v.couponCodes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutPreviewDto other) {
    _$v = other as _$CheckoutPreviewDto;
  }

  @override
  void update(void Function(CheckoutPreviewDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckoutPreviewDto build() => _build();

  _$CheckoutPreviewDto _build() {
    _$CheckoutPreviewDto _$result;
    try {
      _$result = _$v ??
          _$CheckoutPreviewDto._(
            currencyCode: BuiltValueNullFieldError.checkNotNull(
                currencyCode, r'CheckoutPreviewDto', 'currencyCode'),
            countryCode: BuiltValueNullFieldError.checkNotNull(
                countryCode, r'CheckoutPreviewDto', 'countryCode'),
            items: items.build(),
            customerLocale: customerLocale,
            customerId: customerId,
            couponCodes: _couponCodes?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();

        _$failedField = 'couponCodes';
        _couponCodes?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CheckoutPreviewDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
