//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_wishlist_item_dto.g.dart';

/// AddWishlistItemDto
///
/// Properties:
/// * [variantId] - Product variant ID to add to wishlist
@BuiltValue()
abstract class AddWishlistItemDto
    implements Built<AddWishlistItemDto, AddWishlistItemDtoBuilder> {
  /// Product variant ID to add to wishlist
  @BuiltValueField(wireName: r'variantId')
  String get variantId;

  AddWishlistItemDto._();

  factory AddWishlistItemDto([void updates(AddWishlistItemDtoBuilder b)]) =
      _$AddWishlistItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddWishlistItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddWishlistItemDto> get serializer =>
      _$AddWishlistItemDtoSerializer();
}

class _$AddWishlistItemDtoSerializer
    implements PrimitiveSerializer<AddWishlistItemDto> {
  @override
  final Iterable<Type> types = const [AddWishlistItemDto, _$AddWishlistItemDto];

  @override
  final String wireName = r'AddWishlistItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddWishlistItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'variantId';
    yield serializers.serialize(
      object.variantId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AddWishlistItemDto object, {
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
    required AddWishlistItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'variantId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.variantId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AddWishlistItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddWishlistItemDtoBuilder();
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
