//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sales_summary_amount_sum_dto.g.dart';

/// SalesSummaryAmountSumDto
///
/// Properties:
/// * [grandTotalAmount]
/// * [subtotalAmount]
/// * [taxAmount]
/// * [shippingAmount]
@BuiltValue()
abstract class SalesSummaryAmountSumDto
    implements
        Built<SalesSummaryAmountSumDto, SalesSummaryAmountSumDtoBuilder> {
  @BuiltValueField(wireName: r'grandTotalAmount')
  num? get grandTotalAmount;

  @BuiltValueField(wireName: r'subtotalAmount')
  num? get subtotalAmount;

  @BuiltValueField(wireName: r'taxAmount')
  num? get taxAmount;

  @BuiltValueField(wireName: r'shippingAmount')
  num? get shippingAmount;

  SalesSummaryAmountSumDto._();

  factory SalesSummaryAmountSumDto(
          [void updates(SalesSummaryAmountSumDtoBuilder b)]) =
      _$SalesSummaryAmountSumDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SalesSummaryAmountSumDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SalesSummaryAmountSumDto> get serializer =>
      _$SalesSummaryAmountSumDtoSerializer();
}

class _$SalesSummaryAmountSumDtoSerializer
    implements PrimitiveSerializer<SalesSummaryAmountSumDto> {
  @override
  final Iterable<Type> types = const [
    SalesSummaryAmountSumDto,
    _$SalesSummaryAmountSumDto
  ];

  @override
  final String wireName = r'SalesSummaryAmountSumDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SalesSummaryAmountSumDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.grandTotalAmount != null) {
      yield r'grandTotalAmount';
      yield serializers.serialize(
        object.grandTotalAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.subtotalAmount != null) {
      yield r'subtotalAmount';
      yield serializers.serialize(
        object.subtotalAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.taxAmount != null) {
      yield r'taxAmount';
      yield serializers.serialize(
        object.taxAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.shippingAmount != null) {
      yield r'shippingAmount';
      yield serializers.serialize(
        object.shippingAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SalesSummaryAmountSumDto object, {
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
    required SalesSummaryAmountSumDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'grandTotalAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.grandTotalAmount = valueDes;
          break;
        case r'subtotalAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.subtotalAmount = valueDes;
          break;
        case r'taxAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.taxAmount = valueDes;
          break;
        case r'shippingAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.shippingAmount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SalesSummaryAmountSumDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SalesSummaryAmountSumDtoBuilder();
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
