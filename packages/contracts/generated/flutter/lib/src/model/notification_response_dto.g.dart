// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NotificationResponseDto extends NotificationResponseDto {
  @override
  final String id;
  @override
  final String channel;
  @override
  final String eventType;
  @override
  final String title;
  @override
  final String status;
  @override
  final String deduplicationKey;
  @override
  final num attempts;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String? userId;
  @override
  final String? recipientEmail;
  @override
  final String? body;
  @override
  final String? relatedEntityType;
  @override
  final String? relatedEntityId;
  @override
  final String? lastError;
  @override
  final String? availableAt;
  @override
  final String? processedAt;
  @override
  final NotificationUserBriefDto? user;

  factory _$NotificationResponseDto(
          [void Function(NotificationResponseDtoBuilder)? updates]) =>
      (NotificationResponseDtoBuilder()..update(updates))._build();

  _$NotificationResponseDto._(
      {required this.id,
      required this.channel,
      required this.eventType,
      required this.title,
      required this.status,
      required this.deduplicationKey,
      required this.attempts,
      required this.createdAt,
      required this.updatedAt,
      this.userId,
      this.recipientEmail,
      this.body,
      this.relatedEntityType,
      this.relatedEntityId,
      this.lastError,
      this.availableAt,
      this.processedAt,
      this.user})
      : super._();
  @override
  NotificationResponseDto rebuild(
          void Function(NotificationResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationResponseDtoBuilder toBuilder() =>
      NotificationResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationResponseDto &&
        id == other.id &&
        channel == other.channel &&
        eventType == other.eventType &&
        title == other.title &&
        status == other.status &&
        deduplicationKey == other.deduplicationKey &&
        attempts == other.attempts &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        userId == other.userId &&
        recipientEmail == other.recipientEmail &&
        body == other.body &&
        relatedEntityType == other.relatedEntityType &&
        relatedEntityId == other.relatedEntityId &&
        lastError == other.lastError &&
        availableAt == other.availableAt &&
        processedAt == other.processedAt &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, channel.hashCode);
    _$hash = $jc(_$hash, eventType.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, deduplicationKey.hashCode);
    _$hash = $jc(_$hash, attempts.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, recipientEmail.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, relatedEntityType.hashCode);
    _$hash = $jc(_$hash, relatedEntityId.hashCode);
    _$hash = $jc(_$hash, lastError.hashCode);
    _$hash = $jc(_$hash, availableAt.hashCode);
    _$hash = $jc(_$hash, processedAt.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationResponseDto')
          ..add('id', id)
          ..add('channel', channel)
          ..add('eventType', eventType)
          ..add('title', title)
          ..add('status', status)
          ..add('deduplicationKey', deduplicationKey)
          ..add('attempts', attempts)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('userId', userId)
          ..add('recipientEmail', recipientEmail)
          ..add('body', body)
          ..add('relatedEntityType', relatedEntityType)
          ..add('relatedEntityId', relatedEntityId)
          ..add('lastError', lastError)
          ..add('availableAt', availableAt)
          ..add('processedAt', processedAt)
          ..add('user', user))
        .toString();
  }
}

class NotificationResponseDtoBuilder
    implements
        Builder<NotificationResponseDto, NotificationResponseDtoBuilder> {
  _$NotificationResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _channel;
  String? get channel => _$this._channel;
  set channel(String? channel) => _$this._channel = channel;

  String? _eventType;
  String? get eventType => _$this._eventType;
  set eventType(String? eventType) => _$this._eventType = eventType;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _deduplicationKey;
  String? get deduplicationKey => _$this._deduplicationKey;
  set deduplicationKey(String? deduplicationKey) =>
      _$this._deduplicationKey = deduplicationKey;

  num? _attempts;
  num? get attempts => _$this._attempts;
  set attempts(num? attempts) => _$this._attempts = attempts;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _recipientEmail;
  String? get recipientEmail => _$this._recipientEmail;
  set recipientEmail(String? recipientEmail) =>
      _$this._recipientEmail = recipientEmail;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  String? _relatedEntityType;
  String? get relatedEntityType => _$this._relatedEntityType;
  set relatedEntityType(String? relatedEntityType) =>
      _$this._relatedEntityType = relatedEntityType;

  String? _relatedEntityId;
  String? get relatedEntityId => _$this._relatedEntityId;
  set relatedEntityId(String? relatedEntityId) =>
      _$this._relatedEntityId = relatedEntityId;

  String? _lastError;
  String? get lastError => _$this._lastError;
  set lastError(String? lastError) => _$this._lastError = lastError;

  String? _availableAt;
  String? get availableAt => _$this._availableAt;
  set availableAt(String? availableAt) => _$this._availableAt = availableAt;

  String? _processedAt;
  String? get processedAt => _$this._processedAt;
  set processedAt(String? processedAt) => _$this._processedAt = processedAt;

  NotificationUserBriefDtoBuilder? _user;
  NotificationUserBriefDtoBuilder get user =>
      _$this._user ??= NotificationUserBriefDtoBuilder();
  set user(NotificationUserBriefDtoBuilder? user) => _$this._user = user;

  NotificationResponseDtoBuilder() {
    NotificationResponseDto._defaults(this);
  }

  NotificationResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _channel = $v.channel;
      _eventType = $v.eventType;
      _title = $v.title;
      _status = $v.status;
      _deduplicationKey = $v.deduplicationKey;
      _attempts = $v.attempts;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _userId = $v.userId;
      _recipientEmail = $v.recipientEmail;
      _body = $v.body;
      _relatedEntityType = $v.relatedEntityType;
      _relatedEntityId = $v.relatedEntityId;
      _lastError = $v.lastError;
      _availableAt = $v.availableAt;
      _processedAt = $v.processedAt;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationResponseDto other) {
    _$v = other as _$NotificationResponseDto;
  }

  @override
  void update(void Function(NotificationResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationResponseDto build() => _build();

  _$NotificationResponseDto _build() {
    _$NotificationResponseDto _$result;
    try {
      _$result = _$v ??
          _$NotificationResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'NotificationResponseDto', 'id'),
            channel: BuiltValueNullFieldError.checkNotNull(
                channel, r'NotificationResponseDto', 'channel'),
            eventType: BuiltValueNullFieldError.checkNotNull(
                eventType, r'NotificationResponseDto', 'eventType'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'NotificationResponseDto', 'title'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'NotificationResponseDto', 'status'),
            deduplicationKey: BuiltValueNullFieldError.checkNotNull(
                deduplicationKey,
                r'NotificationResponseDto',
                'deduplicationKey'),
            attempts: BuiltValueNullFieldError.checkNotNull(
                attempts, r'NotificationResponseDto', 'attempts'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'NotificationResponseDto', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'NotificationResponseDto', 'updatedAt'),
            userId: userId,
            recipientEmail: recipientEmail,
            body: body,
            relatedEntityType: relatedEntityType,
            relatedEntityId: relatedEntityId,
            lastError: lastError,
            availableAt: availableAt,
            processedAt: processedAt,
            user: _user?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NotificationResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
