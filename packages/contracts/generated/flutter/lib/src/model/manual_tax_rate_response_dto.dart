//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'manual_tax_rate_response_dto.g.dart';

/// ManualTaxRateResponseDto
///
/// Properties:
/// * [id]
/// * [taxClassId]
/// * [countryCode]
/// * [rateBps]
/// * [isIncludedInPrice]
/// * [updatedAt]
@BuiltValue()
abstract class ManualTaxRateResponseDto
    implements
        Built<ManualTaxRateResponseDto, ManualTaxRateResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'taxClassId')
  String get taxClassId;

  @BuiltValueField(wireName: r'countryCode')
  String get countryCode;

  @BuiltValueField(wireName: r'rateBps')
  num get rateBps;

  @BuiltValueField(wireName: r'isIncludedInPrice')
  bool get isIncludedInPrice;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  ManualTaxRateResponseDto._();

  factory ManualTaxRateResponseDto(
          [void updates(ManualTaxRateResponseDtoBuilder b)]) =
      _$ManualTaxRateResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ManualTaxRateResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ManualTaxRateResponseDto> get serializer =>
      _$ManualTaxRateResponseDtoSerializer();
}

class _$ManualTaxRateResponseDtoSerializer
    implements PrimitiveSerializer<ManualTaxRateResponseDto> {
  @override
  final Iterable<Type> types = const [
    ManualTaxRateResponseDto,
    _$ManualTaxRateResponseDto
  ];

  @override
  final String wireName = r'ManualTaxRateResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ManualTaxRateResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'taxClassId';
    yield serializers.serialize(
      object.taxClassId,
      specifiedType: const FullType(String),
    );
    yield r'countryCode';
    yield serializers.serialize(
      object.countryCode,
      specifiedType: const FullType(String),
    );
    yield r'rateBps';
    yield serializers.serialize(
      object.rateBps,
      specifiedType: const FullType(num),
    );
    yield r'isIncludedInPrice';
    yield serializers.serialize(
      object.isIncludedInPrice,
      specifiedType: const FullType(bool),
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
    ManualTaxRateResponseDto object, {
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
    required ManualTaxRateResponseDtoBuilder result,
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
        case r'taxClassId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.taxClassId = valueDes;
          break;
        case r'countryCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.countryCode = valueDes;
          break;
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
  ManualTaxRateResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ManualTaxRateResponseDtoBuilder();
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
