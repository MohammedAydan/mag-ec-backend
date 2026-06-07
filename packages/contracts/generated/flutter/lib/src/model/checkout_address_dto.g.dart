// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_address_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckoutAddressDto extends CheckoutAddressDto {
  @override
  final String recipientName;
  @override
  final String phoneNumber;
  @override
  final String countryCode;
  @override
  final String city;
  @override
  final String addressLine1;
  @override
  final String? state;
  @override
  final String? postalCode;
  @override
  final String? addressLine2;
  @override
  final String? company;

  factory _$CheckoutAddressDto(
          [void Function(CheckoutAddressDtoBuilder)? updates]) =>
      (CheckoutAddressDtoBuilder()..update(updates))._build();

  _$CheckoutAddressDto._(
      {required this.recipientName,
      required this.phoneNumber,
      required this.countryCode,
      required this.city,
      required this.addressLine1,
      this.state,
      this.postalCode,
      this.addressLine2,
      this.company})
      : super._();
  @override
  CheckoutAddressDto rebuild(
          void Function(CheckoutAddressDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutAddressDtoBuilder toBuilder() =>
      CheckoutAddressDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutAddressDto &&
        recipientName == other.recipientName &&
        phoneNumber == other.phoneNumber &&
        countryCode == other.countryCode &&
        city == other.city &&
        addressLine1 == other.addressLine1 &&
        state == other.state &&
        postalCode == other.postalCode &&
        addressLine2 == other.addressLine2 &&
        company == other.company;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, recipientName.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, addressLine1.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, postalCode.hashCode);
    _$hash = $jc(_$hash, addressLine2.hashCode);
    _$hash = $jc(_$hash, company.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckoutAddressDto')
          ..add('recipientName', recipientName)
          ..add('phoneNumber', phoneNumber)
          ..add('countryCode', countryCode)
          ..add('city', city)
          ..add('addressLine1', addressLine1)
          ..add('state', state)
          ..add('postalCode', postalCode)
          ..add('addressLine2', addressLine2)
          ..add('company', company))
        .toString();
  }
}

class CheckoutAddressDtoBuilder
    implements Builder<CheckoutAddressDto, CheckoutAddressDtoBuilder> {
  _$CheckoutAddressDto? _$v;

  String? _recipientName;
  String? get recipientName => _$this._recipientName;
  set recipientName(String? recipientName) =>
      _$this._recipientName = recipientName;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _addressLine1;
  String? get addressLine1 => _$this._addressLine1;
  set addressLine1(String? addressLine1) => _$this._addressLine1 = addressLine1;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _postalCode;
  String? get postalCode => _$this._postalCode;
  set postalCode(String? postalCode) => _$this._postalCode = postalCode;

  String? _addressLine2;
  String? get addressLine2 => _$this._addressLine2;
  set addressLine2(String? addressLine2) => _$this._addressLine2 = addressLine2;

  String? _company;
  String? get company => _$this._company;
  set company(String? company) => _$this._company = company;

  CheckoutAddressDtoBuilder() {
    CheckoutAddressDto._defaults(this);
  }

  CheckoutAddressDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recipientName = $v.recipientName;
      _phoneNumber = $v.phoneNumber;
      _countryCode = $v.countryCode;
      _city = $v.city;
      _addressLine1 = $v.addressLine1;
      _state = $v.state;
      _postalCode = $v.postalCode;
      _addressLine2 = $v.addressLine2;
      _company = $v.company;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutAddressDto other) {
    _$v = other as _$CheckoutAddressDto;
  }

  @override
  void update(void Function(CheckoutAddressDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckoutAddressDto build() => _build();

  _$CheckoutAddressDto _build() {
    final _$result = _$v ??
        _$CheckoutAddressDto._(
          recipientName: BuiltValueNullFieldError.checkNotNull(
              recipientName, r'CheckoutAddressDto', 'recipientName'),
          phoneNumber: BuiltValueNullFieldError.checkNotNull(
              phoneNumber, r'CheckoutAddressDto', 'phoneNumber'),
          countryCode: BuiltValueNullFieldError.checkNotNull(
              countryCode, r'CheckoutAddressDto', 'countryCode'),
          city: BuiltValueNullFieldError.checkNotNull(
              city, r'CheckoutAddressDto', 'city'),
          addressLine1: BuiltValueNullFieldError.checkNotNull(
              addressLine1, r'CheckoutAddressDto', 'addressLine1'),
          state: state,
          postalCode: postalCode,
          addressLine2: addressLine2,
          company: company,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
