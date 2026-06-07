// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_request_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PasswordResetRequestResponseDto
    extends PasswordResetRequestResponseDto {
  @override
  final bool accepted;

  factory _$PasswordResetRequestResponseDto(
          [void Function(PasswordResetRequestResponseDtoBuilder)? updates]) =>
      (PasswordResetRequestResponseDtoBuilder()..update(updates))._build();

  _$PasswordResetRequestResponseDto._({required this.accepted}) : super._();
  @override
  PasswordResetRequestResponseDto rebuild(
          void Function(PasswordResetRequestResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasswordResetRequestResponseDtoBuilder toBuilder() =>
      PasswordResetRequestResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PasswordResetRequestResponseDto &&
        accepted == other.accepted;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accepted.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PasswordResetRequestResponseDto')
          ..add('accepted', accepted))
        .toString();
  }
}

class PasswordResetRequestResponseDtoBuilder
    implements
        Builder<PasswordResetRequestResponseDto,
            PasswordResetRequestResponseDtoBuilder> {
  _$PasswordResetRequestResponseDto? _$v;

  bool? _accepted;
  bool? get accepted => _$this._accepted;
  set accepted(bool? accepted) => _$this._accepted = accepted;

  PasswordResetRequestResponseDtoBuilder() {
    PasswordResetRequestResponseDto._defaults(this);
  }

  PasswordResetRequestResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accepted = $v.accepted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PasswordResetRequestResponseDto other) {
    _$v = other as _$PasswordResetRequestResponseDto;
  }

  @override
  void update(void Function(PasswordResetRequestResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PasswordResetRequestResponseDto build() => _build();

  _$PasswordResetRequestResponseDto _build() {
    final _$result = _$v ??
        _$PasswordResetRequestResponseDto._(
          accepted: BuiltValueNullFieldError.checkNotNull(
              accepted, r'PasswordResetRequestResponseDto', 'accepted'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
