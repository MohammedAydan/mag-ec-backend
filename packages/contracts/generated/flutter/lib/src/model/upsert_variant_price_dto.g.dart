// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_variant_price_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpsertVariantPriceDto extends UpsertVariantPriceDto {
  @override
  final String currencyCode;
  @override
  final num baseAmount;
  @override
  final num? saleAmount;
  @override
  final DateTime? saleStartsAt;
  @override
  final DateTime? saleEndsAt;
  @override
  final String? taxClassId;

  factory _$UpsertVariantPriceDto(
          [void Function(UpsertVariantPriceDtoBuilder)? updates]) =>
      (UpsertVariantPriceDtoBuilder()..update(updates))._build();

  _$UpsertVariantPriceDto._(
      {required this.currencyCode,
      required this.baseAmount,
      this.saleAmount,
      this.saleStartsAt,
      this.saleEndsAt,
      this.taxClassId})
      : super._();
  @override
  UpsertVariantPriceDto rebuild(
          void Function(UpsertVariantPriceDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpsertVariantPriceDtoBuilder toBuilder() =>
      UpsertVariantPriceDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpsertVariantPriceDto &&
        currencyCode == other.currencyCode &&
        baseAmount == other.baseAmount &&
        saleAmount == other.saleAmount &&
        saleStartsAt == other.saleStartsAt &&
        saleEndsAt == other.saleEndsAt &&
        taxClassId == other.taxClassId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, baseAmount.hashCode);
    _$hash = $jc(_$hash, saleAmount.hashCode);
    _$hash = $jc(_$hash, saleStartsAt.hashCode);
    _$hash = $jc(_$hash, saleEndsAt.hashCode);
    _$hash = $jc(_$hash, taxClassId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpsertVariantPriceDto')
          ..add('currencyCode', currencyCode)
          ..add('baseAmount', baseAmount)
          ..add('saleAmount', saleAmount)
          ..add('saleStartsAt', saleStartsAt)
          ..add('saleEndsAt', saleEndsAt)
          ..add('taxClassId', taxClassId))
        .toString();
  }
}

class UpsertVariantPriceDtoBuilder
    implements Builder<UpsertVariantPriceDto, UpsertVariantPriceDtoBuilder> {
  _$UpsertVariantPriceDto? _$v;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  num? _baseAmount;
  num? get baseAmount => _$this._baseAmount;
  set baseAmount(num? baseAmount) => _$this._baseAmount = baseAmount;

  num? _saleAmount;
  num? get saleAmount => _$this._saleAmount;
  set saleAmount(num? saleAmount) => _$this._saleAmount = saleAmount;

  DateTime? _saleStartsAt;
  DateTime? get saleStartsAt => _$this._saleStartsAt;
  set saleStartsAt(DateTime? saleStartsAt) =>
      _$this._saleStartsAt = saleStartsAt;

  DateTime? _saleEndsAt;
  DateTime? get saleEndsAt => _$this._saleEndsAt;
  set saleEndsAt(DateTime? saleEndsAt) => _$this._saleEndsAt = saleEndsAt;

  String? _taxClassId;
  String? get taxClassId => _$this._taxClassId;
  set taxClassId(String? taxClassId) => _$this._taxClassId = taxClassId;

  UpsertVariantPriceDtoBuilder() {
    UpsertVariantPriceDto._defaults(this);
  }

  UpsertVariantPriceDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currencyCode = $v.currencyCode;
      _baseAmount = $v.baseAmount;
      _saleAmount = $v.saleAmount;
      _saleStartsAt = $v.saleStartsAt;
      _saleEndsAt = $v.saleEndsAt;
      _taxClassId = $v.taxClassId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpsertVariantPriceDto other) {
    _$v = other as _$UpsertVariantPriceDto;
  }

  @override
  void update(void Function(UpsertVariantPriceDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpsertVariantPriceDto build() => _build();

  _$UpsertVariantPriceDto _build() {
    final _$result = _$v ??
        _$UpsertVariantPriceDto._(
          currencyCode: BuiltValueNullFieldError.checkNotNull(
              currencyCode, r'UpsertVariantPriceDto', 'currencyCode'),
          baseAmount: BuiltValueNullFieldError.checkNotNull(
              baseAmount, r'UpsertVariantPriceDto', 'baseAmount'),
          saleAmount: saleAmount,
          saleStartsAt: saleStartsAt,
          saleEndsAt: saleEndsAt,
          taxClassId: taxClassId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
