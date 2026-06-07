//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'return_request_item_response_dto.g.dart';

/// ReturnRequestItemResponseDto
///
/// Properties:
/// * [id]
/// * [orderLineId]
/// * [quantity]
/// * [receivedQuantity]
/// * [requestedDisposition]
/// * [productId]
/// * [variantId]
/// * [sku]
/// * [productName]
/// * [variantName]
/// * [finalDisposition]
/// * [warehouseId]
/// * [reason]
/// * [conditionNotes]
/// * [restockedAt]
@BuiltValue()
abstract class ReturnRequestItemResponseDto
    implements
        Built<ReturnRequestItemResponseDto,
            ReturnRequestItemResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'orderLineId')
  String get orderLineId;

  @BuiltValueField(wireName: r'quantity')
  num get quantity;

  @BuiltValueField(wireName: r'receivedQuantity')
  num get receivedQuantity;

  @BuiltValueField(wireName: r'requestedDisposition')
  String get requestedDisposition;

  @BuiltValueField(wireName: r'productId')
  String get productId;

  @BuiltValueField(wireName: r'variantId')
  String get variantId;

  @BuiltValueField(wireName: r'sku')
  String get sku;

  @BuiltValueField(wireName: r'productName')
  String get productName;

  @BuiltValueField(wireName: r'variantName')
  String get variantName;

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

  ReturnRequestItemResponseDto._();

  factory ReturnRequestItemResponseDto(
          [void updates(ReturnRequestItemResponseDtoBuilder b)]) =
      _$ReturnRequestItemResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReturnRequestItemResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReturnRequestItemResponseDto> get serializer =>
      _$ReturnRequestItemResponseDtoSerializer();
}

class _$ReturnRequestItemResponseDtoSerializer
    implements PrimitiveSerializer<ReturnRequestItemResponseDto> {
  @override
  final Iterable<Type> types = const [
    ReturnRequestItemResponseDto,
    _$ReturnRequestItemResponseDto
  ];

  @override
  final String wireName = r'ReturnRequestItemResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReturnRequestItemResponseDto object, {
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
    yield r'receivedQuantity';
    yield serializers.serialize(
      object.receivedQuantity,
      specifiedType: const FullType(num),
    );
    yield r'requestedDisposition';
    yield serializers.serialize(
      object.requestedDisposition,
      specifiedType: const FullType(String),
    );
    yield r'productId';
    yield serializers.serialize(
      object.productId,
      specifiedType: const FullType(String),
    );
    yield r'variantId';
    yield serializers.serialize(
      object.variantId,
      specifiedType: const FullType(String),
    );
    yield r'sku';
    yield serializers.serialize(
      object.sku,
      specifiedType: const FullType(String),
    );
    yield r'productName';
    yield serializers.serialize(
      object.productName,
      specifiedType: const FullType(String),
    );
    yield r'variantName';
    yield serializers.serialize(
      object.variantName,
      specifiedType: const FullType(String),
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
    ReturnRequestItemResponseDto object, {
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
    required ReturnRequestItemResponseDtoBuilder result,
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
        case r'receivedQuantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.receivedQuantity = valueDes;
          break;
        case r'requestedDisposition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.requestedDisposition = valueDes;
          break;
        case r'productId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.productId = valueDes;
          break;
        case r'variantId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.variantId = valueDes;
          break;
        case r'sku':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sku = valueDes;
          break;
        case r'productName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.productName = valueDes;
          break;
        case r'variantName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.variantName = valueDes;
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
  ReturnRequestItemResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReturnRequestItemResponseDtoBuilder();
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
