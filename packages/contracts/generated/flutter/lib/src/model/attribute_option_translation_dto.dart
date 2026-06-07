//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'attribute_option_translation_dto.g.dart';

/// AttributeOptionTranslationDto
///
/// Properties:
/// * [locale]
/// * [label]
@BuiltValue()
abstract class AttributeOptionTranslationDto
    implements
        Built<AttributeOptionTranslationDto,
            AttributeOptionTranslationDtoBuilder> {
  @BuiltValueField(wireName: r'locale')
  String get locale;

  @BuiltValueField(wireName: r'label')
  String get label;

  AttributeOptionTranslationDto._();

  factory AttributeOptionTranslationDto(
          [void updates(AttributeOptionTranslationDtoBuilder b)]) =
      _$AttributeOptionTranslationDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AttributeOptionTranslationDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AttributeOptionTranslationDto> get serializer =>
      _$AttributeOptionTranslationDtoSerializer();
}

class _$AttributeOptionTranslationDtoSerializer
    implements PrimitiveSerializer<AttributeOptionTranslationDto> {
  @override
  final Iterable<Type> types = const [
    AttributeOptionTranslationDto,
    _$AttributeOptionTranslationDto
  ];

  @override
  final String wireName = r'AttributeOptionTranslationDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AttributeOptionTranslationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'locale';
    yield serializers.serialize(
      object.locale,
      specifiedType: const FullType(String),
    );
    yield r'label';
    yield serializers.serialize(
      object.label,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AttributeOptionTranslationDto object, {
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
    required AttributeOptionTranslationDtoBuilder result,
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
        case r'label':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.label = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AttributeOptionTranslationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AttributeOptionTranslationDtoBuilder();
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
