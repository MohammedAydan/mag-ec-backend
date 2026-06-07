//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sales_summary_lines_sum_dto.g.dart';

/// SalesSummaryLinesSumDto
///
/// Properties:
/// * [quantity]
/// * [lineSubtotalAmount]
/// * [taxAmount]
@BuiltValue()
abstract class SalesSummaryLinesSumDto
    implements Built<SalesSummaryLinesSumDto, SalesSummaryLinesSumDtoBuilder> {
  @BuiltValueField(wireName: r'quantity')
  num? get quantity;

  @BuiltValueField(wireName: r'lineSubtotalAmount')
  num? get lineSubtotalAmount;

  @BuiltValueField(wireName: r'taxAmount')
  num? get taxAmount;

  SalesSummaryLinesSumDto._();

  factory SalesSummaryLinesSumDto(
          [void updates(SalesSummaryLinesSumDtoBuilder b)]) =
      _$SalesSummaryLinesSumDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SalesSummaryLinesSumDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SalesSummaryLinesSumDto> get serializer =>
      _$SalesSummaryLinesSumDtoSerializer();
}

class _$SalesSummaryLinesSumDtoSerializer
    implements PrimitiveSerializer<SalesSummaryLinesSumDto> {
  @override
  final Iterable<Type> types = const [
    SalesSummaryLinesSumDto,
    _$SalesSummaryLinesSumDto
  ];

  @override
  final String wireName = r'SalesSummaryLinesSumDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SalesSummaryLinesSumDto object, {
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
    if (object.taxAmount != null) {
      yield r'taxAmount';
      yield serializers.serialize(
        object.taxAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SalesSummaryLinesSumDto object, {
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
    required SalesSummaryLinesSumDtoBuilder result,
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
        case r'taxAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.taxAmount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SalesSummaryLinesSumDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SalesSummaryLinesSumDtoBuilder();
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
