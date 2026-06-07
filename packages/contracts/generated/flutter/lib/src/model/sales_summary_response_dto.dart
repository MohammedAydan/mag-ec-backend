//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/sales_summary_refunds_metric_dto.dart';
import 'package:mag_api_client/src/model/sales_summary_lines_metric_dto.dart';
import 'package:mag_api_client/src/model/sales_summary_metric_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sales_summary_response_dto.g.dart';

/// SalesSummaryResponseDto
///
/// Properties:
/// * [orders]
/// * [orderLines]
/// * [refunds]
@BuiltValue()
abstract class SalesSummaryResponseDto
    implements Built<SalesSummaryResponseDto, SalesSummaryResponseDtoBuilder> {
  @BuiltValueField(wireName: r'orders')
  SalesSummaryMetricDto get orders;

  @BuiltValueField(wireName: r'orderLines')
  SalesSummaryLinesMetricDto get orderLines;

  @BuiltValueField(wireName: r'refunds')
  SalesSummaryRefundsMetricDto get refunds;

  SalesSummaryResponseDto._();

  factory SalesSummaryResponseDto(
          [void updates(SalesSummaryResponseDtoBuilder b)]) =
      _$SalesSummaryResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SalesSummaryResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SalesSummaryResponseDto> get serializer =>
      _$SalesSummaryResponseDtoSerializer();
}

class _$SalesSummaryResponseDtoSerializer
    implements PrimitiveSerializer<SalesSummaryResponseDto> {
  @override
  final Iterable<Type> types = const [
    SalesSummaryResponseDto,
    _$SalesSummaryResponseDto
  ];

  @override
  final String wireName = r'SalesSummaryResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SalesSummaryResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'orders';
    yield serializers.serialize(
      object.orders,
      specifiedType: const FullType(SalesSummaryMetricDto),
    );
    yield r'orderLines';
    yield serializers.serialize(
      object.orderLines,
      specifiedType: const FullType(SalesSummaryLinesMetricDto),
    );
    yield r'refunds';
    yield serializers.serialize(
      object.refunds,
      specifiedType: const FullType(SalesSummaryRefundsMetricDto),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SalesSummaryResponseDto object, {
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
    required SalesSummaryResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'orders':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SalesSummaryMetricDto),
          ) as SalesSummaryMetricDto;
          result.orders.replace(valueDes);
          break;
        case r'orderLines':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SalesSummaryLinesMetricDto),
          ) as SalesSummaryLinesMetricDto;
          result.orderLines.replace(valueDes);
          break;
        case r'refunds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SalesSummaryRefundsMetricDto),
          ) as SalesSummaryRefundsMetricDto;
          result.refunds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SalesSummaryResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SalesSummaryResponseDtoBuilder();
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
