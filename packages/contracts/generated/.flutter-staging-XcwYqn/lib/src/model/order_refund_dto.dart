//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_refund_dto.g.dart';

/// OrderRefundDto
///
/// Properties:
/// * [id] 
/// * [status] 
/// * [amount] 
/// * [currencyCode] 
/// * [provider] 
/// * [requestedAt] 
/// * [returnRequestId] 
/// * [paymentAttemptId] 
/// * [reason] 
/// * [providerRefundId] 
/// * [processedAt] 
@BuiltValue()
abstract class OrderRefundDto implements Built<OrderRefundDto, OrderRefundDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'amount')
  num get amount;

  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  @BuiltValueField(wireName: r'provider')
  String get provider;

  @BuiltValueField(wireName: r'requestedAt')
  String get requestedAt;

  @BuiltValueField(wireName: r'returnRequestId')
  String? get returnRequestId;

  @BuiltValueField(wireName: r'paymentAttemptId')
  String? get paymentAttemptId;

  @BuiltValueField(wireName: r'reason')
  String? get reason;

  @BuiltValueField(wireName: r'providerRefundId')
  String? get providerRefundId;

  @BuiltValueField(wireName: r'processedAt')
  String? get processedAt;

  OrderRefundDto._();

  factory OrderRefundDto([void updates(OrderRefundDtoBuilder b)]) = _$OrderRefundDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrderRefundDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrderRefundDto> get serializer => _$OrderRefundDtoSerializer();
}

class _$OrderRefundDtoSerializer implements PrimitiveSerializer<OrderRefundDto> {
  @override
  final Iterable<Type> types = const [OrderRefundDto, _$OrderRefundDto];

  @override
  final String wireName = r'OrderRefundDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrderRefundDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
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
    yield r'provider';
    yield serializers.serialize(
      object.provider,
      specifiedType: const FullType(String),
    );
    yield r'requestedAt';
    yield serializers.serialize(
      object.requestedAt,
      specifiedType: const FullType(String),
    );
    if (object.returnRequestId != null) {
      yield r'returnRequestId';
      yield serializers.serialize(
        object.returnRequestId,
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
    OrderRefundDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrderRefundDtoBuilder result,
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
        case r'provider':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.provider = valueDes;
          break;
        case r'requestedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.requestedAt = valueDes;
          break;
        case r'returnRequestId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.returnRequestId = valueDes;
          break;
        case r'paymentAttemptId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.paymentAttemptId = valueDes;
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
  OrderRefundDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrderRefundDtoBuilder();
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

