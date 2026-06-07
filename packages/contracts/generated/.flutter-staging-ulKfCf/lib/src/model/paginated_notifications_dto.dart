//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/notification_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_notifications_dto.g.dart';

/// PaginatedNotificationsDto
///
/// Properties:
/// * [items] 
/// * [nextCursor] 
@BuiltValue()
abstract class PaginatedNotificationsDto implements Built<PaginatedNotificationsDto, PaginatedNotificationsDtoBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<NotificationResponseDto> get items;

  @BuiltValueField(wireName: r'nextCursor')
  String? get nextCursor;

  PaginatedNotificationsDto._();

  factory PaginatedNotificationsDto([void updates(PaginatedNotificationsDtoBuilder b)]) = _$PaginatedNotificationsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedNotificationsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedNotificationsDto> get serializer => _$PaginatedNotificationsDtoSerializer();
}

class _$PaginatedNotificationsDtoSerializer implements PrimitiveSerializer<PaginatedNotificationsDto> {
  @override
  final Iterable<Type> types = const [PaginatedNotificationsDto, _$PaginatedNotificationsDto];

  @override
  final String wireName = r'PaginatedNotificationsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedNotificationsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(NotificationResponseDto)]),
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
    PaginatedNotificationsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedNotificationsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(NotificationResponseDto)]),
          ) as BuiltList<NotificationResponseDto>;
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
  PaginatedNotificationsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedNotificationsDtoBuilder();
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

