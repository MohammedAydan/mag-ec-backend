//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/translation_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_tag_dto.g.dart';

/// CreateTagDto
///
/// Properties:
/// * [key]
/// * [translations]
@BuiltValue()
abstract class CreateTagDto
    implements Built<CreateTagDto, CreateTagDtoBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'translations')
  BuiltList<TranslationDto> get translations;

  CreateTagDto._();

  factory CreateTagDto([void updates(CreateTagDtoBuilder b)]) = _$CreateTagDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateTagDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateTagDto> get serializer => _$CreateTagDtoSerializer();
}

class _$CreateTagDtoSerializer implements PrimitiveSerializer<CreateTagDto> {
  @override
  final Iterable<Type> types = const [CreateTagDto, _$CreateTagDto];

  @override
  final String wireName = r'CreateTagDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateTagDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'translations';
    yield serializers.serialize(
      object.translations,
      specifiedType: const FullType(BuiltList, [FullType(TranslationDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateTagDto object, {
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
    required CreateTagDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        case r'translations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(TranslationDto)]),
          ) as BuiltList<TranslationDto>;
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
  CreateTagDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateTagDtoBuilder();
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
