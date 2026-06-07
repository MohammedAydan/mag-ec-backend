// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_request_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VerificationRequestResponseDto extends VerificationRequestResponseDto {
  @override
  final bool accepted;

  factory _$VerificationRequestResponseDto(
          [void Function(VerificationRequestResponseDtoBuilder)? updates]) =>
      (VerificationRequestResponseDtoBuilder()..update(updates))._build();

  _$VerificationRequestResponseDto._({required this.accepted}) : super._();
  @override
  VerificationRequestResponseDto rebuild(
          void Function(VerificationRequestResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerificationRequestResponseDtoBuilder toBuilder() =>
      VerificationRequestResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerificationRequestResponseDto &&
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
    return (newBuiltValueToStringHelper(r'VerificationRequestResponseDto')
          ..add('accepted', accepted))
        .toString();
  }
}

class VerificationRequestResponseDtoBuilder
    implements
        Builder<VerificationRequestResponseDto,
            VerificationRequestResponseDtoBuilder> {
  _$VerificationRequestResponseDto? _$v;

  bool? _accepted;
  bool? get accepted => _$this._accepted;
  set accepted(bool? accepted) => _$this._accepted = accepted;

  VerificationRequestResponseDtoBuilder() {
    VerificationRequestResponseDto._defaults(this);
  }

  VerificationRequestResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accepted = $v.accepted;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerificationRequestResponseDto other) {
    _$v = other as _$VerificationRequestResponseDto;
  }

  @override
  void update(void Function(VerificationRequestResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerificationRequestResponseDto build() => _build();

  _$VerificationRequestResponseDto _build() {
    final _$result = _$v ??
        _$VerificationRequestResponseDto._(
          accepted: BuiltValueNullFieldError.checkNotNull(
              accepted, r'VerificationRequestResponseDto', 'accepted'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
