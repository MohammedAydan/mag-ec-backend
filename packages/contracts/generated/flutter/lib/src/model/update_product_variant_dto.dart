//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/product_variant_translation_dto.dart';
import 'package:mag_api_client/src/model/variant_option_value_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_product_variant_dto.g.dart';

/// UpdateProductVariantDto
///
/// Properties:
/// * [sku]
/// * [isDefault]
/// * [position]
/// * [translations]
/// * [optionValues]
@BuiltValue()
abstract class UpdateProductVariantDto
    implements Built<UpdateProductVariantDto, UpdateProductVariantDtoBuilder> {
  @BuiltValueField(wireName: r'sku')
  String? get sku;

  @BuiltValueField(wireName: r'isDefault')
  bool? get isDefault;

  @BuiltValueField(wireName: r'position')
  num? get position;

  @BuiltValueField(wireName: r'translations')
  BuiltList<ProductVariantTranslationDto>? get translations;

  @BuiltValueField(wireName: r'optionValues')
  BuiltList<VariantOptionValueDto>? get optionValues;

  UpdateProductVariantDto._();

  factory UpdateProductVariantDto(
          [void updates(UpdateProductVariantDtoBuilder b)]) =
      _$UpdateProductVariantDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateProductVariantDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateProductVariantDto> get serializer =>
      _$UpdateProductVariantDtoSerializer();
}

class _$UpdateProductVariantDtoSerializer
    implements PrimitiveSerializer<UpdateProductVariantDto> {
  @override
  final Iterable<Type> types = const [
    UpdateProductVariantDto,
    _$UpdateProductVariantDto
  ];

  @override
  final String wireName = r'UpdateProductVariantDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateProductVariantDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.sku != null) {
      yield r'sku';
      yield serializers.serialize(
        object.sku,
        specifiedType: const FullType(String),
      );
    }
    if (object.isDefault != null) {
      yield r'isDefault';
      yield serializers.serialize(
        object.isDefault,
        specifiedType: const FullType(bool),
      );
    }
    if (object.position != null) {
      yield r'position';
      yield serializers.serialize(
        object.position,
        specifiedType: const FullType(num),
      );
    }
    if (object.translations != null) {
      yield r'translations';
      yield serializers.serialize(
        object.translations,
        specifiedType:
            const FullType(BuiltList, [FullType(ProductVariantTranslationDto)]),
      );
    }
    if (object.optionValues != null) {
      yield r'optionValues';
      yield serializers.serialize(
        object.optionValues,
        specifiedType:
            const FullType(BuiltList, [FullType(VariantOptionValueDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateProductVariantDto object, {
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
    required UpdateProductVariantDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sku':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sku = valueDes;
          break;
        case r'isDefault':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isDefault = valueDes;
          break;
        case r'position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.position = valueDes;
          break;
        case r'translations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(ProductVariantTranslationDto)]),
          ) as BuiltList<ProductVariantTranslationDto>;
          result.translations.replace(valueDes);
          break;
        case r'optionValues':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(VariantOptionValueDto)]),
          ) as BuiltList<VariantOptionValueDto>;
          result.optionValues.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateProductVariantDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateProductVariantDtoBuilder();
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
