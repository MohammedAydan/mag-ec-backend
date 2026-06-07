//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/admin_catalog_collection_dto.dart';
import 'package:mag_api_client/src/model/admin_catalog_category_dto.dart';
import 'package:mag_api_client/src/model/admin_catalog_tag_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_catalog_relation_link_dto.g.dart';

/// AdminCatalogRelationLinkDto
///
/// Properties:
/// * [id]
/// * [sortOrder]
/// * [category]
/// * [collection]
/// * [tag]
@BuiltValue()
abstract class AdminCatalogRelationLinkDto
    implements
        Built<AdminCatalogRelationLinkDto, AdminCatalogRelationLinkDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'sortOrder')
  num get sortOrder;

  @BuiltValueField(wireName: r'category')
  AdminCatalogCategoryDto? get category;

  @BuiltValueField(wireName: r'collection')
  AdminCatalogCollectionDto? get collection;

  @BuiltValueField(wireName: r'tag')
  AdminCatalogTagDto? get tag;

  AdminCatalogRelationLinkDto._();

  factory AdminCatalogRelationLinkDto(
          [void updates(AdminCatalogRelationLinkDtoBuilder b)]) =
      _$AdminCatalogRelationLinkDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminCatalogRelationLinkDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminCatalogRelationLinkDto> get serializer =>
      _$AdminCatalogRelationLinkDtoSerializer();
}

class _$AdminCatalogRelationLinkDtoSerializer
    implements PrimitiveSerializer<AdminCatalogRelationLinkDto> {
  @override
  final Iterable<Type> types = const [
    AdminCatalogRelationLinkDto,
    _$AdminCatalogRelationLinkDto
  ];

  @override
  final String wireName = r'AdminCatalogRelationLinkDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminCatalogRelationLinkDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'sortOrder';
    yield serializers.serialize(
      object.sortOrder,
      specifiedType: const FullType(num),
    );
    if (object.category != null) {
      yield r'category';
      yield serializers.serialize(
        object.category,
        specifiedType: const FullType(AdminCatalogCategoryDto),
      );
    }
    if (object.collection != null) {
      yield r'collection';
      yield serializers.serialize(
        object.collection,
        specifiedType: const FullType(AdminCatalogCollectionDto),
      );
    }
    if (object.tag != null) {
      yield r'tag';
      yield serializers.serialize(
        object.tag,
        specifiedType: const FullType(AdminCatalogTagDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminCatalogRelationLinkDto object, {
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
    required AdminCatalogRelationLinkDtoBuilder result,
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
        case r'sortOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.sortOrder = valueDes;
          break;
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdminCatalogCategoryDto),
          ) as AdminCatalogCategoryDto;
          result.category.replace(valueDes);
          break;
        case r'collection':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdminCatalogCollectionDto),
          ) as AdminCatalogCollectionDto;
          result.collection.replace(valueDes);
          break;
        case r'tag':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdminCatalogTagDto),
          ) as AdminCatalogTagDto;
          result.tag.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminCatalogRelationLinkDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminCatalogRelationLinkDtoBuilder();
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
