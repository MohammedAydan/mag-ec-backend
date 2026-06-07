//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/stock_level_warehouse_dto.dart';
import 'package:mag_api_client/src/model/stock_level_variant_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stock_level_response_dto.g.dart';

/// StockLevelResponseDto
///
/// Properties:
/// * [warehouseId]
/// * [variantId]
/// * [quantityAvailable]
/// * [quantityReserved]
/// * [quantityIncoming]
/// * [warehouse]
/// * [variant]
@BuiltValue()
abstract class StockLevelResponseDto
    implements Built<StockLevelResponseDto, StockLevelResponseDtoBuilder> {
  @BuiltValueField(wireName: r'warehouseId')
  String get warehouseId;

  @BuiltValueField(wireName: r'variantId')
  String get variantId;

  @BuiltValueField(wireName: r'quantityAvailable')
  num get quantityAvailable;

  @BuiltValueField(wireName: r'quantityReserved')
  num get quantityReserved;

  @BuiltValueField(wireName: r'quantityIncoming')
  num get quantityIncoming;

  @BuiltValueField(wireName: r'warehouse')
  StockLevelWarehouseDto get warehouse;

  @BuiltValueField(wireName: r'variant')
  StockLevelVariantDto get variant;

  StockLevelResponseDto._();

  factory StockLevelResponseDto(
      [void updates(StockLevelResponseDtoBuilder b)]) = _$StockLevelResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StockLevelResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StockLevelResponseDto> get serializer =>
      _$StockLevelResponseDtoSerializer();
}

class _$StockLevelResponseDtoSerializer
    implements PrimitiveSerializer<StockLevelResponseDto> {
  @override
  final Iterable<Type> types = const [
    StockLevelResponseDto,
    _$StockLevelResponseDto
  ];

  @override
  final String wireName = r'StockLevelResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StockLevelResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'warehouseId';
    yield serializers.serialize(
      object.warehouseId,
      specifiedType: const FullType(String),
    );
    yield r'variantId';
    yield serializers.serialize(
      object.variantId,
      specifiedType: const FullType(String),
    );
    yield r'quantityAvailable';
    yield serializers.serialize(
      object.quantityAvailable,
      specifiedType: const FullType(num),
    );
    yield r'quantityReserved';
    yield serializers.serialize(
      object.quantityReserved,
      specifiedType: const FullType(num),
    );
    yield r'quantityIncoming';
    yield serializers.serialize(
      object.quantityIncoming,
      specifiedType: const FullType(num),
    );
    yield r'warehouse';
    yield serializers.serialize(
      object.warehouse,
      specifiedType: const FullType(StockLevelWarehouseDto),
    );
    yield r'variant';
    yield serializers.serialize(
      object.variant,
      specifiedType: const FullType(StockLevelVariantDto),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    StockLevelResponseDto object, {
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
    required StockLevelResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'warehouseId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.warehouseId = valueDes;
          break;
        case r'variantId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.variantId = valueDes;
          break;
        case r'quantityAvailable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.quantityAvailable = valueDes;
          break;
        case r'quantityReserved':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.quantityReserved = valueDes;
          break;
        case r'quantityIncoming':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.quantityIncoming = valueDes;
          break;
        case r'warehouse':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StockLevelWarehouseDto),
          ) as StockLevelWarehouseDto;
          result.warehouse.replace(valueDes);
          break;
        case r'variant':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StockLevelVariantDto),
          ) as StockLevelVariantDto;
          result.variant.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StockLevelResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StockLevelResponseDtoBuilder();
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
