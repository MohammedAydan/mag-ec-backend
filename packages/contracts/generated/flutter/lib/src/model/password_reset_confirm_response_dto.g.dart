// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_confirm_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PasswordResetConfirmResponseDto
    extends PasswordResetConfirmResponseDto {
  @override
  final bool passwordReset;

  factory _$PasswordResetConfirmResponseDto(
          [void Function(PasswordResetConfirmResponseDtoBuilder)? updates]) =>
      (PasswordResetConfirmResponseDtoBuilder()..update(updates))._build();

  _$PasswordResetConfirmResponseDto._({required this.passwordReset})
      : super._();
  @override
  PasswordResetConfirmResponseDto rebuild(
          void Function(PasswordResetConfirmResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasswordResetConfirmResponseDtoBuilder toBuilder() =>
      PasswordResetConfirmResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PasswordResetConfirmResponseDto &&
        passwordReset == other.passwordReset;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, passwordReset.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PasswordResetConfirmResponseDto')
          ..add('passwordReset', passwordReset))
        .toString();
  }
}

class PasswordResetConfirmResponseDtoBuilder
    implements
        Builder<PasswordResetConfirmResponseDto,
            PasswordResetConfirmResponseDtoBuilder> {
  _$PasswordResetConfirmResponseDto? _$v;

  bool? _passwordReset;
  bool? get passwordReset => _$this._passwordReset;
  set passwordReset(bool? passwordReset) =>
      _$this._passwordReset = passwordReset;

  PasswordResetConfirmResponseDtoBuilder() {
    PasswordResetConfirmResponseDto._defaults(this);
  }

  PasswordResetConfirmResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _passwordReset = $v.passwordReset;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PasswordResetConfirmResponseDto other) {
    _$v = other as _$PasswordResetConfirmResponseDto;
  }

  @override
  void update(void Function(PasswordResetConfirmResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PasswordResetConfirmResponseDto build() => _build();

  _$PasswordResetConfirmResponseDto _build() {
    final _$result = _$v ??
        _$PasswordResetConfirmResponseDto._(
          passwordReset: BuiltValueNullFieldError.checkNotNull(passwordReset,
              r'PasswordResetConfirmResponseDto', 'passwordReset'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
