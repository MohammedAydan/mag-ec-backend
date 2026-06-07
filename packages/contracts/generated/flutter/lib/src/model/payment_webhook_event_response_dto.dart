//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'payment_webhook_event_response_dto.g.dart';

/// PaymentWebhookEventResponseDto
///
/// Properties:
/// * [id]
/// * [provider]
/// * [status]
/// * [receivedAt]
/// * [createdAt]
/// * [updatedAt]
/// * [externalEventId]
/// * [eventType]
/// * [paymentAttemptId]
/// * [orderId]
/// * [processingError]
/// * [processedAt]
@BuiltValue()
abstract class PaymentWebhookEventResponseDto
    implements
        Built<PaymentWebhookEventResponseDto,
            PaymentWebhookEventResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'provider')
  String get provider;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'receivedAt')
  String get receivedAt;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  @BuiltValueField(wireName: r'externalEventId')
  String? get externalEventId;

  @BuiltValueField(wireName: r'eventType')
  String? get eventType;

  @BuiltValueField(wireName: r'paymentAttemptId')
  String? get paymentAttemptId;

  @BuiltValueField(wireName: r'orderId')
  String? get orderId;

  @BuiltValueField(wireName: r'processingError')
  String? get processingError;

  @BuiltValueField(wireName: r'processedAt')
  String? get processedAt;

  PaymentWebhookEventResponseDto._();

  factory PaymentWebhookEventResponseDto(
          [void updates(PaymentWebhookEventResponseDtoBuilder b)]) =
      _$PaymentWebhookEventResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaymentWebhookEventResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaymentWebhookEventResponseDto> get serializer =>
      _$PaymentWebhookEventResponseDtoSerializer();
}

class _$PaymentWebhookEventResponseDtoSerializer
    implements PrimitiveSerializer<PaymentWebhookEventResponseDto> {
  @override
  final Iterable<Type> types = const [
    PaymentWebhookEventResponseDto,
    _$PaymentWebhookEventResponseDto
  ];

  @override
  final String wireName = r'PaymentWebhookEventResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaymentWebhookEventResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
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
    yield r'receivedAt';
    yield serializers.serialize(
      object.receivedAt,
      specifiedType: const FullType(String),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(String),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(String),
    );
    if (object.externalEventId != null) {
      yield r'externalEventId';
      yield serializers.serialize(
        object.externalEventId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.eventType != null) {
      yield r'eventType';
      yield serializers.serialize(
        object.eventType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.paymentAttemptId != null) {
      yield r'paymentAttemptId';
      yield serializers.serialize(
        object.paymentAttemptId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.orderId != null) {
      yield r'orderId';
      yield serializers.serialize(
        object.orderId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.processingError != null) {
      yield r'processingError';
      yield serializers.serialize(
        object.processingError,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.processedAt != null) {
      yield r'processedAt';
      yield serializers.serialize(
        object.processedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaymentWebhookEventResponseDto object, {
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
    required PaymentWebhookEventResponseDtoBuilder result,
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
        case r'receivedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.receivedAt = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.updatedAt = valueDes;
          break;
        case r'externalEventId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.externalEventId = valueDes;
          break;
        case r'eventType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.eventType = valueDes;
          break;
        case r'paymentAttemptId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.paymentAttemptId = valueDes;
          break;
        case r'orderId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.orderId = valueDes;
          break;
        case r'processingError':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.processingError = valueDes;
          break;
        case r'processedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.processedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaymentWebhookEventResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaymentWebhookEventResponseDtoBuilder();
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
