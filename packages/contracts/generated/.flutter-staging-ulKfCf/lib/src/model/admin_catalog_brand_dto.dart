//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/admin_catalog_translation_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_catalog_brand_dto.g.dart';

/// AdminCatalogBrandDto
///
/// Properties:
/// * [id] 
/// * [key] 
/// * [status] 
/// * [translations] 
@BuiltValue()
abstract class AdminCatalogBrandDto implements Built<AdminCatalogBrandDto, AdminCatalogBrandDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'translations')
  BuiltList<AdminCatalogTranslationDto> get translations;

  AdminCatalogBrandDto._();

  factory AdminCatalogBrandDto([void updates(AdminCatalogBrandDtoBuilder b)]) = _$AdminCatalogBrandDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminCatalogBrandDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminCatalogBrandDto> get serializer => _$AdminCatalogBrandDtoSerializer();
}

class _$AdminCatalogBrandDtoSerializer implements PrimitiveSerializer<AdminCatalogBrandDto> {
  @override
  final Iterable<Type> types = const [AdminCatalogBrandDto, _$AdminCatalogBrandDto];

  @override
  final String wireName = r'AdminCatalogBrandDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminCatalogBrandDto object, {
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
    yield r'translations';
    yield serializers.serialize(
      object.translations,
      specifiedType: const FullType(BuiltList, [FullType(AdminCatalogTranslationDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminCatalogBrandDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminCatalogBrandDtoBuilder result,
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
        case r'translations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AdminCatalogTranslationDto)]),
          ) as BuiltList<AdminCatalogTranslationDto>;
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
  AdminCatalogBrandDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminCatalogBrandDtoBuilder();
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

