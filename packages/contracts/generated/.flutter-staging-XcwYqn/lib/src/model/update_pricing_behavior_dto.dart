//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_pricing_behavior_dto.g.dart';

/// UpdatePricingBehaviorDto
///
/// Properties:
/// * [pricesIncludeTax] - Whether displayed prices include tax by default
/// * [defaultTaxCountryCode] - Default ISO 3166-1 alpha-2 country code for tax calculation
/// * [shippingCurrencyCode] - Default ISO 4217 currency code for shipping charges
@BuiltValue()
abstract class UpdatePricingBehaviorDto implements Built<UpdatePricingBehaviorDto, UpdatePricingBehaviorDtoBuilder> {
  /// Whether displayed prices include tax by default
  @BuiltValueField(wireName: r'pricesIncludeTax')
  bool get pricesIncludeTax;

  /// Default ISO 3166-1 alpha-2 country code for tax calculation
  @BuiltValueField(wireName: r'defaultTaxCountryCode')
  String? get defaultTaxCountryCode;

  /// Default ISO 4217 currency code for shipping charges
  @BuiltValueField(wireName: r'shippingCurrencyCode')
  String? get shippingCurrencyCode;

  UpdatePricingBehaviorDto._();

  factory UpdatePricingBehaviorDto([void updates(UpdatePricingBehaviorDtoBuilder b)]) = _$UpdatePricingBehaviorDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdatePricingBehaviorDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdatePricingBehaviorDto> get serializer => _$UpdatePricingBehaviorDtoSerializer();
}

class _$UpdatePricingBehaviorDtoSerializer implements PrimitiveSerializer<UpdatePricingBehaviorDto> {
  @override
  final Iterable<Type> types = const [UpdatePricingBehaviorDto, _$UpdatePricingBehaviorDto];

  @override
  final String wireName = r'UpdatePricingBehaviorDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdatePricingBehaviorDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'pricesIncludeTax';
    yield serializers.serialize(
      object.pricesIncludeTax,
      specifiedType: const FullType(bool),
    );
    if (object.defaultTaxCountryCode != null) {
      yield r'defaultTaxCountryCode';
      yield serializers.serialize(
        object.defaultTaxCountryCode,
        specifiedType: const FullType(String),
      );
    }
    if (object.shippingCurrencyCode != null) {
      yield r'shippingCurrencyCode';
      yield serializers.serialize(
        object.shippingCurrencyCode,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdatePricingBehaviorDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdatePricingBehaviorDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'pricesIncludeTax':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.pricesIncludeTax = valueDes;
          break;
        case r'defaultTaxCountryCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.defaultTaxCountryCode = valueDes;
          break;
        case r'shippingCurrencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.shippingCurrencyCode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdatePricingBehaviorDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdatePricingBehaviorDtoBuilder();
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

