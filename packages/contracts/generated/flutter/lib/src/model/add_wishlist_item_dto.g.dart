// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_wishlist_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddWishlistItemDto extends AddWishlistItemDto {
  @override
  final String variantId;

  factory _$AddWishlistItemDto(
          [void Function(AddWishlistItemDtoBuilder)? updates]) =>
      (AddWishlistItemDtoBuilder()..update(updates))._build();

  _$AddWishlistItemDto._({required this.variantId}) : super._();
  @override
  AddWishlistItemDto rebuild(
          void Function(AddWishlistItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddWishlistItemDtoBuilder toBuilder() =>
      AddWishlistItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddWishlistItemDto && variantId == other.variantId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddWishlistItemDto')
          ..add('variantId', variantId))
        .toString();
  }
}

class AddWishlistItemDtoBuilder
    implements Builder<AddWishlistItemDto, AddWishlistItemDtoBuilder> {
  _$AddWishlistItemDto? _$v;

  String? _variantId;
  String? get variantId => _$this._variantId;
  set variantId(String? variantId) => _$this._variantId = variantId;

  AddWishlistItemDtoBuilder() {
    AddWishlistItemDto._defaults(this);
  }

  AddWishlistItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _variantId = $v.variantId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddWishlistItemDto other) {
    _$v = other as _$AddWishlistItemDto;
  }

  @override
  void update(void Function(AddWishlistItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddWishlistItemDto build() => _build();

  _$AddWishlistItemDto _build() {
    final _$result = _$v ??
        _$AddWishlistItemDto._(
          variantId: BuiltValueNullFieldError.checkNotNull(
              variantId, r'AddWishlistItemDto', 'variantId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
