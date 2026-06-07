//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/inventory_kpis_stock_sum_dto.dart';
import 'package:mag_api_client/src/model/reporting_count_metric_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'inventory_kpis_stock_metric_dto.g.dart';

/// InventoryKpisStockMetricDto
///
/// Properties:
/// * [count]
/// * [sum]
@BuiltValue()
abstract class InventoryKpisStockMetricDto
    implements
        Built<InventoryKpisStockMetricDto, InventoryKpisStockMetricDtoBuilder> {
  @BuiltValueField(wireName: r'_count')
  ReportingCountMetricDto get count;

  @BuiltValueField(wireName: r'_sum')
  InventoryKpisStockSumDto get sum;

  InventoryKpisStockMetricDto._();

  factory InventoryKpisStockMetricDto(
          [void updates(InventoryKpisStockMetricDtoBuilder b)]) =
      _$InventoryKpisStockMetricDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InventoryKpisStockMetricDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InventoryKpisStockMetricDto> get serializer =>
      _$InventoryKpisStockMetricDtoSerializer();
}

class _$InventoryKpisStockMetricDtoSerializer
    implements PrimitiveSerializer<InventoryKpisStockMetricDto> {
  @override
  final Iterable<Type> types = const [
    InventoryKpisStockMetricDto,
    _$InventoryKpisStockMetricDto
  ];

  @override
  final String wireName = r'InventoryKpisStockMetricDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InventoryKpisStockMetricDto object, {
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
      specifiedType: const FullType(InventoryKpisStockSumDto),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    InventoryKpisStockMetricDto object, {
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
    required InventoryKpisStockMetricDtoBuilder result,
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
            specifiedType: const FullType(InventoryKpisStockSumDto),
          ) as InventoryKpisStockSumDto;
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
  InventoryKpisStockMetricDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InventoryKpisStockMetricDtoBuilder();
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
