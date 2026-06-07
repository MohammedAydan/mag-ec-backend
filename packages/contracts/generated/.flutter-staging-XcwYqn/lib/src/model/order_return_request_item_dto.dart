//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_return_request_item_dto.g.dart';

/// OrderReturnRequestItemDto
///
/// Properties:
/// * [id] 
/// * [orderLineId] 
/// * [quantity] 
/// * [requestedDisposition] 
/// * [receivedQuantity] 
/// * [finalDisposition] 
/// * [warehouseId] 
/// * [reason] 
/// * [conditionNotes] 
/// * [restockedAt] 
@BuiltValue()
abstract class OrderReturnRequestItemDto implements Built<OrderReturnRequestItemDto, OrderReturnRequestItemDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'orderLineId')
  String get orderLineId;

  @BuiltValueField(wireName: r'quantity')
  num get quantity;

  @BuiltValueField(wireName: r'requestedDisposition')
  String get requestedDisposition;

  @BuiltValueField(wireName: r'receivedQuantity')
  num get receivedQuantity;

  @BuiltValueField(wireName: r'finalDisposition')
  String? get finalDisposition;

  @BuiltValueField(wireName: r'warehouseId')
  String? get warehouseId;

  @BuiltValueField(wireName: r'reason')
  String? get reason;

  @BuiltValueField(wireName: r'conditionNotes')
  String? get conditionNotes;

  @BuiltValueField(wireName: r'restockedAt')
  String? get restockedAt;

  OrderReturnRequestItemDto._();

  factory OrderReturnRequestItemDto([void updates(OrderReturnRequestItemDtoBuilder b)]) = _$OrderReturnRequestItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrderReturnRequestItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrderReturnRequestItemDto> get serializer => _$OrderReturnRequestItemDtoSerializer();
}

class _$OrderReturnRequestItemDtoSerializer implements PrimitiveSerializer<OrderReturnRequestItemDto> {
  @override
  final Iterable<Type> types = const [OrderReturnRequestItemDto, _$OrderReturnRequestItemDto];

  @override
  final String wireName = r'OrderReturnRequestItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrderReturnRequestItemDto object, {
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
    yield r'requestedDisposition';
    yield serializers.serialize(
      object.requestedDisposition,
      specifiedType: const FullType(String),
    );
    yield r'receivedQuantity';
    yield serializers.serialize(
      object.receivedQuantity,
      specifiedType: const FullType(num),
    );
    if (object.finalDisposition != null) {
      yield r'finalDisposition';
      yield serializers.serialize(
        object.finalDisposition,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.warehouseId != null) {
      yield r'warehouseId';
      yield serializers.serialize(
        object.warehouseId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.reason != null) {
      yield r'reason';
      yield serializers.serialize(
        object.reason,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.conditionNotes != null) {
      yield r'conditionNotes';
      yield serializers.serialize(
        object.conditionNotes,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.restockedAt != null) {
      yield r'restockedAt';
      yield serializers.serialize(
        object.restockedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrderReturnRequestItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrderReturnRequestItemDtoBuilder result,
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
        case r'requestedDisposition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.requestedDisposition = valueDes;
          break;
        case r'receivedQuantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.receivedQuantity = valueDes;
          break;
        case r'finalDisposition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.finalDisposition = valueDes;
          break;
        case r'warehouseId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.warehouseId = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reason = valueDes;
          break;
        case r'conditionNotes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.conditionNotes = valueDes;
          break;
        case r'restockedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.restockedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrderReturnRequestItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrderReturnRequestItemDtoBuilder();
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

