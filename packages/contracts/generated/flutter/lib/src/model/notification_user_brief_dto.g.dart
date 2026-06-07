// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_user_brief_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NotificationUserBriefDto extends NotificationUserBriefDto {
  @override
  final String id;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String userType;

  factory _$NotificationUserBriefDto(
          [void Function(NotificationUserBriefDtoBuilder)? updates]) =>
      (NotificationUserBriefDtoBuilder()..update(updates))._build();

  _$NotificationUserBriefDto._(
      {required this.id,
      required this.email,
      required this.displayName,
      required this.userType})
      : super._();
  @override
  NotificationUserBriefDto rebuild(
          void Function(NotificationUserBriefDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationUserBriefDtoBuilder toBuilder() =>
      NotificationUserBriefDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationUserBriefDto &&
        id == other.id &&
        email == other.email &&
        displayName == other.displayName &&
        userType == other.userType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, userType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationUserBriefDto')
          ..add('id', id)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('userType', userType))
        .toString();
  }
}

class NotificationUserBriefDtoBuilder
    implements
        Builder<NotificationUserBriefDto, NotificationUserBriefDtoBuilder> {
  _$NotificationUserBriefDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _userType;
  String? get userType => _$this._userType;
  set userType(String? userType) => _$this._userType = userType;

  NotificationUserBriefDtoBuilder() {
    NotificationUserBriefDto._defaults(this);
  }

  NotificationUserBriefDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _displayName = $v.displayName;
      _userType = $v.userType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationUserBriefDto other) {
    _$v = other as _$NotificationUserBriefDto;
  }

  @override
  void update(void Function(NotificationUserBriefDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationUserBriefDto build() => _build();

  _$NotificationUserBriefDto _build() {
    final _$result = _$v ??
        _$NotificationUserBriefDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'NotificationUserBriefDto', 'id'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'NotificationUserBriefDto', 'email'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'NotificationUserBriefDto', 'displayName'),
          userType: BuiltValueNullFieldError.checkNotNull(
              userType, r'NotificationUserBriefDto', 'userType'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
