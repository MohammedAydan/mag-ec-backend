// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_webhook_event_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaymentWebhookEventResponseDto extends PaymentWebhookEventResponseDto {
  @override
  final String id;
  @override
  final String provider;
  @override
  final String status;
  @override
  final String receivedAt;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String? externalEventId;
  @override
  final String? eventType;
  @override
  final String? paymentAttemptId;
  @override
  final String? orderId;
  @override
  final String? processingError;
  @override
  final String? processedAt;

  factory _$PaymentWebhookEventResponseDto(
          [void Function(PaymentWebhookEventResponseDtoBuilder)? updates]) =>
      (PaymentWebhookEventResponseDtoBuilder()..update(updates))._build();

  _$PaymentWebhookEventResponseDto._(
      {required this.id,
      required this.provider,
      required this.status,
      required this.receivedAt,
      required this.createdAt,
      required this.updatedAt,
      this.externalEventId,
      this.eventType,
      this.paymentAttemptId,
      this.orderId,
      this.processingError,
      this.processedAt})
      : super._();
  @override
  PaymentWebhookEventResponseDto rebuild(
          void Function(PaymentWebhookEventResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentWebhookEventResponseDtoBuilder toBuilder() =>
      PaymentWebhookEventResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentWebhookEventResponseDto &&
        id == other.id &&
        provider == other.provider &&
        status == other.status &&
        receivedAt == other.receivedAt &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        externalEventId == other.externalEventId &&
        eventType == other.eventType &&
        paymentAttemptId == other.paymentAttemptId &&
        orderId == other.orderId &&
        processingError == other.processingError &&
        processedAt == other.processedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, provider.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, receivedAt.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, externalEventId.hashCode);
    _$hash = $jc(_$hash, eventType.hashCode);
    _$hash = $jc(_$hash, paymentAttemptId.hashCode);
    _$hash = $jc(_$hash, orderId.hashCode);
    _$hash = $jc(_$hash, processingError.hashCode);
    _$hash = $jc(_$hash, processedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentWebhookEventResponseDto')
          ..add('id', id)
          ..add('provider', provider)
          ..add('status', status)
          ..add('receivedAt', receivedAt)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('externalEventId', externalEventId)
          ..add('eventType', eventType)
          ..add('paymentAttemptId', paymentAttemptId)
          ..add('orderId', orderId)
          ..add('processingError', processingError)
          ..add('processedAt', processedAt))
        .toString();
  }
}

class PaymentWebhookEventResponseDtoBuilder
    implements
        Builder<PaymentWebhookEventResponseDto,
            PaymentWebhookEventResponseDtoBuilder> {
  _$PaymentWebhookEventResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _provider;
  String? get provider => _$this._provider;
  set provider(String? provider) => _$this._provider = provider;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _receivedAt;
  String? get receivedAt => _$this._receivedAt;
  set receivedAt(String? receivedAt) => _$this._receivedAt = receivedAt;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  String? _externalEventId;
  String? get externalEventId => _$this._externalEventId;
  set externalEventId(String? externalEventId) =>
      _$this._externalEventId = externalEventId;

  String? _eventType;
  String? get eventType => _$this._eventType;
  set eventType(String? eventType) => _$this._eventType = eventType;

  String? _paymentAttemptId;
  String? get paymentAttemptId => _$this._paymentAttemptId;
  set paymentAttemptId(String? paymentAttemptId) =>
      _$this._paymentAttemptId = paymentAttemptId;

  String? _orderId;
  String? get orderId => _$this._orderId;
  set orderId(String? orderId) => _$this._orderId = orderId;

  String? _processingError;
  String? get processingError => _$this._processingError;
  set processingError(String? processingError) =>
      _$this._processingError = processingError;

  String? _processedAt;
  String? get processedAt => _$this._processedAt;
  set processedAt(String? processedAt) => _$this._processedAt = processedAt;

  PaymentWebhookEventResponseDtoBuilder() {
    PaymentWebhookEventResponseDto._defaults(this);
  }

  PaymentWebhookEventResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _provider = $v.provider;
      _status = $v.status;
      _receivedAt = $v.receivedAt;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _externalEventId = $v.externalEventId;
      _eventType = $v.eventType;
      _paymentAttemptId = $v.paymentAttemptId;
      _orderId = $v.orderId;
      _processingError = $v.processingError;
      _processedAt = $v.processedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentWebhookEventResponseDto other) {
    _$v = other as _$PaymentWebhookEventResponseDto;
  }

  @override
  void update(void Function(PaymentWebhookEventResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaymentWebhookEventResponseDto build() => _build();

  _$PaymentWebhookEventResponseDto _build() {
    final _$result = _$v ??
        _$PaymentWebhookEventResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'PaymentWebhookEventResponseDto', 'id'),
          provider: BuiltValueNullFieldError.checkNotNull(
              provider, r'PaymentWebhookEventResponseDto', 'provider'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'PaymentWebhookEventResponseDto', 'status'),
          receivedAt: BuiltValueNullFieldError.checkNotNull(
              receivedAt, r'PaymentWebhookEventResponseDto', 'receivedAt'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'PaymentWebhookEventResponseDto', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'PaymentWebhookEventResponseDto', 'updatedAt'),
          externalEventId: externalEventId,
          eventType: eventType,
          paymentAttemptId: paymentAttemptId,
          orderId: orderId,
          processingError: processingError,
          processedAt: processedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
