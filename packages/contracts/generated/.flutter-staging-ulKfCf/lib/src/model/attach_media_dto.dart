//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/media_translation_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'attach_media_dto.g.dart';

/// AttachMediaDto
///
/// Properties:
/// * [mediaId] 
/// * [uploadToken] 
/// * [checksum] 
/// * [translations] 
@BuiltValue()
abstract class AttachMediaDto implements Built<AttachMediaDto, AttachMediaDtoBuilder> {
  @BuiltValueField(wireName: r'mediaId')
  String get mediaId;

  @BuiltValueField(wireName: r'uploadToken')
  String get uploadToken;

  @BuiltValueField(wireName: r'checksum')
  String? get checksum;

  @BuiltValueField(wireName: r'translations')
  BuiltList<MediaTranslationDto>? get translations;

  AttachMediaDto._();

  factory AttachMediaDto([void updates(AttachMediaDtoBuilder b)]) = _$AttachMediaDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AttachMediaDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AttachMediaDto> get serializer => _$AttachMediaDtoSerializer();
}

class _$AttachMediaDtoSerializer implements PrimitiveSerializer<AttachMediaDto> {
  @override
  final Iterable<Type> types = const [AttachMediaDto, _$AttachMediaDto];

  @override
  final String wireName = r'AttachMediaDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AttachMediaDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'mediaId';
    yield serializers.serialize(
      object.mediaId,
      specifiedType: const FullType(String),
    );
    yield r'uploadToken';
    yield serializers.serialize(
      object.uploadToken,
      specifiedType: const FullType(String),
    );
    if (object.checksum != null) {
      yield r'checksum';
      yield serializers.serialize(
        object.checksum,
        specifiedType: const FullType(String),
      );
    }
    if (object.translations != null) {
      yield r'translations';
      yield serializers.serialize(
        object.translations,
        specifiedType: const FullType(BuiltList, [FullType(MediaTranslationDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AttachMediaDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AttachMediaDtoBuilder result,
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
        case r'uploadToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.uploadToken = valueDes;
          break;
        case r'checksum':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.checksum = valueDes;
          break;
        case r'translations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(MediaTranslationDto)]),
          ) as BuiltList<MediaTranslationDto>;
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
  AttachMediaDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AttachMediaDtoBuilder();
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

