//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upsert_shipping_method_dto.g.dart';

/// UpsertShippingMethodDto
///
/// Properties:
/// * [name] - Display name of the shipping method
/// * [rateType] - Rate calculation type: FLAT or PERCENTAGE_OF_SUBTOTAL
/// * [currencyCode] - ISO 4217 currency code for shipping charges
/// * [isActive] - Whether this method is available at checkout
/// * [flatAmount] - Flat shipping amount in minor currency units
/// * [percentageBps] - Percentage rate in basis points (e.g. 500 = 5.00%)
/// * [minSubtotalAmount] - Minimum subtotal required for this method
/// * [maxSubtotalAmount] - Maximum subtotal allowed for this method
/// * [minItemQuantity] - Minimum item quantity required
/// * [maxItemQuantity] - Maximum item quantity allowed
/// * [estimatedMinDays] - Estimated minimum delivery days
/// * [estimatedMaxDays] - Estimated maximum delivery days
/// * [sortOrder] - Sort order for display purposes
@BuiltValue()
abstract class UpsertShippingMethodDto implements Built<UpsertShippingMethodDto, UpsertShippingMethodDtoBuilder> {
  /// Display name of the shipping method
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Rate calculation type: FLAT or PERCENTAGE_OF_SUBTOTAL
  @BuiltValueField(wireName: r'rateType')
  UpsertShippingMethodDtoRateTypeEnum get rateType;
  // enum rateTypeEnum {  FLAT,  PERCENTAGE_OF_SUBTOTAL,  };

  /// ISO 4217 currency code for shipping charges
  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  /// Whether this method is available at checkout
  @BuiltValueField(wireName: r'isActive')
  bool? get isActive;

  /// Flat shipping amount in minor currency units
  @BuiltValueField(wireName: r'flatAmount')
  num? get flatAmount;

  /// Percentage rate in basis points (e.g. 500 = 5.00%)
  @BuiltValueField(wireName: r'percentageBps')
  num? get percentageBps;

  /// Minimum subtotal required for this method
  @BuiltValueField(wireName: r'minSubtotalAmount')
  num? get minSubtotalAmount;

  /// Maximum subtotal allowed for this method
  @BuiltValueField(wireName: r'maxSubtotalAmount')
  num? get maxSubtotalAmount;

  /// Minimum item quantity required
  @BuiltValueField(wireName: r'minItemQuantity')
  num? get minItemQuantity;

  /// Maximum item quantity allowed
  @BuiltValueField(wireName: r'maxItemQuantity')
  num? get maxItemQuantity;

  /// Estimated minimum delivery days
  @BuiltValueField(wireName: r'estimatedMinDays')
  num? get estimatedMinDays;

  /// Estimated maximum delivery days
  @BuiltValueField(wireName: r'estimatedMaxDays')
  num? get estimatedMaxDays;

  /// Sort order for display purposes
  @BuiltValueField(wireName: r'sortOrder')
  num? get sortOrder;

  UpsertShippingMethodDto._();

  factory UpsertShippingMethodDto([void updates(UpsertShippingMethodDtoBuilder b)]) = _$UpsertShippingMethodDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpsertShippingMethodDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpsertShippingMethodDto> get serializer => _$UpsertShippingMethodDtoSerializer();
}

class _$UpsertShippingMethodDtoSerializer implements PrimitiveSerializer<UpsertShippingMethodDto> {
  @override
  final Iterable<Type> types = const [UpsertShippingMethodDto, _$UpsertShippingMethodDto];

