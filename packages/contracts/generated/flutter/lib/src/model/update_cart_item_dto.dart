//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_cart_item_dto.g.dart';

/// UpdateCartItemDto
///
/// Properties:
/// * [quantity] - New quantity (minimum 1)
@BuiltValue()
abstract class UpdateCartItemDto
    implements Built<UpdateCartItemDto, UpdateCartItemDtoBuilder> {
  /// New quantity (minimum 1)
  @BuiltValueField(wireName: r'quantity')
  num get quantity;

  UpdateCartItemDto._();

  factory UpdateCartItemDto([void updates(UpdateCartItemDtoBuilder b)]) =
      _$UpdateCartItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateCartItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateCartItemDto> get serializer =>
      _$UpdateCartItemDtoSerializer();
}

class _$UpdateCartItemDtoSerializer
    implements PrimitiveSerializer<UpdateCartItemDto> {
  @override
  final Iterable<Type> types = const [UpdateCartItemDto, _$UpdateCartItemDto];

  @override
  final String wireName = r'UpdateCartItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateCartItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'quantity';
    yield serializers.serialize(
      object.quantity,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateCartItemDto object, {
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
    required UpdateCartItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.quantity = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateCartItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateCartItemDtoBuilder();
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
