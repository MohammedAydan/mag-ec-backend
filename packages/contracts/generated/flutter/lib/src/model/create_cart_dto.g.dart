// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_cart_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateCartDto extends CreateCartDto {
  @override
  final String? guestToken;

  factory _$CreateCartDto([void Function(CreateCartDtoBuilder)? updates]) =>
      (CreateCartDtoBuilder()..update(updates))._build();

  _$CreateCartDto._({this.guestToken}) : super._();
  @override
  CreateCartDto rebuild(void Function(CreateCartDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateCartDtoBuilder toBuilder() => CreateCartDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateCartDto && guestToken == other.guestToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, guestToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateCartDto')
          ..add('guestToken', guestToken))
        .toString();
  }
}

class CreateCartDtoBuilder
    implements Builder<CreateCartDto, CreateCartDtoBuilder> {
  _$CreateCartDto? _$v;

  String? _guestToken;
  String? get guestToken => _$this._guestToken;
  set guestToken(String? guestToken) => _$this._guestToken = guestToken;

  CreateCartDtoBuilder() {
    CreateCartDto._defaults(this);
  }

  CreateCartDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _guestToken = $v.guestToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateCartDto other) {
    _$v = other as _$CreateCartDto;
  }

  @override
  void update(void Function(CreateCartDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateCartDto build() => _build();

  _$CreateCartDto _build() {
    final _$result = _$v ??
        _$CreateCartDto._(
          guestToken: guestToken,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
