//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/payment_webhook_event_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_payment_webhook_events_dto.g.dart';

/// PaginatedPaymentWebhookEventsDto
///
/// Properties:
/// * [items] 
/// * [nextCursor] 
@BuiltValue()
abstract class PaginatedPaymentWebhookEventsDto implements Built<PaginatedPaymentWebhookEventsDto, PaginatedPaymentWebhookEventsDtoBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<PaymentWebhookEventResponseDto> get items;

  @BuiltValueField(wireName: r'nextCursor')
  String? get nextCursor;

  PaginatedPaymentWebhookEventsDto._();

  factory PaginatedPaymentWebhookEventsDto([void updates(PaginatedPaymentWebhookEventsDtoBuilder b)]) = _$PaginatedPaymentWebhookEventsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedPaymentWebhookEventsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedPaymentWebhookEventsDto> get serializer => _$PaginatedPaymentWebhookEventsDtoSerializer();
}

class _$PaginatedPaymentWebhookEventsDtoSerializer implements PrimitiveSerializer<PaginatedPaymentWebhookEventsDto> {
  @override
  final Iterable<Type> types = const [PaginatedPaymentWebhookEventsDto, _$PaginatedPaymentWebhookEventsDto];

  @override
  final String wireName = r'PaginatedPaymentWebhookEventsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedPaymentWebhookEventsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(PaymentWebhookEventResponseDto)]),
    );
    if (object.nextCursor != null) {
      yield r'nextCursor';
      yield serializers.serialize(
        object.nextCursor,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaginatedPaymentWebhookEventsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedPaymentWebhookEventsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PaymentWebhookEventResponseDto)]),
          ) as BuiltList<PaymentWebhookEventResponseDto>;
          result.items.replace(valueDes);
          break;
        case r'nextCursor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nextCursor = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaginatedPaymentWebhookEventsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedPaymentWebhookEventsDtoBuilder();
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

