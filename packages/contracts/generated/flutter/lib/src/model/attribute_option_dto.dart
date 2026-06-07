//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/attribute_option_translation_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'attribute_option_dto.g.dart';

/// AttributeOptionDto
///
/// Properties:
/// * [key]
/// * [translations]
/// * [sortOrder]
/// * [colorHex]
@BuiltValue()
abstract class AttributeOptionDto
    implements Built<AttributeOptionDto, AttributeOptionDtoBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'translations')
  BuiltList<AttributeOptionTranslationDto> get translations;

  @BuiltValueField(wireName: r'sortOrder')
  num? get sortOrder;

  @BuiltValueField(wireName: r'colorHex')
  String? get colorHex;

  AttributeOptionDto._();

  factory AttributeOptionDto([void updates(AttributeOptionDtoBuilder b)]) =
      _$AttributeOptionDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AttributeOptionDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AttributeOptionDto> get serializer =>
      _$AttributeOptionDtoSerializer();
}

class _$AttributeOptionDtoSerializer
    implements PrimitiveSerializer<AttributeOptionDto> {
  @override
  final Iterable<Type> types = const [AttributeOptionDto, _$AttributeOptionDto];

  @override
  final String wireName = r'AttributeOptionDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AttributeOptionDto object, {
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
      specifiedType:
          const FullType(BuiltList, [FullType(AttributeOptionTranslationDto)]),
    );
    if (object.sortOrder != null) {
      yield r'sortOrder';
      yield serializers.serialize(
        object.sortOrder,
        specifiedType: const FullType(num),
      );
    }
    if (object.colorHex != null) {
      yield r'colorHex';
      yield serializers.serialize(
        object.colorHex,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AttributeOptionDto object, {
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
    required AttributeOptionDtoBuilder result,
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
            specifiedType: const FullType(
                BuiltList, [FullType(AttributeOptionTranslationDto)]),
          ) as BuiltList<AttributeOptionTranslationDto>;
          result.translations.replace(valueDes);
          break;
        case r'sortOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.sortOrder = valueDes;
          break;
        case r'colorHex':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.colorHex = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AttributeOptionDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AttributeOptionDtoBuilder();
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
