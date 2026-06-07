//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/top_product_sum_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'top_product_dto.g.dart';

/// TopProductDto
///
/// Properties:
/// * [productId] 
/// * [productName] 
/// * [sum] 
@BuiltValue()
abstract class TopProductDto implements Built<TopProductDto, TopProductDtoBuilder> {
  @BuiltValueField(wireName: r'productId')
  String get productId;

  @BuiltValueField(wireName: r'productName')
  String get productName;

  @BuiltValueField(wireName: r'_sum')
  TopProductSumDto get sum;

  TopProductDto._();

  factory TopProductDto([void updates(TopProductDtoBuilder b)]) = _$TopProductDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TopProductDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TopProductDto> get serializer => _$TopProductDtoSerializer();
}

class _$TopProductDtoSerializer implements PrimitiveSerializer<TopProductDto> {
  @override
  final Iterable<Type> types = const [TopProductDto, _$TopProductDto];

  @override
  final String wireName = r'TopProductDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TopProductDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'productId';
    yield serializers.serialize(
      object.productId,
      specifiedType: const FullType(String),
    );
    yield r'productName';
    yield serializers.serialize(
      object.productName,
      specifiedType: const FullType(String),
    );
    yield r'_sum';
    yield serializers.serialize(
      object.sum,
      specifiedType: const FullType(TopProductSumDto),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TopProductDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TopProductDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'productId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.productId = valueDes;
          break;
        case r'productName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.productName = valueDes;
          break;
        case r'_sum':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TopProductSumDto),
          ) as TopProductSumDto;
          result.sum.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TopProductDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TopProductDtoBuilder();
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

