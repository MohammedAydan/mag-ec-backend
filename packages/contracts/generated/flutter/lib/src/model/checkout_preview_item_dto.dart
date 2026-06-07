//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'checkout_preview_item_dto.g.dart';

/// CheckoutPreviewItemDto
///
/// Properties:
/// * [variantId] - Catalog variant identifier
/// * [quantity] - Quantity to add (minimum 1)
@BuiltValue()
abstract class CheckoutPreviewItemDto
    implements Built<CheckoutPreviewItemDto, CheckoutPreviewItemDtoBuilder> {
  /// Catalog variant identifier
  @BuiltValueField(wireName: r'variantId')
  String get variantId;

  /// Quantity to add (minimum 1)
  @BuiltValueField(wireName: r'quantity')
  num get quantity;

  CheckoutPreviewItemDto._();

  factory CheckoutPreviewItemDto(
          [void updates(CheckoutPreviewItemDtoBuilder b)]) =
      _$CheckoutPreviewItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckoutPreviewItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckoutPreviewItemDto> get serializer =>
      _$CheckoutPreviewItemDtoSerializer();
}

class _$CheckoutPreviewItemDtoSerializer
    implements PrimitiveSerializer<CheckoutPreviewItemDto> {
  @override
  final Iterable<Type> types = const [
    CheckoutPreviewItemDto,
    _$CheckoutPreviewItemDto
  ];

  @override
  final String wireName = r'CheckoutPreviewItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckoutPreviewItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'variantId';
    yield serializers.serialize(
      object.variantId,
      specifiedType: const FullType(String),
    );
    yield r'quantity';
    yield serializers.serialize(
      object.quantity,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CheckoutPreviewItemDto object, {
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
    required CheckoutPreviewItemDtoBuilder result,
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
  CheckoutPreviewItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckoutPreviewItemDtoBuilder();
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
