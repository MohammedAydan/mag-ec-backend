//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/stock_reservation_user_dto.dart';
import 'package:mag_api_client/src/model/stock_reservation_variant_dto.dart';
import 'package:mag_api_client/src/model/stock_reservation_warehouse_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stock_reservation_response_dto.g.dart';

/// StockReservationResponseDto
///
/// Properties:
/// * [id]
/// * [warehouseId]
/// * [variantId]
/// * [quantity]
/// * [status]
/// * [createdAt]
/// * [warehouse]
/// * [variant]
/// * [expiresAt]
/// * [user]
@BuiltValue()
abstract class StockReservationResponseDto
    implements
        Built<StockReservationResponseDto, StockReservationResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'warehouseId')
  String get warehouseId;

  @BuiltValueField(wireName: r'variantId')
  String get variantId;

  @BuiltValueField(wireName: r'quantity')
  num get quantity;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'warehouse')
  StockReservationWarehouseDto get warehouse;

  @BuiltValueField(wireName: r'variant')
  StockReservationVariantDto get variant;

  @BuiltValueField(wireName: r'expiresAt')
  String? get expiresAt;

  @BuiltValueField(wireName: r'user')
  StockReservationUserDto? get user;

  StockReservationResponseDto._();

  factory StockReservationResponseDto(
          [void updates(StockReservationResponseDtoBuilder b)]) =
      _$StockReservationResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StockReservationResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StockReservationResponseDto> get serializer =>
      _$StockReservationResponseDtoSerializer();
}

class _$StockReservationResponseDtoSerializer
    implements PrimitiveSerializer<StockReservationResponseDto> {
  @override
  final Iterable<Type> types = const [
    StockReservationResponseDto,
    _$StockReservationResponseDto
  ];

  @override
  final String wireName = r'StockReservationResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StockReservationResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
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
    yield r'quantity';
    yield serializers.serialize(
      object.quantity,
      specifiedType: const FullType(num),
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
    yield r'warehouse';
    yield serializers.serialize(
      object.warehouse,
      specifiedType: const FullType(StockReservationWarehouseDto),
    );
    yield r'variant';
    yield serializers.serialize(
      object.variant,
      specifiedType: const FullType(StockReservationVariantDto),
    );
    if (object.expiresAt != null) {
      yield r'expiresAt';
      yield serializers.serialize(
        object.expiresAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.user != null) {
      yield r'user';
      yield serializers.serialize(
        object.user,
        specifiedType: const FullType.nullable(StockReservationUserDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    StockReservationResponseDto object, {
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
    required StockReservationResponseDtoBuilder result,
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
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.quantity = valueDes;
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
        case r'warehouse':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StockReservationWarehouseDto),
          ) as StockReservationWarehouseDto;
          result.warehouse.replace(valueDes);
          break;
        case r'variant':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StockReservationVariantDto),
          ) as StockReservationVariantDto;
          result.variant.replace(valueDes);
          break;
        case r'expiresAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.expiresAt = valueDes;
          break;
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(StockReservationUserDto),
          ) as StockReservationUserDto?;
          if (valueDes == null) continue;
          result.user.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StockReservationResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StockReservationResponseDtoBuilder();
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