  @override
  final String wireName = r'UpsertShippingMethodDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpsertShippingMethodDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'rateType';
    yield serializers.serialize(
      object.rateType,
      specifiedType: const FullType(UpsertShippingMethodDtoRateTypeEnum),
    );
    yield r'currencyCode';
    yield serializers.serialize(
      object.currencyCode,
      specifiedType: const FullType(String),
    );
    if (object.isActive != null) {
      yield r'isActive';
      yield serializers.serialize(
        object.isActive,
        specifiedType: const FullType(bool),
      );
    }
    if (object.flatAmount != null) {
      yield r'flatAmount';
      yield serializers.serialize(
        object.flatAmount,
        specifiedType: const FullType(num),
      );
    }
    if (object.percentageBps != null) {
      yield r'percentageBps';
      yield serializers.serialize(
        object.percentageBps,
        specifiedType: const FullType(num),
      );
    }
    if (object.minSubtotalAmount != null) {
      yield r'minSubtotalAmount';
      yield serializers.serialize(
        object.minSubtotalAmount,
        specifiedType: const FullType(num),
      );
    }
    if (object.maxSubtotalAmount != null) {
      yield r'maxSubtotalAmount';
      yield serializers.serialize(
        object.maxSubtotalAmount,
        specifiedType: const FullType(num),
      );
    }
    if (object.minItemQuantity != null) {
      yield r'minItemQuantity';
      yield serializers.serialize(
        object.minItemQuantity,
        specifiedType: const FullType(num),
      );
    }
    if (object.maxItemQuantity != null) {
      yield r'maxItemQuantity';
      yield serializers.serialize(
        object.maxItemQuantity,
        specifiedType: const FullType(num),
      );
    }
    if (object.estimatedMinDays != null) {
      yield r'estimatedMinDays';
      yield serializers.serialize(
        object.estimatedMinDays,
        specifiedType: const FullType(num),
      );
    }
    if (object.estimatedMaxDays != null) {
      yield r'estimatedMaxDays';
      yield serializers.serialize(
        object.estimatedMaxDays,
        specifiedType: const FullType(num),
      );
    }
    if (object.sortOrder != null) {
      yield r'sortOrder';
      yield serializers.serialize(
        object.sortOrder,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpsertShippingMethodDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpsertShippingMethodDtoBuilder result,
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
        case r'rateType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UpsertShippingMethodDtoRateTypeEnum),
          ) as UpsertShippingMethodDtoRateTypeEnum;
          result.rateType = valueDes;
          break;
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyCode = valueDes;
          break;
        case r'isActive':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isActive = valueDes;
          break;
        case r'flatAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.flatAmount = valueDes;
          break;
        case r'percentageBps':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.percentageBps = valueDes;
          break;
        case r'minSubtotalAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.minSubtotalAmount = valueDes;
          break;
        case r'maxSubtotalAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.maxSubtotalAmount = valueDes;
          break;
        case r'minItemQuantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.minItemQuantity = valueDes;
          break;
        case r'maxItemQuantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.maxItemQuantity = valueDes;
          break;
        case r'estimatedMinDays':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.estimatedMinDays = valueDes;
          break;
        case r'estimatedMaxDays':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.estimatedMaxDays = valueDes;
          break;
        case r'sortOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.sortOrder = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpsertShippingMethodDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpsertShippingMethodDtoBuilder();
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

class UpsertShippingMethodDtoRateTypeEnum extends EnumClass {

  /// Rate calculation type: FLAT or PERCENTAGE_OF_SUBTOTAL
  @BuiltValueEnumConst(wireName: r'FLAT')
  static const UpsertShippingMethodDtoRateTypeEnum FLAT = _$upsertShippingMethodDtoRateTypeEnum_FLAT;
  /// Rate calculation type: FLAT or PERCENTAGE_OF_SUBTOTAL
  @BuiltValueEnumConst(wireName: r'PERCENTAGE_OF_SUBTOTAL')
  static const UpsertShippingMethodDtoRateTypeEnum PERCENTAGE_OF_SUBTOTAL = _$upsertShippingMethodDtoRateTypeEnum_PERCENTAGE_OF_SUBTOTAL;

  static Serializer<UpsertShippingMethodDtoRateTypeEnum> get serializer => _$upsertShippingMethodDtoRateTypeEnumSerializer;

  const UpsertShippingMethodDtoRateTypeEnum._(String name): super(name);

  static BuiltSet<UpsertShippingMethodDtoRateTypeEnum> get values => _$upsertShippingMethodDtoRateTypeEnumValues;
  static UpsertShippingMethodDtoRateTypeEnum valueOf(String name) => _$upsertShippingMethodDtoRateTypeEnumValueOf(name);
}

