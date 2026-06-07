//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stock_movement_actor_dto.g.dart';

/// StockMovementActorDto
///
/// Properties:
/// * [id]
/// * [displayName]
/// * [email]
@BuiltValue()
abstract class StockMovementActorDto
    implements Built<StockMovementActorDto, StockMovementActorDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'displayName')
  String get displayName;

  @BuiltValueField(wireName: r'email')
  String get email;

  StockMovementActorDto._();

  factory StockMovementActorDto(
      [void updates(StockMovementActorDtoBuilder b)]) = _$StockMovementActorDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StockMovementActorDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StockMovementActorDto> get serializer =>
      _$StockMovementActorDtoSerializer();
}

class _$StockMovementActorDtoSerializer
    implements PrimitiveSerializer<StockMovementActorDto> {
  @override
  final Iterable<Type> types = const [
    StockMovementActorDto,
    _$StockMovementActorDto
  ];

  @override
  final String wireName = r'StockMovementActorDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StockMovementActorDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'displayName';
    yield serializers.serialize(
      object.displayName,
      specifiedType: const FullType(String),
    );
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    StockMovementActorDto object, {
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
    required StockMovementActorDtoBuilder result,
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
        case r'displayName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.displayName = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StockMovementActorDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StockMovementActorDtoBuilder();
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
