// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manual_tax_rate_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ManualTaxRateResponseDto extends ManualTaxRateResponseDto {
  @override
  final String id;
  @override
  final String taxClassId;
  @override
  final String countryCode;
  @override
  final num rateBps;
  @override
  final bool isIncludedInPrice;
  @override
  final String updatedAt;

  factory _$ManualTaxRateResponseDto(
          [void Function(ManualTaxRateResponseDtoBuilder)? updates]) =>
      (ManualTaxRateResponseDtoBuilder()..update(updates))._build();

  _$ManualTaxRateResponseDto._(
      {required this.id,
      required this.taxClassId,
      required this.countryCode,
      required this.rateBps,
      required this.isIncludedInPrice,
      required this.updatedAt})
      : super._();
  @override
  ManualTaxRateResponseDto rebuild(
          void Function(ManualTaxRateResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ManualTaxRateResponseDtoBuilder toBuilder() =>
      ManualTaxRateResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ManualTaxRateResponseDto &&
        id == other.id &&
        taxClassId == other.taxClassId &&
        countryCode == other.countryCode &&
        rateBps == other.rateBps &&
        isIncludedInPrice == other.isIncludedInPrice &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, taxClassId.hashCode);
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, rateBps.hashCode);
    _$hash = $jc(_$hash, isIncludedInPrice.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ManualTaxRateResponseDto')
          ..add('id', id)
          ..add('taxClassId', taxClassId)
          ..add('countryCode', countryCode)
          ..add('rateBps', rateBps)
          ..add('isIncludedInPrice', isIncludedInPrice)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class ManualTaxRateResponseDtoBuilder
    implements
        Builder<ManualTaxRateResponseDto, ManualTaxRateResponseDtoBuilder> {
  _$ManualTaxRateResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _taxClassId;
  String? get taxClassId => _$this._taxClassId;
  set taxClassId(String? taxClassId) => _$this._taxClassId = taxClassId;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

  num? _rateBps;
  num? get rateBps => _$this._rateBps;
  set rateBps(num? rateBps) => _$this._rateBps = rateBps;

  bool? _isIncludedInPrice;
  bool? get isIncludedInPrice => _$this._isIncludedInPrice;
  set isIncludedInPrice(bool? isIncludedInPrice) =>
      _$this._isIncludedInPrice = isIncludedInPrice;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ManualTaxRateResponseDtoBuilder() {
    ManualTaxRateResponseDto._defaults(this);
  }

  ManualTaxRateResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _taxClassId = $v.taxClassId;
      _countryCode = $v.countryCode;
      _rateBps = $v.rateBps;
      _isIncludedInPrice = $v.isIncludedInPrice;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ManualTaxRateResponseDto other) {
    _$v = other as _$ManualTaxRateResponseDto;
  }

  @override
  void update(void Function(ManualTaxRateResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ManualTaxRateResponseDto build() => _build();

  _$ManualTaxRateResponseDto _build() {
    final _$result = _$v ??
        _$ManualTaxRateResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ManualTaxRateResponseDto', 'id'),
          taxClassId: BuiltValueNullFieldError.checkNotNull(
              taxClassId, r'ManualTaxRateResponseDto', 'taxClassId'),
          countryCode: BuiltValueNullFieldError.checkNotNull(
              countryCode, r'ManualTaxRateResponseDto', 'countryCode'),
          rateBps: BuiltValueNullFieldError.checkNotNull(
              rateBps, r'ManualTaxRateResponseDto', 'rateBps'),
          isIncludedInPrice: BuiltValueNullFieldError.checkNotNull(
              isIncludedInPrice,
              r'ManualTaxRateResponseDto',
              'isIncludedInPrice'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'ManualTaxRateResponseDto', 'updatedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
