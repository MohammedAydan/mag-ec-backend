// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_status_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StaffStatusResponseDto extends StaffStatusResponseDto {
  @override
  final String id;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String status;

  factory _$StaffStatusResponseDto(
          [void Function(StaffStatusResponseDtoBuilder)? updates]) =>
      (StaffStatusResponseDtoBuilder()..update(updates))._build();

  _$StaffStatusResponseDto._(
      {required this.id,
      required this.email,
      required this.displayName,
      required this.status})
      : super._();
  @override
  StaffStatusResponseDto rebuild(
          void Function(StaffStatusResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StaffStatusResponseDtoBuilder toBuilder() =>
      StaffStatusResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StaffStatusResponseDto &&
        id == other.id &&
        email == other.email &&
        displayName == other.displayName &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StaffStatusResponseDto')
          ..add('id', id)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('status', status))
        .toString();
  }
}

class StaffStatusResponseDtoBuilder
    implements Builder<StaffStatusResponseDto, StaffStatusResponseDtoBuilder> {
  _$StaffStatusResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  StaffStatusResponseDtoBuilder() {
    StaffStatusResponseDto._defaults(this);
  }

  StaffStatusResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _displayName = $v.displayName;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StaffStatusResponseDto other) {
    _$v = other as _$StaffStatusResponseDto;
  }

  @override
  void update(void Function(StaffStatusResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StaffStatusResponseDto build() => _build();

  _$StaffStatusResponseDto _build() {
    final _$result = _$v ??
        _$StaffStatusResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'StaffStatusResponseDto', 'id'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'StaffStatusResponseDto', 'email'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'StaffStatusResponseDto', 'displayName'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'StaffStatusResponseDto', 'status'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
