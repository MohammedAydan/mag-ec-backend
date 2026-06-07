// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_preview_shipping_method_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckoutPreviewShippingMethodDto
    extends CheckoutPreviewShippingMethodDto {
  @override
  final String methodId;
  @override
  final String key;
  @override
  final String name;
  @override
  final num amount;
  @override
  final num totalAmount;
  @override
  final num? estimatedMinDays;
  @override
  final num? estimatedMaxDays;

  factory _$CheckoutPreviewShippingMethodDto(
          [void Function(CheckoutPreviewShippingMethodDtoBuilder)? updates]) =>
      (CheckoutPreviewShippingMethodDtoBuilder()..update(updates))._build();

  _$CheckoutPreviewShippingMethodDto._(
      {required this.methodId,
      required this.key,
      required this.name,
      required this.amount,
      required this.totalAmount,
      this.estimatedMinDays,
      this.estimatedMaxDays})
      : super._();
  @override
  CheckoutPreviewShippingMethodDto rebuild(
          void Function(CheckoutPreviewShippingMethodDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutPreviewShippingMethodDtoBuilder toBuilder() =>
      CheckoutPreviewShippingMethodDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutPreviewShippingMethodDto &&
        methodId == other.methodId &&
        key == other.key &&
        name == other.name &&
        amount == other.amount &&
        totalAmount == other.totalAmount &&
        estimatedMinDays == other.estimatedMinDays &&
        estimatedMaxDays == other.estimatedMaxDays;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, methodId.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, totalAmount.hashCode);
    _$hash = $jc(_$hash, estimatedMinDays.hashCode);
    _$hash = $jc(_$hash, estimatedMaxDays.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckoutPreviewShippingMethodDto')
          ..add('methodId', methodId)
          ..add('key', key)
          ..add('name', name)
          ..add('amount', amount)
          ..add('totalAmount', totalAmount)
          ..add('estimatedMinDays', estimatedMinDays)
          ..add('estimatedMaxDays', estimatedMaxDays))
        .toString();
  }
}

class CheckoutPreviewShippingMethodDtoBuilder
    implements
        Builder<CheckoutPreviewShippingMethodDto,
            CheckoutPreviewShippingMethodDtoBuilder> {
  _$CheckoutPreviewShippingMethodDto? _$v;

  String? _methodId;
  String? get methodId => _$this._methodId;
  set methodId(String? methodId) => _$this._methodId = methodId;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

  num? _totalAmount;
  num? get totalAmount => _$this._totalAmount;
  set totalAmount(num? totalAmount) => _$this._totalAmount = totalAmount;

  num? _estimatedMinDays;
  num? get estimatedMinDays => _$this._estimatedMinDays;
  set estimatedMinDays(num? estimatedMinDays) =>
      _$this._estimatedMinDays = estimatedMinDays;

  num? _estimatedMaxDays;
  num? get estimatedMaxDays => _$this._estimatedMaxDays;
  set estimatedMaxDays(num? estimatedMaxDays) =>
      _$this._estimatedMaxDays = estimatedMaxDays;

  CheckoutPreviewShippingMethodDtoBuilder() {
    CheckoutPreviewShippingMethodDto._defaults(this);
  }

  CheckoutPreviewShippingMethodDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _methodId = $v.methodId;
      _key = $v.key;
      _name = $v.name;
      _amount = $v.amount;
      _totalAmount = $v.totalAmount;
      _estimatedMinDays = $v.estimatedMinDays;
      _estimatedMaxDays = $v.estimatedMaxDays;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutPreviewShippingMethodDto other) {
    _$v = other as _$CheckoutPreviewShippingMethodDto;
  }

  @override
  void update(void Function(CheckoutPreviewShippingMethodDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckoutPreviewShippingMethodDto build() => _build();

  _$CheckoutPreviewShippingMethodDto _build() {
    final _$result = _$v ??
        _$CheckoutPreviewShippingMethodDto._(
          methodId: BuiltValueNullFieldError.checkNotNull(
              methodId, r'CheckoutPreviewShippingMethodDto', 'methodId'),
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'CheckoutPreviewShippingMethodDto', 'key'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'CheckoutPreviewShippingMethodDto', 'name'),
          amount: BuiltValueNullFieldError.checkNotNull(
              amount, r'CheckoutPreviewShippingMethodDto', 'amount'),
          totalAmount: BuiltValueNullFieldError.checkNotNull(
              totalAmount, r'CheckoutPreviewShippingMethodDto', 'totalAmount'),
          estimatedMinDays: estimatedMinDays,
          estimatedMaxDays: estimatedMaxDays,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
