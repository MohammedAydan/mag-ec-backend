//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/inventory_kpis_stock_metric_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'inventory_kpis_response_dto.g.dart';

/// InventoryKpisResponseDto
///
/// Properties:
/// * [stock]
/// * [warehouses]
@BuiltValue()
abstract class InventoryKpisResponseDto
    implements
        Built<InventoryKpisResponseDto, InventoryKpisResponseDtoBuilder> {
  @BuiltValueField(wireName: r'stock')
  InventoryKpisStockMetricDto get stock;

  @BuiltValueField(wireName: r'warehouses')
  num get warehouses;

  InventoryKpisResponseDto._();

  factory InventoryKpisResponseDto(
          [void updates(InventoryKpisResponseDtoBuilder b)]) =
      _$InventoryKpisResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InventoryKpisResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InventoryKpisResponseDto> get serializer =>
      _$InventoryKpisResponseDtoSerializer();
}

class _$InventoryKpisResponseDtoSerializer
    implements PrimitiveSerializer<InventoryKpisResponseDto> {
  @override
  final Iterable<Type> types = const [
    InventoryKpisResponseDto,
    _$InventoryKpisResponseDto
  ];

  @override
  final String wireName = r'InventoryKpisResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InventoryKpisResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'stock';
    yield serializers.serialize(
      object.stock,
      specifiedType: const FullType(InventoryKpisStockMetricDto),
    );
    yield r'warehouses';
    yield serializers.serialize(
      object.warehouses,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    InventoryKpisResponseDto object, {
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
    required InventoryKpisResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'stock':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(InventoryKpisStockMetricDto),
          ) as InventoryKpisStockMetricDto;
          result.stock.replace(valueDes);
          break;
        case r'warehouses':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.warehouses = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InventoryKpisResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InventoryKpisResponseDtoBuilder();
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
