//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'wishlist_item_response_dto.g.dart';

/// WishlistItemResponseDto
///
/// Properties:
/// * [id] 
/// * [variantId] 
/// * [addedAt] 
@BuiltValue()
abstract class WishlistItemResponseDto implements Built<WishlistItemResponseDto, WishlistItemResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'variantId')
  String get variantId;

  @BuiltValueField(wireName: r'addedAt')
  String get addedAt;

  WishlistItemResponseDto._();

  factory WishlistItemResponseDto([void updates(WishlistItemResponseDtoBuilder b)]) = _$WishlistItemResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WishlistItemResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WishlistItemResponseDto> get serializer => _$WishlistItemResponseDtoSerializer();
}

class _$WishlistItemResponseDtoSerializer implements PrimitiveSerializer<WishlistItemResponseDto> {
  @override
  final Iterable<Type> types = const [WishlistItemResponseDto, _$WishlistItemResponseDto];

  @override
  final String wireName = r'WishlistItemResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WishlistItemResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'variantId';
    yield serializers.serialize(
      object.variantId,
      specifiedType: const FullType(String),
    );
    yield r'addedAt';
    yield serializers.serialize(
      object.addedAt,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    WishlistItemResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WishlistItemResponseDtoBuilder result,
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
        case r'variantId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.variantId = valueDes;
          break;
        case r'addedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.addedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WishlistItemResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WishlistItemResponseDtoBuilder();
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

