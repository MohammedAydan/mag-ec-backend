//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'shipping_zone_response_dto.g.dart';

/// ShippingZoneResponseDto
///
/// Properties:
/// * [id] 
/// * [key] 
/// * [name] 
/// * [isActive] 
/// * [countryCodes] 
/// * [updatedAt] 
@BuiltValue()
abstract class ShippingZoneResponseDto implements Built<ShippingZoneResponseDto, ShippingZoneResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'isActive')
  bool get isActive;

  @BuiltValueField(wireName: r'countryCodes')
  BuiltList<String> get countryCodes;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  ShippingZoneResponseDto._();

  factory ShippingZoneResponseDto([void updates(ShippingZoneResponseDtoBuilder b)]) = _$ShippingZoneResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ShippingZoneResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ShippingZoneResponseDto> get serializer => _$ShippingZoneResponseDtoSerializer();
}

class _$ShippingZoneResponseDtoSerializer implements PrimitiveSerializer<ShippingZoneResponseDto> {
  @override
  final Iterable<Type> types = const [ShippingZoneResponseDto, _$ShippingZoneResponseDto];

  @override
  final String wireName = r'ShippingZoneResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ShippingZoneResponseDto object, {
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
    yield r'isActive';
    yield serializers.serialize(
      object.isActive,
      specifiedType: const FullType(bool),
    );
    yield r'countryCodes';
    yield serializers.serialize(
      object.countryCodes,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ShippingZoneResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ShippingZoneResponseDtoBuilder result,
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
        case r'isActive':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isActive = valueDes;
          break;
        case r'countryCodes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.countryCodes.replace(valueDes);
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ShippingZoneResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShippingZoneResponseDtoBuilder();
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

