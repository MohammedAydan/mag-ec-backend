//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/sales_summary_refunds_sum_dto.dart';
import 'package:mag_api_client/src/model/reporting_count_metric_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sales_summary_refunds_metric_dto.g.dart';

/// SalesSummaryRefundsMetricDto
///
/// Properties:
/// * [count]
/// * [sum]
@BuiltValue()
abstract class SalesSummaryRefundsMetricDto
    implements
        Built<SalesSummaryRefundsMetricDto,
            SalesSummaryRefundsMetricDtoBuilder> {
  @BuiltValueField(wireName: r'_count')
  ReportingCountMetricDto get count;

  @BuiltValueField(wireName: r'_sum')
  SalesSummaryRefundsSumDto get sum;

  SalesSummaryRefundsMetricDto._();

  factory SalesSummaryRefundsMetricDto(
          [void updates(SalesSummaryRefundsMetricDtoBuilder b)]) =
      _$SalesSummaryRefundsMetricDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SalesSummaryRefundsMetricDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SalesSummaryRefundsMetricDto> get serializer =>
      _$SalesSummaryRefundsMetricDtoSerializer();
}

class _$SalesSummaryRefundsMetricDtoSerializer
    implements PrimitiveSerializer<SalesSummaryRefundsMetricDto> {
  @override
  final Iterable<Type> types = const [
    SalesSummaryRefundsMetricDto,
    _$SalesSummaryRefundsMetricDto
  ];

  @override
  final String wireName = r'SalesSummaryRefundsMetricDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SalesSummaryRefundsMetricDto object, {
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
      specifiedType: const FullType(SalesSummaryRefundsSumDto),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SalesSummaryRefundsMetricDto object, {
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
    required SalesSummaryRefundsMetricDtoBuilder result,
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
            specifiedType: const FullType(SalesSummaryRefundsSumDto),
          ) as SalesSummaryRefundsSumDto;
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
  SalesSummaryRefundsMetricDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SalesSummaryRefundsMetricDtoBuilder();
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
