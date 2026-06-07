// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_preview_item_stock_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckoutPreviewItemStockDto extends CheckoutPreviewItemStockDto {
  @override
  final num availableQuantity;
  @override
  final bool isAvailable;

  factory _$CheckoutPreviewItemStockDto(
          [void Function(CheckoutPreviewItemStockDtoBuilder)? updates]) =>
      (CheckoutPreviewItemStockDtoBuilder()..update(updates))._build();

  _$CheckoutPreviewItemStockDto._(
      {required this.availableQuantity, required this.isAvailable})
      : super._();
  @override
  CheckoutPreviewItemStockDto rebuild(
          void Function(CheckoutPreviewItemStockDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutPreviewItemStockDtoBuilder toBuilder() =>
      CheckoutPreviewItemStockDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutPreviewItemStockDto &&
        availableQuantity == other.availableQuantity &&
        isAvailable == other.isAvailable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, availableQuantity.hashCode);
    _$hash = $jc(_$hash, isAvailable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckoutPreviewItemStockDto')
          ..add('availableQuantity', availableQuantity)
          ..add('isAvailable', isAvailable))
        .toString();
  }
}

class CheckoutPreviewItemStockDtoBuilder
    implements
        Builder<CheckoutPreviewItemStockDto,
            CheckoutPreviewItemStockDtoBuilder> {
  _$CheckoutPreviewItemStockDto? _$v;

  num? _availableQuantity;
  num? get availableQuantity => _$this._availableQuantity;
  set availableQuantity(num? availableQuantity) =>
      _$this._availableQuantity = availableQuantity;

  bool? _isAvailable;
  bool? get isAvailable => _$this._isAvailable;
  set isAvailable(bool? isAvailable) => _$this._isAvailable = isAvailable;

  CheckoutPreviewItemStockDtoBuilder() {
    CheckoutPreviewItemStockDto._defaults(this);
  }

  CheckoutPreviewItemStockDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _availableQuantity = $v.availableQuantity;
      _isAvailable = $v.isAvailable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutPreviewItemStockDto other) {
    _$v = other as _$CheckoutPreviewItemStockDto;
  }

  @override
  void update(void Function(CheckoutPreviewItemStockDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckoutPreviewItemStockDto build() => _build();

  _$CheckoutPreviewItemStockDto _build() {
    final _$result = _$v ??
        _$CheckoutPreviewItemStockDto._(
          availableQuantity: BuiltValueNullFieldError.checkNotNull(
              availableQuantity,
              r'CheckoutPreviewItemStockDto',
              'availableQuantity'),
          isAvailable: BuiltValueNullFieldError.checkNotNull(
              isAvailable, r'CheckoutPreviewItemStockDto', 'isAvailable'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
