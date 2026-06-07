// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WishlistResponseDto extends WishlistResponseDto {
  @override
  final String id;
  @override
  final String userId;
  @override
  final BuiltList<WishlistItemResponseDto> items;
  @override
  final num? itemCount;

  factory _$WishlistResponseDto(
          [void Function(WishlistResponseDtoBuilder)? updates]) =>
      (WishlistResponseDtoBuilder()..update(updates))._build();

  _$WishlistResponseDto._(
      {required this.id,
      required this.userId,
      required this.items,
      this.itemCount})
      : super._();
  @override
  WishlistResponseDto rebuild(
          void Function(WishlistResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WishlistResponseDtoBuilder toBuilder() =>
      WishlistResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WishlistResponseDto &&
        id == other.id &&
        userId == other.userId &&
        items == other.items &&
        itemCount == other.itemCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, itemCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WishlistResponseDto')
          ..add('id', id)
          ..add('userId', userId)
          ..add('items', items)
          ..add('itemCount', itemCount))
        .toString();
  }
}

class WishlistResponseDtoBuilder
    implements Builder<WishlistResponseDto, WishlistResponseDtoBuilder> {
  _$WishlistResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  ListBuilder<WishlistItemResponseDto>? _items;
  ListBuilder<WishlistItemResponseDto> get items =>
      _$this._items ??= ListBuilder<WishlistItemResponseDto>();
  set items(ListBuilder<WishlistItemResponseDto>? items) =>
      _$this._items = items;

  num? _itemCount;
  num? get itemCount => _$this._itemCount;
  set itemCount(num? itemCount) => _$this._itemCount = itemCount;

  WishlistResponseDtoBuilder() {
    WishlistResponseDto._defaults(this);
  }

  WishlistResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _items = $v.items.toBuilder();
      _itemCount = $v.itemCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WishlistResponseDto other) {
    _$v = other as _$WishlistResponseDto;
  }

  @override
  void update(void Function(WishlistResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WishlistResponseDto build() => _build();

  _$WishlistResponseDto _build() {
    _$WishlistResponseDto _$result;
    try {
      _$result = _$v ??
          _$WishlistResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'WishlistResponseDto', 'id'),
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'WishlistResponseDto', 'userId'),
            items: items.build(),
            itemCount: itemCount,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WishlistResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
