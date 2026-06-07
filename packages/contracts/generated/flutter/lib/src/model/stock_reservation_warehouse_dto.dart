//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stock_reservation_warehouse_dto.g.dart';

/// StockReservationWarehouseDto
///
/// Properties:
/// * [id]
/// * [key]
/// * [name]
@BuiltValue()
abstract class StockReservationWarehouseDto
    implements
        Built<StockReservationWarehouseDto,
            StockReservationWarehouseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'name')
  String get name;

  StockReservationWarehouseDto._();

  factory StockReservationWarehouseDto(
          [void updates(StockReservationWarehouseDtoBuilder b)]) =
      _$StockReservationWarehouseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StockReservationWarehouseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StockReservationWarehouseDto> get serializer =>
      _$StockReservationWarehouseDtoSerializer();
}

class _$StockReservationWarehouseDtoSerializer
    implements PrimitiveSerializer<StockReservationWarehouseDto> {
  @override
  final Iterable<Type> types = const [
    StockReservationWarehouseDto,
    _$StockReservationWarehouseDto
  ];

  @override
  final String wireName = r'StockReservationWarehouseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StockReservationWarehouseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    StockReservationWarehouseDto object, {
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
    required StockReservationWarehouseDtoBuilder result,
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
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StockReservationWarehouseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StockReservationWarehouseDtoBuilder();
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
