//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_shipment_item_dto.g.dart';

/// CreateShipmentItemDto
///
/// Properties:
/// * [orderLineId] - Order line identifier to include in the shipment
/// * [quantity] - Quantity to ship for this order line
@BuiltValue()
abstract class CreateShipmentItemDto
    implements Built<CreateShipmentItemDto, CreateShipmentItemDtoBuilder> {
  /// Order line identifier to include in the shipment
  @BuiltValueField(wireName: r'orderLineId')
  String get orderLineId;

  /// Quantity to ship for this order line
  @BuiltValueField(wireName: r'quantity')
  num get quantity;

  CreateShipmentItemDto._();

  factory CreateShipmentItemDto(
      [void updates(CreateShipmentItemDtoBuilder b)]) = _$CreateShipmentItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateShipmentItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateShipmentItemDto> get serializer =>
      _$CreateShipmentItemDtoSerializer();
}

class _$CreateShipmentItemDtoSerializer
    implements PrimitiveSerializer<CreateShipmentItemDto> {
  @override
  final Iterable<Type> types = const [
    CreateShipmentItemDto,
    _$CreateShipmentItemDto
  ];

  @override
  final String wireName = r'CreateShipmentItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateShipmentItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    CreateShipmentItemDto object, {
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
    required CreateShipmentItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  CreateShipmentItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateShipmentItemDtoBuilder();
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
