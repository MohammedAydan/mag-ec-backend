//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notification_preference_response_dto.g.dart';

/// NotificationPreferenceResponseDto
///
/// Properties:
/// * [id]
/// * [userId]
/// * [channel]
/// * [orderConfirmations]
/// * [orderShipments]
/// * [orderDeliveries]
/// * [returnStatusUpdates]
/// * [reviewReplies]
/// * [backInStock]
/// * [lowStockAlerts]
/// * [promotionalMessages]
/// * [createdAt]
/// * [updatedAt]
@BuiltValue()
abstract class NotificationPreferenceResponseDto
    implements
        Built<NotificationPreferenceResponseDto,
            NotificationPreferenceResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'userId')
  String get userId;

  @BuiltValueField(wireName: r'channel')
  String get channel;

  @BuiltValueField(wireName: r'orderConfirmations')
  bool get orderConfirmations;

  @BuiltValueField(wireName: r'orderShipments')
  bool get orderShipments;

  @BuiltValueField(wireName: r'orderDeliveries')
  bool get orderDeliveries;

  @BuiltValueField(wireName: r'returnStatusUpdates')
  bool get returnStatusUpdates;

  @BuiltValueField(wireName: r'reviewReplies')
  bool get reviewReplies;

  @BuiltValueField(wireName: r'backInStock')
  bool get backInStock;

  @BuiltValueField(wireName: r'lowStockAlerts')
  bool get lowStockAlerts;

  @BuiltValueField(wireName: r'promotionalMessages')
  bool get promotionalMessages;

  @BuiltValueField(wireName: r'createdAt')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime get updatedAt;

  NotificationPreferenceResponseDto._();

  factory NotificationPreferenceResponseDto(
          [void updates(NotificationPreferenceResponseDtoBuilder b)]) =
      _$NotificationPreferenceResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NotificationPreferenceResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NotificationPreferenceResponseDto> get serializer =>
      _$NotificationPreferenceResponseDtoSerializer();
}

class _$NotificationPreferenceResponseDtoSerializer
    implements PrimitiveSerializer<NotificationPreferenceResponseDto> {
  @override
  final Iterable<Type> types = const [
    NotificationPreferenceResponseDto,
    _$NotificationPreferenceResponseDto
  ];

  @override
  final String wireName = r'NotificationPreferenceResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NotificationPreferenceResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'userId';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(String),
    );
    yield r'channel';
    yield serializers.serialize(
      object.channel,
      specifiedType: const FullType(String),
    );
    yield r'orderConfirmations';
    yield serializers.serialize(
      object.orderConfirmations,
      specifiedType: const FullType(bool),
    );
    yield r'orderShipments';
    yield serializers.serialize(
      object.orderShipments,
      specifiedType: const FullType(bool),
    );
    yield r'orderDeliveries';
    yield serializers.serialize(
      object.orderDeliveries,
      specifiedType: const FullType(bool),
    );
    yield r'returnStatusUpdates';
    yield serializers.serialize(
      object.returnStatusUpdates,
      specifiedType: const FullType(bool),
    );
    yield r'reviewReplies';
    yield serializers.serialize(
      object.reviewReplies,
      specifiedType: const FullType(bool),
    );
    yield r'backInStock';
    yield serializers.serialize(
      object.backInStock,
      specifiedType: const FullType(bool),
    );
    yield r'lowStockAlerts';
    yield serializers.serialize(
      object.lowStockAlerts,
      specifiedType: const FullType(bool),
    );
    yield r'promotionalMessages';
    yield serializers.serialize(
      object.promotionalMessages,
      specifiedType: const FullType(bool),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NotificationPreferenceResponseDto object, {
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
    required NotificationPreferenceResponseDtoBuilder result,
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
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        case r'channel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.channel = valueDes;
          break;
        case r'orderConfirmations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.orderConfirmations = valueDes;
          break;
        case r'orderShipments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.orderShipments = valueDes;
          break;
        case r'orderDeliveries':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.orderDeliveries = valueDes;
          break;
        case r'returnStatusUpdates':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.returnStatusUpdates = valueDes;
          break;
        case r'reviewReplies':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.reviewReplies = valueDes;
          break;
        case r'backInStock':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.backInStock = valueDes;
          break;
        case r'lowStockAlerts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.lowStockAlerts = valueDes;
          break;
        case r'promotionalMessages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.promotionalMessages = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NotificationPreferenceResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NotificationPreferenceResponseDtoBuilder();
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
