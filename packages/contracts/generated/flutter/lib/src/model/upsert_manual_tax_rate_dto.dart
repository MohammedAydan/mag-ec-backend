//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upsert_manual_tax_rate_dto.g.dart';

/// UpsertManualTaxRateDto
///
/// Properties:
/// * [rateBps] - Tax rate in basis points (e.g. 850 = 8.50%)
/// * [isIncludedInPrice] - Whether this tax rate is included in the displayed price
@BuiltValue()
abstract class UpsertManualTaxRateDto
    implements Built<UpsertManualTaxRateDto, UpsertManualTaxRateDtoBuilder> {
  /// Tax rate in basis points (e.g. 850 = 8.50%)
  @BuiltValueField(wireName: r'rateBps')
  num get rateBps;

  /// Whether this tax rate is included in the displayed price
  @BuiltValueField(wireName: r'isIncludedInPrice')
  bool? get isIncludedInPrice;

  UpsertManualTaxRateDto._();

  factory UpsertManualTaxRateDto(
          [void updates(UpsertManualTaxRateDtoBuilder b)]) =
      _$UpsertManualTaxRateDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpsertManualTaxRateDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpsertManualTaxRateDto> get serializer =>
      _$UpsertManualTaxRateDtoSerializer();
}

class _$UpsertManualTaxRateDtoSerializer
    implements PrimitiveSerializer<UpsertManualTaxRateDto> {
  @override
  final Iterable<Type> types = const [
    UpsertManualTaxRateDto,
    _$UpsertManualTaxRateDto
  ];

  @override
  final String wireName = r'UpsertManualTaxRateDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpsertManualTaxRateDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'rateBps';
    yield serializers.serialize(
      object.rateBps,
      specifiedType: const FullType(num),
    );
    if (object.isIncludedInPrice != null) {
      yield r'isIncludedInPrice';
      yield serializers.serialize(
        object.isIncludedInPrice,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpsertManualTaxRateDto object, {
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
    required UpsertManualTaxRateDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'rateBps':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.rateBps = valueDes;
          break;
        case r'isIncludedInPrice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isIncludedInPrice = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpsertManualTaxRateDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpsertManualTaxRateDtoBuilder();
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
