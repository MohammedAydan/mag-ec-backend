//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'merge_cart_dto.g.dart';

/// MergeCartDto
///
/// Properties:
/// * [sourceGuestToken] - Guest token from source (anonymous) cart
@BuiltValue()
abstract class MergeCartDto implements Built<MergeCartDto, MergeCartDtoBuilder> {
  /// Guest token from source (anonymous) cart
  @BuiltValueField(wireName: r'sourceGuestToken')
  String get sourceGuestToken;

  MergeCartDto._();

  factory MergeCartDto([void updates(MergeCartDtoBuilder b)]) = _$MergeCartDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MergeCartDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MergeCartDto> get serializer => _$MergeCartDtoSerializer();
}

class _$MergeCartDtoSerializer implements PrimitiveSerializer<MergeCartDto> {
  @override
  final Iterable<Type> types = const [MergeCartDto, _$MergeCartDto];

  @override
  final String wireName = r'MergeCartDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MergeCartDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'sourceGuestToken';
    yield serializers.serialize(
      object.sourceGuestToken,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MergeCartDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MergeCartDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sourceGuestToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourceGuestToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MergeCartDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MergeCartDtoBuilder();
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

