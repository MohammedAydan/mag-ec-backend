// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_price_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VariantPriceResponseDto extends VariantPriceResponseDto {
  @override
  final String id;
  @override
  final String variantId;
  @override
  final String currencyCode;
  @override
  final num baseAmount;
  @override
  final String updatedAt;
  @override
  final num? saleAmount;
  @override
  final String? saleStartsAt;
  @override
  final String? saleEndsAt;
  @override
  final String? taxClassId;

  factory _$VariantPriceResponseDto(
          [void Function(VariantPriceResponseDtoBuilder)? updates]) =>
      (VariantPriceResponseDtoBuilder()..update(updates))._build();

  _$VariantPriceResponseDto._(
      {required this.id,
      required this.variantId,
      required this.currencyCode,
      required this.baseAmount,
      required this.updatedAt,
      this.saleAmount,
      this.saleStartsAt,
      this.saleEndsAt,
      this.taxClassId})
      : super._();
  @override
  VariantPriceResponseDto rebuild(
          void Function(VariantPriceResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VariantPriceResponseDtoBuilder toBuilder() =>
      VariantPriceResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VariantPriceResponseDto &&
        id == other.id &&
        variantId == other.variantId &&
        currencyCode == other.currencyCode &&
        baseAmount == other.baseAmount &&
        updatedAt == other.updatedAt &&
        saleAmount == other.saleAmount &&
        saleStartsAt == other.saleStartsAt &&
        saleEndsAt == other.saleEndsAt &&
        taxClassId == other.taxClassId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, baseAmount.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, saleAmount.hashCode);
    _$hash = $jc(_$hash, saleStartsAt.hashCode);
    _$hash = $jc(_$hash, saleEndsAt.hashCode);
    _$hash = $jc(_$hash, taxClassId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VariantPriceResponseDto')
          ..add('id', id)
          ..add('variantId', variantId)
          ..add('currencyCode', currencyCode)
          ..add('baseAmount', baseAmount)
          ..add('updatedAt', updatedAt)
          ..add('saleAmount', saleAmount)
          ..add('saleStartsAt', saleStartsAt)
          ..add('saleEndsAt', saleEndsAt)
          ..add('taxClassId', taxClassId))
        .toString();
  }
}

class VariantPriceResponseDtoBuilder
    implements
        Builder<VariantPriceResponseDto, VariantPriceResponseDtoBuilder> {
  _$VariantPriceResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _variantId;
  String? get variantId => _$this._variantId;
  set variantId(String? variantId) => _$this._variantId = variantId;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  num? _baseAmount;
  num? get baseAmount => _$this._baseAmount;
  set baseAmount(num? baseAmount) => _$this._baseAmount = baseAmount;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  num? _saleAmount;
  num? get saleAmount => _$this._saleAmount;
  set saleAmount(num? saleAmount) => _$this._saleAmount = saleAmount;

  String? _saleStartsAt;
  String? get saleStartsAt => _$this._saleStartsAt;
  set saleStartsAt(String? saleStartsAt) => _$this._saleStartsAt = saleStartsAt;

  String? _saleEndsAt;
  String? get saleEndsAt => _$this._saleEndsAt;
  set saleEndsAt(String? saleEndsAt) => _$this._saleEndsAt = saleEndsAt;

  String? _taxClassId;
  String? get taxClassId => _$this._taxClassId;
  set taxClassId(String? taxClassId) => _$this._taxClassId = taxClassId;

  VariantPriceResponseDtoBuilder() {
    VariantPriceResponseDto._defaults(this);
  }

  VariantPriceResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _variantId = $v.variantId;
      _currencyCode = $v.currencyCode;
      _baseAmount = $v.baseAmount;
      _updatedAt = $v.updatedAt;
      _saleAmount = $v.saleAmount;
      _saleStartsAt = $v.saleStartsAt;
      _saleEndsAt = $v.saleEndsAt;
      _taxClassId = $v.taxClassId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VariantPriceResponseDto other) {
    _$v = other as _$VariantPriceResponseDto;
  }

  @override
  void update(void Function(VariantPriceResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VariantPriceResponseDto build() => _build();

  _$VariantPriceResponseDto _build() {
    final _$result = _$v ??
        _$VariantPriceResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'VariantPriceResponseDto', 'id'),
          variantId: BuiltValueNullFieldError.checkNotNull(
              variantId, r'VariantPriceResponseDto', 'variantId'),
          currencyCode: BuiltValueNullFieldError.checkNotNull(
              currencyCode, r'VariantPriceResponseDto', 'currencyCode'),
          baseAmount: BuiltValueNullFieldError.checkNotNull(
              baseAmount, r'VariantPriceResponseDto', 'baseAmount'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'VariantPriceResponseDto', 'updatedAt'),
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
