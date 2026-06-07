//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stock_reservation_variant_dto.g.dart';

/// StockReservationVariantDto
///
/// Properties:
/// * [id]
/// * [sku]
@BuiltValue()
abstract class StockReservationVariantDto
    implements
        Built<StockReservationVariantDto, StockReservationVariantDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'sku')
  String get sku;

  StockReservationVariantDto._();

  factory StockReservationVariantDto(
          [void updates(StockReservationVariantDtoBuilder b)]) =
      _$StockReservationVariantDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StockReservationVariantDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StockReservationVariantDto> get serializer =>
      _$StockReservationVariantDtoSerializer();
}

class _$StockReservationVariantDtoSerializer
    implements PrimitiveSerializer<StockReservationVariantDto> {
  @override
  final Iterable<Type> types = const [
    StockReservationVariantDto,
    _$StockReservationVariantDto
  ];

  @override
  final String wireName = r'StockReservationVariantDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StockReservationVariantDto object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    StockReservationVariantDto object, {
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
    required StockReservationVariantDtoBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StockReservationVariantDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StockReservationVariantDtoBuilder();
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
