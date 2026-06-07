//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'catalog_media_summary_dto.g.dart';

/// CatalogMediaSummaryDto
///
/// Properties:
/// * [id]
/// * [objectKey]
/// * [publicUrl]
/// * [role]
/// * [mediaType]
/// * [mimeType]
/// * [altText]
/// * [title]
@BuiltValue()
abstract class CatalogMediaSummaryDto
    implements Built<CatalogMediaSummaryDto, CatalogMediaSummaryDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'objectKey')
  String get objectKey;

  @BuiltValueField(wireName: r'publicUrl')
  String get publicUrl;

  @BuiltValueField(wireName: r'role')
  String get role;

  @BuiltValueField(wireName: r'mediaType')
  String get mediaType;

  @BuiltValueField(wireName: r'mimeType')
  String get mimeType;

  @BuiltValueField(wireName: r'altText')
  String? get altText;

  @BuiltValueField(wireName: r'title')
  String? get title;

  CatalogMediaSummaryDto._();

  factory CatalogMediaSummaryDto(
          [void updates(CatalogMediaSummaryDtoBuilder b)]) =
      _$CatalogMediaSummaryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CatalogMediaSummaryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CatalogMediaSummaryDto> get serializer =>
      _$CatalogMediaSummaryDtoSerializer();
}

class _$CatalogMediaSummaryDtoSerializer
    implements PrimitiveSerializer<CatalogMediaSummaryDto> {
  @override
  final Iterable<Type> types = const [
    CatalogMediaSummaryDto,
    _$CatalogMediaSummaryDto
  ];

  @override
  final String wireName = r'CatalogMediaSummaryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CatalogMediaSummaryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'objectKey';
    yield serializers.serialize(
      object.objectKey,
      specifiedType: const FullType(String),
    );
    yield r'publicUrl';
    yield serializers.serialize(
      object.publicUrl,
      specifiedType: const FullType(String),
    );
    yield r'role';
    yield serializers.serialize(
      object.role,
      specifiedType: const FullType(String),
    );
    yield r'mediaType';
    yield serializers.serialize(
      object.mediaType,
      specifiedType: const FullType(String),
    );
    yield r'mimeType';
    yield serializers.serialize(
      object.mimeType,
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
    CatalogMediaSummaryDto object, {
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
    required CatalogMediaSummaryDtoBuilder result,
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
        case r'objectKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.objectKey = valueDes;
          break;
        case r'publicUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.publicUrl = valueDes;
          break;
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.role = valueDes;
          break;
        case r'mediaType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mediaType = valueDes;
          break;
        case r'mimeType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mimeType = valueDes;
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
  CatalogMediaSummaryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CatalogMediaSummaryDtoBuilder();
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
