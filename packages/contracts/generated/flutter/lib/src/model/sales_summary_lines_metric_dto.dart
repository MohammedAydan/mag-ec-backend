//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/sales_summary_lines_sum_dto.dart';
import 'package:mag_api_client/src/model/reporting_count_metric_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sales_summary_lines_metric_dto.g.dart';

/// SalesSummaryLinesMetricDto
///
/// Properties:
/// * [count]
/// * [sum]
@BuiltValue()
abstract class SalesSummaryLinesMetricDto
    implements
        Built<SalesSummaryLinesMetricDto, SalesSummaryLinesMetricDtoBuilder> {
  @BuiltValueField(wireName: r'_count')
  ReportingCountMetricDto get count;

  @BuiltValueField(wireName: r'_sum')
  SalesSummaryLinesSumDto get sum;

  SalesSummaryLinesMetricDto._();

  factory SalesSummaryLinesMetricDto(
          [void updates(SalesSummaryLinesMetricDtoBuilder b)]) =
      _$SalesSummaryLinesMetricDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SalesSummaryLinesMetricDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SalesSummaryLinesMetricDto> get serializer =>
      _$SalesSummaryLinesMetricDtoSerializer();
}

class _$SalesSummaryLinesMetricDtoSerializer
    implements PrimitiveSerializer<SalesSummaryLinesMetricDto> {
  @override
  final Iterable<Type> types = const [
    SalesSummaryLinesMetricDto,
    _$SalesSummaryLinesMetricDto
  ];

  @override
  final String wireName = r'SalesSummaryLinesMetricDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SalesSummaryLinesMetricDto object, {
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
      specifiedType: const FullType(SalesSummaryLinesSumDto),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SalesSummaryLinesMetricDto object, {
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
    required SalesSummaryLinesMetricDtoBuilder result,
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
            specifiedType: const FullType(SalesSummaryLinesSumDto),
          ) as SalesSummaryLinesSumDto;
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
  SalesSummaryLinesMetricDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SalesSummaryLinesMetricDtoBuilder();
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
