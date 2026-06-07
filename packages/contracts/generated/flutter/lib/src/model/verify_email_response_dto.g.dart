// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VerifyEmailResponseDto extends VerifyEmailResponseDto {
  @override
  final bool verified;

  factory _$VerifyEmailResponseDto(
          [void Function(VerifyEmailResponseDtoBuilder)? updates]) =>
      (VerifyEmailResponseDtoBuilder()..update(updates))._build();

  _$VerifyEmailResponseDto._({required this.verified}) : super._();
  @override
  VerifyEmailResponseDto rebuild(
          void Function(VerifyEmailResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerifyEmailResponseDtoBuilder toBuilder() =>
      VerifyEmailResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerifyEmailResponseDto && verified == other.verified;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, verified.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VerifyEmailResponseDto')
          ..add('verified', verified))
        .toString();
  }
}

class VerifyEmailResponseDtoBuilder
    implements Builder<VerifyEmailResponseDto, VerifyEmailResponseDtoBuilder> {
  _$VerifyEmailResponseDto? _$v;

  bool? _verified;
  bool? get verified => _$this._verified;
  set verified(bool? verified) => _$this._verified = verified;

  VerifyEmailResponseDtoBuilder() {
    VerifyEmailResponseDto._defaults(this);
  }

  VerifyEmailResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _verified = $v.verified;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerifyEmailResponseDto other) {
    _$v = other as _$VerifyEmailResponseDto;
  }

  @override
  void update(void Function(VerifyEmailResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerifyEmailResponseDto build() => _build();

  _$VerifyEmailResponseDto _build() {
    final _$result = _$v ??
        _$VerifyEmailResponseDto._(
          verified: BuiltValueNullFieldError.checkNotNull(
              verified, r'VerifyEmailResponseDto', 'verified'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
