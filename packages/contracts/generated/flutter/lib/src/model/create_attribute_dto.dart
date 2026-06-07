//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/attribute_translation_dto.dart';
import 'package:mag_api_client/src/model/attribute_option_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_attribute_dto.g.dart';

/// CreateAttributeDto
///
/// Properties:
/// * [key]
/// * [inputType]
/// * [translations]
/// * [isFilterable]
/// * [isVariantDefining]
/// * [sortOrder]
/// * [options]
@BuiltValue()
abstract class CreateAttributeDto
    implements Built<CreateAttributeDto, CreateAttributeDtoBuilder> {
  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'inputType')
  CreateAttributeDtoInputTypeEnum get inputType;
  // enum inputTypeEnum {  TEXT,  SELECT,  MULTI_SELECT,  COLOR,  SIZE,  BOOLEAN,  NUMBER,  };

  @BuiltValueField(wireName: r'translations')
  BuiltList<AttributeTranslationDto> get translations;

  @BuiltValueField(wireName: r'isFilterable')
  bool? get isFilterable;

  @BuiltValueField(wireName: r'isVariantDefining')
  bool? get isVariantDefining;

  @BuiltValueField(wireName: r'sortOrder')
  num? get sortOrder;

  @BuiltValueField(wireName: r'options')
  BuiltList<AttributeOptionDto>? get options;

  CreateAttributeDto._();

  factory CreateAttributeDto([void updates(CreateAttributeDtoBuilder b)]) =
      _$CreateAttributeDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateAttributeDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateAttributeDto> get serializer =>
      _$CreateAttributeDtoSerializer();
}

class _$CreateAttributeDtoSerializer
    implements PrimitiveSerializer<CreateAttributeDto> {
  @override
  final Iterable<Type> types = const [CreateAttributeDto, _$CreateAttributeDto];

  @override
  final String wireName = r'CreateAttributeDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateAttributeDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'inputType';
    yield serializers.serialize(
      object.inputType,
      specifiedType: const FullType(CreateAttributeDtoInputTypeEnum),
    );
    yield r'translations';
    yield serializers.serialize(
      object.translations,
      specifiedType:
          const FullType(BuiltList, [FullType(AttributeTranslationDto)]),
    );
    if (object.isFilterable != null) {
      yield r'isFilterable';
      yield serializers.serialize(
        object.isFilterable,
        specifiedType: const FullType(bool),
      );
    }
    if (object.isVariantDefining != null) {
      yield r'isVariantDefining';
      yield serializers.serialize(
        object.isVariantDefining,
        specifiedType: const FullType(bool),
      );
    }
    if (object.sortOrder != null) {
      yield r'sortOrder';
      yield serializers.serialize(
        object.sortOrder,
        specifiedType: const FullType(num),
      );
    }
    if (object.options != null) {
      yield r'options';
      yield serializers.serialize(
        object.options,
        specifiedType:
            const FullType(BuiltList, [FullType(AttributeOptionDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateAttributeDto object, {
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
    required CreateAttributeDtoBuilder result,
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
        case r'inputType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreateAttributeDtoInputTypeEnum),
          ) as CreateAttributeDtoInputTypeEnum;
          result.inputType = valueDes;
          break;
        case r'translations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(AttributeTranslationDto)]),
          ) as BuiltList<AttributeTranslationDto>;
          result.translations.replace(valueDes);
          break;
        case r'isFilterable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isFilterable = valueDes;
          break;
        case r'isVariantDefining':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isVariantDefining = valueDes;
          break;
        case r'sortOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.sortOrder = valueDes;
          break;
        case r'options':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(AttributeOptionDto)]),
          ) as BuiltList<AttributeOptionDto>;
          result.options.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateAttributeDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateAttributeDtoBuilder();
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

class CreateAttributeDtoInputTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'TEXT')
  static const CreateAttributeDtoInputTypeEnum TEXT =
      _$createAttributeDtoInputTypeEnum_TEXT;
  @BuiltValueEnumConst(wireName: r'SELECT')
  static const CreateAttributeDtoInputTypeEnum SELECT =
      _$createAttributeDtoInputTypeEnum_SELECT;
  @BuiltValueEnumConst(wireName: r'MULTI_SELECT')
  static const CreateAttributeDtoInputTypeEnum MULTI_SELECT =
      _$createAttributeDtoInputTypeEnum_MULTI_SELECT;
  @BuiltValueEnumConst(wireName: r'COLOR')
  static const CreateAttributeDtoInputTypeEnum COLOR =
      _$createAttributeDtoInputTypeEnum_COLOR;
  @BuiltValueEnumConst(wireName: r'SIZE')
  static const CreateAttributeDtoInputTypeEnum SIZE =
      _$createAttributeDtoInputTypeEnum_SIZE;
  @BuiltValueEnumConst(wireName: r'BOOLEAN')
  static const CreateAttributeDtoInputTypeEnum BOOLEAN =
      _$createAttributeDtoInputTypeEnum_BOOLEAN;
  @BuiltValueEnumConst(wireName: r'NUMBER')
  static const CreateAttributeDtoInputTypeEnum NUMBER =
      _$createAttributeDtoInputTypeEnum_NUMBER;

  static Serializer<CreateAttributeDtoInputTypeEnum> get serializer =>
      _$createAttributeDtoInputTypeEnumSerializer;

  const CreateAttributeDtoInputTypeEnum._(String name) : super(name);

  static BuiltSet<CreateAttributeDtoInputTypeEnum> get values =>
      _$createAttributeDtoInputTypeEnumValues;
  static CreateAttributeDtoInputTypeEnum valueOf(String name) =>
      _$createAttributeDtoInputTypeEnumValueOf(name);
}
