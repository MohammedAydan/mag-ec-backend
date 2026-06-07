// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_store_currency_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateStoreCurrencyDto extends UpdateStoreCurrencyDto {
  @override
  final String currencyCode;
  @override
  final String symbol;
  @override
  final num minorUnit;

  factory _$UpdateStoreCurrencyDto(
          [void Function(UpdateStoreCurrencyDtoBuilder)? updates]) =>
      (UpdateStoreCurrencyDtoBuilder()..update(updates))._build();

  _$UpdateStoreCurrencyDto._(
      {required this.currencyCode,
      required this.symbol,
      required this.minorUnit})
      : super._();
  @override
  UpdateStoreCurrencyDto rebuild(
          void Function(UpdateStoreCurrencyDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateStoreCurrencyDtoBuilder toBuilder() =>
      UpdateStoreCurrencyDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateStoreCurrencyDto &&
        currencyCode == other.currencyCode &&
        symbol == other.symbol &&
        minorUnit == other.minorUnit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, symbol.hashCode);
    _$hash = $jc(_$hash, minorUnit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateStoreCurrencyDto')
          ..add('currencyCode', currencyCode)
          ..add('symbol', symbol)
          ..add('minorUnit', minorUnit))
        .toString();
  }
}

class UpdateStoreCurrencyDtoBuilder
    implements Builder<UpdateStoreCurrencyDto, UpdateStoreCurrencyDtoBuilder> {
  _$UpdateStoreCurrencyDto? _$v;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  String? _symbol;
  String? get symbol => _$this._symbol;
  set symbol(String? symbol) => _$this._symbol = symbol;

  num? _minorUnit;
  num? get minorUnit => _$this._minorUnit;
  set minorUnit(num? minorUnit) => _$this._minorUnit = minorUnit;

  UpdateStoreCurrencyDtoBuilder() {
    UpdateStoreCurrencyDto._defaults(this);
  }

  UpdateStoreCurrencyDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyCode = $v.currencyCode;
      _symbol = $v.symbol;
      _minorUnit = $v.minorUnit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateStoreCurrencyDto other) {
    _$v = other as _$UpdateStoreCurrencyDto;
  }

  @override
  void update(void Function(UpdateStoreCurrencyDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateStoreCurrencyDto build() => _build();

  _$UpdateStoreCurrencyDto _build() {
    final _$result = _$v ??
        _$UpdateStoreCurrencyDto._(
          currencyCode: BuiltValueNullFieldError.checkNotNull(
              currencyCode, r'UpdateStoreCurrencyDto', 'currencyCode'),
          symbol: BuiltValueNullFieldError.checkNotNull(
              symbol, r'UpdateStoreCurrencyDto', 'symbol'),
          minorUnit: BuiltValueNullFieldError.checkNotNull(
              minorUnit, r'UpdateStoreCurrencyDto', 'minorUnit'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
