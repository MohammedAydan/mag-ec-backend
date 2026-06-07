// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_access_check_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminAccessCheckResponseDto extends AdminAccessCheckResponseDto {
  @override
  final bool allowed;

  factory _$AdminAccessCheckResponseDto(
          [void Function(AdminAccessCheckResponseDtoBuilder)? updates]) =>
      (AdminAccessCheckResponseDtoBuilder()..update(updates))._build();

  _$AdminAccessCheckResponseDto._({required this.allowed}) : super._();
  @override
  AdminAccessCheckResponseDto rebuild(
          void Function(AdminAccessCheckResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminAccessCheckResponseDtoBuilder toBuilder() =>
      AdminAccessCheckResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminAccessCheckResponseDto && allowed == other.allowed;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, allowed.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminAccessCheckResponseDto')
          ..add('allowed', allowed))
        .toString();
  }
}

class AdminAccessCheckResponseDtoBuilder
    implements
        Builder<AdminAccessCheckResponseDto,
            AdminAccessCheckResponseDtoBuilder> {
  _$AdminAccessCheckResponseDto? _$v;

  bool? _allowed;
  bool? get allowed => _$this._allowed;
  set allowed(bool? allowed) => _$this._allowed = allowed;

  AdminAccessCheckResponseDtoBuilder() {
    AdminAccessCheckResponseDto._defaults(this);
  }

  AdminAccessCheckResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _allowed = $v.allowed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminAccessCheckResponseDto other) {
    _$v = other as _$AdminAccessCheckResponseDto;
  }

  @override
  void update(void Function(AdminAccessCheckResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminAccessCheckResponseDto build() => _build();

  _$AdminAccessCheckResponseDto _build() {
    final _$result = _$v ??
        _$AdminAccessCheckResponseDto._(
          allowed: BuiltValueNullFieldError.checkNotNull(
              allowed, r'AdminAccessCheckResponseDto', 'allowed'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
