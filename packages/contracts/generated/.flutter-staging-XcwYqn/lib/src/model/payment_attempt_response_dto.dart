//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/order_brief_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'payment_attempt_response_dto.g.dart';

/// PaymentAttemptResponseDto
///
/// Properties:
/// * [id] 
/// * [orderId] 
/// * [provider] 
/// * [method] 
/// * [status] 
/// * [currencyCode] 
/// * [amount] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [order] 
/// * [providerPaymentId] 
/// * [providerIntentStatus] 
/// * [providerReference] 
/// * [lastErrorCode] 
/// * [lastErrorMessage] 
/// * [succeededAt] 
/// * [failedAt] 
@BuiltValue()
abstract class PaymentAttemptResponseDto implements Built<PaymentAttemptResponseDto, PaymentAttemptResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'orderId')
  String get orderId;

  @BuiltValueField(wireName: r'provider')
  String get provider;

  @BuiltValueField(wireName: r'method')
  String get method;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  @BuiltValueField(wireName: r'amount')
  num get amount;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  @BuiltValueField(wireName: r'order')
  OrderBriefDto get order;

  @BuiltValueField(wireName: r'providerPaymentId')
  String? get providerPaymentId;

  @BuiltValueField(wireName: r'providerIntentStatus')
  String? get providerIntentStatus;

  @BuiltValueField(wireName: r'providerReference')
  String? get providerReference;

  @BuiltValueField(wireName: r'lastErrorCode')
  String? get lastErrorCode;

  @BuiltValueField(wireName: r'lastErrorMessage')
  String? get lastErrorMessage;

  @BuiltValueField(wireName: r'succeededAt')
  String? get succeededAt;

  @BuiltValueField(wireName: r'failedAt')
  String? get failedAt;

  PaymentAttemptResponseDto._();

  factory PaymentAttemptResponseDto([void updates(PaymentAttemptResponseDtoBuilder b)]) = _$PaymentAttemptResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaymentAttemptResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaymentAttemptResponseDto> get serializer => _$PaymentAttemptResponseDtoSerializer();
}

class _$PaymentAttemptResponseDtoSerializer implements PrimitiveSerializer<PaymentAttemptResponseDto> {
  @override
  final Iterable<Type> types = const [PaymentAttemptResponseDto, _$PaymentAttemptResponseDto];

  @override
  final String wireName = r'PaymentAttemptResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaymentAttemptResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'orderId';
    yield serializers.serialize(
      object.orderId,
      specifiedType: const FullType(String),
    );
    yield r'provider';
    yield serializers.serialize(
      object.provider,
      specifiedType: const FullType(String),
    );
    yield r'method';
    yield serializers.serialize(
      object.method,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'currencyCode';
    yield serializers.serialize(
      object.currencyCode,
      specifiedType: const FullType(String),
    );
    yield r'amount';
    yield serializers.serialize(
      object.amount,
      specifiedType: const FullType(num),
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
    yield r'order';
    yield serializers.serialize(
      object.order,
      specifiedType: const FullType(OrderBriefDto),
    );
    if (object.providerPaymentId != null) {
      yield r'providerPaymentId';
      yield serializers.serialize(
        object.providerPaymentId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.providerIntentStatus != null) {
      yield r'providerIntentStatus';
      yield serializers.serialize(
        object.providerIntentStatus,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.providerReference != null) {
      yield r'providerReference';
      yield serializers.serialize(
        object.providerReference,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.lastErrorCode != null) {
      yield r'lastErrorCode';
      yield serializers.serialize(
        object.lastErrorCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.lastErrorMessage != null) {
      yield r'lastErrorMessage';
      yield serializers.serialize(
        object.lastErrorMessage,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.succeededAt != null) {
      yield r'succeededAt';
      yield serializers.serialize(
        object.succeededAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.failedAt != null) {
      yield r'failedAt';
      yield serializers.serialize(
        object.failedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaymentAttemptResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaymentAttemptResponseDtoBuilder result,
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
        case r'orderId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.orderId = valueDes;
          break;
        case r'provider':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.provider = valueDes;
          break;
        case r'method':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.method = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyCode = valueDes;
          break;
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.amount = valueDes;
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
        case r'order':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(OrderBriefDto),
          ) as OrderBriefDto;
          result.order.replace(valueDes);
          break;
        case r'providerPaymentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerPaymentId = valueDes;
          break;
        case r'providerIntentStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerIntentStatus = valueDes;
          break;
        case r'providerReference':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerReference = valueDes;
          break;
        case r'lastErrorCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.lastErrorCode = valueDes;
          break;
        case r'lastErrorMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.lastErrorMessage = valueDes;
          break;
        case r'succeededAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.succeededAt = valueDes;
          break;
        case r'failedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.failedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaymentAttemptResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaymentAttemptResponseDtoBuilder();
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

