//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/order_brief_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'refund_response_dto.g.dart';

/// RefundResponseDto
///
/// Properties:
/// * [id] 
/// * [orderId] 
/// * [provider] 
/// * [status] 
/// * [amount] 
/// * [currencyCode] 
/// * [requestedAt] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [order] 
/// * [paymentAttemptId] 
/// * [returnRequestId] 
/// * [requestedByUserId] 
/// * [reason] 
/// * [providerRefundId] 
/// * [providerReference] 
/// * [failureReason] 
/// * [processedAt] 
@BuiltValue()
abstract class RefundResponseDto implements Built<RefundResponseDto, RefundResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'orderId')
  String get orderId;

  @BuiltValueField(wireName: r'provider')
  String get provider;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'amount')
  num get amount;

  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  @BuiltValueField(wireName: r'requestedAt')
  String get requestedAt;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  @BuiltValueField(wireName: r'order')
  OrderBriefDto get order;

  @BuiltValueField(wireName: r'paymentAttemptId')
  String? get paymentAttemptId;

  @BuiltValueField(wireName: r'returnRequestId')
  String? get returnRequestId;

  @BuiltValueField(wireName: r'requestedByUserId')
  String? get requestedByUserId;

  @BuiltValueField(wireName: r'reason')
  String? get reason;

  @BuiltValueField(wireName: r'providerRefundId')
  String? get providerRefundId;

  @BuiltValueField(wireName: r'providerReference')
  String? get providerReference;

  @BuiltValueField(wireName: r'failureReason')
  String? get failureReason;

  @BuiltValueField(wireName: r'processedAt')
  String? get processedAt;

  RefundResponseDto._();

  factory RefundResponseDto([void updates(RefundResponseDtoBuilder b)]) = _$RefundResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RefundResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RefundResponseDto> get serializer => _$RefundResponseDtoSerializer();
}

class _$RefundResponseDtoSerializer implements PrimitiveSerializer<RefundResponseDto> {
  @override
  final Iterable<Type> types = const [RefundResponseDto, _$RefundResponseDto];

  @override
  final String wireName = r'RefundResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RefundResponseDto object, {
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
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'amount';
    yield serializers.serialize(
      object.amount,
      specifiedType: const FullType(num),
    );
    yield r'currencyCode';
    yield serializers.serialize(
      object.currencyCode,
      specifiedType: const FullType(String),
    );
    yield r'requestedAt';
    yield serializers.serialize(
      object.requestedAt,
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
    yield r'order';
    yield serializers.serialize(
      object.order,
      specifiedType: const FullType(OrderBriefDto),
    );
    if (object.paymentAttemptId != null) {
      yield r'paymentAttemptId';
      yield serializers.serialize(
        object.paymentAttemptId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.returnRequestId != null) {
      yield r'returnRequestId';
      yield serializers.serialize(
        object.returnRequestId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.requestedByUserId != null) {
      yield r'requestedByUserId';
      yield serializers.serialize(
        object.requestedByUserId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.reason != null) {
      yield r'reason';
      yield serializers.serialize(
        object.reason,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.providerRefundId != null) {
      yield r'providerRefundId';
      yield serializers.serialize(
        object.providerRefundId,
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
    if (object.failureReason != null) {
      yield r'failureReason';
      yield serializers.serialize(
        object.failureReason,
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
    RefundResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RefundResponseDtoBuilder result,
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
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.amount = valueDes;
          break;
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyCode = valueDes;
          break;
        case r'requestedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.requestedAt = valueDes;
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
        case r'paymentAttemptId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.paymentAttemptId = valueDes;
          break;
        case r'returnRequestId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.returnRequestId = valueDes;
          break;
        case r'requestedByUserId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.requestedByUserId = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reason = valueDes;
          break;
        case r'providerRefundId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerRefundId = valueDes;
          break;
        case r'providerReference':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providerReference = valueDes;
          break;
        case r'failureReason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.failureReason = valueDes;
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
  RefundResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RefundResponseDtoBuilder();
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

