//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stock_reservation_user_dto.g.dart';

/// StockReservationUserDto
///
/// Properties:
/// * [id] 
/// * [email] 
/// * [displayName] 
@BuiltValue()
abstract class StockReservationUserDto implements Built<StockReservationUserDto, StockReservationUserDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'displayName')
  String get displayName;

  StockReservationUserDto._();

  factory StockReservationUserDto([void updates(StockReservationUserDtoBuilder b)]) = _$StockReservationUserDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StockReservationUserDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StockReservationUserDto> get serializer => _$StockReservationUserDtoSerializer();
}

class _$StockReservationUserDtoSerializer implements PrimitiveSerializer<StockReservationUserDto> {
  @override
  final Iterable<Type> types = const [StockReservationUserDto, _$StockReservationUserDto];

  @override
  final String wireName = r'StockReservationUserDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StockReservationUserDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'displayName';
    yield serializers.serialize(
      object.displayName,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    StockReservationUserDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required StockReservationUserDtoBuilder result,
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
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'displayName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.displayName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StockReservationUserDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StockReservationUserDtoBuilder();
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

