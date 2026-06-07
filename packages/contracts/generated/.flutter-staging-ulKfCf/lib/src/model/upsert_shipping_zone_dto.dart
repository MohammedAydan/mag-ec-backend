//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upsert_shipping_zone_dto.g.dart';

/// UpsertShippingZoneDto
///
/// Properties:
/// * [name] - Display name of the shipping zone
/// * [countryCodes] - ISO 3166-1 alpha-2 country codes in this zone
/// * [isActive] - Whether this zone is active for checkout
@BuiltValue()
abstract class UpsertShippingZoneDto implements Built<UpsertShippingZoneDto, UpsertShippingZoneDtoBuilder> {
  /// Display name of the shipping zone
  @BuiltValueField(wireName: r'name')
  String get name;

  /// ISO 3166-1 alpha-2 country codes in this zone
  @BuiltValueField(wireName: r'countryCodes')
  BuiltList<String> get countryCodes;

  /// Whether this zone is active for checkout
  @BuiltValueField(wireName: r'isActive')
  bool? get isActive;

  UpsertShippingZoneDto._();

  factory UpsertShippingZoneDto([void updates(UpsertShippingZoneDtoBuilder b)]) = _$UpsertShippingZoneDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpsertShippingZoneDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpsertShippingZoneDto> get serializer => _$UpsertShippingZoneDtoSerializer();
}

class _$UpsertShippingZoneDtoSerializer implements PrimitiveSerializer<UpsertShippingZoneDto> {
  @override
  final Iterable<Type> types = const [UpsertShippingZoneDto, _$UpsertShippingZoneDto];

  @override
  final String wireName = r'UpsertShippingZoneDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpsertShippingZoneDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'countryCodes';
    yield serializers.serialize(
      object.countryCodes,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    if (object.isActive != null) {
      yield r'isActive';
      yield serializers.serialize(
        object.isActive,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpsertShippingZoneDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpsertShippingZoneDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'countryCodes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.countryCodes.replace(valueDes);
          break;
        case r'isActive':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isActive = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpsertShippingZoneDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpsertShippingZoneDtoBuilder();
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

