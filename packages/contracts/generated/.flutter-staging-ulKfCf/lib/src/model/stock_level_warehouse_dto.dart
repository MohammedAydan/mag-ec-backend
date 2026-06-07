//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stock_level_warehouse_dto.g.dart';

/// StockLevelWarehouseDto
///
/// Properties:
/// * [id] 
/// * [key] 
/// * [name] 
@BuiltValue()
abstract class StockLevelWarehouseDto implements Built<StockLevelWarehouseDto, StockLevelWarehouseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'name')
  String get name;

  StockLevelWarehouseDto._();

  factory StockLevelWarehouseDto([void updates(StockLevelWarehouseDtoBuilder b)]) = _$StockLevelWarehouseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StockLevelWarehouseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StockLevelWarehouseDto> get serializer => _$StockLevelWarehouseDtoSerializer();
}

class _$StockLevelWarehouseDtoSerializer implements PrimitiveSerializer<StockLevelWarehouseDto> {
  @override
  final Iterable<Type> types = const [StockLevelWarehouseDto, _$StockLevelWarehouseDto];

  @override
  final String wireName = r'StockLevelWarehouseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StockLevelWarehouseDto object, {
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
    StockLevelWarehouseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required StockLevelWarehouseDtoBuilder result,
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
  StockLevelWarehouseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StockLevelWarehouseDtoBuilder();
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

