//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'product_translation_dto.g.dart';

/// ProductTranslationDto
///
/// Properties:
/// * [locale] 
/// * [name] 
/// * [slug] 
/// * [description] 
/// * [shortDescription] 
/// * [metaTitle] 
/// * [metaDescription] 
@BuiltValue()
abstract class ProductTranslationDto implements Built<ProductTranslationDto, ProductTranslationDtoBuilder> {
  @BuiltValueField(wireName: r'locale')
  String get locale;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'slug')
  String get slug;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'shortDescription')
  String? get shortDescription;

  @BuiltValueField(wireName: r'metaTitle')
  String? get metaTitle;

  @BuiltValueField(wireName: r'metaDescription')
  String? get metaDescription;

  ProductTranslationDto._();

  factory ProductTranslationDto([void updates(ProductTranslationDtoBuilder b)]) = _$ProductTranslationDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProductTranslationDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProductTranslationDto> get serializer => _$ProductTranslationDtoSerializer();
}

class _$ProductTranslationDtoSerializer implements PrimitiveSerializer<ProductTranslationDto> {
  @override
  final Iterable<Type> types = const [ProductTranslationDto, _$ProductTranslationDto];

  @override
  final String wireName = r'ProductTranslationDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProductTranslationDto object, {
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
    yield r'slug';
    yield serializers.serialize(
      object.slug,
      specifiedType: const FullType(String),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.shortDescription != null) {
      yield r'shortDescription';
      yield serializers.serialize(
        object.shortDescription,
        specifiedType: const FullType(String),
      );
    }
    if (object.metaTitle != null) {
      yield r'metaTitle';
      yield serializers.serialize(
        object.metaTitle,
        specifiedType: const FullType(String),
      );
    }
    if (object.metaDescription != null) {
      yield r'metaDescription';
      yield serializers.serialize(
        object.metaDescription,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ProductTranslationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ProductTranslationDtoBuilder result,
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
        case r'slug':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.slug = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'shortDescription':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.shortDescription = valueDes;
          break;
        case r'metaTitle':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.metaTitle = valueDes;
          break;
        case r'metaDescription':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.metaDescription = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProductTranslationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProductTranslationDtoBuilder();
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

