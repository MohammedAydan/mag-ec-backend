// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_brief_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrderBriefDto extends OrderBriefDto {
  @override
  final String orderNumber;
  @override
  final String paymentStatus;
  @override
  final String status;

  factory _$OrderBriefDto([void Function(OrderBriefDtoBuilder)? updates]) =>
      (OrderBriefDtoBuilder()..update(updates))._build();

  _$OrderBriefDto._(
      {required this.orderNumber,
      required this.paymentStatus,
      required this.status})
      : super._();
  @override
  OrderBriefDto rebuild(void Function(OrderBriefDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderBriefDtoBuilder toBuilder() => OrderBriefDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderBriefDto &&
        orderNumber == other.orderNumber &&
        paymentStatus == other.paymentStatus &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, orderNumber.hashCode);
    _$hash = $jc(_$hash, paymentStatus.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderBriefDto')
          ..add('orderNumber', orderNumber)
          ..add('paymentStatus', paymentStatus)
          ..add('status', status))
        .toString();
  }
}

class OrderBriefDtoBuilder
    implements Builder<OrderBriefDto, OrderBriefDtoBuilder> {
  _$OrderBriefDto? _$v;

  String? _orderNumber;
  String? get orderNumber => _$this._orderNumber;
  set orderNumber(String? orderNumber) => _$this._orderNumber = orderNumber;

  String? _paymentStatus;
  String? get paymentStatus => _$this._paymentStatus;
  set paymentStatus(String? paymentStatus) =>
      _$this._paymentStatus = paymentStatus;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  OrderBriefDtoBuilder() {
    OrderBriefDto._defaults(this);
  }

  OrderBriefDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderNumber = $v.orderNumber;
      _paymentStatus = $v.paymentStatus;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderBriefDto other) {
    _$v = other as _$OrderBriefDto;
  }

  @override
  void update(void Function(OrderBriefDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderBriefDto build() => _build();

  _$OrderBriefDto _build() {
    final _$result = _$v ??
        _$OrderBriefDto._(
          orderNumber: BuiltValueNullFieldError.checkNotNull(
              orderNumber, r'OrderBriefDto', 'orderNumber'),
          paymentStatus: BuiltValueNullFieldError.checkNotNull(
              paymentStatus, r'OrderBriefDto', 'paymentStatus'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'OrderBriefDto', 'status'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
