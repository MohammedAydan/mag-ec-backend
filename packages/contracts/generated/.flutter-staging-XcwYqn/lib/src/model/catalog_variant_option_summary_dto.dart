//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'catalog_variant_option_summary_dto.g.dart';

/// CatalogVariantOptionSummaryDto
///
/// Properties:
/// * [attributeKey] 
/// * [optionKey] 
/// * [attributeName] 
/// * [optionLabel] 
/// * [colorHex] 
@BuiltValue()
abstract class CatalogVariantOptionSummaryDto implements Built<CatalogVariantOptionSummaryDto, CatalogVariantOptionSummaryDtoBuilder> {
  @BuiltValueField(wireName: r'attributeKey')
  String get attributeKey;

  @BuiltValueField(wireName: r'optionKey')
  String get optionKey;

  @BuiltValueField(wireName: r'attributeName')
  String? get attributeName;

  @BuiltValueField(wireName: r'optionLabel')
  String? get optionLabel;

  @BuiltValueField(wireName: r'colorHex')
  String? get colorHex;

  CatalogVariantOptionSummaryDto._();

  factory CatalogVariantOptionSummaryDto([void updates(CatalogVariantOptionSummaryDtoBuilder b)]) = _$CatalogVariantOptionSummaryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CatalogVariantOptionSummaryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CatalogVariantOptionSummaryDto> get serializer => _$CatalogVariantOptionSummaryDtoSerializer();
}

class _$CatalogVariantOptionSummaryDtoSerializer implements PrimitiveSerializer<CatalogVariantOptionSummaryDto> {
  @override
  final Iterable<Type> types = const [CatalogVariantOptionSummaryDto, _$CatalogVariantOptionSummaryDto];

  @override
  final String wireName = r'CatalogVariantOptionSummaryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CatalogVariantOptionSummaryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'attributeKey';
    yield serializers.serialize(
      object.attributeKey,
      specifiedType: const FullType(String),
    );
    yield r'optionKey';
    yield serializers.serialize(
      object.optionKey,
      specifiedType: const FullType(String),
    );
    if (object.attributeName != null) {
      yield r'attributeName';
      yield serializers.serialize(
        object.attributeName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.optionLabel != null) {
      yield r'optionLabel';
      yield serializers.serialize(
        object.optionLabel,
        specifiedType: const FullType.nullable(String),
      );
    }
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
    CatalogVariantOptionSummaryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CatalogVariantOptionSummaryDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'attributeKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.attributeKey = valueDes;
          break;
        case r'optionKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.optionKey = valueDes;
          break;
        case r'attributeName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.attributeName = valueDes;
          break;
        case r'optionLabel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.optionLabel = valueDes;
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
  CatalogVariantOptionSummaryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CatalogVariantOptionSummaryDtoBuilder();
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

