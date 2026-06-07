//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upsert_promotion_dto.g.dart';

/// UpsertPromotionDto
///
/// Properties:
/// * [name] - Human-readable promotion name
/// * [status] - Promotion status
/// * [trigger] - How the promotion is triggered
/// * [rewardType] - Type of discount reward
/// * [description] - Promotion description
/// * [currencyCode] - ISO 4217 currency code
/// * [fixedAmount] - Fixed discount amount in minor units
/// * [percentageBps] - Percentage discount in basis points (e.g. 1000 = 10%)
/// * [maxDiscountAmount] - Maximum discount amount in minor units
/// * [minSubtotalAmount] - Minimum subtotal required in minor units
/// * [isCombinable] - Whether this promotion can combine with others
/// * [priority] - Evaluation priority (higher = evaluated first)
/// * [startsAt] - Start date (ISO 8601)
/// * [endsAt] - End date (ISO 8601)
/// * [totalUsageLimit] - Maximum number of total redemptions
/// * [perCustomerUsageLimit] - Maximum redemptions per customer
/// * [maxApplicationsPerOrder] - Maximum applications per order
/// * [excludedPromotionIds] - Promotion IDs excluded from stacking
@BuiltValue()
abstract class UpsertPromotionDto
    implements Built<UpsertPromotionDto, UpsertPromotionDtoBuilder> {
  /// Human-readable promotion name
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Promotion status
  @BuiltValueField(wireName: r'status')
  UpsertPromotionDtoStatusEnum get status;
  // enum statusEnum {  DRAFT,  ACTIVE,  ARCHIVED,  };

  /// How the promotion is triggered
  @BuiltValueField(wireName: r'trigger')
  UpsertPromotionDtoTriggerEnum get trigger;
  // enum triggerEnum {  AUTOMATIC,  COUPON,  };

  /// Type of discount reward
  @BuiltValueField(wireName: r'rewardType')
  UpsertPromotionDtoRewardTypeEnum get rewardType;
  // enum rewardTypeEnum {  FIXED_AMOUNT,  PERCENTAGE,  FREE_SHIPPING,  };

  /// Promotion description
  @BuiltValueField(wireName: r'description')
  String? get description;

  /// ISO 4217 currency code
  @BuiltValueField(wireName: r'currencyCode')
  String? get currencyCode;

  /// Fixed discount amount in minor units
  @BuiltValueField(wireName: r'fixedAmount')
  num? get fixedAmount;

  /// Percentage discount in basis points (e.g. 1000 = 10%)
  @BuiltValueField(wireName: r'percentageBps')
  num? get percentageBps;

  /// Maximum discount amount in minor units
  @BuiltValueField(wireName: r'maxDiscountAmount')
  num? get maxDiscountAmount;

  /// Minimum subtotal required in minor units
  @BuiltValueField(wireName: r'minSubtotalAmount')
  num? get minSubtotalAmount;

  /// Whether this promotion can combine with others
  @BuiltValueField(wireName: r'isCombinable')
  bool? get isCombinable;

  /// Evaluation priority (higher = evaluated first)
  @BuiltValueField(wireName: r'priority')
  num? get priority;

  /// Start date (ISO 8601)
  @BuiltValueField(wireName: r'startsAt')
  DateTime? get startsAt;

  /// End date (ISO 8601)
  @BuiltValueField(wireName: r'endsAt')
  DateTime? get endsAt;

  /// Maximum number of total redemptions
  @BuiltValueField(wireName: r'totalUsageLimit')
  num? get totalUsageLimit;

  /// Maximum redemptions per customer
  @BuiltValueField(wireName: r'perCustomerUsageLimit')
  num? get perCustomerUsageLimit;

  /// Maximum applications per order
  @BuiltValueField(wireName: r'maxApplicationsPerOrder')
  num? get maxApplicationsPerOrder;

  /// Promotion IDs excluded from stacking
  @BuiltValueField(wireName: r'excludedPromotionIds')
  BuiltSet<String>? get excludedPromotionIds;

  UpsertPromotionDto._();

  factory UpsertPromotionDto([void updates(UpsertPromotionDtoBuilder b)]) =
      _$UpsertPromotionDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpsertPromotionDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpsertPromotionDto> get serializer =>
      _$UpsertPromotionDtoSerializer();
}

