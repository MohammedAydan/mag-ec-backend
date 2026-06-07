// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_attempt_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaymentAttemptResponseDto extends PaymentAttemptResponseDto {
  @override
  final String id;
  @override
  final String orderId;
  @override
  final String provider;
  @override
  final String method;
  @override
  final String status;
  @override
  final String currencyCode;
  @override
  final num amount;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final OrderBriefDto order;
  @override
  final String? providerPaymentId;
  @override
  final String? providerIntentStatus;
  @override
  final String? providerReference;
  @override
  final String? lastErrorCode;
  @override
  final String? lastErrorMessage;
  @override
  final String? succeededAt;
  @override
  final String? failedAt;

  factory _$PaymentAttemptResponseDto(
          [void Function(PaymentAttemptResponseDtoBuilder)? updates]) =>
      (PaymentAttemptResponseDtoBuilder()..update(updates))._build();

  _$PaymentAttemptResponseDto._(
      {required this.id,
      required this.orderId,
      required this.provider,
      required this.method,
      required this.status,
      required this.currencyCode,
      required this.amount,
      required this.createdAt,
      required this.updatedAt,
      required this.order,
      this.providerPaymentId,
      this.providerIntentStatus,
      this.providerReference,
      this.lastErrorCode,
      this.lastErrorMessage,
      this.succeededAt,
      this.failedAt})
      : super._();
  @override
  PaymentAttemptResponseDto rebuild(
          void Function(PaymentAttemptResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentAttemptResponseDtoBuilder toBuilder() =>
      PaymentAttemptResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentAttemptResponseDto &&
        id == other.id &&
        orderId == other.orderId &&
        provider == other.provider &&
        method == other.method &&
        status == other.status &&
        currencyCode == other.currencyCode &&
        amount == other.amount &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        order == other.order &&
        providerPaymentId == other.providerPaymentId &&
        providerIntentStatus == other.providerIntentStatus &&
        providerReference == other.providerReference &&
        lastErrorCode == other.lastErrorCode &&
        lastErrorMessage == other.lastErrorMessage &&
        succeededAt == other.succeededAt &&
        failedAt == other.failedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, orderId.hashCode);
    _$hash = $jc(_$hash, provider.hashCode);
    _$hash = $jc(_$hash, method.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jc(_$hash, providerPaymentId.hashCode);
    _$hash = $jc(_$hash, providerIntentStatus.hashCode);
    _$hash = $jc(_$hash, providerReference.hashCode);
    _$hash = $jc(_$hash, lastErrorCode.hashCode);
    _$hash = $jc(_$hash, lastErrorMessage.hashCode);
    _$hash = $jc(_$hash, succeededAt.hashCode);
    _$hash = $jc(_$hash, failedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentAttemptResponseDto')
          ..add('id', id)
          ..add('orderId', orderId)
          ..add('provider', provider)
          ..add('method', method)
          ..add('status', status)
          ..add('currencyCode', currencyCode)
          ..add('amount', amount)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('order', order)
          ..add('providerPaymentId', providerPaymentId)
          ..add('providerIntentStatus', providerIntentStatus)
          ..add('providerReference', providerReference)
          ..add('lastErrorCode', lastErrorCode)
          ..add('lastErrorMessage', lastErrorMessage)
          ..add('succeededAt', succeededAt)
          ..add('failedAt', failedAt))
        .toString();
  }
}

class PaymentAttemptResponseDtoBuilder
    implements
        Builder<PaymentAttemptResponseDto, PaymentAttemptResponseDtoBuilder> {
  _$PaymentAttemptResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _orderId;
  String? get orderId => _$this._orderId;
  set orderId(String? orderId) => _$this._orderId = orderId;

  String? _provider;
  String? get provider => _$this._provider;
  set provider(String? provider) => _$this._provider = provider;

  String? _method;
  String? get method => _$this._method;
  set method(String? method) => _$this._method = method;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  OrderBriefDtoBuilder? _order;
  OrderBriefDtoBuilder get order => _$this._order ??= OrderBriefDtoBuilder();
  set order(OrderBriefDtoBuilder? order) => _$this._order = order;

  String? _providerPaymentId;
  String? get providerPaymentId => _$this._providerPaymentId;
  set providerPaymentId(String? providerPaymentId) =>
      _$this._providerPaymentId = providerPaymentId;

  String? _providerIntentStatus;
  String? get providerIntentStatus => _$this._providerIntentStatus;
  set providerIntentStatus(String? providerIntentStatus) =>
      _$this._providerIntentStatus = providerIntentStatus;

  String? _providerReference;
  String? get providerReference => _$this._providerReference;
  set providerReference(String? providerReference) =>
      _$this._providerReference = providerReference;

  String? _lastErrorCode;
  String? get lastErrorCode => _$this._lastErrorCode;
  set lastErrorCode(String? lastErrorCode) =>
      _$this._lastErrorCode = lastErrorCode;

  String? _lastErrorMessage;
  String? get lastErrorMessage => _$this._lastErrorMessage;
  set lastErrorMessage(String? lastErrorMessage) =>
      _$this._lastErrorMessage = lastErrorMessage;

  String? _succeededAt;
  String? get succeededAt => _$this._succeededAt;
  set succeededAt(String? succeededAt) => _$this._succeededAt = succeededAt;

  String? _failedAt;
  String? get failedAt => _$this._failedAt;
  set failedAt(String? failedAt) => _$this._failedAt = failedAt;

  PaymentAttemptResponseDtoBuilder() {
    PaymentAttemptResponseDto._defaults(this);
  }

  PaymentAttemptResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _orderId = $v.orderId;
      _provider = $v.provider;
      _method = $v.method;
      _status = $v.status;
      _currencyCode = $v.currencyCode;
      _amount = $v.amount;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _order = $v.order.toBuilder();
      _providerPaymentId = $v.providerPaymentId;
      _providerIntentStatus = $v.providerIntentStatus;
      _providerReference = $v.providerReference;
      _lastErrorCode = $v.lastErrorCode;
      _lastErrorMessage = $v.lastErrorMessage;
      _succeededAt = $v.succeededAt;
      _failedAt = $v.failedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentAttemptResponseDto other) {
    _$v = other as _$PaymentAttemptResponseDto;
  }

  @override
  void update(void Function(PaymentAttemptResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaymentAttemptResponseDto build() => _build();

  _$PaymentAttemptResponseDto _build() {
    _$PaymentAttemptResponseDto _$result;
    try {
      _$result = _$v ??
          _$PaymentAttemptResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'PaymentAttemptResponseDto', 'id'),
            orderId: BuiltValueNullFieldError.checkNotNull(
                orderId, r'PaymentAttemptResponseDto', 'orderId'),
            provider: BuiltValueNullFieldError.checkNotNull(
                provider, r'PaymentAttemptResponseDto', 'provider'),
            method: BuiltValueNullFieldError.checkNotNull(
                method, r'PaymentAttemptResponseDto', 'method'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'PaymentAttemptResponseDto', 'status'),
            currencyCode: BuiltValueNullFieldError.checkNotNull(
                currencyCode, r'PaymentAttemptResponseDto', 'currencyCode'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'PaymentAttemptResponseDto', 'amount'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'PaymentAttemptResponseDto', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'PaymentAttemptResponseDto', 'updatedAt'),
            order: order.build(),
            providerPaymentId: providerPaymentId,
            providerIntentStatus: providerIntentStatus,
            providerReference: providerReference,
            lastErrorCode: lastErrorCode,
            lastErrorMessage: lastErrorMessage,
            succeededAt: succeededAt,
            failedAt: failedAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'order';
        order.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PaymentAttemptResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
