//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/order_refund_dto.dart';
import 'package:mag_api_client/src/model/order_return_request_item_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_return_request_dto.g.dart';

/// OrderReturnRequestDto
///
/// Properties:
/// * [id]
/// * [returnNumber]
/// * [requestedByUserId]
/// * [status]
/// * [reason]
/// * [createdAt]
/// * [updatedAt]
/// * [items]
/// * [refunds]
/// * [reviewedByUserId]
/// * [receivedByUserId]
/// * [notes]
/// * [reviewNotes]
/// * [rejectionReason]
/// * [approvedAt]
/// * [rejectedAt]
/// * [receivedAt]
/// * [closedAt]
@BuiltValue()
abstract class OrderReturnRequestDto
    implements Built<OrderReturnRequestDto, OrderReturnRequestDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'returnNumber')
  String get returnNumber;

  @BuiltValueField(wireName: r'requestedByUserId')
  String get requestedByUserId;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'reason')
  String get reason;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  @BuiltValueField(wireName: r'items')
  BuiltList<OrderReturnRequestItemDto> get items;

  @BuiltValueField(wireName: r'refunds')
  BuiltList<OrderRefundDto> get refunds;

  @BuiltValueField(wireName: r'reviewedByUserId')
  String? get reviewedByUserId;

  @BuiltValueField(wireName: r'receivedByUserId')
  String? get receivedByUserId;

  @BuiltValueField(wireName: r'notes')
  String? get notes;

  @BuiltValueField(wireName: r'reviewNotes')
  String? get reviewNotes;

  @BuiltValueField(wireName: r'rejectionReason')
  String? get rejectionReason;

  @BuiltValueField(wireName: r'approvedAt')
  String? get approvedAt;

  @BuiltValueField(wireName: r'rejectedAt')
  String? get rejectedAt;

  @BuiltValueField(wireName: r'receivedAt')
  String? get receivedAt;

  @BuiltValueField(wireName: r'closedAt')
  String? get closedAt;

  OrderReturnRequestDto._();

  factory OrderReturnRequestDto(
      [void updates(OrderReturnRequestDtoBuilder b)]) = _$OrderReturnRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrderReturnRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrderReturnRequestDto> get serializer =>
      _$OrderReturnRequestDtoSerializer();
}

class _$OrderReturnRequestDtoSerializer
    implements PrimitiveSerializer<OrderReturnRequestDto> {
  @override
  final Iterable<Type> types = const [
    OrderReturnRequestDto,
    _$OrderReturnRequestDto
  ];

  @override
  final String wireName = r'OrderReturnRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrderReturnRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'returnNumber';
    yield serializers.serialize(
      object.returnNumber,
      specifiedType: const FullType(String),
    );
    yield r'requestedByUserId';
    yield serializers.serialize(
      object.requestedByUserId,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'reason';
    yield serializers.serialize(
      object.reason,
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
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(OrderReturnRequestItemDto)]),
    );
    yield r'refunds';
    yield serializers.serialize(
      object.refunds,
      specifiedType: const FullType(BuiltList, [FullType(OrderRefundDto)]),
    );
    if (object.reviewedByUserId != null) {
      yield r'reviewedByUserId';
      yield serializers.serialize(
        object.reviewedByUserId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.receivedByUserId != null) {
      yield r'receivedByUserId';
      yield serializers.serialize(
        object.receivedByUserId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.notes != null) {
      yield r'notes';
      yield serializers.serialize(
        object.notes,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.reviewNotes != null) {
      yield r'reviewNotes';
      yield serializers.serialize(
        object.reviewNotes,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.rejectionReason != null) {
      yield r'rejectionReason';
      yield serializers.serialize(
        object.rejectionReason,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.approvedAt != null) {
      yield r'approvedAt';
      yield serializers.serialize(
        object.approvedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.rejectedAt != null) {
      yield r'rejectedAt';
      yield serializers.serialize(
        object.rejectedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.receivedAt != null) {
      yield r'receivedAt';
      yield serializers.serialize(
        object.receivedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.closedAt != null) {
      yield r'closedAt';
      yield serializers.serialize(
        object.closedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrderReturnRequestDto object, {
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
    required OrderReturnRequestDtoBuilder result,
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
        case r'returnNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.returnNumber = valueDes;
          break;
        case r'requestedByUserId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.requestedByUserId = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reason = valueDes;
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
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(OrderReturnRequestItemDto)]),
          ) as BuiltList<OrderReturnRequestItemDto>;
          result.items.replace(valueDes);
          break;
        case r'refunds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(OrderRefundDto)]),
          ) as BuiltList<OrderRefundDto>;
          result.refunds.replace(valueDes);
          break;
        case r'reviewedByUserId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reviewedByUserId = valueDes;
          break;
        case r'receivedByUserId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.receivedByUserId = valueDes;
          break;
        case r'notes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.notes = valueDes;
          break;
        case r'reviewNotes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reviewNotes = valueDes;
          break;
        case r'rejectionReason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.rejectionReason = valueDes;
          break;
        case r'approvedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.approvedAt = valueDes;
          break;
        case r'rejectedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.rejectedAt = valueDes;
          break;
        case r'receivedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.receivedAt = valueDes;
          break;
        case r'closedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.closedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrderReturnRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrderReturnRequestDtoBuilder();
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
