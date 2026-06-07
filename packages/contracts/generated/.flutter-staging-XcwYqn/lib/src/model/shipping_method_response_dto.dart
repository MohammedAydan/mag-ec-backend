//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shipping_method_response_dto.g.dart';

/// ShippingMethodResponseDto
///
/// Properties:
/// * [id] 
/// * [zoneId] 
/// * [key] 
/// * [name] 
/// * [isActive] 
/// * [rateType] 
/// * [currencyCode] 
/// * [sortOrder] 
/// * [updatedAt] 
/// * [flatAmount] 
/// * [percentageBps] 
/// * [estimatedMinDays] 
/// * [estimatedMaxDays] 
@BuiltValue()
abstract class ShippingMethodResponseDto implements Built<ShippingMethodResponseDto, ShippingMethodResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'zoneId')
  String get zoneId;

  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'isActive')
  bool get isActive;

  @BuiltValueField(wireName: r'rateType')
  String get rateType;

  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  @BuiltValueField(wireName: r'sortOrder')
  num get sortOrder;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  @BuiltValueField(wireName: r'flatAmount')
  num? get flatAmount;

  @BuiltValueField(wireName: r'percentageBps')
  num? get percentageBps;

  @BuiltValueField(wireName: r'estimatedMinDays')
  num? get estimatedMinDays;

  @BuiltValueField(wireName: r'estimatedMaxDays')
  num? get estimatedMaxDays;

  ShippingMethodResponseDto._();

  factory ShippingMethodResponseDto([void updates(ShippingMethodResponseDtoBuilder b)]) = _$ShippingMethodResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShippingMethodResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShippingMethodResponseDto> get serializer => _$ShippingMethodResponseDtoSerializer();
}

class _$ShippingMethodResponseDtoSerializer implements PrimitiveSerializer<ShippingMethodResponseDto> {
  @override
  final Iterable<Type> types = const [ShippingMethodResponseDto, _$ShippingMethodResponseDto];

  @override
  final String wireName = r'ShippingMethodResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShippingMethodResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'zoneId';
    yield serializers.serialize(
      object.zoneId,
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
    yield r'isActive';
    yield serializers.serialize(
      object.isActive,
      specifiedType: const FullType(bool),
    );
    yield r'rateType';
    yield serializers.serialize(
      object.rateType,
      specifiedType: const FullType(String),
    );
    yield r'currencyCode';
    yield serializers.serialize(
      object.currencyCode,
      specifiedType: const FullType(String),
    );
    yield r'sortOrder';
    yield serializers.serialize(
      object.sortOrder,
      specifiedType: const FullType(num),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(String),
    );
    if (object.flatAmount != null) {
      yield r'flatAmount';
      yield serializers.serialize(
        object.flatAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.percentageBps != null) {
      yield r'percentageBps';
      yield serializers.serialize(
        object.percentageBps,
        specifiedType: const FullType.nullable(num),
      );
    }
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
    ShippingMethodResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ShippingMethodResponseDtoBuilder result,
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
        case r'zoneId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.zoneId = valueDes;
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
        case r'isActive':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isActive = valueDes;
          break;
        case r'rateType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.rateType = valueDes;
          break;
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyCode = valueDes;
          break;
        case r'sortOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.sortOrder = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.updatedAt = valueDes;
          break;
        case r'flatAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.flatAmount = valueDes;
          break;
        case r'percentageBps':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.percentageBps = valueDes;
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
  ShippingMethodResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShippingMethodResponseDtoBuilder();
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

