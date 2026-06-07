// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_customer_summary_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminCustomerSummaryDto extends AdminCustomerSummaryDto {
  @override
  final String id;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String status;
  @override
  final String createdAt;
  @override
  final String? lastLoginAt;

  factory _$AdminCustomerSummaryDto(
          [void Function(AdminCustomerSummaryDtoBuilder)? updates]) =>
      (AdminCustomerSummaryDtoBuilder()..update(updates))._build();

  _$AdminCustomerSummaryDto._(
      {required this.id,
      required this.email,
      required this.displayName,
      required this.status,
      required this.createdAt,
      this.lastLoginAt})
      : super._();
  @override
  AdminCustomerSummaryDto rebuild(
          void Function(AdminCustomerSummaryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminCustomerSummaryDtoBuilder toBuilder() =>
      AdminCustomerSummaryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminCustomerSummaryDto &&
        id == other.id &&
        email == other.email &&
        displayName == other.displayName &&
        status == other.status &&
        createdAt == other.createdAt &&
        lastLoginAt == other.lastLoginAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, lastLoginAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminCustomerSummaryDto')
          ..add('id', id)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('status', status)
          ..add('createdAt', createdAt)
          ..add('lastLoginAt', lastLoginAt))
        .toString();
  }
}

class AdminCustomerSummaryDtoBuilder
    implements
        Builder<AdminCustomerSummaryDto, AdminCustomerSummaryDtoBuilder> {
  _$AdminCustomerSummaryDto? _$v;

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

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _lastLoginAt;
  String? get lastLoginAt => _$this._lastLoginAt;
  set lastLoginAt(String? lastLoginAt) => _$this._lastLoginAt = lastLoginAt;

  AdminCustomerSummaryDtoBuilder() {
    AdminCustomerSummaryDto._defaults(this);
  }

  AdminCustomerSummaryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _displayName = $v.displayName;
      _status = $v.status;
      _createdAt = $v.createdAt;
      _lastLoginAt = $v.lastLoginAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminCustomerSummaryDto other) {
    _$v = other as _$AdminCustomerSummaryDto;
  }

  @override
  void update(void Function(AdminCustomerSummaryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminCustomerSummaryDto build() => _build();

  _$AdminCustomerSummaryDto _build() {
    final _$result = _$v ??
        _$AdminCustomerSummaryDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'AdminCustomerSummaryDto', 'id'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'AdminCustomerSummaryDto', 'email'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'AdminCustomerSummaryDto', 'displayName'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'AdminCustomerSummaryDto', 'status'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'AdminCustomerSummaryDto', 'createdAt'),
          lastLoginAt: lastLoginAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
