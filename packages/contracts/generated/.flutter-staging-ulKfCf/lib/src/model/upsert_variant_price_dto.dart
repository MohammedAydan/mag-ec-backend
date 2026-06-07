//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upsert_variant_price_dto.g.dart';

/// UpsertVariantPriceDto
///
/// Properties:
/// * [currencyCode] - ISO 4217 currency code for this price
/// * [baseAmount] - Base price in minor currency units
/// * [saleAmount] - Optional sale price in minor currency units
/// * [saleStartsAt] - Sale start date-time
/// * [saleEndsAt] - Sale end date-time
/// * [taxClassId] - Tax class identifier for this price entry
@BuiltValue()
abstract class UpsertVariantPriceDto implements Built<UpsertVariantPriceDto, UpsertVariantPriceDtoBuilder> {
  /// ISO 4217 currency code for this price
  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  /// Base price in minor currency units
  @BuiltValueField(wireName: r'baseAmount')
  num get baseAmount;

  /// Optional sale price in minor currency units
  @BuiltValueField(wireName: r'saleAmount')
  num? get saleAmount;

  /// Sale start date-time
  @BuiltValueField(wireName: r'saleStartsAt')
  DateTime? get saleStartsAt;

  /// Sale end date-time
  @BuiltValueField(wireName: r'saleEndsAt')
  DateTime? get saleEndsAt;

  /// Tax class identifier for this price entry
  @BuiltValueField(wireName: r'taxClassId')
  String? get taxClassId;

  UpsertVariantPriceDto._();

  factory UpsertVariantPriceDto([void updates(UpsertVariantPriceDtoBuilder b)]) = _$UpsertVariantPriceDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpsertVariantPriceDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpsertVariantPriceDto> get serializer => _$UpsertVariantPriceDtoSerializer();
}

class _$UpsertVariantPriceDtoSerializer implements PrimitiveSerializer<UpsertVariantPriceDto> {
  @override
  final Iterable<Type> types = const [UpsertVariantPriceDto, _$UpsertVariantPriceDto];

  @override
  final String wireName = r'UpsertVariantPriceDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpsertVariantPriceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'currencyCode';
    yield serializers.serialize(
      object.currencyCode,
      specifiedType: const FullType(String),
    );
    yield r'baseAmount';
    yield serializers.serialize(
      object.baseAmount,
      specifiedType: const FullType(num),
    );
    if (object.saleAmount != null) {
      yield r'saleAmount';
      yield serializers.serialize(
        object.saleAmount,
        specifiedType: const FullType(num),
      );
    }
    if (object.saleStartsAt != null) {
      yield r'saleStartsAt';
      yield serializers.serialize(
        object.saleStartsAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.saleEndsAt != null) {
      yield r'saleEndsAt';
      yield serializers.serialize(
        object.saleEndsAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.taxClassId != null) {
      yield r'taxClassId';
      yield serializers.serialize(
        object.taxClassId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpsertVariantPriceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpsertVariantPriceDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyCode = valueDes;
          break;
        case r'baseAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.baseAmount = valueDes;
          break;
        case r'saleAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.saleAmount = valueDes;
          break;
        case r'saleStartsAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.saleStartsAt = valueDes;
          break;
        case r'saleEndsAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.saleEndsAt = valueDes;
          break;
        case r'taxClassId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.taxClassId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpsertVariantPriceDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpsertVariantPriceDtoBuilder();
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

