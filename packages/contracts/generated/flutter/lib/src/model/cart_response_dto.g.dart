// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CartResponseDto extends CartResponseDto {
  @override
  final String id;
  @override
  final String status;
  @override
  final BuiltList<CartItemResponseDto> items;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String? guestToken;
  @override
  final String? couponCode;
  @override
  final String? userId;

  factory _$CartResponseDto([void Function(CartResponseDtoBuilder)? updates]) =>
      (CartResponseDtoBuilder()..update(updates))._build();

  _$CartResponseDto._(
      {required this.id,
      required this.status,
      required this.items,
      required this.createdAt,
      required this.updatedAt,
      this.guestToken,
      this.couponCode,
      this.userId})
      : super._();
  @override
  CartResponseDto rebuild(void Function(CartResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CartResponseDtoBuilder toBuilder() => CartResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartResponseDto &&
        id == other.id &&
        status == other.status &&
        items == other.items &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        guestToken == other.guestToken &&
        couponCode == other.couponCode &&
        userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, guestToken.hashCode);
    _$hash = $jc(_$hash, couponCode.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CartResponseDto')
          ..add('id', id)
          ..add('status', status)
          ..add('items', items)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('guestToken', guestToken)
          ..add('couponCode', couponCode)
          ..add('userId', userId))
        .toString();
  }
}

class CartResponseDtoBuilder
    implements Builder<CartResponseDto, CartResponseDtoBuilder> {
  _$CartResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  ListBuilder<CartItemResponseDto>? _items;
  ListBuilder<CartItemResponseDto> get items =>
      _$this._items ??= ListBuilder<CartItemResponseDto>();
  set items(ListBuilder<CartItemResponseDto>? items) => _$this._items = items;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  String? _guestToken;
  String? get guestToken => _$this._guestToken;
  set guestToken(String? guestToken) => _$this._guestToken = guestToken;

  String? _couponCode;
  String? get couponCode => _$this._couponCode;
  set couponCode(String? couponCode) => _$this._couponCode = couponCode;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  CartResponseDtoBuilder() {
    CartResponseDto._defaults(this);
  }

  CartResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _status = $v.status;
      _items = $v.items.toBuilder();
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _guestToken = $v.guestToken;
      _couponCode = $v.couponCode;
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CartResponseDto other) {
    _$v = other as _$CartResponseDto;
  }

  @override
  void update(void Function(CartResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CartResponseDto build() => _build();

  _$CartResponseDto _build() {
    _$CartResponseDto _$result;
    try {
      _$result = _$v ??
          _$CartResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CartResponseDto', 'id'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'CartResponseDto', 'status'),
            items: items.build(),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'CartResponseDto', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'CartResponseDto', 'updatedAt'),
            guestToken: guestToken,
            couponCode: couponCode,
            userId: userId,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CartResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
