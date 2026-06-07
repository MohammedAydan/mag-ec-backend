//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/review_product_translation_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'review_product_dto.g.dart';

/// ReviewProductDto
///
/// Properties:
/// * [id]
/// * [sku]
/// * [translations]
@BuiltValue()
abstract class ReviewProductDto
    implements Built<ReviewProductDto, ReviewProductDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'sku')
  String get sku;

  @BuiltValueField(wireName: r'translations')
  BuiltList<ReviewProductTranslationDto> get translations;

  ReviewProductDto._();

  factory ReviewProductDto([void updates(ReviewProductDtoBuilder b)]) =
      _$ReviewProductDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReviewProductDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReviewProductDto> get serializer =>
      _$ReviewProductDtoSerializer();
}

class _$ReviewProductDtoSerializer
    implements PrimitiveSerializer<ReviewProductDto> {
  @override
  final Iterable<Type> types = const [ReviewProductDto, _$ReviewProductDto];

  @override
  final String wireName = r'ReviewProductDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReviewProductDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'sku';
    yield serializers.serialize(
      object.sku,
      specifiedType: const FullType(String),
    );
    yield r'translations';
    yield serializers.serialize(
      object.translations,
      specifiedType:
          const FullType(BuiltList, [FullType(ReviewProductTranslationDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReviewProductDto object, {
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
    required ReviewProductDtoBuilder result,
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
        case r'sku':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sku = valueDes;
          break;
        case r'translations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(ReviewProductTranslationDto)]),
          ) as BuiltList<ReviewProductTranslationDto>;
          result.translations.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReviewProductDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReviewProductDtoBuilder();
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
