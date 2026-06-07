//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_cart_dto.g.dart';

/// CreateCartDto
///
/// Properties:
/// * [guestToken] - Anonymous cart token in UUIDv4 format (omit for authenticated users)
@BuiltValue()
abstract class CreateCartDto implements Built<CreateCartDto, CreateCartDtoBuilder> {
  /// Anonymous cart token in UUIDv4 format (omit for authenticated users)
  @BuiltValueField(wireName: r'guestToken')
  String? get guestToken;

  CreateCartDto._();

  factory CreateCartDto([void updates(CreateCartDtoBuilder b)]) = _$CreateCartDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateCartDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateCartDto> get serializer => _$CreateCartDtoSerializer();
}

class _$CreateCartDtoSerializer implements PrimitiveSerializer<CreateCartDto> {
  @override
  final Iterable<Type> types = const [CreateCartDto, _$CreateCartDto];

  @override
  final String wireName = r'CreateCartDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateCartDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.guestToken != null) {
      yield r'guestToken';
      yield serializers.serialize(
        object.guestToken,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateCartDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateCartDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'guestToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.guestToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateCartDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateCartDtoBuilder();
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

