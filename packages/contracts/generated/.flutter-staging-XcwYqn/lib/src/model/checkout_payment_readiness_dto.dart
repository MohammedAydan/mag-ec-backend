//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'checkout_payment_readiness_dto.g.dart';

/// CheckoutPaymentReadinessDto
///
/// Properties:
/// * [cashOnDeliveryAvailable] 
/// * [onlinePaymentAvailable] 
@BuiltValue()
abstract class CheckoutPaymentReadinessDto implements Built<CheckoutPaymentReadinessDto, CheckoutPaymentReadinessDtoBuilder> {
  @BuiltValueField(wireName: r'cashOnDeliveryAvailable')
  bool get cashOnDeliveryAvailable;

  @BuiltValueField(wireName: r'onlinePaymentAvailable')
  bool get onlinePaymentAvailable;

  CheckoutPaymentReadinessDto._();

  factory CheckoutPaymentReadinessDto([void updates(CheckoutPaymentReadinessDtoBuilder b)]) = _$CheckoutPaymentReadinessDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckoutPaymentReadinessDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckoutPaymentReadinessDto> get serializer => _$CheckoutPaymentReadinessDtoSerializer();
}

class _$CheckoutPaymentReadinessDtoSerializer implements PrimitiveSerializer<CheckoutPaymentReadinessDto> {
  @override
  final Iterable<Type> types = const [CheckoutPaymentReadinessDto, _$CheckoutPaymentReadinessDto];

  @override
  final String wireName = r'CheckoutPaymentReadinessDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckoutPaymentReadinessDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cashOnDeliveryAvailable';
    yield serializers.serialize(
      object.cashOnDeliveryAvailable,
      specifiedType: const FullType(bool),
    );
    yield r'onlinePaymentAvailable';
    yield serializers.serialize(
      object.onlinePaymentAvailable,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CheckoutPaymentReadinessDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CheckoutPaymentReadinessDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'cashOnDeliveryAvailable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.cashOnDeliveryAvailable = valueDes;
          break;
        case r'onlinePaymentAvailable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.onlinePaymentAvailable = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CheckoutPaymentReadinessDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckoutPaymentReadinessDtoBuilder();
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

