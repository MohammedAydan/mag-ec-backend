//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'catalog_status_response_dto.g.dart';

/// CatalogStatusResponseDto
///
/// Properties:
/// * [id] 
/// * [status] 
/// * [updatedAt] 
/// * [publishedAt] 
/// * [archivedAt] 
@BuiltValue()
abstract class CatalogStatusResponseDto implements Built<CatalogStatusResponseDto, CatalogStatusResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  @BuiltValueField(wireName: r'publishedAt')
  String? get publishedAt;

  @BuiltValueField(wireName: r'archivedAt')
  String? get archivedAt;

  CatalogStatusResponseDto._();

  factory CatalogStatusResponseDto([void updates(CatalogStatusResponseDtoBuilder b)]) = _$CatalogStatusResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CatalogStatusResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CatalogStatusResponseDto> get serializer => _$CatalogStatusResponseDtoSerializer();
}

class _$CatalogStatusResponseDtoSerializer implements PrimitiveSerializer<CatalogStatusResponseDto> {
  @override
  final Iterable<Type> types = const [CatalogStatusResponseDto, _$CatalogStatusResponseDto];

  @override
  final String wireName = r'CatalogStatusResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CatalogStatusResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(String),
    );
    if (object.publishedAt != null) {
      yield r'publishedAt';
      yield serializers.serialize(
        object.publishedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.archivedAt != null) {
      yield r'archivedAt';
      yield serializers.serialize(
        object.archivedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CatalogStatusResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CatalogStatusResponseDtoBuilder result,
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
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.updatedAt = valueDes;
          break;
        case r'publishedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.publishedAt = valueDes;
          break;
        case r'archivedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.archivedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CatalogStatusResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CatalogStatusResponseDtoBuilder();
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

