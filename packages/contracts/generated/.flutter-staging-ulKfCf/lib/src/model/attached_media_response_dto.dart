//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/attached_media_translation_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'attached_media_response_dto.g.dart';

/// AttachedMediaResponseDto
///
/// Properties:
/// * [id] 
/// * [productId] 
/// * [status] 
/// * [mediaType] 
/// * [role] 
/// * [mimeType] 
/// * [objectKey] 
/// * [publicUrl] 
/// * [translations] 
/// * [variantId] 
/// * [checksum] 
/// * [attachedAt] 
@BuiltValue()
abstract class AttachedMediaResponseDto implements Built<AttachedMediaResponseDto, AttachedMediaResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'productId')
  String get productId;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'mediaType')
  String get mediaType;

  @BuiltValueField(wireName: r'role')
  String get role;

  @BuiltValueField(wireName: r'mimeType')
  String get mimeType;

  @BuiltValueField(wireName: r'objectKey')
  String get objectKey;

  @BuiltValueField(wireName: r'publicUrl')
  String get publicUrl;

  @BuiltValueField(wireName: r'translations')
  BuiltList<AttachedMediaTranslationDto> get translations;

  @BuiltValueField(wireName: r'variantId')
  String? get variantId;

  @BuiltValueField(wireName: r'checksum')
  String? get checksum;

  @BuiltValueField(wireName: r'attachedAt')
  String? get attachedAt;

  AttachedMediaResponseDto._();

  factory AttachedMediaResponseDto([void updates(AttachedMediaResponseDtoBuilder b)]) = _$AttachedMediaResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AttachedMediaResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AttachedMediaResponseDto> get serializer => _$AttachedMediaResponseDtoSerializer();
}

class _$AttachedMediaResponseDtoSerializer implements PrimitiveSerializer<AttachedMediaResponseDto> {
  @override
  final Iterable<Type> types = const [AttachedMediaResponseDto, _$AttachedMediaResponseDto];

  @override
  final String wireName = r'AttachedMediaResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AttachedMediaResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'productId';
    yield serializers.serialize(
      object.productId,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'mediaType';
    yield serializers.serialize(
      object.mediaType,
      specifiedType: const FullType(String),
    );
    yield r'role';
    yield serializers.serialize(
      object.role,
      specifiedType: const FullType(String),
    );
    yield r'mimeType';
    yield serializers.serialize(
      object.mimeType,
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
    yield r'translations';
    yield serializers.serialize(
      object.translations,
      specifiedType: const FullType(BuiltList, [FullType(AttachedMediaTranslationDto)]),
    );
    if (object.variantId != null) {
      yield r'variantId';
      yield serializers.serialize(
        object.variantId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.checksum != null) {
      yield r'checksum';
      yield serializers.serialize(
        object.checksum,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.attachedAt != null) {
      yield r'attachedAt';
      yield serializers.serialize(
        object.attachedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AttachedMediaResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AttachedMediaResponseDtoBuilder result,
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
        case r'productId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.productId = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'mediaType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mediaType = valueDes;
          break;
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.role = valueDes;
          break;
        case r'mimeType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mimeType = valueDes;
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
        case r'translations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AttachedMediaTranslationDto)]),
          ) as BuiltList<AttachedMediaTranslationDto>;
          result.translations.replace(valueDes);
          break;
        case r'variantId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.variantId = valueDes;
          break;
        case r'checksum':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.checksum = valueDes;
          break;
        case r'attachedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.attachedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AttachedMediaResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AttachedMediaResponseDtoBuilder();
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

