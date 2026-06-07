// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_liveness_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HealthLivenessResponseDto extends HealthLivenessResponseDto {
  @override
  final String status;

  factory _$HealthLivenessResponseDto(
          [void Function(HealthLivenessResponseDtoBuilder)? updates]) =>
      (HealthLivenessResponseDtoBuilder()..update(updates))._build();

  _$HealthLivenessResponseDto._({required this.status}) : super._();
  @override
  HealthLivenessResponseDto rebuild(
          void Function(HealthLivenessResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthLivenessResponseDtoBuilder toBuilder() =>
      HealthLivenessResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthLivenessResponseDto && status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HealthLivenessResponseDto')
          ..add('status', status))
        .toString();
  }
}

class HealthLivenessResponseDtoBuilder
    implements
        Builder<HealthLivenessResponseDto, HealthLivenessResponseDtoBuilder> {
  _$HealthLivenessResponseDto? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  HealthLivenessResponseDtoBuilder() {
    HealthLivenessResponseDto._defaults(this);
  }

  HealthLivenessResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthLivenessResponseDto other) {
    _$v = other as _$HealthLivenessResponseDto;
  }

  @override
  void update(void Function(HealthLivenessResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HealthLivenessResponseDto build() => _build();

  _$HealthLivenessResponseDto _build() {
    final _$result = _$v ??
        _$HealthLivenessResponseDto._(
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'HealthLivenessResponseDto', 'status'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
