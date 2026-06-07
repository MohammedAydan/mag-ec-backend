// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_payment_attempt_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckoutPaymentAttemptDto extends CheckoutPaymentAttemptDto {
  @override
  final String attemptId;
  @override
  final String provider;
  @override
  final String status;
  @override
  final String? clientSecret;
  @override
  final String? checkoutUrl;
  @override
  final String? providerPaymentId;

  factory _$CheckoutPaymentAttemptDto(
          [void Function(CheckoutPaymentAttemptDtoBuilder)? updates]) =>
      (CheckoutPaymentAttemptDtoBuilder()..update(updates))._build();

  _$CheckoutPaymentAttemptDto._(
      {required this.attemptId,
      required this.provider,
      required this.status,
      this.clientSecret,
      this.checkoutUrl,
      this.providerPaymentId})
      : super._();
  @override
  CheckoutPaymentAttemptDto rebuild(
          void Function(CheckoutPaymentAttemptDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutPaymentAttemptDtoBuilder toBuilder() =>
      CheckoutPaymentAttemptDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutPaymentAttemptDto &&
        attemptId == other.attemptId &&
        provider == other.provider &&
        status == other.status &&
        clientSecret == other.clientSecret &&
        checkoutUrl == other.checkoutUrl &&
        providerPaymentId == other.providerPaymentId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attemptId.hashCode);
    _$hash = $jc(_$hash, provider.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, clientSecret.hashCode);
    _$hash = $jc(_$hash, checkoutUrl.hashCode);
    _$hash = $jc(_$hash, providerPaymentId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckoutPaymentAttemptDto')
          ..add('attemptId', attemptId)
          ..add('provider', provider)
          ..add('status', status)
          ..add('clientSecret', clientSecret)
          ..add('checkoutUrl', checkoutUrl)
          ..add('providerPaymentId', providerPaymentId))
        .toString();
  }
}

class CheckoutPaymentAttemptDtoBuilder
    implements
        Builder<CheckoutPaymentAttemptDto, CheckoutPaymentAttemptDtoBuilder> {
  _$CheckoutPaymentAttemptDto? _$v;

  String? _attemptId;
  String? get attemptId => _$this._attemptId;
  set attemptId(String? attemptId) => _$this._attemptId = attemptId;

  String? _provider;
  String? get provider => _$this._provider;
  set provider(String? provider) => _$this._provider = provider;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _clientSecret;
  String? get clientSecret => _$this._clientSecret;
  set clientSecret(String? clientSecret) => _$this._clientSecret = clientSecret;

  String? _checkoutUrl;
  String? get checkoutUrl => _$this._checkoutUrl;
  set checkoutUrl(String? checkoutUrl) => _$this._checkoutUrl = checkoutUrl;

  String? _providerPaymentId;
  String? get providerPaymentId => _$this._providerPaymentId;
  set providerPaymentId(String? providerPaymentId) =>
      _$this._providerPaymentId = providerPaymentId;

  CheckoutPaymentAttemptDtoBuilder() {
    CheckoutPaymentAttemptDto._defaults(this);
  }

  CheckoutPaymentAttemptDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attemptId = $v.attemptId;
      _provider = $v.provider;
      _status = $v.status;
      _clientSecret = $v.clientSecret;
      _checkoutUrl = $v.checkoutUrl;
      _providerPaymentId = $v.providerPaymentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutPaymentAttemptDto other) {
    _$v = other as _$CheckoutPaymentAttemptDto;
  }

  @override
  void update(void Function(CheckoutPaymentAttemptDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckoutPaymentAttemptDto build() => _build();

  _$CheckoutPaymentAttemptDto _build() {
    final _$result = _$v ??
        _$CheckoutPaymentAttemptDto._(
          attemptId: BuiltValueNullFieldError.checkNotNull(
              attemptId, r'CheckoutPaymentAttemptDto', 'attemptId'),
          provider: BuiltValueNullFieldError.checkNotNull(
              provider, r'CheckoutPaymentAttemptDto', 'provider'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'CheckoutPaymentAttemptDto', 'status'),
          clientSecret: clientSecret,
          checkoutUrl: checkoutUrl,
          providerPaymentId: providerPaymentId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
