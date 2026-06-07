// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_summary_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StaffSummaryDto extends StaffSummaryDto {
  @override
  final String id;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String status;

  factory _$StaffSummaryDto([void Function(StaffSummaryDtoBuilder)? updates]) =>
      (StaffSummaryDtoBuilder()..update(updates))._build();

  _$StaffSummaryDto._(
      {required this.id,
      required this.email,
      required this.displayName,
      required this.status})
      : super._();
  @override
  StaffSummaryDto rebuild(void Function(StaffSummaryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StaffSummaryDtoBuilder toBuilder() => StaffSummaryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StaffSummaryDto &&
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
    return (newBuiltValueToStringHelper(r'StaffSummaryDto')
          ..add('id', id)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('status', status))
        .toString();
  }
}

class StaffSummaryDtoBuilder
    implements Builder<StaffSummaryDto, StaffSummaryDtoBuilder> {
  _$StaffSummaryDto? _$v;

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

  StaffSummaryDtoBuilder() {
    StaffSummaryDto._defaults(this);
  }

  StaffSummaryDtoBuilder get _$this {
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
  void replace(StaffSummaryDto other) {
    _$v = other as _$StaffSummaryDto;
  }

  @override
  void update(void Function(StaffSummaryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StaffSummaryDto build() => _build();

  _$StaffSummaryDto _build() {
    final _$result = _$v ??
        _$StaffSummaryDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'StaffSummaryDto', 'id'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'StaffSummaryDto', 'email'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'StaffSummaryDto', 'displayName'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'StaffSummaryDto', 'status'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
