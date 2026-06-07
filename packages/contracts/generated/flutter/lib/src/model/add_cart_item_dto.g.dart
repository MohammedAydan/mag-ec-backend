// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddCartItemDto extends AddCartItemDto {
  @override
  final String variantId;
  @override
  final num quantity;

  factory _$AddCartItemDto([void Function(AddCartItemDtoBuilder)? updates]) =>
      (AddCartItemDtoBuilder()..update(updates))._build();

  _$AddCartItemDto._({required this.variantId, required this.quantity})
      : super._();
  @override
  AddCartItemDto rebuild(void Function(AddCartItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddCartItemDtoBuilder toBuilder() => AddCartItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddCartItemDto &&
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
    return (newBuiltValueToStringHelper(r'AddCartItemDto')
          ..add('variantId', variantId)
          ..add('quantity', quantity))
        .toString();
  }
}

class AddCartItemDtoBuilder
    implements Builder<AddCartItemDto, AddCartItemDtoBuilder> {
  _$AddCartItemDto? _$v;

  String? _variantId;
  String? get variantId => _$this._variantId;
  set variantId(String? variantId) => _$this._variantId = variantId;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

  AddCartItemDtoBuilder() {
    AddCartItemDto._defaults(this);
  }

  AddCartItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _variantId = $v.variantId;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddCartItemDto other) {
    _$v = other as _$AddCartItemDto;
  }

  @override
  void update(void Function(AddCartItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddCartItemDto build() => _build();

  _$AddCartItemDto _build() {
    final _$result = _$v ??
        _$AddCartItemDto._(
          variantId: BuiltValueNullFieldError.checkNotNull(
              variantId, r'AddCartItemDto', 'variantId'),
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'AddCartItemDto', 'quantity'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
