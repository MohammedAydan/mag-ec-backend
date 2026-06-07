//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'media_upload_headers_dto.g.dart';

/// MediaUploadHeadersDto
///
/// Properties:
/// * [contentType] 
@BuiltValue()
abstract class MediaUploadHeadersDto implements Built<MediaUploadHeadersDto, MediaUploadHeadersDtoBuilder> {
  @BuiltValueField(wireName: r'content-type')
  String get contentType;

  MediaUploadHeadersDto._();

  factory MediaUploadHeadersDto([void updates(MediaUploadHeadersDtoBuilder b)]) = _$MediaUploadHeadersDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MediaUploadHeadersDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MediaUploadHeadersDto> get serializer => _$MediaUploadHeadersDtoSerializer();
}

class _$MediaUploadHeadersDtoSerializer implements PrimitiveSerializer<MediaUploadHeadersDto> {
  @override
  final Iterable<Type> types = const [MediaUploadHeadersDto, _$MediaUploadHeadersDto];

  @override
  final String wireName = r'MediaUploadHeadersDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MediaUploadHeadersDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'content-type';
    yield serializers.serialize(
      object.contentType,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MediaUploadHeadersDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MediaUploadHeadersDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'content-type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.contentType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MediaUploadHeadersDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MediaUploadHeadersDtoBuilder();
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

