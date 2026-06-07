// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_promotion_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UpsertPromotionDtoStatusEnum _$upsertPromotionDtoStatusEnum_DRAFT =
    const UpsertPromotionDtoStatusEnum._('DRAFT');
const UpsertPromotionDtoStatusEnum _$upsertPromotionDtoStatusEnum_ACTIVE =
    const UpsertPromotionDtoStatusEnum._('ACTIVE');
const UpsertPromotionDtoStatusEnum _$upsertPromotionDtoStatusEnum_ARCHIVED =
    const UpsertPromotionDtoStatusEnum._('ARCHIVED');

UpsertPromotionDtoStatusEnum _$upsertPromotionDtoStatusEnumValueOf(
    String name) {
  switch (name) {
    case 'DRAFT':
      return _$upsertPromotionDtoStatusEnum_DRAFT;
    case 'ACTIVE':
      return _$upsertPromotionDtoStatusEnum_ACTIVE;
    case 'ARCHIVED':
      return _$upsertPromotionDtoStatusEnum_ARCHIVED;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UpsertPromotionDtoStatusEnum>
    _$upsertPromotionDtoStatusEnumValues =
    BuiltSet<UpsertPromotionDtoStatusEnum>(const <UpsertPromotionDtoStatusEnum>[
  _$upsertPromotionDtoStatusEnum_DRAFT,
  _$upsertPromotionDtoStatusEnum_ACTIVE,
  _$upsertPromotionDtoStatusEnum_ARCHIVED,
]);

const UpsertPromotionDtoTriggerEnum _$upsertPromotionDtoTriggerEnum_AUTOMATIC =
    const UpsertPromotionDtoTriggerEnum._('AUTOMATIC');
const UpsertPromotionDtoTriggerEnum _$upsertPromotionDtoTriggerEnum_COUPON =
    const UpsertPromotionDtoTriggerEnum._('COUPON');

UpsertPromotionDtoTriggerEnum _$upsertPromotionDtoTriggerEnumValueOf(
    String name) {
  switch (name) {
    case 'AUTOMATIC':
      return _$upsertPromotionDtoTriggerEnum_AUTOMATIC;
    case 'COUPON':
      return _$upsertPromotionDtoTriggerEnum_COUPON;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UpsertPromotionDtoTriggerEnum>
    _$upsertPromotionDtoTriggerEnumValues = BuiltSet<
        UpsertPromotionDtoTriggerEnum>(const <UpsertPromotionDtoTriggerEnum>[
  _$upsertPromotionDtoTriggerEnum_AUTOMATIC,
  _$upsertPromotionDtoTriggerEnum_COUPON,
]);

const UpsertPromotionDtoRewardTypeEnum
    _$upsertPromotionDtoRewardTypeEnum_FIXED_AMOUNT =
    const UpsertPromotionDtoRewardTypeEnum._('FIXED_AMOUNT');
const UpsertPromotionDtoRewardTypeEnum
    _$upsertPromotionDtoRewardTypeEnum_PERCENTAGE =
    const UpsertPromotionDtoRewardTypeEnum._('PERCENTAGE');
const UpsertPromotionDtoRewardTypeEnum
    _$upsertPromotionDtoRewardTypeEnum_FREE_SHIPPING =
    const UpsertPromotionDtoRewardTypeEnum._('FREE_SHIPPING');

UpsertPromotionDtoRewardTypeEnum _$upsertPromotionDtoRewardTypeEnumValueOf(
    String name) {
  switch (name) {
    case 'FIXED_AMOUNT':
      return _$upsertPromotionDtoRewardTypeEnum_FIXED_AMOUNT;
    case 'PERCENTAGE':
      return _$upsertPromotionDtoRewardTypeEnum_PERCENTAGE;
    case 'FREE_SHIPPING':
      return _$upsertPromotionDtoRewardTypeEnum_FREE_SHIPPING;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UpsertPromotionDtoRewardTypeEnum>
    _$upsertPromotionDtoRewardTypeEnumValues = BuiltSet<
        UpsertPromotionDtoRewardTypeEnum>(const <UpsertPromotionDtoRewardTypeEnum>[
  _$upsertPromotionDtoRewardTypeEnum_FIXED_AMOUNT,
  _$upsertPromotionDtoRewardTypeEnum_PERCENTAGE,
  _$upsertPromotionDtoRewardTypeEnum_FREE_SHIPPING,
]);

Serializer<UpsertPromotionDtoStatusEnum>
    _$upsertPromotionDtoStatusEnumSerializer =
    _$UpsertPromotionDtoStatusEnumSerializer();
Serializer<UpsertPromotionDtoTriggerEnum>
    _$upsertPromotionDtoTriggerEnumSerializer =
    _$UpsertPromotionDtoTriggerEnumSerializer();
Serializer<UpsertPromotionDtoRewardTypeEnum>
    _$upsertPromotionDtoRewardTypeEnumSerializer =
    _$UpsertPromotionDtoRewardTypeEnumSerializer();

class _$UpsertPromotionDtoStatusEnumSerializer
    implements PrimitiveSerializer<UpsertPromotionDtoStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'DRAFT': 'DRAFT',
    'ACTIVE': 'ACTIVE',
    'ARCHIVED': 'ARCHIVED',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'DRAFT': 'DRAFT',
    'ACTIVE': 'ACTIVE',
    'ARCHIVED': 'ARCHIVED',
  };

  @override
  final Iterable<Type> types = const <Type>[UpsertPromotionDtoStatusEnum];
  @override
  final String wireName = 'UpsertPromotionDtoStatusEnum';

  @override
  Object serialize(Serializers serializers, UpsertPromotionDtoStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UpsertPromotionDtoStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UpsertPromotionDtoStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$UpsertPromotionDtoTriggerEnumSerializer
    implements PrimitiveSerializer<UpsertPromotionDtoTriggerEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'AUTOMATIC': 'AUTOMATIC',
    'COUPON': 'COUPON',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'AUTOMATIC': 'AUTOMATIC',
    'COUPON': 'COUPON',
  };

  @override
  final Iterable<Type> types = const <Type>[UpsertPromotionDtoTriggerEnum];
  @override
  final String wireName = 'UpsertPromotionDtoTriggerEnum';

  @override
  Object serialize(
          Serializers serializers, UpsertPromotionDtoTriggerEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UpsertPromotionDtoTriggerEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UpsertPromotionDtoTriggerEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$UpsertPromotionDtoRewardTypeEnumSerializer
    implements PrimitiveSerializer<UpsertPromotionDtoRewardTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'FIXED_AMOUNT': 'FIXED_AMOUNT',
    'PERCENTAGE': 'PERCENTAGE',
    'FREE_SHIPPING': 'FREE_SHIPPING',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'FIXED_AMOUNT': 'FIXED_AMOUNT',
    'PERCENTAGE': 'PERCENTAGE',
    'FREE_SHIPPING': 'FREE_SHIPPING',
  };

  @override
  final Iterable<Type> types = const <Type>[UpsertPromotionDtoRewardTypeEnum];
  @override
  final String wireName = 'UpsertPromotionDtoRewardTypeEnum';

  @override
  Object serialize(
          Serializers serializers, UpsertPromotionDtoRewardTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UpsertPromotionDtoRewardTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UpsertPromotionDtoRewardTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$UpsertPromotionDto extends UpsertPromotionDto {
  @override
  final String name;
  @override
  final UpsertPromotionDtoStatusEnum status;
  @override
  final UpsertPromotionDtoTriggerEnum trigger;
  @override
  final UpsertPromotionDtoRewardTypeEnum rewardType;
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
  final bool? isCombinable;
  @override
  final num? priority;
  @override
  final DateTime? startsAt;
  @override
  final DateTime? endsAt;
  @override
  final num? totalUsageLimit;
  @override
  final num? perCustomerUsageLimit;
  @override
  final num? maxApplicationsPerOrder;
  @override
  final BuiltSet<String>? excludedPromotionIds;

  factory _$UpsertPromotionDto(
          [void Function(UpsertPromotionDtoBuilder)? updates]) =>
      (UpsertPromotionDtoBuilder()..update(updates))._build();

  _$UpsertPromotionDto._(
      {required this.name,
      required this.status,
      required this.trigger,
      required this.rewardType,
      this.description,
      this.currencyCode,
      this.fixedAmount,
      this.percentageBps,
      this.maxDiscountAmount,
      this.minSubtotalAmount,
      this.isCombinable,
      this.priority,
      this.startsAt,
      this.endsAt,
      this.totalUsageLimit,
      this.perCustomerUsageLimit,
      this.maxApplicationsPerOrder,
      this.excludedPromotionIds})
      : super._();
  @override
  UpsertPromotionDto rebuild(
          void Function(UpsertPromotionDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpsertPromotionDtoBuilder toBuilder() =>
      UpsertPromotionDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpsertPromotionDto &&
        name == other.name &&
        status == other.status &&
        trigger == other.trigger &&
        rewardType == other.rewardType &&
        description == other.description &&
        currencyCode == other.currencyCode &&
        fixedAmount == other.fixedAmount &&
        percentageBps == other.percentageBps &&
        maxDiscountAmount == other.maxDiscountAmount &&
        minSubtotalAmount == other.minSubtotalAmount &&
        isCombinable == other.isCombinable &&
        priority == other.priority &&
        startsAt == other.startsAt &&
        endsAt == other.endsAt &&
        totalUsageLimit == other.totalUsageLimit &&
        perCustomerUsageLimit == other.perCustomerUsageLimit &&
        maxApplicationsPerOrder == other.maxApplicationsPerOrder &&
        excludedPromotionIds == other.excludedPromotionIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, trigger.hashCode);
    _$hash = $jc(_$hash, rewardType.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, fixedAmount.hashCode);
    _$hash = $jc(_$hash, percentageBps.hashCode);
    _$hash = $jc(_$hash, maxDiscountAmount.hashCode);
    _$hash = $jc(_$hash, minSubtotalAmount.hashCode);
    _$hash = $jc(_$hash, isCombinable.hashCode);
    _$hash = $jc(_$hash, priority.hashCode);
    _$hash = $jc(_$hash, startsAt.hashCode);
    _$hash = $jc(_$hash, endsAt.hashCode);
    _$hash = $jc(_$hash, totalUsageLimit.hashCode);
    _$hash = $jc(_$hash, perCustomerUsageLimit.hashCode);
    _$hash = $jc(_$hash, maxApplicationsPerOrder.hashCode);
    _$hash = $jc(_$hash, excludedPromotionIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpsertPromotionDto')
          ..add('name', name)
          ..add('status', status)
          ..add('trigger', trigger)
          ..add('rewardType', rewardType)
          ..add('description', description)
          ..add('currencyCode', currencyCode)
          ..add('fixedAmount', fixedAmount)
          ..add('percentageBps', percentageBps)
          ..add('maxDiscountAmount', maxDiscountAmount)
          ..add('minSubtotalAmount', minSubtotalAmount)
          ..add('isCombinable', isCombinable)
          ..add('priority', priority)
          ..add('startsAt', startsAt)
          ..add('endsAt', endsAt)
          ..add('totalUsageLimit', totalUsageLimit)
          ..add('perCustomerUsageLimit', perCustomerUsageLimit)
          ..add('maxApplicationsPerOrder', maxApplicationsPerOrder)
          ..add('excludedPromotionIds', excludedPromotionIds))
        .toString();
  }
}

class UpsertPromotionDtoBuilder
    implements Builder<UpsertPromotionDto, UpsertPromotionDtoBuilder> {
  _$UpsertPromotionDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  UpsertPromotionDtoStatusEnum? _status;
  UpsertPromotionDtoStatusEnum? get status => _$this._status;
  set status(UpsertPromotionDtoStatusEnum? status) => _$this._status = status;

  UpsertPromotionDtoTriggerEnum? _trigger;
  UpsertPromotionDtoTriggerEnum? get trigger => _$this._trigger;
  set trigger(UpsertPromotionDtoTriggerEnum? trigger) =>
      _$this._trigger = trigger;

  UpsertPromotionDtoRewardTypeEnum? _rewardType;
  UpsertPromotionDtoRewardTypeEnum? get rewardType => _$this._rewardType;
  set rewardType(UpsertPromotionDtoRewardTypeEnum? rewardType) =>
      _$this._rewardType = rewardType;

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

  bool? _isCombinable;
  bool? get isCombinable => _$this._isCombinable;
  set isCombinable(bool? isCombinable) => _$this._isCombinable = isCombinable;

  num? _priority;
  num? get priority => _$this._priority;
  set priority(num? priority) => _$this._priority = priority;

  DateTime? _startsAt;
  DateTime? get startsAt => _$this._startsAt;
  set startsAt(DateTime? startsAt) => _$this._startsAt = startsAt;

  DateTime? _endsAt;
  DateTime? get endsAt => _$this._endsAt;
  set endsAt(DateTime? endsAt) => _$this._endsAt = endsAt;

  num? _totalUsageLimit;
  num? get totalUsageLimit => _$this._totalUsageLimit;
  set totalUsageLimit(num? totalUsageLimit) =>
      _$this._totalUsageLimit = totalUsageLimit;

  num? _perCustomerUsageLimit;
  num? get perCustomerUsageLimit => _$this._perCustomerUsageLimit;
  set perCustomerUsageLimit(num? perCustomerUsageLimit) =>
      _$this._perCustomerUsageLimit = perCustomerUsageLimit;

  num? _maxApplicationsPerOrder;
  num? get maxApplicationsPerOrder => _$this._maxApplicationsPerOrder;
  set maxApplicationsPerOrder(num? maxApplicationsPerOrder) =>
      _$this._maxApplicationsPerOrder = maxApplicationsPerOrder;

  SetBuilder<String>? _excludedPromotionIds;
  SetBuilder<String> get excludedPromotionIds =>
      _$this._excludedPromotionIds ??= SetBuilder<String>();
  set excludedPromotionIds(SetBuilder<String>? excludedPromotionIds) =>
      _$this._excludedPromotionIds = excludedPromotionIds;

  UpsertPromotionDtoBuilder() {
    UpsertPromotionDto._defaults(this);
  }

  UpsertPromotionDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _status = $v.status;
      _trigger = $v.trigger;
      _rewardType = $v.rewardType;
      _description = $v.description;
      _currencyCode = $v.currencyCode;
      _fixedAmount = $v.fixedAmount;
      _percentageBps = $v.percentageBps;
      _maxDiscountAmount = $v.maxDiscountAmount;
      _minSubtotalAmount = $v.minSubtotalAmount;
      _isCombinable = $v.isCombinable;
      _priority = $v.priority;
      _startsAt = $v.startsAt;
      _endsAt = $v.endsAt;
      _totalUsageLimit = $v.totalUsageLimit;
      _perCustomerUsageLimit = $v.perCustomerUsageLimit;
      _maxApplicationsPerOrder = $v.maxApplicationsPerOrder;
      _excludedPromotionIds = $v.excludedPromotionIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpsertPromotionDto other) {
    _$v = other as _$UpsertPromotionDto;
  }

  @override
  void update(void Function(UpsertPromotionDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpsertPromotionDto build() => _build();

  _$UpsertPromotionDto _build() {
    _$UpsertPromotionDto _$result;
    try {
      _$result = _$v ??
          _$UpsertPromotionDto._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'UpsertPromotionDto', 'name'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'UpsertPromotionDto', 'status'),
            trigger: BuiltValueNullFieldError.checkNotNull(
                trigger, r'UpsertPromotionDto', 'trigger'),
            rewardType: BuiltValueNullFieldError.checkNotNull(
                rewardType, r'UpsertPromotionDto', 'rewardType'),
            description: description,
            currencyCode: currencyCode,
            fixedAmount: fixedAmount,
            percentageBps: percentageBps,
            maxDiscountAmount: maxDiscountAmount,
            minSubtotalAmount: minSubtotalAmount,
            isCombinable: isCombinable,
            priority: priority,
            startsAt: startsAt,
            endsAt: endsAt,
            totalUsageLimit: totalUsageLimit,
            perCustomerUsageLimit: perCustomerUsageLimit,
            maxApplicationsPerOrder: maxApplicationsPerOrder,
            excludedPromotionIds: _excludedPromotionIds?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'excludedPromotionIds';
        _excludedPromotionIds?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UpsertPromotionDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
