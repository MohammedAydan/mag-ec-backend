//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'variant_price_response_dto.g.dart';

/// VariantPriceResponseDto
///
/// Properties:
/// * [id]
/// * [variantId]
/// * [currencyCode]
/// * [baseAmount]
/// * [updatedAt]
/// * [saleAmount]
/// * [saleStartsAt]
/// * [saleEndsAt]
/// * [taxClassId]
@BuiltValue()
abstract class VariantPriceResponseDto
    implements Built<VariantPriceResponseDto, VariantPriceResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'variantId')
  String get variantId;

  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  @BuiltValueField(wireName: r'baseAmount')
  num get baseAmount;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  @BuiltValueField(wireName: r'saleAmount')
  num? get saleAmount;

  @BuiltValueField(wireName: r'saleStartsAt')
  String? get saleStartsAt;

  @BuiltValueField(wireName: r'saleEndsAt')
  String? get saleEndsAt;

  @BuiltValueField(wireName: r'taxClassId')
  String? get taxClassId;

  VariantPriceResponseDto._();

  factory VariantPriceResponseDto(
          [void updates(VariantPriceResponseDtoBuilder b)]) =
      _$VariantPriceResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VariantPriceResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VariantPriceResponseDto> get serializer =>
      _$VariantPriceResponseDtoSerializer();
}

class _$VariantPriceResponseDtoSerializer
    implements PrimitiveSerializer<VariantPriceResponseDto> {
  @override
  final Iterable<Type> types = const [
    VariantPriceResponseDto,
    _$VariantPriceResponseDto
  ];

  @override
  final String wireName = r'VariantPriceResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VariantPriceResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'variantId';
    yield serializers.serialize(
      object.variantId,
      specifiedType: const FullType(String),
    );
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
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(String),
    );
    if (object.saleAmount != null) {
      yield r'saleAmount';
      yield serializers.serialize(
        object.saleAmount,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.saleStartsAt != null) {
      yield r'saleStartsAt';
      yield serializers.serialize(
        object.saleStartsAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.saleEndsAt != null) {
      yield r'saleEndsAt';
      yield serializers.serialize(
        object.saleEndsAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.taxClassId != null) {
      yield r'taxClassId';
      yield serializers.serialize(
        object.taxClassId,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VariantPriceResponseDto object, {
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
    required VariantPriceResponseDtoBuilder result,
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
        case r'variantId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.variantId = valueDes;
          break;
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
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.updatedAt = valueDes;
          break;
        case r'saleAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.saleAmount = valueDes;
          break;
        case r'saleStartsAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.saleStartsAt = valueDes;
          break;
        case r'saleEndsAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.saleEndsAt = valueDes;
          break;
        case r'taxClassId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
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
  VariantPriceResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VariantPriceResponseDtoBuilder();
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
