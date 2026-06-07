//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/admin_catalog_product_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_paginated_catalog_products_dto.g.dart';

/// AdminPaginatedCatalogProductsDto
///
/// Properties:
/// * [items]
/// * [nextCursor]
@BuiltValue()
abstract class AdminPaginatedCatalogProductsDto
    implements
        Built<AdminPaginatedCatalogProductsDto,
            AdminPaginatedCatalogProductsDtoBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<AdminCatalogProductDto> get items;

  @BuiltValueField(wireName: r'nextCursor')
  String? get nextCursor;

  AdminPaginatedCatalogProductsDto._();

  factory AdminPaginatedCatalogProductsDto(
          [void updates(AdminPaginatedCatalogProductsDtoBuilder b)]) =
      _$AdminPaginatedCatalogProductsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminPaginatedCatalogProductsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminPaginatedCatalogProductsDto> get serializer =>
      _$AdminPaginatedCatalogProductsDtoSerializer();
}

class _$AdminPaginatedCatalogProductsDtoSerializer
    implements PrimitiveSerializer<AdminPaginatedCatalogProductsDto> {
  @override
  final Iterable<Type> types = const [
    AdminPaginatedCatalogProductsDto,
    _$AdminPaginatedCatalogProductsDto
  ];

  @override
  final String wireName = r'AdminPaginatedCatalogProductsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminPaginatedCatalogProductsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(AdminCatalogProductDto)]),
    );
    if (object.nextCursor != null) {
      yield r'nextCursor';
      yield serializers.serialize(
        object.nextCursor,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminPaginatedCatalogProductsDto object, {
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
    required AdminPaginatedCatalogProductsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(AdminCatalogProductDto)]),
          ) as BuiltList<AdminCatalogProductDto>;
          result.items.replace(valueDes);
          break;
        case r'nextCursor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nextCursor = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminPaginatedCatalogProductsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminPaginatedCatalogProductsDtoBuilder();
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
