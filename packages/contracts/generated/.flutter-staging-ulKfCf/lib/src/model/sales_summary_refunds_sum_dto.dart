//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sales_summary_refunds_sum_dto.g.dart';

/// SalesSummaryRefundsSumDto
///
/// Properties:
/// * [amount] 
@BuiltValue()
abstract class SalesSummaryRefundsSumDto implements Built<SalesSummaryRefundsSumDto, SalesSummaryRefundsSumDtoBuilder> {
  @BuiltValueField(wireName: r'amount')
  num? get amount;

  SalesSummaryRefundsSumDto._();

  factory SalesSummaryRefundsSumDto([void updates(SalesSummaryRefundsSumDtoBuilder b)]) = _$SalesSummaryRefundsSumDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SalesSummaryRefundsSumDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SalesSummaryRefundsSumDto> get serializer => _$SalesSummaryRefundsSumDtoSerializer();
}

class _$SalesSummaryRefundsSumDtoSerializer implements PrimitiveSerializer<SalesSummaryRefundsSumDto> {
  @override
  final Iterable<Type> types = const [SalesSummaryRefundsSumDto, _$SalesSummaryRefundsSumDto];

  @override
  final String wireName = r'SalesSummaryRefundsSumDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SalesSummaryRefundsSumDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.amount != null) {
      yield r'amount';
      yield serializers.serialize(
        object.amount,
        specifiedType: const FullType.nullable(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SalesSummaryRefundsSumDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SalesSummaryRefundsSumDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.amount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SalesSummaryRefundsSumDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SalesSummaryRefundsSumDtoBuilder();
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

