//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pricing_preview_shipping_method_dto.g.dart';

/// PricingPreviewShippingMethodDto
///
/// Properties:
/// * [key]
/// * [name]
/// * [rateType]
/// * [amount]
/// * [totalAmount]
@BuiltValue()
abstract class PricingPreviewShippingMethodDto
    implements
        Built<PricingPreviewShippingMethodDto,
            PricingPreviewShippingMethodDtoBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'rateType')
  String get rateType;

  @BuiltValueField(wireName: r'amount')
  num get amount;

  @BuiltValueField(wireName: r'totalAmount')
  num get totalAmount;

  PricingPreviewShippingMethodDto._();

  factory PricingPreviewShippingMethodDto(
          [void updates(PricingPreviewShippingMethodDtoBuilder b)]) =
      _$PricingPreviewShippingMethodDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PricingPreviewShippingMethodDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PricingPreviewShippingMethodDto> get serializer =>
      _$PricingPreviewShippingMethodDtoSerializer();
}

class _$PricingPreviewShippingMethodDtoSerializer
    implements PrimitiveSerializer<PricingPreviewShippingMethodDto> {
  @override
  final Iterable<Type> types = const [
    PricingPreviewShippingMethodDto,
    _$PricingPreviewShippingMethodDto
  ];

  @override
  final String wireName = r'PricingPreviewShippingMethodDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PricingPreviewShippingMethodDto object, {
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
    yield r'amount';
    yield serializers.serialize(
      object.amount,
      specifiedType: const FullType(num),
    );
    yield r'totalAmount';
    yield serializers.serialize(
      object.totalAmount,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PricingPreviewShippingMethodDto object, {
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
    required PricingPreviewShippingMethodDtoBuilder result,
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
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.amount = valueDes;
          break;
        case r'totalAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.totalAmount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PricingPreviewShippingMethodDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PricingPreviewShippingMethodDtoBuilder();
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
