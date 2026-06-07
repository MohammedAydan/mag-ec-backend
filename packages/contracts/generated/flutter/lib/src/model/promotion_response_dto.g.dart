// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PromotionResponseDto extends PromotionResponseDto {
  @override
  final String id;
  @override
  final String key;
  @override
  final String name;
  @override
  final String status;
  @override
  final String trigger;
  @override
  final String rewardType;
  @override
  final bool isCombinable;
  @override
  final num priority;
  @override
  final num maxApplicationsPerOrder;
  @override
  final num reservedCount;
  @override
  final num redeemedCount;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String? description;
  @override
  final String? currencyCode;
  @override
  final num? fixedAmount;
  @override
  final num? percentageBps;
  @override
  final num? maxDiscountAmount;
  @override
  final num? minSubtotalAmount;
  @override
  final String? startsAt;
  @override
  final String? endsAt;
  @override
  final num? totalUsageLimit;
  @override
  final num? perCustomerUsageLimit;

  factory _$PromotionResponseDto(
          [void Function(PromotionResponseDtoBuilder)? updates]) =>
      (PromotionResponseDtoBuilder()..update(updates))._build();

  _$PromotionResponseDto._(
      {required this.id,
      required this.key,
      required this.name,
      required this.status,
      required this.trigger,
      required this.rewardType,
      required this.isCombinable,
      required this.priority,
      required this.maxApplicationsPerOrder,
      required this.reservedCount,
      required this.redeemedCount,
      required this.createdAt,
      required this.updatedAt,
      this.description,
      this.currencyCode,
      this.fixedAmount,
      this.percentageBps,
      this.maxDiscountAmount,
      this.minSubtotalAmount,
      this.startsAt,
      this.endsAt,
      this.totalUsageLimit,
      this.perCustomerUsageLimit})
      : super._();
  @override
  PromotionResponseDto rebuild(
          void Function(PromotionResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PromotionResponseDtoBuilder toBuilder() =>
      PromotionResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PromotionResponseDto &&
        id == other.id &&
        key == other.key &&
        name == other.name &&
        status == other.status &&
        trigger == other.trigger &&
        rewardType == other.rewardType &&
        isCombinable == other.isCombinable &&
        priority == other.priority &&
        maxApplicationsPerOrder == other.maxApplicationsPerOrder &&
        reservedCount == other.reservedCount &&
        redeemedCount == other.redeemedCount &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        description == other.description &&
        currencyCode == other.currencyCode &&
        fixedAmount == other.fixedAmount &&
        percentageBps == other.percentageBps &&
        maxDiscountAmount == other.maxDiscountAmount &&
        minSubtotalAmount == other.minSubtotalAmount &&
        startsAt == other.startsAt &&
        endsAt == other.endsAt &&
        totalUsageLimit == other.totalUsageLimit &&
        perCustomerUsageLimit == other.perCustomerUsageLimit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, trigger.hashCode);
    _$hash = $jc(_$hash, rewardType.hashCode);
    _$hash = $jc(_$hash, isCombinable.hashCode);
    _$hash = $jc(_$hash, priority.hashCode);
    _$hash = $jc(_$hash, maxApplicationsPerOrder.hashCode);
    _$hash = $jc(_$hash, reservedCount.hashCode);
    _$hash = $jc(_$hash, redeemedCount.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, fixedAmount.hashCode);
    _$hash = $jc(_$hash, percentageBps.hashCode);
    _$hash = $jc(_$hash, maxDiscountAmount.hashCode);
    _$hash = $jc(_$hash, minSubtotalAmount.hashCode);
    _$hash = $jc(_$hash, startsAt.hashCode);
    _$hash = $jc(_$hash, endsAt.hashCode);
    _$hash = $jc(_$hash, totalUsageLimit.hashCode);
    _$hash = $jc(_$hash, perCustomerUsageLimit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PromotionResponseDto')
          ..add('id', id)
          ..add('key', key)
          ..add('name', name)
          ..add('status', status)
          ..add('trigger', trigger)
          ..add('rewardType', rewardType)
          ..add('isCombinable', isCombinable)
          ..add('priority', priority)
          ..add('maxApplicationsPerOrder', maxApplicationsPerOrder)
          ..add('reservedCount', reservedCount)
          ..add('redeemedCount', redeemedCount)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('description', description)
          ..add('currencyCode', currencyCode)
          ..add('fixedAmount', fixedAmount)
          ..add('percentageBps', percentageBps)
          ..add('maxDiscountAmount', maxDiscountAmount)
          ..add('minSubtotalAmount', minSubtotalAmount)
          ..add('startsAt', startsAt)
          ..add('endsAt', endsAt)
          ..add('totalUsageLimit', totalUsageLimit)
          ..add('perCustomerUsageLimit', perCustomerUsageLimit))
        .toString();
  }
}

