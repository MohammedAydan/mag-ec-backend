// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unregister_push_device_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UnregisterPushDeviceResponseDto
    extends UnregisterPushDeviceResponseDto {
  @override
  final bool removed;

  factory _$UnregisterPushDeviceResponseDto(
          [void Function(UnregisterPushDeviceResponseDtoBuilder)? updates]) =>
      (UnregisterPushDeviceResponseDtoBuilder()..update(updates))._build();

  _$UnregisterPushDeviceResponseDto._({required this.removed}) : super._();
  @override
  UnregisterPushDeviceResponseDto rebuild(
          void Function(UnregisterPushDeviceResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnregisterPushDeviceResponseDtoBuilder toBuilder() =>
      UnregisterPushDeviceResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnregisterPushDeviceResponseDto && removed == other.removed;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, removed.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UnregisterPushDeviceResponseDto')
          ..add('removed', removed))
        .toString();
  }
}

class UnregisterPushDeviceResponseDtoBuilder
    implements
        Builder<UnregisterPushDeviceResponseDto,
            UnregisterPushDeviceResponseDtoBuilder> {
  _$UnregisterPushDeviceResponseDto? _$v;

  bool? _removed;
  bool? get removed => _$this._removed;
  set removed(bool? removed) => _$this._removed = removed;

  UnregisterPushDeviceResponseDtoBuilder() {
    UnregisterPushDeviceResponseDto._defaults(this);
  }

  UnregisterPushDeviceResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _removed = $v.removed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnregisterPushDeviceResponseDto other) {
    _$v = other as _$UnregisterPushDeviceResponseDto;
  }

  @override
  void update(void Function(UnregisterPushDeviceResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UnregisterPushDeviceResponseDto build() => _build();

  _$UnregisterPushDeviceResponseDto _build() {
    final _$result = _$v ??
        _$UnregisterPushDeviceResponseDto._(
          removed: BuiltValueNullFieldError.checkNotNull(
              removed, r'UnregisterPushDeviceResponseDto', 'removed'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
