// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_movement_actor_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StockMovementActorDto extends StockMovementActorDto {
  @override
  final String id;
  @override
  final String displayName;
  @override
  final String email;

  factory _$StockMovementActorDto(
          [void Function(StockMovementActorDtoBuilder)? updates]) =>
      (StockMovementActorDtoBuilder()..update(updates))._build();

  _$StockMovementActorDto._(
      {required this.id, required this.displayName, required this.email})
      : super._();
  @override
  StockMovementActorDto rebuild(
          void Function(StockMovementActorDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockMovementActorDtoBuilder toBuilder() =>
      StockMovementActorDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockMovementActorDto &&
        id == other.id &&
        displayName == other.displayName &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StockMovementActorDto')
          ..add('id', id)
          ..add('displayName', displayName)
          ..add('email', email))
        .toString();
  }
}

class StockMovementActorDtoBuilder
    implements Builder<StockMovementActorDto, StockMovementActorDtoBuilder> {
  _$StockMovementActorDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  StockMovementActorDtoBuilder() {
    StockMovementActorDto._defaults(this);
  }

  StockMovementActorDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _displayName = $v.displayName;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StockMovementActorDto other) {
    _$v = other as _$StockMovementActorDto;
  }

  @override
  void update(void Function(StockMovementActorDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockMovementActorDto build() => _build();

  _$StockMovementActorDto _build() {
    final _$result = _$v ??
        _$StockMovementActorDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'StockMovementActorDto', 'id'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'StockMovementActorDto', 'displayName'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'StockMovementActorDto', 'email'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
