//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/admin_catalog_product_type_attribute_dto.dart';
import 'package:mag_api_client/src/model/admin_catalog_translation_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_catalog_product_type_dto.g.dart';

/// AdminCatalogProductTypeDto
///
/// Properties:
/// * [id]
/// * [key]
/// * [status]
/// * [sortOrder]
/// * [translations]
/// * [attributes]
@BuiltValue()
abstract class AdminCatalogProductTypeDto
    implements
        Built<AdminCatalogProductTypeDto, AdminCatalogProductTypeDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'sortOrder')
  num get sortOrder;

  @BuiltValueField(wireName: r'translations')
  BuiltList<AdminCatalogTranslationDto> get translations;

  @BuiltValueField(wireName: r'attributes')
  BuiltList<AdminCatalogProductTypeAttributeDto>? get attributes;

  AdminCatalogProductTypeDto._();

  factory AdminCatalogProductTypeDto(
          [void updates(AdminCatalogProductTypeDtoBuilder b)]) =
      _$AdminCatalogProductTypeDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminCatalogProductTypeDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminCatalogProductTypeDto> get serializer =>
      _$AdminCatalogProductTypeDtoSerializer();
}

class _$AdminCatalogProductTypeDtoSerializer
    implements PrimitiveSerializer<AdminCatalogProductTypeDto> {
  @override
  final Iterable<Type> types = const [
    AdminCatalogProductTypeDto,
    _$AdminCatalogProductTypeDto
  ];

  @override
  final String wireName = r'AdminCatalogProductTypeDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminCatalogProductTypeDto object, {
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
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
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
    if (object.attributes != null) {
      yield r'attributes';
      yield serializers.serialize(
        object.attributes,
        specifiedType: const FullType(
            BuiltList, [FullType(AdminCatalogProductTypeAttributeDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminCatalogProductTypeDto object, {
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
    required AdminCatalogProductTypeDtoBuilder result,
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
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
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
        case r'attributes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(AdminCatalogProductTypeAttributeDto)]),
          ) as BuiltList<AdminCatalogProductTypeAttributeDto>;
          result.attributes.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminCatalogProductTypeDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminCatalogProductTypeDtoBuilder();
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
