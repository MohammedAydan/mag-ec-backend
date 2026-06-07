//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upsert_notification_preference_dto.g.dart';

/// UpsertNotificationPreferenceDto
///
/// Properties:
/// * [channel] - Notification channel to configure
/// * [orderConfirmations] - Enable or disable order confirmation notifications
/// * [orderShipments] - Enable or disable order shipment notifications
/// * [orderDeliveries] - Enable or disable order delivery notifications
/// * [returnStatusUpdates] - Enable or disable return status update notifications
/// * [reviewReplies] - Enable or disable review reply notifications
/// * [backInStock] - Enable or disable back-in-stock notifications
/// * [lowStockAlerts] - Enable or disable low stock alert notifications
/// * [promotionalMessages] - Enable or disable promotional message notifications
@BuiltValue()
abstract class UpsertNotificationPreferenceDto implements Built<UpsertNotificationPreferenceDto, UpsertNotificationPreferenceDtoBuilder> {
  /// Notification channel to configure
  @BuiltValueField(wireName: r'channel')
  UpsertNotificationPreferenceDtoChannelEnum get channel;
  // enum channelEnum {  EMAIL,  PUSH,  IN_APP,  };

  /// Enable or disable order confirmation notifications
  @BuiltValueField(wireName: r'orderConfirmations')
  bool? get orderConfirmations;

  /// Enable or disable order shipment notifications
  @BuiltValueField(wireName: r'orderShipments')
  bool? get orderShipments;

  /// Enable or disable order delivery notifications
  @BuiltValueField(wireName: r'orderDeliveries')
  bool? get orderDeliveries;

  /// Enable or disable return status update notifications
  @BuiltValueField(wireName: r'returnStatusUpdates')
  bool? get returnStatusUpdates;

  /// Enable or disable review reply notifications
  @BuiltValueField(wireName: r'reviewReplies')
  bool? get reviewReplies;

  /// Enable or disable back-in-stock notifications
  @BuiltValueField(wireName: r'backInStock')
  bool? get backInStock;

  /// Enable or disable low stock alert notifications
  @BuiltValueField(wireName: r'lowStockAlerts')
  bool? get lowStockAlerts;

  /// Enable or disable promotional message notifications
  @BuiltValueField(wireName: r'promotionalMessages')
  bool? get promotionalMessages;

  UpsertNotificationPreferenceDto._();

  factory UpsertNotificationPreferenceDto([void updates(UpsertNotificationPreferenceDtoBuilder b)]) = _$UpsertNotificationPreferenceDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpsertNotificationPreferenceDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpsertNotificationPreferenceDto> get serializer => _$UpsertNotificationPreferenceDtoSerializer();
}

class _$UpsertNotificationPreferenceDtoSerializer implements PrimitiveSerializer<UpsertNotificationPreferenceDto> {
  @override
  final Iterable<Type> types = const [UpsertNotificationPreferenceDto, _$UpsertNotificationPreferenceDto];

  @override
  final String wireName = r'UpsertNotificationPreferenceDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpsertNotificationPreferenceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'channel';
    yield serializers.serialize(
      object.channel,
      specifiedType: const FullType(UpsertNotificationPreferenceDtoChannelEnum),
    );
    if (object.orderConfirmations != null) {
      yield r'orderConfirmations';
      yield serializers.serialize(
        object.orderConfirmations,
        specifiedType: const FullType(bool),
      );
    }
    if (object.orderShipments != null) {
      yield r'orderShipments';
      yield serializers.serialize(
        object.orderShipments,
        specifiedType: const FullType(bool),
      );
    }
    if (object.orderDeliveries != null) {
      yield r'orderDeliveries';
      yield serializers.serialize(
        object.orderDeliveries,
        specifiedType: const FullType(bool),
      );
    }
    if (object.returnStatusUpdates != null) {
      yield r'returnStatusUpdates';
      yield serializers.serialize(
        object.returnStatusUpdates,
        specifiedType: const FullType(bool),
      );
    }
    if (object.reviewReplies != null) {
      yield r'reviewReplies';
      yield serializers.serialize(
        object.reviewReplies,
        specifiedType: const FullType(bool),
      );
    }
    if (object.backInStock != null) {
      yield r'backInStock';
      yield serializers.serialize(
        object.backInStock,
        specifiedType: const FullType(bool),
      );
    }
    if (object.lowStockAlerts != null) {
      yield r'lowStockAlerts';
      yield serializers.serialize(
        object.lowStockAlerts,
        specifiedType: const FullType(bool),
      );
    }
    if (object.promotionalMessages != null) {
      yield r'promotionalMessages';
      yield serializers.serialize(
        object.promotionalMessages,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpsertNotificationPreferenceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpsertNotificationPreferenceDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'channel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UpsertNotificationPreferenceDtoChannelEnum),
          ) as UpsertNotificationPreferenceDtoChannelEnum;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpsertNotificationPreferenceDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpsertNotificationPreferenceDtoBuilder();
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

class UpsertNotificationPreferenceDtoChannelEnum extends EnumClass {

  /// Notification channel to configure
  @BuiltValueEnumConst(wireName: r'EMAIL')
  static const UpsertNotificationPreferenceDtoChannelEnum EMAIL = _$upsertNotificationPreferenceDtoChannelEnum_EMAIL;
  /// Notification channel to configure
  @BuiltValueEnumConst(wireName: r'PUSH')
  static const UpsertNotificationPreferenceDtoChannelEnum PUSH = _$upsertNotificationPreferenceDtoChannelEnum_PUSH;
  /// Notification channel to configure
  @BuiltValueEnumConst(wireName: r'IN_APP')
  static const UpsertNotificationPreferenceDtoChannelEnum IN_APP = _$upsertNotificationPreferenceDtoChannelEnum_IN_APP;

  static Serializer<UpsertNotificationPreferenceDtoChannelEnum> get serializer => _$upsertNotificationPreferenceDtoChannelEnumSerializer;

  const UpsertNotificationPreferenceDtoChannelEnum._(String name): super(name);

  static BuiltSet<UpsertNotificationPreferenceDtoChannelEnum> get values => _$upsertNotificationPreferenceDtoChannelEnumValues;
  static UpsertNotificationPreferenceDtoChannelEnum valueOf(String name) => _$upsertNotificationPreferenceDtoChannelEnumValueOf(name);
}

