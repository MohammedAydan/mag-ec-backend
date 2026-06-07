// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_shipping_method_details_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrderShippingMethodDetailsDto extends OrderShippingMethodDetailsDto {
  @override
  final String key;
  @override
  final String name;
  @override
  final String rateType;
  @override
  final num? estimatedMinDays;
  @override
  final num? estimatedMaxDays;

  factory _$OrderShippingMethodDetailsDto(
          [void Function(OrderShippingMethodDetailsDtoBuilder)? updates]) =>
      (OrderShippingMethodDetailsDtoBuilder()..update(updates))._build();

  _$OrderShippingMethodDetailsDto._(
      {required this.key,
      required this.name,
      required this.rateType,
      this.estimatedMinDays,
      this.estimatedMaxDays})
      : super._();
  @override
  OrderShippingMethodDetailsDto rebuild(
          void Function(OrderShippingMethodDetailsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderShippingMethodDetailsDtoBuilder toBuilder() =>
      OrderShippingMethodDetailsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderShippingMethodDetailsDto &&
        key == other.key &&
        name == other.name &&
        rateType == other.rateType &&
        estimatedMinDays == other.estimatedMinDays &&
        estimatedMaxDays == other.estimatedMaxDays;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, rateType.hashCode);
    _$hash = $jc(_$hash, estimatedMinDays.hashCode);
    _$hash = $jc(_$hash, estimatedMaxDays.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderShippingMethodDetailsDto')
          ..add('key', key)
          ..add('name', name)
          ..add('rateType', rateType)
          ..add('estimatedMinDays', estimatedMinDays)
          ..add('estimatedMaxDays', estimatedMaxDays))
        .toString();
  }
}

class OrderShippingMethodDetailsDtoBuilder
    implements
        Builder<OrderShippingMethodDetailsDto,
            OrderShippingMethodDetailsDtoBuilder> {
  _$OrderShippingMethodDetailsDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _rateType;
  String? get rateType => _$this._rateType;
  set rateType(String? rateType) => _$this._rateType = rateType;

  num? _estimatedMinDays;
  num? get estimatedMinDays => _$this._estimatedMinDays;
  set estimatedMinDays(num? estimatedMinDays) =>
      _$this._estimatedMinDays = estimatedMinDays;

  num? _estimatedMaxDays;
  num? get estimatedMaxDays => _$this._estimatedMaxDays;
  set estimatedMaxDays(num? estimatedMaxDays) =>
      _$this._estimatedMaxDays = estimatedMaxDays;

  OrderShippingMethodDetailsDtoBuilder() {
    OrderShippingMethodDetailsDto._defaults(this);
  }

  OrderShippingMethodDetailsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _name = $v.name;
      _rateType = $v.rateType;
      _estimatedMinDays = $v.estimatedMinDays;
      _estimatedMaxDays = $v.estimatedMaxDays;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderShippingMethodDetailsDto other) {
    _$v = other as _$OrderShippingMethodDetailsDto;
  }

  @override
  void update(void Function(OrderShippingMethodDetailsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderShippingMethodDetailsDto build() => _build();

  _$OrderShippingMethodDetailsDto _build() {
    final _$result = _$v ??
        _$OrderShippingMethodDetailsDto._(
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'OrderShippingMethodDetailsDto', 'key'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'OrderShippingMethodDetailsDto', 'name'),
          rateType: BuiltValueNullFieldError.checkNotNull(
              rateType, r'OrderShippingMethodDetailsDto', 'rateType'),
          estimatedMinDays: estimatedMinDays,
          estimatedMaxDays: estimatedMaxDays,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