class PromotionResponseDtoBuilder
    implements Builder<PromotionResponseDto, PromotionResponseDtoBuilder> {
  _$PromotionResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _trigger;
  String? get trigger => _$this._trigger;
  set trigger(String? trigger) => _$this._trigger = trigger;

  String? _rewardType;
  String? get rewardType => _$this._rewardType;
  set rewardType(String? rewardType) => _$this._rewardType = rewardType;

  bool? _isCombinable;
  bool? get isCombinable => _$this._isCombinable;
  set isCombinable(bool? isCombinable) => _$this._isCombinable = isCombinable;

  num? _priority;
  num? get priority => _$this._priority;
  set priority(num? priority) => _$this._priority = priority;

  num? _maxApplicationsPerOrder;
  num? get maxApplicationsPerOrder => _$this._maxApplicationsPerOrder;
  set maxApplicationsPerOrder(num? maxApplicationsPerOrder) =>
      _$this._maxApplicationsPerOrder = maxApplicationsPerOrder;

  num? _reservedCount;
  num? get reservedCount => _$this._reservedCount;
  set reservedCount(num? reservedCount) =>
      _$this._reservedCount = reservedCount;

  num? _redeemedCount;
  num? get redeemedCount => _$this._redeemedCount;
  set redeemedCount(num? redeemedCount) =>
      _$this._redeemedCount = redeemedCount;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  num? _fixedAmount;
  num? get fixedAmount => _$this._fixedAmount;
  set fixedAmount(num? fixedAmount) => _$this._fixedAmount = fixedAmount;

  num? _percentageBps;
  num? get percentageBps => _$this._percentageBps;
  set percentageBps(num? percentageBps) =>
      _$this._percentageBps = percentageBps;

  num? _maxDiscountAmount;
  num? get maxDiscountAmount => _$this._maxDiscountAmount;
  set maxDiscountAmount(num? maxDiscountAmount) =>
      _$this._maxDiscountAmount = maxDiscountAmount;

  num? _minSubtotalAmount;
  num? get minSubtotalAmount => _$this._minSubtotalAmount;
  set minSubtotalAmount(num? minSubtotalAmount) =>
      _$this._minSubtotalAmount = minSubtotalAmount;

  String? _startsAt;
  String? get startsAt => _$this._startsAt;
  set startsAt(String? startsAt) => _$this._startsAt = startsAt;

  String? _endsAt;
  String? get endsAt => _$this._endsAt;
  set endsAt(String? endsAt) => _$this._endsAt = endsAt;

  num? _totalUsageLimit;
  num? get totalUsageLimit => _$this._totalUsageLimit;
  set totalUsageLimit(num? totalUsageLimit) =>
      _$this._totalUsageLimit = totalUsageLimit;

  num? _perCustomerUsageLimit;
  num? get perCustomerUsageLimit => _$this._perCustomerUsageLimit;
  set perCustomerUsageLimit(num? perCustomerUsageLimit) =>
      _$this._perCustomerUsageLimit = perCustomerUsageLimit;

  PromotionResponseDtoBuilder() {
    PromotionResponseDto._defaults(this);
  }

  PromotionResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _name = $v.name;
      _status = $v.status;
      _trigger = $v.trigger;
      _rewardType = $v.rewardType;
      _isCombinable = $v.isCombinable;
      _priority = $v.priority;
      _maxApplicationsPerOrder = $v.maxApplicationsPerOrder;
      _reservedCount = $v.reservedCount;
      _redeemedCount = $v.redeemedCount;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _description = $v.description;
      _currencyCode = $v.currencyCode;
      _fixedAmount = $v.fixedAmount;
      _percentageBps = $v.percentageBps;
      _maxDiscountAmount = $v.maxDiscountAmount;
      _minSubtotalAmount = $v.minSubtotalAmount;
      _startsAt = $v.startsAt;
      _endsAt = $v.endsAt;
      _totalUsageLimit = $v.totalUsageLimit;
      _perCustomerUsageLimit = $v.perCustomerUsageLimit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PromotionResponseDto other) {
    _$v = other as _$PromotionResponseDto;
  }

  @override
  void update(void Function(PromotionResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PromotionResponseDto build() => _build();

  _$PromotionResponseDto _build() {
    final _$result = _$v ??
        _$PromotionResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'PromotionResponseDto', 'id'),
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'PromotionResponseDto', 'key'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'PromotionResponseDto', 'name'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'PromotionResponseDto', 'status'),
          trigger: BuiltValueNullFieldError.checkNotNull(
              trigger, r'PromotionResponseDto', 'trigger'),
          rewardType: BuiltValueNullFieldError.checkNotNull(
              rewardType, r'PromotionResponseDto', 'rewardType'),
          isCombinable: BuiltValueNullFieldError.checkNotNull(
              isCombinable, r'PromotionResponseDto', 'isCombinable'),
          priority: BuiltValueNullFieldError.checkNotNull(
              priority, r'PromotionResponseDto', 'priority'),
          maxApplicationsPerOrder: BuiltValueNullFieldError.checkNotNull(
              maxApplicationsPerOrder,
              r'PromotionResponseDto',
              'maxApplicationsPerOrder'),
          reservedCount: BuiltValueNullFieldError.checkNotNull(
              reservedCount, r'PromotionResponseDto', 'reservedCount'),
          redeemedCount: BuiltValueNullFieldError.checkNotNull(
              redeemedCount, r'PromotionResponseDto', 'redeemedCount'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'PromotionResponseDto', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'PromotionResponseDto', 'updatedAt'),
          description: description,
          currencyCode: currencyCode,
          fixedAmount: fixedAmount,
          percentageBps: percentageBps,
          maxDiscountAmount: maxDiscountAmount,
          minSubtotalAmount: minSubtotalAmount,
          startsAt: startsAt,
          endsAt: endsAt,
          totalUsageLimit: totalUsageLimit,
          perCustomerUsageLimit: perCustomerUsageLimit,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
