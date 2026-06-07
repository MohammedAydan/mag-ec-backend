//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'checkout_preview_shipping_method_dto.g.dart';

/// CheckoutPreviewShippingMethodDto
///
/// Properties:
/// * [methodId] 
/// * [key] 
/// * [name] 
/// * [amount] 
/// * [totalAmount] 
/// * [estimatedMinDays] 
/// * [estimatedMaxDays] 
@BuiltValue()
abstract class CheckoutPreviewShippingMethodDto implements Built<CheckoutPreviewShippingMethodDto, CheckoutPreviewShippingMethodDtoBuilder> {
  @BuiltValueField(wireName: r'methodId')
  String get methodId;

  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'amount')
  num get amount;

  @BuiltValueField(wireName: r'totalAmount')
  num get totalAmount;

  @BuiltValueField(wireName: r'estimatedMinDays')
  num? get estimatedMinDays;

  @BuiltValueField(wireName: r'estimatedMaxDays')
  num? get estimatedMaxDays;

  CheckoutPreviewShippingMethodDto._();

  factory CheckoutPreviewShippingMethodDto([void updates(CheckoutPreviewShippingMethodDtoBuilder b)]) = _$CheckoutPreviewShippingMethodDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckoutPreviewShippingMethodDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckoutPreviewShippingMethodDto> get serializer => _$CheckoutPreviewShippingMethodDtoSerializer();
}

class _$CheckoutPreviewShippingMethodDtoSerializer implements PrimitiveSerializer<CheckoutPreviewShippingMethodDto> {
  @override
  final Iterable<Type> types = const [CheckoutPreviewShippingMethodDto, _$CheckoutPreviewShippingMethodDto];

  @override
  final String wireName = r'CheckoutPreviewShippingMethodDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckoutPreviewShippingMethodDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'methodId';
    yield serializers.serialize(
      object.methodId,
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
    CheckoutPreviewShippingMethodDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CheckoutPreviewShippingMethodDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'methodId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.methodId = valueDes;
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
  CheckoutPreviewShippingMethodDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckoutPreviewShippingMethodDtoBuilder();
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

