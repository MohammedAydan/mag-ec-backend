//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'promotion_performance_sum_dto.g.dart';

/// PromotionPerformanceSumDto
///
/// Properties:
/// * [discountAmount] 
@BuiltValue()
abstract class PromotionPerformanceSumDto implements Built<PromotionPerformanceSumDto, PromotionPerformanceSumDtoBuilder> {
  @BuiltValueField(wireName: r'discountAmount')
  num? get discountAmount;

  PromotionPerformanceSumDto._();

  factory PromotionPerformanceSumDto([void updates(PromotionPerformanceSumDtoBuilder b)]) = _$PromotionPerformanceSumDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PromotionPerformanceSumDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PromotionPerformanceSumDto> get serializer => _$PromotionPerformanceSumDtoSerializer();
}

class _$PromotionPerformanceSumDtoSerializer implements PrimitiveSerializer<PromotionPerformanceSumDto> {
  @override
  final Iterable<Type> types = const [PromotionPerformanceSumDto, _$PromotionPerformanceSumDto];

  @override
  final String wireName = r'PromotionPerformanceSumDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PromotionPerformanceSumDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.discountAmount != null) {
      yield r'discountAmount';
      yield serializers.serialize(
        object.discountAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PromotionPerformanceSumDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PromotionPerformanceSumDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'discountAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.discountAmount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PromotionPerformanceSumDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PromotionPerformanceSumDtoBuilder();
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

