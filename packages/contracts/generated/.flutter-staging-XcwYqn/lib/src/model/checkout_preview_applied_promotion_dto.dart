//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'checkout_preview_applied_promotion_dto.g.dart';

/// CheckoutPreviewAppliedPromotionDto
///
/// Properties:
/// * [promotionId] 
/// * [key] 
/// * [name] 
/// * [rewardType] 
/// * [discountAmount] 
/// * [freeShipping] 
/// * [source_] 
/// * [couponCode] 
@BuiltValue()
abstract class CheckoutPreviewAppliedPromotionDto implements Built<CheckoutPreviewAppliedPromotionDto, CheckoutPreviewAppliedPromotionDtoBuilder> {
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

  CheckoutPreviewAppliedPromotionDto._();

  factory CheckoutPreviewAppliedPromotionDto([void updates(CheckoutPreviewAppliedPromotionDtoBuilder b)]) = _$CheckoutPreviewAppliedPromotionDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckoutPreviewAppliedPromotionDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckoutPreviewAppliedPromotionDto> get serializer => _$CheckoutPreviewAppliedPromotionDtoSerializer();
}

class _$CheckoutPreviewAppliedPromotionDtoSerializer implements PrimitiveSerializer<CheckoutPreviewAppliedPromotionDto> {
  @override
  final Iterable<Type> types = const [CheckoutPreviewAppliedPromotionDto, _$CheckoutPreviewAppliedPromotionDto];

  @override
  final String wireName = r'CheckoutPreviewAppliedPromotionDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckoutPreviewAppliedPromotionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    CheckoutPreviewAppliedPromotionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CheckoutPreviewAppliedPromotionDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  CheckoutPreviewAppliedPromotionDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckoutPreviewAppliedPromotionDtoBuilder();
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

