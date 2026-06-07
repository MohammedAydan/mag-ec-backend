// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_indicator_detail_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HealthIndicatorDetailDto extends HealthIndicatorDetailDto {
  @override
  final String status;
  @override
  final String? message;
  @override
  final String? mode;
  @override
  final bool? redisRequired;

  factory _$HealthIndicatorDetailDto(
          [void Function(HealthIndicatorDetailDtoBuilder)? updates]) =>
      (HealthIndicatorDetailDtoBuilder()..update(updates))._build();

  _$HealthIndicatorDetailDto._(
      {required this.status, this.message, this.mode, this.redisRequired})
      : super._();
  @override
  HealthIndicatorDetailDto rebuild(
          void Function(HealthIndicatorDetailDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthIndicatorDetailDtoBuilder toBuilder() =>
      HealthIndicatorDetailDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthIndicatorDetailDto &&
        status == other.status &&
        message == other.message &&
        mode == other.mode &&
        redisRequired == other.redisRequired;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, mode.hashCode);
    _$hash = $jc(_$hash, redisRequired.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HealthIndicatorDetailDto')
          ..add('status', status)
          ..add('message', message)
          ..add('mode', mode)
          ..add('redisRequired', redisRequired))
        .toString();
  }
}

class HealthIndicatorDetailDtoBuilder
    implements
        Builder<HealthIndicatorDetailDto, HealthIndicatorDetailDtoBuilder> {
  _$HealthIndicatorDetailDto? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _mode;
  String? get mode => _$this._mode;
  set mode(String? mode) => _$this._mode = mode;

  bool? _redisRequired;
  bool? get redisRequired => _$this._redisRequired;
  set redisRequired(bool? redisRequired) =>
      _$this._redisRequired = redisRequired;

  HealthIndicatorDetailDtoBuilder() {
    HealthIndicatorDetailDto._defaults(this);
  }

  HealthIndicatorDetailDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _message = $v.message;
      _mode = $v.mode;
      _redisRequired = $v.redisRequired;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthIndicatorDetailDto other) {
    _$v = other as _$HealthIndicatorDetailDto;
  }

  @override
  void update(void Function(HealthIndicatorDetailDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HealthIndicatorDetailDto build() => _build();

  _$HealthIndicatorDetailDto _build() {
    final _$result = _$v ??
        _$HealthIndicatorDetailDto._(
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'HealthIndicatorDetailDto', 'status'),
          message: message,
          mode: mode,
          redisRequired: redisRequired,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
