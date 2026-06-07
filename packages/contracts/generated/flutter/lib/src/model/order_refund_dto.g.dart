// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_refund_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrderRefundDto extends OrderRefundDto {
  @override
  final String id;
  @override
  final String status;
  @override
  final num amount;
  @override
  final String currencyCode;
  @override
  final String provider;
  @override
  final String requestedAt;
  @override
  final String? returnRequestId;
  @override
  final String? paymentAttemptId;
  @override
  final String? reason;
  @override
  final String? providerRefundId;
  @override
  final String? processedAt;

  factory _$OrderRefundDto([void Function(OrderRefundDtoBuilder)? updates]) =>
      (OrderRefundDtoBuilder()..update(updates))._build();

  _$OrderRefundDto._(
      {required this.id,
      required this.status,
      required this.amount,
      required this.currencyCode,
      required this.provider,
      required this.requestedAt,
      this.returnRequestId,
      this.paymentAttemptId,
      this.reason,
      this.providerRefundId,
      this.processedAt})
      : super._();
  @override
  OrderRefundDto rebuild(void Function(OrderRefundDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderRefundDtoBuilder toBuilder() => OrderRefundDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderRefundDto &&
        id == other.id &&
        status == other.status &&
        amount == other.amount &&
        currencyCode == other.currencyCode &&
        provider == other.provider &&
        requestedAt == other.requestedAt &&
        returnRequestId == other.returnRequestId &&
        paymentAttemptId == other.paymentAttemptId &&
        reason == other.reason &&
        providerRefundId == other.providerRefundId &&
        processedAt == other.processedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, provider.hashCode);
    _$hash = $jc(_$hash, requestedAt.hashCode);
    _$hash = $jc(_$hash, returnRequestId.hashCode);
    _$hash = $jc(_$hash, paymentAttemptId.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, providerRefundId.hashCode);
    _$hash = $jc(_$hash, processedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderRefundDto')
          ..add('id', id)
          ..add('status', status)
          ..add('amount', amount)
          ..add('currencyCode', currencyCode)
          ..add('provider', provider)
          ..add('requestedAt', requestedAt)
          ..add('returnRequestId', returnRequestId)
          ..add('paymentAttemptId', paymentAttemptId)
          ..add('reason', reason)
          ..add('providerRefundId', providerRefundId)
          ..add('processedAt', processedAt))
        .toString();
  }
}

class OrderRefundDtoBuilder
    implements Builder<OrderRefundDto, OrderRefundDtoBuilder> {
  _$OrderRefundDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  String? _provider;
  String? get provider => _$this._provider;
  set provider(String? provider) => _$this._provider = provider;

  String? _requestedAt;
  String? get requestedAt => _$this._requestedAt;
  set requestedAt(String? requestedAt) => _$this._requestedAt = requestedAt;

  String? _returnRequestId;
  String? get returnRequestId => _$this._returnRequestId;
  set returnRequestId(String? returnRequestId) =>
      _$this._returnRequestId = returnRequestId;

  String? _paymentAttemptId;
  String? get paymentAttemptId => _$this._paymentAttemptId;
  set paymentAttemptId(String? paymentAttemptId) =>
      _$this._paymentAttemptId = paymentAttemptId;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  String? _providerRefundId;
  String? get providerRefundId => _$this._providerRefundId;
  set providerRefundId(String? providerRefundId) =>
      _$this._providerRefundId = providerRefundId;

  String? _processedAt;
  String? get processedAt => _$this._processedAt;
  set processedAt(String? processedAt) => _$this._processedAt = processedAt;

  OrderRefundDtoBuilder() {
    OrderRefundDto._defaults(this);
  }

  OrderRefundDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _status = $v.status;
      _amount = $v.amount;
      _currencyCode = $v.currencyCode;
      _provider = $v.provider;
      _requestedAt = $v.requestedAt;
      _returnRequestId = $v.returnRequestId;
      _paymentAttemptId = $v.paymentAttemptId;
      _reason = $v.reason;
      _providerRefundId = $v.providerRefundId;
      _processedAt = $v.processedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderRefundDto other) {
    _$v = other as _$OrderRefundDto;
  }

  @override
  void update(void Function(OrderRefundDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderRefundDto build() => _build();

  _$OrderRefundDto _build() {
    final _$result = _$v ??
        _$OrderRefundDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'OrderRefundDto', 'id'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'OrderRefundDto', 'status'),
          amount: BuiltValueNullFieldError.checkNotNull(
              amount, r'OrderRefundDto', 'amount'),
          currencyCode: BuiltValueNullFieldError.checkNotNull(
              currencyCode, r'OrderRefundDto', 'currencyCode'),
          provider: BuiltValueNullFieldError.checkNotNull(
              provider, r'OrderRefundDto', 'provider'),
          requestedAt: BuiltValueNullFieldError.checkNotNull(
              requestedAt, r'OrderRefundDto', 'requestedAt'),
          returnRequestId: returnRequestId,
          paymentAttemptId: paymentAttemptId,
          reason: reason,
          providerRefundId: providerRefundId,
          processedAt: processedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
