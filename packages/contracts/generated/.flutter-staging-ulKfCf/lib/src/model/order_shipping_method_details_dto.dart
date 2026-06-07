//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_shipping_method_details_dto.g.dart';

/// OrderShippingMethodDetailsDto
///
/// Properties:
/// * [key] 
/// * [name] 
/// * [rateType] 
/// * [estimatedMinDays] 
/// * [estimatedMaxDays] 
@BuiltValue()
abstract class OrderShippingMethodDetailsDto implements Built<OrderShippingMethodDetailsDto, OrderShippingMethodDetailsDtoBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'rateType')
  String get rateType;

  @BuiltValueField(wireName: r'estimatedMinDays')
  num? get estimatedMinDays;

  @BuiltValueField(wireName: r'estimatedMaxDays')
  num? get estimatedMaxDays;

  OrderShippingMethodDetailsDto._();

  factory OrderShippingMethodDetailsDto([void updates(OrderShippingMethodDetailsDtoBuilder b)]) = _$OrderShippingMethodDetailsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrderShippingMethodDetailsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrderShippingMethodDetailsDto> get serializer => _$OrderShippingMethodDetailsDtoSerializer();
}

class _$OrderShippingMethodDetailsDtoSerializer implements PrimitiveSerializer<OrderShippingMethodDetailsDto> {
  @override
  final Iterable<Type> types = const [OrderShippingMethodDetailsDto, _$OrderShippingMethodDetailsDto];

  @override
  final String wireName = r'OrderShippingMethodDetailsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrderShippingMethodDetailsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    yield r'rateType';
    yield serializers.serialize(
      object.rateType,
      specifiedType: const FullType(String),
    );
    if (object.estimatedMinDays != null) {
      yield r'estimatedMinDays';
      yield serializers.serialize(
        object.estimatedMinDays,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.estimatedMaxDays != null) {
      yield r'estimatedMaxDays';
      yield serializers.serialize(
        object.estimatedMaxDays,
        specifiedType: const FullType.nullable(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrderShippingMethodDetailsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrderShippingMethodDetailsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'rateType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.rateType = valueDes;
          break;
        case r'estimatedMinDays':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.estimatedMinDays = valueDes;
          break;
        case r'estimatedMaxDays':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.estimatedMaxDays = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrderShippingMethodDetailsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrderShippingMethodDetailsDtoBuilder();
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

