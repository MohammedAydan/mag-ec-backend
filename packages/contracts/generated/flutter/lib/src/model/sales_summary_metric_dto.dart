//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/reporting_count_metric_dto.dart';
import 'package:mag_api_client/src/model/sales_summary_amount_sum_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sales_summary_metric_dto.g.dart';

/// SalesSummaryMetricDto
///
/// Properties:
/// * [count]
/// * [sum]
@BuiltValue()
abstract class SalesSummaryMetricDto
    implements Built<SalesSummaryMetricDto, SalesSummaryMetricDtoBuilder> {
  @BuiltValueField(wireName: r'_count')
  ReportingCountMetricDto get count;

  @BuiltValueField(wireName: r'_sum')
  SalesSummaryAmountSumDto get sum;

  SalesSummaryMetricDto._();

  factory SalesSummaryMetricDto(
      [void updates(SalesSummaryMetricDtoBuilder b)]) = _$SalesSummaryMetricDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SalesSummaryMetricDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SalesSummaryMetricDto> get serializer =>
      _$SalesSummaryMetricDtoSerializer();
}

class _$SalesSummaryMetricDtoSerializer
    implements PrimitiveSerializer<SalesSummaryMetricDto> {
  @override
  final Iterable<Type> types = const [
    SalesSummaryMetricDto,
    _$SalesSummaryMetricDto
  ];

  @override
  final String wireName = r'SalesSummaryMetricDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SalesSummaryMetricDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'_count';
    yield serializers.serialize(
      object.count,
      specifiedType: const FullType(ReportingCountMetricDto),
    );
    yield r'_sum';
    yield serializers.serialize(
      object.sum,
      specifiedType: const FullType(SalesSummaryAmountSumDto),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SalesSummaryMetricDto object, {
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
    required SalesSummaryMetricDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReportingCountMetricDto),
          ) as ReportingCountMetricDto;
          result.count.replace(valueDes);
          break;
        case r'_sum':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SalesSummaryAmountSumDto),
          ) as SalesSummaryAmountSumDto;
          result.sum.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SalesSummaryMetricDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SalesSummaryMetricDtoBuilder();
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
