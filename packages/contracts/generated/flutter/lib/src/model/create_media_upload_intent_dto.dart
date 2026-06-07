//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_media_upload_intent_dto.g.dart';

/// CreateMediaUploadIntentDto
///
/// Properties:
/// * [mediaType]
/// * [role]
/// * [mimeType]
/// * [sizeBytes]
/// * [variantId]
@BuiltValue()
abstract class CreateMediaUploadIntentDto
    implements
        Built<CreateMediaUploadIntentDto, CreateMediaUploadIntentDtoBuilder> {
  @BuiltValueField(wireName: r'mediaType')
  CreateMediaUploadIntentDtoMediaTypeEnum get mediaType;
  // enum mediaTypeEnum {  IMAGE,  VIDEO,  FILE,  };

  @BuiltValueField(wireName: r'role')
  CreateMediaUploadIntentDtoRoleEnum get role;
  // enum roleEnum {  PRIMARY,  GALLERY,  SWATCH,  DETAIL,  };

  @BuiltValueField(wireName: r'mimeType')
  String get mimeType;

  @BuiltValueField(wireName: r'sizeBytes')
  num get sizeBytes;

  @BuiltValueField(wireName: r'variantId')
  String? get variantId;

  CreateMediaUploadIntentDto._();

  factory CreateMediaUploadIntentDto(
          [void updates(CreateMediaUploadIntentDtoBuilder b)]) =
      _$CreateMediaUploadIntentDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateMediaUploadIntentDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateMediaUploadIntentDto> get serializer =>
      _$CreateMediaUploadIntentDtoSerializer();
}

class _$CreateMediaUploadIntentDtoSerializer
    implements PrimitiveSerializer<CreateMediaUploadIntentDto> {
  @override
  final Iterable<Type> types = const [
    CreateMediaUploadIntentDto,
    _$CreateMediaUploadIntentDto
  ];

  @override
  final String wireName = r'CreateMediaUploadIntentDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateMediaUploadIntentDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'mediaType';
    yield serializers.serialize(
      object.mediaType,
      specifiedType: const FullType(CreateMediaUploadIntentDtoMediaTypeEnum),
    );
    yield r'role';
    yield serializers.serialize(
      object.role,
      specifiedType: const FullType(CreateMediaUploadIntentDtoRoleEnum),
    );
    yield r'mimeType';
    yield serializers.serialize(
      object.mimeType,
      specifiedType: const FullType(String),
    );
    yield r'sizeBytes';
    yield serializers.serialize(
      object.sizeBytes,
      specifiedType: const FullType(num),
    );
    if (object.variantId != null) {
      yield r'variantId';
      yield serializers.serialize(
        object.variantId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateMediaUploadIntentDto object, {
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
    required CreateMediaUploadIntentDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'mediaType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(CreateMediaUploadIntentDtoMediaTypeEnum),
          ) as CreateMediaUploadIntentDtoMediaTypeEnum;
          result.mediaType = valueDes;
          break;
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreateMediaUploadIntentDtoRoleEnum),
          ) as CreateMediaUploadIntentDtoRoleEnum;
          result.role = valueDes;
          break;
        case r'mimeType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mimeType = valueDes;
          break;
        case r'sizeBytes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.sizeBytes = valueDes;
          break;
        case r'variantId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.variantId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateMediaUploadIntentDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateMediaUploadIntentDtoBuilder();
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

class CreateMediaUploadIntentDtoMediaTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'IMAGE')
  static const CreateMediaUploadIntentDtoMediaTypeEnum IMAGE =
      _$createMediaUploadIntentDtoMediaTypeEnum_IMAGE;
  @BuiltValueEnumConst(wireName: r'VIDEO')
  static const CreateMediaUploadIntentDtoMediaTypeEnum VIDEO =
      _$createMediaUploadIntentDtoMediaTypeEnum_VIDEO;
  @BuiltValueEnumConst(wireName: r'FILE')
  static const CreateMediaUploadIntentDtoMediaTypeEnum FILE =
      _$createMediaUploadIntentDtoMediaTypeEnum_FILE;

  static Serializer<CreateMediaUploadIntentDtoMediaTypeEnum> get serializer =>
      _$createMediaUploadIntentDtoMediaTypeEnumSerializer;

  const CreateMediaUploadIntentDtoMediaTypeEnum._(String name) : super(name);

  static BuiltSet<CreateMediaUploadIntentDtoMediaTypeEnum> get values =>
      _$createMediaUploadIntentDtoMediaTypeEnumValues;
  static CreateMediaUploadIntentDtoMediaTypeEnum valueOf(String name) =>
      _$createMediaUploadIntentDtoMediaTypeEnumValueOf(name);
}

class CreateMediaUploadIntentDtoRoleEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'PRIMARY')
  static const CreateMediaUploadIntentDtoRoleEnum PRIMARY =
      _$createMediaUploadIntentDtoRoleEnum_PRIMARY;
  @BuiltValueEnumConst(wireName: r'GALLERY')
  static const CreateMediaUploadIntentDtoRoleEnum GALLERY =
      _$createMediaUploadIntentDtoRoleEnum_GALLERY;
  @BuiltValueEnumConst(wireName: r'SWATCH')
  static const CreateMediaUploadIntentDtoRoleEnum SWATCH =
      _$createMediaUploadIntentDtoRoleEnum_SWATCH;
  @BuiltValueEnumConst(wireName: r'DETAIL')
  static const CreateMediaUploadIntentDtoRoleEnum DETAIL =
      _$createMediaUploadIntentDtoRoleEnum_DETAIL;

  static Serializer<CreateMediaUploadIntentDtoRoleEnum> get serializer =>
      _$createMediaUploadIntentDtoRoleEnumSerializer;

  const CreateMediaUploadIntentDtoRoleEnum._(String name) : super(name);

  static BuiltSet<CreateMediaUploadIntentDtoRoleEnum> get values =>
      _$createMediaUploadIntentDtoRoleEnumValues;
  static CreateMediaUploadIntentDtoRoleEnum valueOf(String name) =>
      _$createMediaUploadIntentDtoRoleEnumValueOf(name);
}
