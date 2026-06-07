//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/order_shipment_item_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_shipment_dto.g.dart';

/// OrderShipmentDto
///
/// Properties:
/// * [id]
/// * [shipmentNumber]
/// * [status]
/// * [createdAt]
/// * [updatedAt]
/// * [items]
/// * [carrierKey]
/// * [carrierName]
/// * [trackingNumber]
/// * [trackingUrl]
/// * [notes]
/// * [shippedAt]
/// * [deliveredAt]
/// * [cancelledAt]
@BuiltValue()
abstract class OrderShipmentDto
    implements Built<OrderShipmentDto, OrderShipmentDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'shipmentNumber')
  String get shipmentNumber;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  @BuiltValueField(wireName: r'items')
  BuiltList<OrderShipmentItemDto> get items;

  @BuiltValueField(wireName: r'carrierKey')
  String? get carrierKey;

  @BuiltValueField(wireName: r'carrierName')
  String? get carrierName;

  @BuiltValueField(wireName: r'trackingNumber')
  String? get trackingNumber;

  @BuiltValueField(wireName: r'trackingUrl')
  String? get trackingUrl;

  @BuiltValueField(wireName: r'notes')
  String? get notes;

  @BuiltValueField(wireName: r'shippedAt')
  String? get shippedAt;

  @BuiltValueField(wireName: r'deliveredAt')
  String? get deliveredAt;

  @BuiltValueField(wireName: r'cancelledAt')
  String? get cancelledAt;

  OrderShipmentDto._();

  factory OrderShipmentDto([void updates(OrderShipmentDtoBuilder b)]) =
      _$OrderShipmentDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrderShipmentDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrderShipmentDto> get serializer =>
      _$OrderShipmentDtoSerializer();
}

class _$OrderShipmentDtoSerializer
    implements PrimitiveSerializer<OrderShipmentDto> {
  @override
  final Iterable<Type> types = const [OrderShipmentDto, _$OrderShipmentDto];

  @override
  final String wireName = r'OrderShipmentDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrderShipmentDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'shipmentNumber';
    yield serializers.serialize(
      object.shipmentNumber,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(String),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(String),
    );
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(OrderShipmentItemDto)]),
    );
    if (object.carrierKey != null) {
      yield r'carrierKey';
      yield serializers.serialize(
        object.carrierKey,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.carrierName != null) {
      yield r'carrierName';
      yield serializers.serialize(
        object.carrierName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.trackingNumber != null) {
      yield r'trackingNumber';
      yield serializers.serialize(
        object.trackingNumber,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.trackingUrl != null) {
      yield r'trackingUrl';
      yield serializers.serialize(
        object.trackingUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.notes != null) {
      yield r'notes';
      yield serializers.serialize(
        object.notes,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.shippedAt != null) {
      yield r'shippedAt';
      yield serializers.serialize(
        object.shippedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.deliveredAt != null) {
      yield r'deliveredAt';
      yield serializers.serialize(
        object.deliveredAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.cancelledAt != null) {
      yield r'cancelledAt';
      yield serializers.serialize(
        object.cancelledAt,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrderShipmentDto object, {
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
    required OrderShipmentDtoBuilder result,
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
        case r'shipmentNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.shipmentNumber = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.updatedAt = valueDes;
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(OrderShipmentItemDto)]),
          ) as BuiltList<OrderShipmentItemDto>;
          result.items.replace(valueDes);
          break;
        case r'carrierKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.carrierKey = valueDes;
          break;
        case r'carrierName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.carrierName = valueDes;
          break;
        case r'trackingNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.trackingNumber = valueDes;
          break;
        case r'trackingUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.trackingUrl = valueDes;
          break;
        case r'notes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.notes = valueDes;
          break;
        case r'shippedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.shippedAt = valueDes;
          break;
        case r'deliveredAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deliveredAt = valueDes;
          break;
        case r'cancelledAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.cancelledAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrderShipmentDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrderShipmentDtoBuilder();
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
