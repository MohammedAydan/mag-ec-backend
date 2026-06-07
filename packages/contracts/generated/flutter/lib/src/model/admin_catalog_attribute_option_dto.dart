//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/admin_catalog_translation_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_catalog_attribute_option_dto.g.dart';

/// AdminCatalogAttributeOptionDto
///
/// Properties:
/// * [id]
/// * [key]
/// * [sortOrder]
/// * [translations]
/// * [colorHex]
@BuiltValue()
abstract class AdminCatalogAttributeOptionDto
    implements
        Built<AdminCatalogAttributeOptionDto,
            AdminCatalogAttributeOptionDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'sortOrder')
  num get sortOrder;

  @BuiltValueField(wireName: r'translations')
  BuiltList<AdminCatalogTranslationDto> get translations;

  @BuiltValueField(wireName: r'colorHex')
  String? get colorHex;

  AdminCatalogAttributeOptionDto._();

  factory AdminCatalogAttributeOptionDto(
          [void updates(AdminCatalogAttributeOptionDtoBuilder b)]) =
      _$AdminCatalogAttributeOptionDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminCatalogAttributeOptionDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminCatalogAttributeOptionDto> get serializer =>
      _$AdminCatalogAttributeOptionDtoSerializer();
}

class _$AdminCatalogAttributeOptionDtoSerializer
    implements PrimitiveSerializer<AdminCatalogAttributeOptionDto> {
  @override
  final Iterable<Type> types = const [
    AdminCatalogAttributeOptionDto,
    _$AdminCatalogAttributeOptionDto
  ];

  @override
  final String wireName = r'AdminCatalogAttributeOptionDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminCatalogAttributeOptionDto object, {
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
    if (object.colorHex != null) {
      yield r'colorHex';
      yield serializers.serialize(
        object.colorHex,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminCatalogAttributeOptionDto object, {
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
    required AdminCatalogAttributeOptionDtoBuilder result,
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
        case r'colorHex':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.colorHex = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminCatalogAttributeOptionDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminCatalogAttributeOptionDtoBuilder();
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
