//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/wishlist_item_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'wishlist_response_dto.g.dart';

/// WishlistResponseDto
///
/// Properties:
/// * [id] 
/// * [userId] 
/// * [items] 
/// * [itemCount] 
@BuiltValue()
abstract class WishlistResponseDto implements Built<WishlistResponseDto, WishlistResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'userId')
  String get userId;

  @BuiltValueField(wireName: r'items')
  BuiltList<WishlistItemResponseDto> get items;

  @BuiltValueField(wireName: r'itemCount')
  num? get itemCount;

  WishlistResponseDto._();

  factory WishlistResponseDto([void updates(WishlistResponseDtoBuilder b)]) = _$WishlistResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WishlistResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WishlistResponseDto> get serializer => _$WishlistResponseDtoSerializer();
}

class _$WishlistResponseDtoSerializer implements PrimitiveSerializer<WishlistResponseDto> {
  @override
  final Iterable<Type> types = const [WishlistResponseDto, _$WishlistResponseDto];

  @override
  final String wireName = r'WishlistResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WishlistResponseDto object, {
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
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(WishlistItemResponseDto)]),
    );
    if (object.itemCount != null) {
      yield r'itemCount';
      yield serializers.serialize(
        object.itemCount,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WishlistResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WishlistResponseDtoBuilder result,
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
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(WishlistItemResponseDto)]),
          ) as BuiltList<WishlistItemResponseDto>;
          result.items.replace(valueDes);
          break;
        case r'itemCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.itemCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WishlistResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WishlistResponseDtoBuilder();
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

