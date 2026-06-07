// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CartItemResponseDto extends CartItemResponseDto {
  @override
  final String id;
  @override
  final String variantId;
  @override
  final num quantity;

  factory _$CartItemResponseDto(
          [void Function(CartItemResponseDtoBuilder)? updates]) =>
      (CartItemResponseDtoBuilder()..update(updates))._build();

  _$CartItemResponseDto._(
      {required this.id, required this.variantId, required this.quantity})
      : super._();
  @override
  CartItemResponseDto rebuild(
          void Function(CartItemResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CartItemResponseDtoBuilder toBuilder() =>
      CartItemResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartItemResponseDto &&
        id == other.id &&
        variantId == other.variantId &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CartItemResponseDto')
          ..add('id', id)
          ..add('variantId', variantId)
          ..add('quantity', quantity))
        .toString();
  }
}

class CartItemResponseDtoBuilder
    implements Builder<CartItemResponseDto, CartItemResponseDtoBuilder> {
  _$CartItemResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _variantId;
  String? get variantId => _$this._variantId;
  set variantId(String? variantId) => _$this._variantId = variantId;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

  CartItemResponseDtoBuilder() {
    CartItemResponseDto._defaults(this);
  }

  CartItemResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _variantId = $v.variantId;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CartItemResponseDto other) {
    _$v = other as _$CartItemResponseDto;
  }

  @override
  void update(void Function(CartItemResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CartItemResponseDto build() => _build();

  _$CartItemResponseDto _build() {
    final _$result = _$v ??
        _$CartItemResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'CartItemResponseDto', 'id'),
          variantId: BuiltValueNullFieldError.checkNotNull(
              variantId, r'CartItemResponseDto', 'variantId'),
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'CartItemResponseDto', 'quantity'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
