// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_reservation_user_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StockReservationUserDto extends StockReservationUserDto {
  @override
  final String id;
  @override
  final String email;
  @override
  final String displayName;

  factory _$StockReservationUserDto(
          [void Function(StockReservationUserDtoBuilder)? updates]) =>
      (StockReservationUserDtoBuilder()..update(updates))._build();

  _$StockReservationUserDto._(
      {required this.id, required this.email, required this.displayName})
      : super._();
  @override
  StockReservationUserDto rebuild(
          void Function(StockReservationUserDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockReservationUserDtoBuilder toBuilder() =>
      StockReservationUserDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockReservationUserDto &&
        id == other.id &&
        email == other.email &&
        displayName == other.displayName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StockReservationUserDto')
          ..add('id', id)
          ..add('email', email)
          ..add('displayName', displayName))
        .toString();
  }
}

class StockReservationUserDtoBuilder
    implements
        Builder<StockReservationUserDto, StockReservationUserDtoBuilder> {
  _$StockReservationUserDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  StockReservationUserDtoBuilder() {
    StockReservationUserDto._defaults(this);
  }

  StockReservationUserDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _displayName = $v.displayName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StockReservationUserDto other) {
    _$v = other as _$StockReservationUserDto;
  }

  @override
  void update(void Function(StockReservationUserDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockReservationUserDto build() => _build();

  _$StockReservationUserDto _build() {
    final _$result = _$v ??
        _$StockReservationUserDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'StockReservationUserDto', 'id'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'StockReservationUserDto', 'email'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'StockReservationUserDto', 'displayName'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
