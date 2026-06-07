//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'top_product_sum_dto.g.dart';

/// TopProductSumDto
///
/// Properties:
/// * [quantity] 
/// * [lineSubtotalAmount] 
@BuiltValue()
abstract class TopProductSumDto implements Built<TopProductSumDto, TopProductSumDtoBuilder> {
  @BuiltValueField(wireName: r'quantity')
  num? get quantity;

  @BuiltValueField(wireName: r'lineSubtotalAmount')
  num? get lineSubtotalAmount;

  TopProductSumDto._();

  factory TopProductSumDto([void updates(TopProductSumDtoBuilder b)]) = _$TopProductSumDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TopProductSumDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TopProductSumDto> get serializer => _$TopProductSumDtoSerializer();
}

class _$TopProductSumDtoSerializer implements PrimitiveSerializer<TopProductSumDto> {
  @override
  final Iterable<Type> types = const [TopProductSumDto, _$TopProductSumDto];

  @override
  final String wireName = r'TopProductSumDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TopProductSumDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.quantity != null) {
      yield r'quantity';
      yield serializers.serialize(
        object.quantity,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.lineSubtotalAmount != null) {
      yield r'lineSubtotalAmount';
      yield serializers.serialize(
        object.lineSubtotalAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TopProductSumDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TopProductSumDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.quantity = valueDes;
          break;
        case r'lineSubtotalAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.lineSubtotalAmount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TopProductSumDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TopProductSumDtoBuilder();
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

