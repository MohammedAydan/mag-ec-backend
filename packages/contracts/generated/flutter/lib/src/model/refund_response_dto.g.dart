// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RefundResponseDto extends RefundResponseDto {
  @override
  final String id;
  @override
  final String orderId;
  @override
  final String provider;
  @override
  final String status;
  @override
  final num amount;
  @override
  final String currencyCode;
  @override
  final String requestedAt;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final OrderBriefDto order;
  @override
  final String? paymentAttemptId;
  @override
  final String? returnRequestId;
  @override
  final String? requestedByUserId;
  @override
  final String? reason;
  @override
  final String? providerRefundId;
  @override
  final String? providerReference;
  @override
  final String? failureReason;
  @override
  final String? processedAt;

  factory _$RefundResponseDto(
          [void Function(RefundResponseDtoBuilder)? updates]) =>
      (RefundResponseDtoBuilder()..update(updates))._build();

  _$RefundResponseDto._(
      {required this.id,
      required this.orderId,
      required this.provider,
      required this.status,
      required this.amount,
      required this.currencyCode,
      required this.requestedAt,
      required this.createdAt,
      required this.updatedAt,
      required this.order,
      this.paymentAttemptId,
      this.returnRequestId,
      this.requestedByUserId,
      this.reason,
      this.providerRefundId,
      this.providerReference,
      this.failureReason,
      this.processedAt})
      : super._();
  @override
  RefundResponseDto rebuild(void Function(RefundResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefundResponseDtoBuilder toBuilder() =>
      RefundResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefundResponseDto &&
        id == other.id &&
        orderId == other.orderId &&
        provider == other.provider &&
        status == other.status &&
        amount == other.amount &&
        currencyCode == other.currencyCode &&
        requestedAt == other.requestedAt &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        order == other.order &&
        paymentAttemptId == other.paymentAttemptId &&
        returnRequestId == other.returnRequestId &&
        requestedByUserId == other.requestedByUserId &&
        reason == other.reason &&
        providerRefundId == other.providerRefundId &&
        providerReference == other.providerReference &&
        failureReason == other.failureReason &&
        processedAt == other.processedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, orderId.hashCode);
    _$hash = $jc(_$hash, provider.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, requestedAt.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jc(_$hash, paymentAttemptId.hashCode);
    _$hash = $jc(_$hash, returnRequestId.hashCode);
    _$hash = $jc(_$hash, requestedByUserId.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, providerRefundId.hashCode);
    _$hash = $jc(_$hash, providerReference.hashCode);
    _$hash = $jc(_$hash, failureReason.hashCode);
    _$hash = $jc(_$hash, processedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RefundResponseDto')
          ..add('id', id)
          ..add('orderId', orderId)
          ..add('provider', provider)
          ..add('status', status)
          ..add('amount', amount)
          ..add('currencyCode', currencyCode)
          ..add('requestedAt', requestedAt)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('order', order)
          ..add('paymentAttemptId', paymentAttemptId)
          ..add('returnRequestId', returnRequestId)
          ..add('requestedByUserId', requestedByUserId)
          ..add('reason', reason)
          ..add('providerRefundId', providerRefundId)
          ..add('providerReference', providerReference)
          ..add('failureReason', failureReason)
          ..add('processedAt', processedAt))
        .toString();
  }
}

class RefundResponseDtoBuilder
    implements Builder<RefundResponseDto, RefundResponseDtoBuilder> {
  _$RefundResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _orderId;
  String? get orderId => _$this._orderId;
  set orderId(String? orderId) => _$this._orderId = orderId;

  String? _provider;
  String? get provider => _$this._provider;
  set provider(String? provider) => _$this._provider = provider;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  String? _requestedAt;
  String? get requestedAt => _$this._requestedAt;
  set requestedAt(String? requestedAt) => _$this._requestedAt = requestedAt;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  OrderBriefDtoBuilder? _order;
  OrderBriefDtoBuilder get order => _$this._order ??= OrderBriefDtoBuilder();
  set order(OrderBriefDtoBuilder? order) => _$this._order = order;

  String? _paymentAttemptId;
  String? get paymentAttemptId => _$this._paymentAttemptId;
  set paymentAttemptId(String? paymentAttemptId) =>
      _$this._paymentAttemptId = paymentAttemptId;

  String? _returnRequestId;
  String? get returnRequestId => _$this._returnRequestId;
  set returnRequestId(String? returnRequestId) =>
      _$this._returnRequestId = returnRequestId;

  String? _requestedByUserId;
  String? get requestedByUserId => _$this._requestedByUserId;
  set requestedByUserId(String? requestedByUserId) =>
      _$this._requestedByUserId = requestedByUserId;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  String? _providerRefundId;
  String? get providerRefundId => _$this._providerRefundId;
  set providerRefundId(String? providerRefundId) =>
      _$this._providerRefundId = providerRefundId;

  String? _providerReference;
  String? get providerReference => _$this._providerReference;
  set providerReference(String? providerReference) =>
      _$this._providerReference = providerReference;

  String? _failureReason;
  String? get failureReason => _$this._failureReason;
  set failureReason(String? failureReason) =>
      _$this._failureReason = failureReason;

  String? _processedAt;
  String? get processedAt => _$this._processedAt;
  set processedAt(String? processedAt) => _$this._processedAt = processedAt;

  RefundResponseDtoBuilder() {
    RefundResponseDto._defaults(this);
  }

  RefundResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _orderId = $v.orderId;
      _provider = $v.provider;
      _status = $v.status;
      _amount = $v.amount;
      _currencyCode = $v.currencyCode;
      _requestedAt = $v.requestedAt;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _order = $v.order.toBuilder();
      _paymentAttemptId = $v.paymentAttemptId;
      _returnRequestId = $v.returnRequestId;
      _requestedByUserId = $v.requestedByUserId;
      _reason = $v.reason;
      _providerRefundId = $v.providerRefundId;
      _providerReference = $v.providerReference;
      _failureReason = $v.failureReason;
      _processedAt = $v.processedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RefundResponseDto other) {
    _$v = other as _$RefundResponseDto;
  }

  @override
  void update(void Function(RefundResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RefundResponseDto build() => _build();

  _$RefundResponseDto _build() {
    _$RefundResponseDto _$result;
    try {
      _$result = _$v ??
          _$RefundResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'RefundResponseDto', 'id'),
            orderId: BuiltValueNullFieldError.checkNotNull(
                orderId, r'RefundResponseDto', 'orderId'),
            provider: BuiltValueNullFieldError.checkNotNull(
                provider, r'RefundResponseDto', 'provider'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'RefundResponseDto', 'status'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'RefundResponseDto', 'amount'),
            currencyCode: BuiltValueNullFieldError.checkNotNull(
                currencyCode, r'RefundResponseDto', 'currencyCode'),
            requestedAt: BuiltValueNullFieldError.checkNotNull(
                requestedAt, r'RefundResponseDto', 'requestedAt'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'RefundResponseDto', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'RefundResponseDto', 'updatedAt'),
            order: order.build(),
            paymentAttemptId: paymentAttemptId,
            returnRequestId: returnRequestId,
            requestedByUserId: requestedByUserId,
            reason: reason,
            providerRefundId: providerRefundId,
            providerReference: providerReference,
            failureReason: failureReason,
            processedAt: processedAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'order';
        order.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'RefundResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
