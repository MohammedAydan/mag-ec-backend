//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_store_currency_dto.g.dart';

/// UpdateStoreCurrencyDto
///
/// Properties:
/// * [currencyCode] - ISO 4217 currency code (e.g. USD)
/// * [symbol] - Currency symbol (e.g. $)
/// * [minorUnit] - Number of decimal minor units (e.g. 2 for cents)
@BuiltValue()
abstract class UpdateStoreCurrencyDto implements Built<UpdateStoreCurrencyDto, UpdateStoreCurrencyDtoBuilder> {
  /// ISO 4217 currency code (e.g. USD)
  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  /// Currency symbol (e.g. $)
  @BuiltValueField(wireName: r'symbol')
  String get symbol;

  /// Number of decimal minor units (e.g. 2 for cents)
  @BuiltValueField(wireName: r'minorUnit')
  num get minorUnit;

  UpdateStoreCurrencyDto._();

  factory UpdateStoreCurrencyDto([void updates(UpdateStoreCurrencyDtoBuilder b)]) = _$UpdateStoreCurrencyDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateStoreCurrencyDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateStoreCurrencyDto> get serializer => _$UpdateStoreCurrencyDtoSerializer();
}

class _$UpdateStoreCurrencyDtoSerializer implements PrimitiveSerializer<UpdateStoreCurrencyDto> {
  @override
  final Iterable<Type> types = const [UpdateStoreCurrencyDto, _$UpdateStoreCurrencyDto];

  @override
  final String wireName = r'UpdateStoreCurrencyDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateStoreCurrencyDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'currencyCode';
    yield serializers.serialize(
      object.currencyCode,
      specifiedType: const FullType(String),
    );
    yield r'symbol';
    yield serializers.serialize(
      object.symbol,
      specifiedType: const FullType(String),
    );
    yield r'minorUnit';
    yield serializers.serialize(
      object.minorUnit,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateStoreCurrencyDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateStoreCurrencyDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyCode = valueDes;
          break;
        case r'symbol':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.symbol = valueDes;
          break;
        case r'minorUnit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.minorUnit = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateStoreCurrencyDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateStoreCurrencyDtoBuilder();
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

