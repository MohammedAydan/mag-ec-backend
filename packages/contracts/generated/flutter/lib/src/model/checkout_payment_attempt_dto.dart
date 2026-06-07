//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'checkout_payment_attempt_dto.g.dart';

/// CheckoutPaymentAttemptDto
///
/// Properties:
/// * [attemptId]
/// * [provider]
/// * [status]
/// * [clientSecret]
/// * [checkoutUrl]
/// * [providerPaymentId]
@BuiltValue()
abstract class CheckoutPaymentAttemptDto
    implements
        Built<CheckoutPaymentAttemptDto, CheckoutPaymentAttemptDtoBuilder> {
  @BuiltValueField(wireName: r'attemptId')
  String get attemptId;

  @BuiltValueField(wireName: r'provider')
  String get provider;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'clientSecret')
  String? get clientSecret;

  @BuiltValueField(wireName: r'checkoutUrl')
  String? get checkoutUrl;

  @BuiltValueField(wireName: r'providerPaymentId')
  String? get providerPaymentId;

  CheckoutPaymentAttemptDto._();

  factory CheckoutPaymentAttemptDto(
          [void updates(CheckoutPaymentAttemptDtoBuilder b)]) =
      _$CheckoutPaymentAttemptDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckoutPaymentAttemptDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckoutPaymentAttemptDto> get serializer =>
      _$CheckoutPaymentAttemptDtoSerializer();
}

class _$CheckoutPaymentAttemptDtoSerializer
    implements PrimitiveSerializer<CheckoutPaymentAttemptDto> {
  @override
  final Iterable<Type> types = const [
    CheckoutPaymentAttemptDto,
    _$CheckoutPaymentAttemptDto
  ];

  @override
  final String wireName = r'CheckoutPaymentAttemptDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckoutPaymentAttemptDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'attemptId';
    yield serializers.serialize(
      object.attemptId,
      specifiedType: const FullType(String),
    );
    yield r'provider';
    yield serializers.serialize(
      object.provider,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    if (object.clientSecret != null) {
      yield r'clientSecret';
      yield serializers.serialize(
        object.clientSecret,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.checkoutUrl != null) {
      yield r'checkoutUrl';
      yield serializers.serialize(
        object.checkoutUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.providerPaymentId != null) {
      yield r'providerPaymentId';
      yield serializers.serialize(
        object.providerPaymentId,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CheckoutPaymentAttemptDto object, {
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
    required CheckoutPaymentAttemptDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'attemptId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.attemptId = valueDes;
          break;
        case r'provider':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.provider = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'clientSecret':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.clientSecret = valueDes;
          break;
        case r'checkoutUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.checkoutUrl = valueDes;
          break;
        case r'providerPaymentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerPaymentId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CheckoutPaymentAttemptDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckoutPaymentAttemptDtoBuilder();
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
