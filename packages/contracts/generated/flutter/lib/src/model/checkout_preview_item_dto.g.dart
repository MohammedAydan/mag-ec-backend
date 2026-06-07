// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_preview_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckoutPreviewItemDto extends CheckoutPreviewItemDto {
  @override
  final String variantId;
  @override
  final num quantity;

  factory _$CheckoutPreviewItemDto(
          [void Function(CheckoutPreviewItemDtoBuilder)? updates]) =>
      (CheckoutPreviewItemDtoBuilder()..update(updates))._build();

  _$CheckoutPreviewItemDto._({required this.variantId, required this.quantity})
      : super._();
  @override
  CheckoutPreviewItemDto rebuild(
          void Function(CheckoutPreviewItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutPreviewItemDtoBuilder toBuilder() =>
      CheckoutPreviewItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutPreviewItemDto &&
        variantId == other.variantId &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckoutPreviewItemDto')
          ..add('variantId', variantId)
          ..add('quantity', quantity))
        .toString();
  }
}

class CheckoutPreviewItemDtoBuilder
    implements Builder<CheckoutPreviewItemDto, CheckoutPreviewItemDtoBuilder> {
  _$CheckoutPreviewItemDto? _$v;

  String? _variantId;
  String? get variantId => _$this._variantId;
  set variantId(String? variantId) => _$this._variantId = variantId;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

  CheckoutPreviewItemDtoBuilder() {
    CheckoutPreviewItemDto._defaults(this);
  }

  CheckoutPreviewItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _variantId = $v.variantId;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutPreviewItemDto other) {
    _$v = other as _$CheckoutPreviewItemDto;
  }

  @override
  void update(void Function(CheckoutPreviewItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckoutPreviewItemDto build() => _build();

  _$CheckoutPreviewItemDto _build() {
    final _$result = _$v ??
        _$CheckoutPreviewItemDto._(
          variantId: BuiltValueNullFieldError.checkNotNull(
              variantId, r'CheckoutPreviewItemDto', 'variantId'),
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'CheckoutPreviewItemDto', 'quantity'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
