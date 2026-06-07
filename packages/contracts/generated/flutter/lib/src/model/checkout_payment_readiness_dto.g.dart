// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_payment_readiness_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckoutPaymentReadinessDto extends CheckoutPaymentReadinessDto {
  @override
  final bool cashOnDeliveryAvailable;
  @override
  final bool onlinePaymentAvailable;

  factory _$CheckoutPaymentReadinessDto(
          [void Function(CheckoutPaymentReadinessDtoBuilder)? updates]) =>
      (CheckoutPaymentReadinessDtoBuilder()..update(updates))._build();

  _$CheckoutPaymentReadinessDto._(
      {required this.cashOnDeliveryAvailable,
      required this.onlinePaymentAvailable})
      : super._();
  @override
  CheckoutPaymentReadinessDto rebuild(
          void Function(CheckoutPaymentReadinessDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutPaymentReadinessDtoBuilder toBuilder() =>
      CheckoutPaymentReadinessDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutPaymentReadinessDto &&
        cashOnDeliveryAvailable == other.cashOnDeliveryAvailable &&
        onlinePaymentAvailable == other.onlinePaymentAvailable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cashOnDeliveryAvailable.hashCode);
    _$hash = $jc(_$hash, onlinePaymentAvailable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckoutPaymentReadinessDto')
          ..add('cashOnDeliveryAvailable', cashOnDeliveryAvailable)
          ..add('onlinePaymentAvailable', onlinePaymentAvailable))
        .toString();
  }
}

class CheckoutPaymentReadinessDtoBuilder
    implements
        Builder<CheckoutPaymentReadinessDto,
            CheckoutPaymentReadinessDtoBuilder> {
  _$CheckoutPaymentReadinessDto? _$v;

  bool? _cashOnDeliveryAvailable;
  bool? get cashOnDeliveryAvailable => _$this._cashOnDeliveryAvailable;
  set cashOnDeliveryAvailable(bool? cashOnDeliveryAvailable) =>
      _$this._cashOnDeliveryAvailable = cashOnDeliveryAvailable;

  bool? _onlinePaymentAvailable;
  bool? get onlinePaymentAvailable => _$this._onlinePaymentAvailable;
  set onlinePaymentAvailable(bool? onlinePaymentAvailable) =>
      _$this._onlinePaymentAvailable = onlinePaymentAvailable;

  CheckoutPaymentReadinessDtoBuilder() {
    CheckoutPaymentReadinessDto._defaults(this);
  }

  CheckoutPaymentReadinessDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cashOnDeliveryAvailable = $v.cashOnDeliveryAvailable;
      _onlinePaymentAvailable = $v.onlinePaymentAvailable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutPaymentReadinessDto other) {
    _$v = other as _$CheckoutPaymentReadinessDto;
  }

  @override
  void update(void Function(CheckoutPaymentReadinessDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckoutPaymentReadinessDto build() => _build();

  _$CheckoutPaymentReadinessDto _build() {
    final _$result = _$v ??
        _$CheckoutPaymentReadinessDto._(
          cashOnDeliveryAvailable: BuiltValueNullFieldError.checkNotNull(
              cashOnDeliveryAvailable,
              r'CheckoutPaymentReadinessDto',
              'cashOnDeliveryAvailable'),
          onlinePaymentAvailable: BuiltValueNullFieldError.checkNotNull(
              onlinePaymentAvailable,
              r'CheckoutPaymentReadinessDto',
              'onlinePaymentAvailable'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
