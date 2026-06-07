// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_manual_tax_rate_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpsertManualTaxRateDto extends UpsertManualTaxRateDto {
  @override
  final num rateBps;
  @override
  final bool? isIncludedInPrice;

  factory _$UpsertManualTaxRateDto(
          [void Function(UpsertManualTaxRateDtoBuilder)? updates]) =>
      (UpsertManualTaxRateDtoBuilder()..update(updates))._build();

  _$UpsertManualTaxRateDto._({required this.rateBps, this.isIncludedInPrice})
      : super._();
  @override
  UpsertManualTaxRateDto rebuild(
          void Function(UpsertManualTaxRateDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpsertManualTaxRateDtoBuilder toBuilder() =>
      UpsertManualTaxRateDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpsertManualTaxRateDto &&
        rateBps == other.rateBps &&
        isIncludedInPrice == other.isIncludedInPrice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, rateBps.hashCode);
    _$hash = $jc(_$hash, isIncludedInPrice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpsertManualTaxRateDto')
          ..add('rateBps', rateBps)
          ..add('isIncludedInPrice', isIncludedInPrice))
        .toString();
  }
}

class UpsertManualTaxRateDtoBuilder
    implements Builder<UpsertManualTaxRateDto, UpsertManualTaxRateDtoBuilder> {
  _$UpsertManualTaxRateDto? _$v;

  num? _rateBps;
  num? get rateBps => _$this._rateBps;
  set rateBps(num? rateBps) => _$this._rateBps = rateBps;

  bool? _isIncludedInPrice;
  bool? get isIncludedInPrice => _$this._isIncludedInPrice;
  set isIncludedInPrice(bool? isIncludedInPrice) =>
      _$this._isIncludedInPrice = isIncludedInPrice;

  UpsertManualTaxRateDtoBuilder() {
    UpsertManualTaxRateDto._defaults(this);
  }

  UpsertManualTaxRateDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rateBps = $v.rateBps;
      _isIncludedInPrice = $v.isIncludedInPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpsertManualTaxRateDto other) {
    _$v = other as _$UpsertManualTaxRateDto;
  }

  @override
  void update(void Function(UpsertManualTaxRateDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpsertManualTaxRateDto build() => _build();

  _$UpsertManualTaxRateDto _build() {
    final _$result = _$v ??
        _$UpsertManualTaxRateDto._(
          rateBps: BuiltValueNullFieldError.checkNotNull(
              rateBps, r'UpsertManualTaxRateDto', 'rateBps'),
          isIncludedInPrice: isIncludedInPrice,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
