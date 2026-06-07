//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/stock_movement_variant_dto.dart';
import 'package:mag_api_client/src/model/stock_movement_actor_dto.dart';
import 'package:mag_api_client/src/model/stock_movement_warehouse_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stock_movement_item_dto.g.dart';

/// StockMovementItemDto
///
/// Properties:
/// * [id] 
/// * [type] 
/// * [quantityChanged] 
/// * [createdAt] 
/// * [variant] 
/// * [warehouse] 
/// * [referenceType] 
/// * [referenceId] 
/// * [actorUser] 
@BuiltValue()
abstract class StockMovementItemDto implements Built<StockMovementItemDto, StockMovementItemDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'type')
  String get type;

  @BuiltValueField(wireName: r'quantityChanged')
  num get quantityChanged;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'variant')
  StockMovementVariantDto get variant;

  @BuiltValueField(wireName: r'warehouse')
  StockMovementWarehouseDto get warehouse;

  @BuiltValueField(wireName: r'referenceType')
  String? get referenceType;

  @BuiltValueField(wireName: r'referenceId')
  String? get referenceId;

  @BuiltValueField(wireName: r'actorUser')
  StockMovementActorDto? get actorUser;

  StockMovementItemDto._();

  factory StockMovementItemDto([void updates(StockMovementItemDtoBuilder b)]) = _$StockMovementItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StockMovementItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StockMovementItemDto> get serializer => _$StockMovementItemDtoSerializer();
}

class _$StockMovementItemDtoSerializer implements PrimitiveSerializer<StockMovementItemDto> {
  @override
  final Iterable<Type> types = const [StockMovementItemDto, _$StockMovementItemDto];

  @override
  final String wireName = r'StockMovementItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StockMovementItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(String),
    );
    yield r'quantityChanged';
    yield serializers.serialize(
      object.quantityChanged,
      specifiedType: const FullType(num),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(String),
    );
    yield r'variant';
    yield serializers.serialize(
      object.variant,
      specifiedType: const FullType(StockMovementVariantDto),
    );
    yield r'warehouse';
    yield serializers.serialize(
      object.warehouse,
      specifiedType: const FullType(StockMovementWarehouseDto),
    );
    if (object.referenceType != null) {
      yield r'referenceType';
      yield serializers.serialize(
        object.referenceType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.referenceId != null) {
      yield r'referenceId';
      yield serializers.serialize(
        object.referenceId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.actorUser != null) {
      yield r'actorUser';
      yield serializers.serialize(
        object.actorUser,
        specifiedType: const FullType.nullable(StockMovementActorDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    StockMovementItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required StockMovementItemDtoBuilder result,
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
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'quantityChanged':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.quantityChanged = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'variant':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StockMovementVariantDto),
          ) as StockMovementVariantDto;
          result.variant.replace(valueDes);
          break;
        case r'warehouse':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StockMovementWarehouseDto),
          ) as StockMovementWarehouseDto;
          result.warehouse.replace(valueDes);
          break;
        case r'referenceType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.referenceType = valueDes;
          break;
        case r'referenceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.referenceId = valueDes;
          break;
        case r'actorUser':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(StockMovementActorDto),
          ) as StockMovementActorDto?;
          if (valueDes == null) continue;
          result.actorUser.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StockMovementItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StockMovementItemDtoBuilder();
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

