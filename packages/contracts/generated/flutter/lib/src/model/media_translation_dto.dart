//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'media_translation_dto.g.dart';

/// MediaTranslationDto
///
/// Properties:
/// * [locale]
/// * [altText]
/// * [title]
@BuiltValue()
abstract class MediaTranslationDto
    implements Built<MediaTranslationDto, MediaTranslationDtoBuilder> {
  @BuiltValueField(wireName: r'locale')
  String get locale;

  @BuiltValueField(wireName: r'altText')
  String? get altText;

  @BuiltValueField(wireName: r'title')
  String? get title;

  MediaTranslationDto._();

  factory MediaTranslationDto([void updates(MediaTranslationDtoBuilder b)]) =
      _$MediaTranslationDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MediaTranslationDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MediaTranslationDto> get serializer =>
      _$MediaTranslationDtoSerializer();
}

class _$MediaTranslationDtoSerializer
    implements PrimitiveSerializer<MediaTranslationDto> {
  @override
  final Iterable<Type> types = const [
    MediaTranslationDto,
    _$MediaTranslationDto
  ];

  @override
  final String wireName = r'MediaTranslationDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MediaTranslationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'locale';
    yield serializers.serialize(
      object.locale,
      specifiedType: const FullType(String),
    );
    if (object.altText != null) {
      yield r'altText';
      yield serializers.serialize(
        object.altText,
        specifiedType: const FullType(String),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MediaTranslationDto object, {
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
    required MediaTranslationDtoBuilder result,
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
        case r'altText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.altText = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MediaTranslationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MediaTranslationDtoBuilder();
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
