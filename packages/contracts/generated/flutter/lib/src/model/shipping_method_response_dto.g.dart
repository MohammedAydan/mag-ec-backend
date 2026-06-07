// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_method_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShippingMethodResponseDto extends ShippingMethodResponseDto {
  @override
  final String id;
  @override
  final String zoneId;
  @override
  final String key;
  @override
  final String name;
  @override
  final bool isActive;
  @override
  final String rateType;
  @override
  final String currencyCode;
  @override
  final num sortOrder;
  @override
  final String updatedAt;
  @override
  final num? flatAmount;
  @override
  final num? percentageBps;
  @override
  final num? estimatedMinDays;
  @override
  final num? estimatedMaxDays;

  factory _$ShippingMethodResponseDto(
          [void Function(ShippingMethodResponseDtoBuilder)? updates]) =>
      (ShippingMethodResponseDtoBuilder()..update(updates))._build();

  _$ShippingMethodResponseDto._(
      {required this.id,
      required this.zoneId,
      required this.key,
      required this.name,
      required this.isActive,
      required this.rateType,
      required this.currencyCode,
      required this.sortOrder,
      required this.updatedAt,
      this.flatAmount,
      this.percentageBps,
      this.estimatedMinDays,
      this.estimatedMaxDays})
      : super._();
  @override
  ShippingMethodResponseDto rebuild(
          void Function(ShippingMethodResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShippingMethodResponseDtoBuilder toBuilder() =>
      ShippingMethodResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShippingMethodResponseDto &&
        id == other.id &&
        zoneId == other.zoneId &&
        key == other.key &&
        name == other.name &&
        isActive == other.isActive &&
        rateType == other.rateType &&
        currencyCode == other.currencyCode &&
        sortOrder == other.sortOrder &&
        updatedAt == other.updatedAt &&
        flatAmount == other.flatAmount &&
        percentageBps == other.percentageBps &&
        estimatedMinDays == other.estimatedMinDays &&
        estimatedMaxDays == other.estimatedMaxDays;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, zoneId.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jc(_$hash, rateType.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, flatAmount.hashCode);
    _$hash = $jc(_$hash, percentageBps.hashCode);
    _$hash = $jc(_$hash, estimatedMinDays.hashCode);
    _$hash = $jc(_$hash, estimatedMaxDays.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShippingMethodResponseDto')
          ..add('id', id)
          ..add('zoneId', zoneId)
          ..add('key', key)
          ..add('name', name)
          ..add('isActive', isActive)
          ..add('rateType', rateType)
          ..add('currencyCode', currencyCode)
          ..add('sortOrder', sortOrder)
          ..add('updatedAt', updatedAt)
          ..add('flatAmount', flatAmount)
          ..add('percentageBps', percentageBps)
          ..add('estimatedMinDays', estimatedMinDays)
          ..add('estimatedMaxDays', estimatedMaxDays))
        .toString();
  }
}

class ShippingMethodResponseDtoBuilder
    implements
        Builder<ShippingMethodResponseDto, ShippingMethodResponseDtoBuilder> {
  _$ShippingMethodResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _zoneId;
  String? get zoneId => _$this._zoneId;
  set zoneId(String? zoneId) => _$this._zoneId = zoneId;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  String? _rateType;
  String? get rateType => _$this._rateType;
  set rateType(String? rateType) => _$this._rateType = rateType;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  num? _flatAmount;
  num? get flatAmount => _$this._flatAmount;
  set flatAmount(num? flatAmount) => _$this._flatAmount = flatAmount;

  num? _percentageBps;
  num? get percentageBps => _$this._percentageBps;
  set percentageBps(num? percentageBps) =>
      _$this._percentageBps = percentageBps;

  num? _estimatedMinDays;
  num? get estimatedMinDays => _$this._estimatedMinDays;
  set estimatedMinDays(num? estimatedMinDays) =>
      _$this._estimatedMinDays = estimatedMinDays;

  num? _estimatedMaxDays;
  num? get estimatedMaxDays => _$this._estimatedMaxDays;
  set estimatedMaxDays(num? estimatedMaxDays) =>
      _$this._estimatedMaxDays = estimatedMaxDays;

  ShippingMethodResponseDtoBuilder() {
    ShippingMethodResponseDto._defaults(this);
  }

  ShippingMethodResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _zoneId = $v.zoneId;
      _key = $v.key;
      _name = $v.name;
      _isActive = $v.isActive;
      _rateType = $v.rateType;
      _currencyCode = $v.currencyCode;
      _sortOrder = $v.sortOrder;
      _updatedAt = $v.updatedAt;
      _flatAmount = $v.flatAmount;
      _percentageBps = $v.percentageBps;
      _estimatedMinDays = $v.estimatedMinDays;
      _estimatedMaxDays = $v.estimatedMaxDays;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShippingMethodResponseDto other) {
    _$v = other as _$ShippingMethodResponseDto;
  }

  @override
  void update(void Function(ShippingMethodResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShippingMethodResponseDto build() => _build();

  _$ShippingMethodResponseDto _build() {
    final _$result = _$v ??
        _$ShippingMethodResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ShippingMethodResponseDto', 'id'),
          zoneId: BuiltValueNullFieldError.checkNotNull(
              zoneId, r'ShippingMethodResponseDto', 'zoneId'),
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'ShippingMethodResponseDto', 'key'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'ShippingMethodResponseDto', 'name'),
          isActive: BuiltValueNullFieldError.checkNotNull(
              isActive, r'ShippingMethodResponseDto', 'isActive'),
          rateType: BuiltValueNullFieldError.checkNotNull(
              rateType, r'ShippingMethodResponseDto', 'rateType'),
          currencyCode: BuiltValueNullFieldError.checkNotNull(
              currencyCode, r'ShippingMethodResponseDto', 'currencyCode'),
          sortOrder: BuiltValueNullFieldError.checkNotNull(
              sortOrder, r'ShippingMethodResponseDto', 'sortOrder'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'ShippingMethodResponseDto', 'updatedAt'),
          flatAmount: flatAmount,
          percentageBps: percentageBps,
          estimatedMinDays: estimatedMinDays,
          estimatedMaxDays: estimatedMaxDays,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
