//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'checkout_preview_item_stock_dto.g.dart';

/// CheckoutPreviewItemStockDto
///
/// Properties:
/// * [availableQuantity]
/// * [isAvailable]
@BuiltValue()
abstract class CheckoutPreviewItemStockDto
    implements
        Built<CheckoutPreviewItemStockDto, CheckoutPreviewItemStockDtoBuilder> {
  @BuiltValueField(wireName: r'availableQuantity')
  num get availableQuantity;

  @BuiltValueField(wireName: r'isAvailable')
  bool get isAvailable;

  CheckoutPreviewItemStockDto._();

  factory CheckoutPreviewItemStockDto(
          [void updates(CheckoutPreviewItemStockDtoBuilder b)]) =
      _$CheckoutPreviewItemStockDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckoutPreviewItemStockDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckoutPreviewItemStockDto> get serializer =>
      _$CheckoutPreviewItemStockDtoSerializer();
}

class _$CheckoutPreviewItemStockDtoSerializer
    implements PrimitiveSerializer<CheckoutPreviewItemStockDto> {
  @override
  final Iterable<Type> types = const [
    CheckoutPreviewItemStockDto,
    _$CheckoutPreviewItemStockDto
  ];

  @override
  final String wireName = r'CheckoutPreviewItemStockDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckoutPreviewItemStockDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'availableQuantity';
    yield serializers.serialize(
      object.availableQuantity,
      specifiedType: const FullType(num),
    );
    yield r'isAvailable';
    yield serializers.serialize(
      object.isAvailable,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CheckoutPreviewItemStockDto object, {
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
    required CheckoutPreviewItemStockDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'availableQuantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.availableQuantity = valueDes;
          break;
        case r'isAvailable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isAvailable = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CheckoutPreviewItemStockDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckoutPreviewItemStockDtoBuilder();
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
