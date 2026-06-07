//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'attached_media_translation_dto.g.dart';

/// AttachedMediaTranslationDto
///
/// Properties:
/// * [mediaId] 
/// * [locale] 
/// * [altText] 
/// * [title] 
@BuiltValue()
abstract class AttachedMediaTranslationDto implements Built<AttachedMediaTranslationDto, AttachedMediaTranslationDtoBuilder> {
  @BuiltValueField(wireName: r'mediaId')
  String get mediaId;

  @BuiltValueField(wireName: r'locale')
  String get locale;

  @BuiltValueField(wireName: r'altText')
  String? get altText;

  @BuiltValueField(wireName: r'title')
  String? get title;

  AttachedMediaTranslationDto._();

  factory AttachedMediaTranslationDto([void updates(AttachedMediaTranslationDtoBuilder b)]) = _$AttachedMediaTranslationDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AttachedMediaTranslationDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AttachedMediaTranslationDto> get serializer => _$AttachedMediaTranslationDtoSerializer();
}

class _$AttachedMediaTranslationDtoSerializer implements PrimitiveSerializer<AttachedMediaTranslationDto> {
  @override
  final Iterable<Type> types = const [AttachedMediaTranslationDto, _$AttachedMediaTranslationDto];

  @override
  final String wireName = r'AttachedMediaTranslationDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AttachedMediaTranslationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'mediaId';
    yield serializers.serialize(
      object.mediaId,
      specifiedType: const FullType(String),
    );
    yield r'locale';
    yield serializers.serialize(
      object.locale,
      specifiedType: const FullType(String),
    );
    if (object.altText != null) {
      yield r'altText';
      yield serializers.serialize(
        object.altText,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AttachedMediaTranslationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AttachedMediaTranslationDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'mediaId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mediaId = valueDes;
          break;
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
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.altText = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
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
  AttachedMediaTranslationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AttachedMediaTranslationDtoBuilder();
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

