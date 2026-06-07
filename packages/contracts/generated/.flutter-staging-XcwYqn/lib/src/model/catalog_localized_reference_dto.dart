//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'catalog_localized_reference_dto.g.dart';

/// CatalogLocalizedReferenceDto
///
/// Properties:
/// * [key] 
/// * [name] 
/// * [slug] 
@BuiltValue()
abstract class CatalogLocalizedReferenceDto implements Built<CatalogLocalizedReferenceDto, CatalogLocalizedReferenceDtoBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'slug')
  String? get slug;

  CatalogLocalizedReferenceDto._();

  factory CatalogLocalizedReferenceDto([void updates(CatalogLocalizedReferenceDtoBuilder b)]) = _$CatalogLocalizedReferenceDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CatalogLocalizedReferenceDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CatalogLocalizedReferenceDto> get serializer => _$CatalogLocalizedReferenceDtoSerializer();
}

class _$CatalogLocalizedReferenceDtoSerializer implements PrimitiveSerializer<CatalogLocalizedReferenceDto> {
  @override
  final Iterable<Type> types = const [CatalogLocalizedReferenceDto, _$CatalogLocalizedReferenceDto];

  @override
  final String wireName = r'CatalogLocalizedReferenceDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CatalogLocalizedReferenceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.slug != null) {
      yield r'slug';
      yield serializers.serialize(
        object.slug,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CatalogLocalizedReferenceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CatalogLocalizedReferenceDtoBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'slug':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.slug = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CatalogLocalizedReferenceDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CatalogLocalizedReferenceDtoBuilder();
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

