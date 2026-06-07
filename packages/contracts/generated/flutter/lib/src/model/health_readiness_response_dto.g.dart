// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_readiness_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HealthReadinessResponseDto extends HealthReadinessResponseDto {
  @override
  final String status;
  @override
  final BuiltMap<String, HealthIndicatorDetailDto> details;
  @override
  final BuiltMap<String, HealthIndicatorDetailDto>? info;
  @override
  final BuiltMap<String, HealthIndicatorDetailDto>? error;

  factory _$HealthReadinessResponseDto(
          [void Function(HealthReadinessResponseDtoBuilder)? updates]) =>
      (HealthReadinessResponseDtoBuilder()..update(updates))._build();

  _$HealthReadinessResponseDto._(
      {required this.status, required this.details, this.info, this.error})
      : super._();
  @override
  HealthReadinessResponseDto rebuild(
          void Function(HealthReadinessResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthReadinessResponseDtoBuilder toBuilder() =>
      HealthReadinessResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthReadinessResponseDto &&
        status == other.status &&
        details == other.details &&
        info == other.info &&
        error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jc(_$hash, info.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HealthReadinessResponseDto')
          ..add('status', status)
          ..add('details', details)
          ..add('info', info)
          ..add('error', error))
        .toString();
  }
}

class HealthReadinessResponseDtoBuilder
    implements
        Builder<HealthReadinessResponseDto, HealthReadinessResponseDtoBuilder> {
  _$HealthReadinessResponseDto? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  MapBuilder<String, HealthIndicatorDetailDto>? _details;
  MapBuilder<String, HealthIndicatorDetailDto> get details =>
      _$this._details ??= MapBuilder<String, HealthIndicatorDetailDto>();
  set details(MapBuilder<String, HealthIndicatorDetailDto>? details) =>
      _$this._details = details;

  MapBuilder<String, HealthIndicatorDetailDto>? _info;
  MapBuilder<String, HealthIndicatorDetailDto> get info =>
      _$this._info ??= MapBuilder<String, HealthIndicatorDetailDto>();
  set info(MapBuilder<String, HealthIndicatorDetailDto>? info) =>
      _$this._info = info;

  MapBuilder<String, HealthIndicatorDetailDto>? _error;
  MapBuilder<String, HealthIndicatorDetailDto> get error =>
      _$this._error ??= MapBuilder<String, HealthIndicatorDetailDto>();
  set error(MapBuilder<String, HealthIndicatorDetailDto>? error) =>
      _$this._error = error;

  HealthReadinessResponseDtoBuilder() {
    HealthReadinessResponseDto._defaults(this);
  }

  HealthReadinessResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _details = $v.details.toBuilder();
      _info = $v.info?.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthReadinessResponseDto other) {
    _$v = other as _$HealthReadinessResponseDto;
  }

  @override
  void update(void Function(HealthReadinessResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HealthReadinessResponseDto build() => _build();

  _$HealthReadinessResponseDto _build() {
    _$HealthReadinessResponseDto _$result;
    try {
      _$result = _$v ??
          _$HealthReadinessResponseDto._(
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'HealthReadinessResponseDto', 'status'),
            details: details.build(),
            info: _info?.build(),
            error: _error?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'details';
        details.build();
        _$failedField = 'info';
        _info?.build();
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'HealthReadinessResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
