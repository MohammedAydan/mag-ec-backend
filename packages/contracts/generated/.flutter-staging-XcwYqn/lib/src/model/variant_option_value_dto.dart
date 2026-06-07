//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'variant_option_value_dto.g.dart';

/// VariantOptionValueDto
///
/// Properties:
/// * [attributeId] 
/// * [optionId] 
@BuiltValue()
abstract class VariantOptionValueDto implements Built<VariantOptionValueDto, VariantOptionValueDtoBuilder> {
  @BuiltValueField(wireName: r'attributeId')
  String get attributeId;

  @BuiltValueField(wireName: r'optionId')
  String get optionId;

  VariantOptionValueDto._();

  factory VariantOptionValueDto([void updates(VariantOptionValueDtoBuilder b)]) = _$VariantOptionValueDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VariantOptionValueDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VariantOptionValueDto> get serializer => _$VariantOptionValueDtoSerializer();
}

class _$VariantOptionValueDtoSerializer implements PrimitiveSerializer<VariantOptionValueDto> {
  @override
  final Iterable<Type> types = const [VariantOptionValueDto, _$VariantOptionValueDto];

  @override
  final String wireName = r'VariantOptionValueDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VariantOptionValueDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'attributeId';
    yield serializers.serialize(
      object.attributeId,
      specifiedType: const FullType(String),
    );
    yield r'optionId';
    yield serializers.serialize(
      object.optionId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    VariantOptionValueDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VariantOptionValueDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'attributeId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.attributeId = valueDes;
          break;
        case r'optionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.optionId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VariantOptionValueDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VariantOptionValueDtoBuilder();
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

