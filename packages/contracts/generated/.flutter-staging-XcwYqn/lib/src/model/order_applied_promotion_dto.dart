//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_applied_promotion_dto.g.dart';

/// OrderAppliedPromotionDto
///
/// Properties:
/// * [id] 
/// * [promotionId] 
/// * [key] 
/// * [name] 
/// * [rewardType] 
/// * [discountAmount] 
/// * [freeShipping] 
/// * [source_] 
/// * [couponCode] 
@BuiltValue()
abstract class OrderAppliedPromotionDto implements Built<OrderAppliedPromotionDto, OrderAppliedPromotionDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'promotionId')
  String get promotionId;

  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'rewardType')
  String get rewardType;

  @BuiltValueField(wireName: r'discountAmount')
  num get discountAmount;

  @BuiltValueField(wireName: r'freeShipping')
  bool get freeShipping;

  @BuiltValueField(wireName: r'source')
  String get source_;

  @BuiltValueField(wireName: r'couponCode')
  String? get couponCode;

  OrderAppliedPromotionDto._();

  factory OrderAppliedPromotionDto([void updates(OrderAppliedPromotionDtoBuilder b)]) = _$OrderAppliedPromotionDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrderAppliedPromotionDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrderAppliedPromotionDto> get serializer => _$OrderAppliedPromotionDtoSerializer();
}

class _$OrderAppliedPromotionDtoSerializer implements PrimitiveSerializer<OrderAppliedPromotionDto> {
  @override
  final Iterable<Type> types = const [OrderAppliedPromotionDto, _$OrderAppliedPromotionDto];

  @override
  final String wireName = r'OrderAppliedPromotionDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrderAppliedPromotionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'promotionId';
    yield serializers.serialize(
      object.promotionId,
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
    yield r'rewardType';
    yield serializers.serialize(
      object.rewardType,
      specifiedType: const FullType(String),
    );
    yield r'discountAmount';
    yield serializers.serialize(
      object.discountAmount,
      specifiedType: const FullType(num),
    );
    yield r'freeShipping';
    yield serializers.serialize(
      object.freeShipping,
      specifiedType: const FullType(bool),
    );
    yield r'source';
    yield serializers.serialize(
      object.source_,
      specifiedType: const FullType(String),
    );
    if (object.couponCode != null) {
      yield r'couponCode';
      yield serializers.serialize(
        object.couponCode,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrderAppliedPromotionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrderAppliedPromotionDtoBuilder result,
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
        case r'promotionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.promotionId = valueDes;
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
        case r'rewardType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.rewardType = valueDes;
          break;
        case r'discountAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.discountAmount = valueDes;
          break;
        case r'freeShipping':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.freeShipping = valueDes;
          break;
        case r'source':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.source_ = valueDes;
          break;
        case r'couponCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.couponCode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrderAppliedPromotionDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrderAppliedPromotionDtoBuilder();
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

