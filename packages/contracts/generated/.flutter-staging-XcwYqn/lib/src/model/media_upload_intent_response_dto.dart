//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/media_upload_headers_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'media_upload_intent_response_dto.g.dart';

/// MediaUploadIntentResponseDto
///
/// Properties:
/// * [mediaId] 
/// * [objectKey] 
/// * [uploadUrl] 
/// * [publicUrl] 
/// * [uploadToken] 
/// * [expiresAt] 
/// * [headers] 
@BuiltValue()
abstract class MediaUploadIntentResponseDto implements Built<MediaUploadIntentResponseDto, MediaUploadIntentResponseDtoBuilder> {
  @BuiltValueField(wireName: r'mediaId')
  String get mediaId;

  @BuiltValueField(wireName: r'objectKey')
  String get objectKey;

  @BuiltValueField(wireName: r'uploadUrl')
  String get uploadUrl;

  @BuiltValueField(wireName: r'publicUrl')
  String get publicUrl;

  @BuiltValueField(wireName: r'uploadToken')
  String get uploadToken;

  @BuiltValueField(wireName: r'expiresAt')
  String get expiresAt;

  @BuiltValueField(wireName: r'headers')
  MediaUploadHeadersDto get headers;

  MediaUploadIntentResponseDto._();

  factory MediaUploadIntentResponseDto([void updates(MediaUploadIntentResponseDtoBuilder b)]) = _$MediaUploadIntentResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MediaUploadIntentResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MediaUploadIntentResponseDto> get serializer => _$MediaUploadIntentResponseDtoSerializer();
}

class _$MediaUploadIntentResponseDtoSerializer implements PrimitiveSerializer<MediaUploadIntentResponseDto> {
  @override
  final Iterable<Type> types = const [MediaUploadIntentResponseDto, _$MediaUploadIntentResponseDto];

  @override
  final String wireName = r'MediaUploadIntentResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MediaUploadIntentResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'mediaId';
    yield serializers.serialize(
      object.mediaId,
      specifiedType: const FullType(String),
    );
    yield r'objectKey';
    yield serializers.serialize(
      object.objectKey,
      specifiedType: const FullType(String),
    );
    yield r'uploadUrl';
    yield serializers.serialize(
      object.uploadUrl,
      specifiedType: const FullType(String),
    );
    yield r'publicUrl';
    yield serializers.serialize(
      object.publicUrl,
      specifiedType: const FullType(String),
    );
    yield r'uploadToken';
    yield serializers.serialize(
      object.uploadToken,
      specifiedType: const FullType(String),
    );
    yield r'expiresAt';
    yield serializers.serialize(
      object.expiresAt,
      specifiedType: const FullType(String),
    );
    yield r'headers';
    yield serializers.serialize(
      object.headers,
      specifiedType: const FullType(MediaUploadHeadersDto),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MediaUploadIntentResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MediaUploadIntentResponseDtoBuilder result,
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
        case r'objectKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.objectKey = valueDes;
          break;
        case r'uploadUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.uploadUrl = valueDes;
          break;
        case r'publicUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.publicUrl = valueDes;
          break;
        case r'uploadToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.uploadToken = valueDes;
          break;
        case r'expiresAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.expiresAt = valueDes;
          break;
        case r'headers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MediaUploadHeadersDto),
          ) as MediaUploadHeadersDto;
          result.headers.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MediaUploadIntentResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MediaUploadIntentResponseDtoBuilder();
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

