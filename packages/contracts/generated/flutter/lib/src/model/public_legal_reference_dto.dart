//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'public_legal_reference_dto.g.dart';

/// PublicLegalReferenceDto
///
/// Properties:
/// * [key]
/// * [slug]
/// * [title]
/// * [updatedAt]
@BuiltValue()
abstract class PublicLegalReferenceDto
    implements Built<PublicLegalReferenceDto, PublicLegalReferenceDtoBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'slug')
  String get slug;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  PublicLegalReferenceDto._();

  factory PublicLegalReferenceDto(
          [void updates(PublicLegalReferenceDtoBuilder b)]) =
      _$PublicLegalReferenceDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PublicLegalReferenceDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PublicLegalReferenceDto> get serializer =>
      _$PublicLegalReferenceDtoSerializer();
}

class _$PublicLegalReferenceDtoSerializer
    implements PrimitiveSerializer<PublicLegalReferenceDto> {
  @override
  final Iterable<Type> types = const [
    PublicLegalReferenceDto,
    _$PublicLegalReferenceDto
  ];

  @override
  final String wireName = r'PublicLegalReferenceDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PublicLegalReferenceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'slug';
    yield serializers.serialize(
      object.slug,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PublicLegalReferenceDto object, {
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
    required PublicLegalReferenceDtoBuilder result,
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
        case r'slug':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.slug = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PublicLegalReferenceDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PublicLegalReferenceDtoBuilder();
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
