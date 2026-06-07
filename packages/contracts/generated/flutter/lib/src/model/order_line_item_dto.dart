//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_line_item_dto.g.dart';

/// OrderLineItemDto
///
/// Properties:
/// * [id]
/// * [productId]
/// * [variantId]
/// * [sku]
/// * [productName]
/// * [variantName]
/// * [quantity]
/// * [currencyCode]
/// * [unitBaseAmount]
/// * [effectiveUnitAmount]
/// * [lineSubtotalAmount]
/// * [taxAmount]
/// * [unitSaleAmount]
@BuiltValue()
abstract class OrderLineItemDto
    implements Built<OrderLineItemDto, OrderLineItemDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

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

  @BuiltValueField(wireName: r'quantity')
  num get quantity;

  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  @BuiltValueField(wireName: r'unitBaseAmount')
  num get unitBaseAmount;

  @BuiltValueField(wireName: r'effectiveUnitAmount')
  num get effectiveUnitAmount;

  @BuiltValueField(wireName: r'lineSubtotalAmount')
  num get lineSubtotalAmount;

  @BuiltValueField(wireName: r'taxAmount')
  num get taxAmount;

  @BuiltValueField(wireName: r'unitSaleAmount')
  num? get unitSaleAmount;

  OrderLineItemDto._();

  factory OrderLineItemDto([void updates(OrderLineItemDtoBuilder b)]) =
      _$OrderLineItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrderLineItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrderLineItemDto> get serializer =>
      _$OrderLineItemDtoSerializer();
}

class _$OrderLineItemDtoSerializer
    implements PrimitiveSerializer<OrderLineItemDto> {
  @override
  final Iterable<Type> types = const [OrderLineItemDto, _$OrderLineItemDto];

  @override
  final String wireName = r'OrderLineItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrderLineItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
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
    yield r'quantity';
    yield serializers.serialize(
      object.quantity,
      specifiedType: const FullType(num),
    );
    yield r'currencyCode';
    yield serializers.serialize(
      object.currencyCode,
      specifiedType: const FullType(String),
    );
    yield r'unitBaseAmount';
    yield serializers.serialize(
      object.unitBaseAmount,
      specifiedType: const FullType(num),
    );
    yield r'effectiveUnitAmount';
    yield serializers.serialize(
      object.effectiveUnitAmount,
      specifiedType: const FullType(num),
    );
    yield r'lineSubtotalAmount';
    yield serializers.serialize(
      object.lineSubtotalAmount,
      specifiedType: const FullType(num),
    );
    yield r'taxAmount';
    yield serializers.serialize(
      object.taxAmount,
      specifiedType: const FullType(num),
    );
    if (object.unitSaleAmount != null) {
      yield r'unitSaleAmount';
      yield serializers.serialize(
        object.unitSaleAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrderLineItemDto object, {
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
    required OrderLineItemDtoBuilder result,
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
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.quantity = valueDes;
          break;
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyCode = valueDes;
          break;
        case r'unitBaseAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.unitBaseAmount = valueDes;
          break;
        case r'effectiveUnitAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.effectiveUnitAmount = valueDes;
          break;
        case r'lineSubtotalAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.lineSubtotalAmount = valueDes;
          break;
        case r'taxAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.taxAmount = valueDes;
          break;
        case r'unitSaleAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.unitSaleAmount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrderLineItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrderLineItemDtoBuilder();
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
