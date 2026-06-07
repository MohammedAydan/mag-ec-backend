//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/payment_attempt_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_payment_attempts_dto.g.dart';

/// PaginatedPaymentAttemptsDto
///
/// Properties:
/// * [items] 
/// * [nextCursor] 
@BuiltValue()
abstract class PaginatedPaymentAttemptsDto implements Built<PaginatedPaymentAttemptsDto, PaginatedPaymentAttemptsDtoBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<PaymentAttemptResponseDto> get items;

  @BuiltValueField(wireName: r'nextCursor')
  String? get nextCursor;

  PaginatedPaymentAttemptsDto._();

  factory PaginatedPaymentAttemptsDto([void updates(PaginatedPaymentAttemptsDtoBuilder b)]) = _$PaginatedPaymentAttemptsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedPaymentAttemptsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedPaymentAttemptsDto> get serializer => _$PaginatedPaymentAttemptsDtoSerializer();
}

class _$PaginatedPaymentAttemptsDtoSerializer implements PrimitiveSerializer<PaginatedPaymentAttemptsDto> {
  @override
  final Iterable<Type> types = const [PaginatedPaymentAttemptsDto, _$PaginatedPaymentAttemptsDto];

  @override
  final String wireName = r'PaginatedPaymentAttemptsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedPaymentAttemptsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(PaymentAttemptResponseDto)]),
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
    PaginatedPaymentAttemptsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedPaymentAttemptsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PaymentAttemptResponseDto)]),
          ) as BuiltList<PaymentAttemptResponseDto>;
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
  PaginatedPaymentAttemptsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedPaymentAttemptsDtoBuilder();
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

