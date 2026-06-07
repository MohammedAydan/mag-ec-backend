//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pricing_preview_applied_promotion_dto.g.dart';

/// PricingPreviewAppliedPromotionDto
///
/// Properties:
/// * [key] 
/// * [name] 
/// * [subtotalDiscountAmount] 
/// * [freeShipping] 
@BuiltValue()
abstract class PricingPreviewAppliedPromotionDto implements Built<PricingPreviewAppliedPromotionDto, PricingPreviewAppliedPromotionDtoBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'subtotalDiscountAmount')
  num get subtotalDiscountAmount;

  @BuiltValueField(wireName: r'freeShipping')
  bool get freeShipping;

  PricingPreviewAppliedPromotionDto._();

  factory PricingPreviewAppliedPromotionDto([void updates(PricingPreviewAppliedPromotionDtoBuilder b)]) = _$PricingPreviewAppliedPromotionDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PricingPreviewAppliedPromotionDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PricingPreviewAppliedPromotionDto> get serializer => _$PricingPreviewAppliedPromotionDtoSerializer();
}

class _$PricingPreviewAppliedPromotionDtoSerializer implements PrimitiveSerializer<PricingPreviewAppliedPromotionDto> {
  @override
  final Iterable<Type> types = const [PricingPreviewAppliedPromotionDto, _$PricingPreviewAppliedPromotionDto];

  @override
  final String wireName = r'PricingPreviewAppliedPromotionDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PricingPreviewAppliedPromotionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    yield r'subtotalDiscountAmount';
    yield serializers.serialize(
      object.subtotalDiscountAmount,
      specifiedType: const FullType(num),
    );
    yield r'freeShipping';
    yield serializers.serialize(
      object.freeShipping,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PricingPreviewAppliedPromotionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PricingPreviewAppliedPromotionDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'subtotalDiscountAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.subtotalDiscountAmount = valueDes;
          break;
        case r'freeShipping':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.freeShipping = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PricingPreviewAppliedPromotionDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PricingPreviewAppliedPromotionDtoBuilder();
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

