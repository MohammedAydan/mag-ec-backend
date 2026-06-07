// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_variant_price_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CatalogVariantPriceDto extends CatalogVariantPriceDto {
  @override
  final String currencyCode;
  @override
  final num baseAmount;
  @override
  final num? saleAmount;

  factory _$CatalogVariantPriceDto(
          [void Function(CatalogVariantPriceDtoBuilder)? updates]) =>
      (CatalogVariantPriceDtoBuilder()..update(updates))._build();

  _$CatalogVariantPriceDto._(
      {required this.currencyCode, required this.baseAmount, this.saleAmount})
      : super._();
  @override
  CatalogVariantPriceDto rebuild(
          void Function(CatalogVariantPriceDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CatalogVariantPriceDtoBuilder toBuilder() =>
      CatalogVariantPriceDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CatalogVariantPriceDto &&
        currencyCode == other.currencyCode &&
        baseAmount == other.baseAmount &&
        saleAmount == other.saleAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, baseAmount.hashCode);
    _$hash = $jc(_$hash, saleAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CatalogVariantPriceDto')
          ..add('currencyCode', currencyCode)
          ..add('baseAmount', baseAmount)
          ..add('saleAmount', saleAmount))
        .toString();
  }
}

class CatalogVariantPriceDtoBuilder
    implements Builder<CatalogVariantPriceDto, CatalogVariantPriceDtoBuilder> {
  _$CatalogVariantPriceDto? _$v;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  num? _baseAmount;
  num? get baseAmount => _$this._baseAmount;
  set baseAmount(num? baseAmount) => _$this._baseAmount = baseAmount;

  num? _saleAmount;
  num? get saleAmount => _$this._saleAmount;
  set saleAmount(num? saleAmount) => _$this._saleAmount = saleAmount;

  CatalogVariantPriceDtoBuilder() {
    CatalogVariantPriceDto._defaults(this);
  }

  CatalogVariantPriceDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyCode = $v.currencyCode;
      _baseAmount = $v.baseAmount;
      _saleAmount = $v.saleAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CatalogVariantPriceDto other) {
    _$v = other as _$CatalogVariantPriceDto;
  }

  @override
  void update(void Function(CatalogVariantPriceDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CatalogVariantPriceDto build() => _build();

  _$CatalogVariantPriceDto _build() {
    final _$result = _$v ??
        _$CatalogVariantPriceDto._(
          currencyCode: BuiltValueNullFieldError.checkNotNull(
              currencyCode, r'CatalogVariantPriceDto', 'currencyCode'),
          baseAmount: BuiltValueNullFieldError.checkNotNull(
              baseAmount, r'CatalogVariantPriceDto', 'baseAmount'),
          saleAmount: saleAmount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