class _$UpsertPromotionDtoSerializer
    implements PrimitiveSerializer<UpsertPromotionDto> {
  @override
  final Iterable<Type> types = const [UpsertPromotionDto, _$UpsertPromotionDto];

  @override
  final String wireName = r'UpsertPromotionDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpsertPromotionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(UpsertPromotionDtoStatusEnum),
    );
    yield r'trigger';
    yield serializers.serialize(
      object.trigger,
      specifiedType: const FullType(UpsertPromotionDtoTriggerEnum),
    );
    yield r'rewardType';
    yield serializers.serialize(
      object.rewardType,
      specifiedType: const FullType(UpsertPromotionDtoRewardTypeEnum),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.currencyCode != null) {
      yield r'currencyCode';
      yield serializers.serialize(
        object.currencyCode,
        specifiedType: const FullType(String),
      );
    }
    if (object.fixedAmount != null) {
      yield r'fixedAmount';
      yield serializers.serialize(
        object.fixedAmount,
        specifiedType: const FullType(num),
      );
    }
    if (object.percentageBps != null) {
      yield r'percentageBps';
      yield serializers.serialize(
        object.percentageBps,
        specifiedType: const FullType(num),
      );
    }
    if (object.maxDiscountAmount != null) {
      yield r'maxDiscountAmount';
      yield serializers.serialize(
        object.maxDiscountAmount,
        specifiedType: const FullType(num),
      );
    }
    if (object.minSubtotalAmount != null) {
      yield r'minSubtotalAmount';
      yield serializers.serialize(
        object.minSubtotalAmount,
        specifiedType: const FullType(num),
      );
    }
    if (object.isCombinable != null) {
      yield r'isCombinable';
      yield serializers.serialize(
        object.isCombinable,
        specifiedType: const FullType(bool),
      );
    }
    if (object.priority != null) {
      yield r'priority';
      yield serializers.serialize(
        object.priority,
        specifiedType: const FullType(num),
      );
    }
    if (object.startsAt != null) {
      yield r'startsAt';
      yield serializers.serialize(
        object.startsAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.endsAt != null) {
      yield r'endsAt';
      yield serializers.serialize(
        object.endsAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.totalUsageLimit != null) {
      yield r'totalUsageLimit';
      yield serializers.serialize(
        object.totalUsageLimit,
        specifiedType: const FullType(num),
      );
    }
    if (object.perCustomerUsageLimit != null) {
      yield r'perCustomerUsageLimit';
      yield serializers.serialize(
        object.perCustomerUsageLimit,
        specifiedType: const FullType(num),
      );
    }
    if (object.maxApplicationsPerOrder != null) {
      yield r'maxApplicationsPerOrder';
      yield serializers.serialize(
        object.maxApplicationsPerOrder,
        specifiedType: const FullType(num),
      );
    }
    if (object.excludedPromotionIds != null) {
      yield r'excludedPromotionIds';
      yield serializers.serialize(
        object.excludedPromotionIds,
        specifiedType: const FullType(BuiltSet, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpsertPromotionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpsertPromotionDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UpsertPromotionDtoStatusEnum),
          ) as UpsertPromotionDtoStatusEnum;
          result.status = valueDes;
          break;
        case r'trigger':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UpsertPromotionDtoTriggerEnum),
          ) as UpsertPromotionDtoTriggerEnum;
          result.trigger = valueDes;
          break;
        case r'rewardType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UpsertPromotionDtoRewardTypeEnum),
          ) as UpsertPromotionDtoRewardTypeEnum;
          result.rewardType = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyCode = valueDes;
          break;
        case r'fixedAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.fixedAmount = valueDes;
          break;
        case r'percentageBps':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.percentageBps = valueDes;
          break;
        case r'maxDiscountAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.maxDiscountAmount = valueDes;
          break;
        case r'minSubtotalAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.minSubtotalAmount = valueDes;
          break;
        case r'isCombinable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isCombinable = valueDes;
          break;
        case r'priority':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.priority = valueDes;
          break;
        case r'startsAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startsAt = valueDes;
          break;
        case r'endsAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endsAt = valueDes;
          break;
        case r'totalUsageLimit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.totalUsageLimit = valueDes;
          break;
        case r'perCustomerUsageLimit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.perCustomerUsageLimit = valueDes;
          break;
        case r'maxApplicationsPerOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.maxApplicationsPerOrder = valueDes;
          break;
        case r'excludedPromotionIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltSet, [FullType(String)]),
          ) as BuiltSet<String>;
          result.excludedPromotionIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpsertPromotionDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpsertPromotionDtoBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

