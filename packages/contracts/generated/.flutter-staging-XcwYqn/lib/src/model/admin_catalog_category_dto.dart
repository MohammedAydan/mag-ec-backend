//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/admin_catalog_translation_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_catalog_category_dto.g.dart';

/// AdminCatalogCategoryDto
///
/// Properties:
/// * [id] 
/// * [key] 
/// * [status] 
/// * [sortOrder] 
/// * [translations] 
/// * [parentId] 
@BuiltValue()
abstract class AdminCatalogCategoryDto implements Built<AdminCatalogCategoryDto, AdminCatalogCategoryDtoBuilder> {
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

  @BuiltValueField(wireName: r'parentId')
  String? get parentId;

  AdminCatalogCategoryDto._();

  factory AdminCatalogCategoryDto([void updates(AdminCatalogCategoryDtoBuilder b)]) = _$AdminCatalogCategoryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminCatalogCategoryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminCatalogCategoryDto> get serializer => _$AdminCatalogCategoryDtoSerializer();
}

class _$AdminCatalogCategoryDtoSerializer implements PrimitiveSerializer<AdminCatalogCategoryDto> {
  @override
  final Iterable<Type> types = const [AdminCatalogCategoryDto, _$AdminCatalogCategoryDto];

  @override
  final String wireName = r'AdminCatalogCategoryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminCatalogCategoryDto object, {
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
      specifiedType: const FullType(BuiltList, [FullType(AdminCatalogTranslationDto)]),
    );
    if (object.parentId != null) {
      yield r'parentId';
      yield serializers.serialize(
        object.parentId,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminCatalogCategoryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminCatalogCategoryDtoBuilder result,
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
            specifiedType: const FullType(BuiltList, [FullType(AdminCatalogTranslationDto)]),
          ) as BuiltList<AdminCatalogTranslationDto>;
          result.translations.replace(valueDes);
          break;
        case r'parentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.parentId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminCatalogCategoryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminCatalogCategoryDtoBuilder();
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

