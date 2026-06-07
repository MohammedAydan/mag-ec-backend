//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stock_level_variant_dto.g.dart';

/// StockLevelVariantDto
///
/// Properties:
/// * [id] 
/// * [sku] 
/// * [isDefault] 
@BuiltValue()
abstract class StockLevelVariantDto implements Built<StockLevelVariantDto, StockLevelVariantDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'sku')
  String get sku;

  @BuiltValueField(wireName: r'isDefault')
  bool get isDefault;

  StockLevelVariantDto._();

  factory StockLevelVariantDto([void updates(StockLevelVariantDtoBuilder b)]) = _$StockLevelVariantDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StockLevelVariantDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StockLevelVariantDto> get serializer => _$StockLevelVariantDtoSerializer();
}

class _$StockLevelVariantDtoSerializer implements PrimitiveSerializer<StockLevelVariantDto> {
  @override
  final Iterable<Type> types = const [StockLevelVariantDto, _$StockLevelVariantDto];

  @override
  final String wireName = r'StockLevelVariantDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StockLevelVariantDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'sku';
    yield serializers.serialize(
      object.sku,
      specifiedType: const FullType(String),
    );
    yield r'isDefault';
    yield serializers.serialize(
      object.isDefault,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    StockLevelVariantDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required StockLevelVariantDtoBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StockLevelVariantDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StockLevelVariantDtoBuilder();
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