class UpsertPromotionDtoStatusEnum extends EnumClass {
  /// Promotion status
  @BuiltValueEnumConst(wireName: r'DRAFT')
  static const UpsertPromotionDtoStatusEnum DRAFT =
      _$upsertPromotionDtoStatusEnum_DRAFT;

  /// Promotion status
  @BuiltValueEnumConst(wireName: r'ACTIVE')
  static const UpsertPromotionDtoStatusEnum ACTIVE =
      _$upsertPromotionDtoStatusEnum_ACTIVE;

  /// Promotion status
  @BuiltValueEnumConst(wireName: r'ARCHIVED')
  static const UpsertPromotionDtoStatusEnum ARCHIVED =
      _$upsertPromotionDtoStatusEnum_ARCHIVED;

  static Serializer<UpsertPromotionDtoStatusEnum> get serializer =>
      _$upsertPromotionDtoStatusEnumSerializer;

  const UpsertPromotionDtoStatusEnum._(String name) : super(name);

  static BuiltSet<UpsertPromotionDtoStatusEnum> get values =>
      _$upsertPromotionDtoStatusEnumValues;
  static UpsertPromotionDtoStatusEnum valueOf(String name) =>
      _$upsertPromotionDtoStatusEnumValueOf(name);
}

class UpsertPromotionDtoTriggerEnum extends EnumClass {
  /// How the promotion is triggered
  @BuiltValueEnumConst(wireName: r'AUTOMATIC')
  static const UpsertPromotionDtoTriggerEnum AUTOMATIC =
      _$upsertPromotionDtoTriggerEnum_AUTOMATIC;

  /// How the promotion is triggered
  @BuiltValueEnumConst(wireName: r'COUPON')
  static const UpsertPromotionDtoTriggerEnum COUPON =
      _$upsertPromotionDtoTriggerEnum_COUPON;

  static Serializer<UpsertPromotionDtoTriggerEnum> get serializer =>
      _$upsertPromotionDtoTriggerEnumSerializer;

  const UpsertPromotionDtoTriggerEnum._(String name) : super(name);

  static BuiltSet<UpsertPromotionDtoTriggerEnum> get values =>
      _$upsertPromotionDtoTriggerEnumValues;
  static UpsertPromotionDtoTriggerEnum valueOf(String name) =>
      _$upsertPromotionDtoTriggerEnumValueOf(name);
}

class UpsertPromotionDtoRewardTypeEnum extends EnumClass {
  /// Type of discount reward
  @BuiltValueEnumConst(wireName: r'FIXED_AMOUNT')
  static const UpsertPromotionDtoRewardTypeEnum FIXED_AMOUNT =
      _$upsertPromotionDtoRewardTypeEnum_FIXED_AMOUNT;

  /// Type of discount reward
  @BuiltValueEnumConst(wireName: r'PERCENTAGE')
  static const UpsertPromotionDtoRewardTypeEnum PERCENTAGE =
      _$upsertPromotionDtoRewardTypeEnum_PERCENTAGE;

  /// Type of discount reward
  @BuiltValueEnumConst(wireName: r'FREE_SHIPPING')
  static const UpsertPromotionDtoRewardTypeEnum FREE_SHIPPING =
      _$upsertPromotionDtoRewardTypeEnum_FREE_SHIPPING;

  static Serializer<UpsertPromotionDtoRewardTypeEnum> get serializer =>
      _$upsertPromotionDtoRewardTypeEnumSerializer;

  const UpsertPromotionDtoRewardTypeEnum._(String name) : super(name);

  static BuiltSet<UpsertPromotionDtoRewardTypeEnum> get values =>
      _$upsertPromotionDtoRewardTypeEnumValues;
  static UpsertPromotionDtoRewardTypeEnum valueOf(String name) =>
      _$upsertPromotionDtoRewardTypeEnumValueOf(name);
}
