// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_item_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WishlistItemResponseDto extends WishlistItemResponseDto {
  @override
  final String id;
  @override
  final String variantId;
  @override
  final String addedAt;

  factory _$WishlistItemResponseDto(
          [void Function(WishlistItemResponseDtoBuilder)? updates]) =>
      (WishlistItemResponseDtoBuilder()..update(updates))._build();

  _$WishlistItemResponseDto._(
      {required this.id, required this.variantId, required this.addedAt})
      : super._();
  @override
  WishlistItemResponseDto rebuild(
          void Function(WishlistItemResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WishlistItemResponseDtoBuilder toBuilder() =>
      WishlistItemResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WishlistItemResponseDto &&
        id == other.id &&
        variantId == other.variantId &&
        addedAt == other.addedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, addedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WishlistItemResponseDto')
          ..add('id', id)
          ..add('variantId', variantId)
          ..add('addedAt', addedAt))
        .toString();
  }
}

class WishlistItemResponseDtoBuilder
    implements
        Builder<WishlistItemResponseDto, WishlistItemResponseDtoBuilder> {
  _$WishlistItemResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _variantId;
  String? get variantId => _$this._variantId;
  set variantId(String? variantId) => _$this._variantId = variantId;

  String? _addedAt;
  String? get addedAt => _$this._addedAt;
  set addedAt(String? addedAt) => _$this._addedAt = addedAt;

  WishlistItemResponseDtoBuilder() {
    WishlistItemResponseDto._defaults(this);
  }

  WishlistItemResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _variantId = $v.variantId;
      _addedAt = $v.addedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WishlistItemResponseDto other) {
    _$v = other as _$WishlistItemResponseDto;
  }

  @override
  void update(void Function(WishlistItemResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WishlistItemResponseDto build() => _build();

  _$WishlistItemResponseDto _build() {
    final _$result = _$v ??
        _$WishlistItemResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'WishlistItemResponseDto', 'id'),
          variantId: BuiltValueNullFieldError.checkNotNull(
              variantId, r'WishlistItemResponseDto', 'variantId'),
          addedAt: BuiltValueNullFieldError.checkNotNull(
              addedAt, r'WishlistItemResponseDto', 'addedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
