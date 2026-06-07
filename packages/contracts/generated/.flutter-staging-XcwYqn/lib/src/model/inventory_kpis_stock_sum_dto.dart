//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'inventory_kpis_stock_sum_dto.g.dart';

/// InventoryKpisStockSumDto
///
/// Properties:
/// * [quantityOnHand] 
/// * [quantityReserved] 
@BuiltValue()
abstract class InventoryKpisStockSumDto implements Built<InventoryKpisStockSumDto, InventoryKpisStockSumDtoBuilder> {
  @BuiltValueField(wireName: r'quantityOnHand')
  num? get quantityOnHand;

  @BuiltValueField(wireName: r'quantityReserved')
  num? get quantityReserved;

  InventoryKpisStockSumDto._();

  factory InventoryKpisStockSumDto([void updates(InventoryKpisStockSumDtoBuilder b)]) = _$InventoryKpisStockSumDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InventoryKpisStockSumDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InventoryKpisStockSumDto> get serializer => _$InventoryKpisStockSumDtoSerializer();
}

class _$InventoryKpisStockSumDtoSerializer implements PrimitiveSerializer<InventoryKpisStockSumDto> {
  @override
  final Iterable<Type> types = const [InventoryKpisStockSumDto, _$InventoryKpisStockSumDto];

  @override
  final String wireName = r'InventoryKpisStockSumDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InventoryKpisStockSumDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.quantityOnHand != null) {
      yield r'quantityOnHand';
      yield serializers.serialize(
        object.quantityOnHand,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.quantityReserved != null) {
      yield r'quantityReserved';
      yield serializers.serialize(
        object.quantityReserved,
        specifiedType: const FullType.nullable(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InventoryKpisStockSumDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InventoryKpisStockSumDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'quantityOnHand':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.quantityOnHand = valueDes;
          break;
        case r'quantityReserved':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.quantityReserved = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InventoryKpisStockSumDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InventoryKpisStockSumDtoBuilder();
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

