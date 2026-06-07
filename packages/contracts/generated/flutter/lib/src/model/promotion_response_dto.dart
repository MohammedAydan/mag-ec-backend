//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'promotion_response_dto.g.dart';

/// PromotionResponseDto
///
/// Properties:
/// * [id]
/// * [key]
/// * [name]
/// * [status]
/// * [trigger]
/// * [rewardType]
/// * [isCombinable]
/// * [priority]
/// * [maxApplicationsPerOrder]
/// * [reservedCount]
/// * [redeemedCount]
/// * [createdAt]
/// * [updatedAt]
/// * [description]
/// * [currencyCode]
/// * [fixedAmount]
/// * [percentageBps]
/// * [maxDiscountAmount]
/// * [minSubtotalAmount]
/// * [startsAt]
/// * [endsAt]
/// * [totalUsageLimit]
/// * [perCustomerUsageLimit]
@BuiltValue()
abstract class PromotionResponseDto
    implements Built<PromotionResponseDto, PromotionResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'trigger')
  String get trigger;

  @BuiltValueField(wireName: r'rewardType')
  String get rewardType;

  @BuiltValueField(wireName: r'isCombinable')
  bool get isCombinable;

  @BuiltValueField(wireName: r'priority')
  num get priority;

  @BuiltValueField(wireName: r'maxApplicationsPerOrder')
  num get maxApplicationsPerOrder;

  @BuiltValueField(wireName: r'reservedCount')
  num get reservedCount;

  @BuiltValueField(wireName: r'redeemedCount')
  num get redeemedCount;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'currencyCode')
  String? get currencyCode;

  @BuiltValueField(wireName: r'fixedAmount')
  num? get fixedAmount;

  @BuiltValueField(wireName: r'percentageBps')
  num? get percentageBps;

  @BuiltValueField(wireName: r'maxDiscountAmount')
  num? get maxDiscountAmount;

  @BuiltValueField(wireName: r'minSubtotalAmount')
  num? get minSubtotalAmount;

  @BuiltValueField(wireName: r'startsAt')
  String? get startsAt;

  @BuiltValueField(wireName: r'endsAt')
  String? get endsAt;

  @BuiltValueField(wireName: r'totalUsageLimit')
  num? get totalUsageLimit;

  @BuiltValueField(wireName: r'perCustomerUsageLimit')
  num? get perCustomerUsageLimit;

  PromotionResponseDto._();

  factory PromotionResponseDto([void updates(PromotionResponseDtoBuilder b)]) =
      _$PromotionResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PromotionResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PromotionResponseDto> get serializer =>
      _$PromotionResponseDtoSerializer();
}

class _$PromotionResponseDtoSerializer
    implements PrimitiveSerializer<PromotionResponseDto> {
  @override
  final Iterable<Type> types = const [
    PromotionResponseDto,
    _$PromotionResponseDto
  ];

  @override
  final String wireName = r'PromotionResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PromotionResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'trigger';
    yield serializers.serialize(
      object.trigger,
      specifiedType: const FullType(String),
    );
    yield r'rewardType';
    yield serializers.serialize(
      object.rewardType,
      specifiedType: const FullType(String),
    );
    yield r'isCombinable';
    yield serializers.serialize(
      object.isCombinable,
      specifiedType: const FullType(bool),
    );
    yield r'priority';
    yield serializers.serialize(
      object.priority,
      specifiedType: const FullType(num),
    );
    yield r'maxApplicationsPerOrder';
    yield serializers.serialize(
      object.maxApplicationsPerOrder,
      specifiedType: const FullType(num),
    );
    yield r'reservedCount';
    yield serializers.serialize(
      object.reservedCount,
      specifiedType: const FullType(num),
    );
    yield r'redeemedCount';
    yield serializers.serialize(
      object.redeemedCount,
      specifiedType: const FullType(num),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(String),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(String),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.currencyCode != null) {
      yield r'currencyCode';
      yield serializers.serialize(
        object.currencyCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.fixedAmount != null) {
      yield r'fixedAmount';
      yield serializers.serialize(
        object.fixedAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.percentageBps != null) {
      yield r'percentageBps';
      yield serializers.serialize(
        object.percentageBps,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.maxDiscountAmount != null) {
      yield r'maxDiscountAmount';
      yield serializers.serialize(
        object.maxDiscountAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.minSubtotalAmount != null) {
      yield r'minSubtotalAmount';
      yield serializers.serialize(
        object.minSubtotalAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.startsAt != null) {
      yield r'startsAt';
      yield serializers.serialize(
        object.startsAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.endsAt != null) {
      yield r'endsAt';
      yield serializers.serialize(
        object.endsAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.totalUsageLimit != null) {
      yield r'totalUsageLimit';
      yield serializers.serialize(
        object.totalUsageLimit,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.perCustomerUsageLimit != null) {
      yield r'perCustomerUsageLimit';
      yield serializers.serialize(
        object.perCustomerUsageLimit,
        specifiedType: const FullType.nullable(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PromotionResponseDto object, {
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
    required PromotionResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
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
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'trigger':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.trigger = valueDes;
          break;
        case r'rewardType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.rewardType = valueDes;
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
        case r'maxApplicationsPerOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.maxApplicationsPerOrder = valueDes;
          break;
        case r'reservedCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.reservedCount = valueDes;
          break;
        case r'redeemedCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.redeemedCount = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.updatedAt = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currencyCode = valueDes;
          break;
        case r'fixedAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.fixedAmount = valueDes;
          break;
        case r'percentageBps':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.percentageBps = valueDes;
          break;
        case r'maxDiscountAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.maxDiscountAmount = valueDes;
          break;
        case r'minSubtotalAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.minSubtotalAmount = valueDes;
          break;
        case r'startsAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.startsAt = valueDes;
          break;
        case r'endsAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.endsAt = valueDes;
          break;
        case r'totalUsageLimit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.totalUsageLimit = valueDes;
          break;
        case r'perCustomerUsageLimit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.perCustomerUsageLimit = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PromotionResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PromotionResponseDtoBuilder();
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
