//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_shipment_item_dto.g.dart';

/// OrderShipmentItemDto
///
/// Properties:
/// * [id] 
/// * [orderLineId] 
/// * [quantity] 
@BuiltValue()
abstract class OrderShipmentItemDto implements Built<OrderShipmentItemDto, OrderShipmentItemDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'orderLineId')
  String get orderLineId;

  @BuiltValueField(wireName: r'quantity')
  num get quantity;

  OrderShipmentItemDto._();

  factory OrderShipmentItemDto([void updates(OrderShipmentItemDtoBuilder b)]) = _$OrderShipmentItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrderShipmentItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrderShipmentItemDto> get serializer => _$OrderShipmentItemDtoSerializer();
}

class _$OrderShipmentItemDtoSerializer implements PrimitiveSerializer<OrderShipmentItemDto> {
  @override
  final Iterable<Type> types = const [OrderShipmentItemDto, _$OrderShipmentItemDto];

  @override
  final String wireName = r'OrderShipmentItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrderShipmentItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'orderLineId';
    yield serializers.serialize(
      object.orderLineId,
      specifiedType: const FullType(String),
    );
    yield r'quantity';
    yield serializers.serialize(
      object.quantity,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    OrderShipmentItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrderShipmentItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'orderLineId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.orderLineId = valueDes;
          break;
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.quantity = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrderShipmentItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrderShipmentItemDtoBuilder();
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

