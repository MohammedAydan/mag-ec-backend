// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateCartItemDto extends UpdateCartItemDto {
  @override
  final num quantity;

  factory _$UpdateCartItemDto(
          [void Function(UpdateCartItemDtoBuilder)? updates]) =>
      (UpdateCartItemDtoBuilder()..update(updates))._build();

  _$UpdateCartItemDto._({required this.quantity}) : super._();
  @override
  UpdateCartItemDto rebuild(void Function(UpdateCartItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateCartItemDtoBuilder toBuilder() =>
      UpdateCartItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateCartItemDto && quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateCartItemDto')
          ..add('quantity', quantity))
        .toString();
  }
}

class UpdateCartItemDtoBuilder
    implements Builder<UpdateCartItemDto, UpdateCartItemDtoBuilder> {
  _$UpdateCartItemDto? _$v;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

  UpdateCartItemDtoBuilder() {
    UpdateCartItemDto._defaults(this);
  }

  UpdateCartItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateCartItemDto other) {
    _$v = other as _$UpdateCartItemDto;
  }

  @override
  void update(void Function(UpdateCartItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateCartItemDto build() => _build();

  _$UpdateCartItemDto _build() {
    final _$result = _$v ??
        _$UpdateCartItemDto._(
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'UpdateCartItemDto', 'quantity'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
