//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/admin_catalog_attribute_option_dto.dart';
import 'package:mag_api_client/src/model/admin_catalog_translation_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_catalog_attribute_dto.g.dart';

/// AdminCatalogAttributeDto
///
/// Properties:
/// * [id]
/// * [key]
/// * [inputType]
/// * [isFilterable]
/// * [isVariantDefining]
/// * [sortOrder]
/// * [translations]
/// * [options]
@BuiltValue()
abstract class AdminCatalogAttributeDto
    implements
        Built<AdminCatalogAttributeDto, AdminCatalogAttributeDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'inputType')
  String get inputType;

  @BuiltValueField(wireName: r'isFilterable')
  bool get isFilterable;

  @BuiltValueField(wireName: r'isVariantDefining')
  bool get isVariantDefining;

  @BuiltValueField(wireName: r'sortOrder')
  num get sortOrder;

  @BuiltValueField(wireName: r'translations')
  BuiltList<AdminCatalogTranslationDto> get translations;

  @BuiltValueField(wireName: r'options')
  BuiltList<AdminCatalogAttributeOptionDto> get options;

  AdminCatalogAttributeDto._();

  factory AdminCatalogAttributeDto(
          [void updates(AdminCatalogAttributeDtoBuilder b)]) =
      _$AdminCatalogAttributeDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminCatalogAttributeDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminCatalogAttributeDto> get serializer =>
      _$AdminCatalogAttributeDtoSerializer();
}

class _$AdminCatalogAttributeDtoSerializer
    implements PrimitiveSerializer<AdminCatalogAttributeDto> {
  @override
  final Iterable<Type> types = const [
    AdminCatalogAttributeDto,
    _$AdminCatalogAttributeDto
  ];

  @override
  final String wireName = r'AdminCatalogAttributeDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminCatalogAttributeDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'inputType';
    yield serializers.serialize(
      object.inputType,
      specifiedType: const FullType(String),
    );
    yield r'isFilterable';
    yield serializers.serialize(
      object.isFilterable,
      specifiedType: const FullType(bool),
    );
    yield r'isVariantDefining';
    yield serializers.serialize(
      object.isVariantDefining,
      specifiedType: const FullType(bool),
    );
    yield r'sortOrder';
    yield serializers.serialize(
      object.sortOrder,
      specifiedType: const FullType(num),
    );
    yield r'translations';
    yield serializers.serialize(
      object.translations,
      specifiedType:
          const FullType(BuiltList, [FullType(AdminCatalogTranslationDto)]),
    );
    yield r'options';
    yield serializers.serialize(
      object.options,
      specifiedType:
          const FullType(BuiltList, [FullType(AdminCatalogAttributeOptionDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminCatalogAttributeDto object, {
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
    required AdminCatalogAttributeDtoBuilder result,
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
            specifiedType: const FullType(String),
          ) as String;
          result.inputType = valueDes;
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
        case r'translations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(AdminCatalogTranslationDto)]),
          ) as BuiltList<AdminCatalogTranslationDto>;
          result.translations.replace(valueDes);
          break;
        case r'options':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(AdminCatalogAttributeOptionDto)]),
          ) as BuiltList<AdminCatalogAttributeOptionDto>;
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
  AdminCatalogAttributeDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminCatalogAttributeDtoBuilder();
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
