//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'product_variant_translation_dto.g.dart';

/// ProductVariantTranslationDto
///
/// Properties:
/// * [locale]
/// * [name]
@BuiltValue()
abstract class ProductVariantTranslationDto
    implements
        Built<ProductVariantTranslationDto,
            ProductVariantTranslationDtoBuilder> {
  @BuiltValueField(wireName: r'locale')
  String get locale;

  @BuiltValueField(wireName: r'name')
  String get name;

  ProductVariantTranslationDto._();

  factory ProductVariantTranslationDto(
          [void updates(ProductVariantTranslationDtoBuilder b)]) =
      _$ProductVariantTranslationDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProductVariantTranslationDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProductVariantTranslationDto> get serializer =>
      _$ProductVariantTranslationDtoSerializer();
}

class _$ProductVariantTranslationDtoSerializer
    implements PrimitiveSerializer<ProductVariantTranslationDto> {
  @override
  final Iterable<Type> types = const [
    ProductVariantTranslationDto,
    _$ProductVariantTranslationDto
  ];

  @override
  final String wireName = r'ProductVariantTranslationDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProductVariantTranslationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'locale';
    yield serializers.serialize(
      object.locale,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ProductVariantTranslationDto object, {
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
    required ProductVariantTranslationDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'locale':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.locale = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProductVariantTranslationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProductVariantTranslationDtoBuilder();
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
