//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_review_dto.g.dart';

/// CreateReviewDto
///
/// Properties:
/// * [rating] - Rating from 1 to 5
/// * [title] - Review title
/// * [body] - Review body text
@BuiltValue()
abstract class CreateReviewDto implements Built<CreateReviewDto, CreateReviewDtoBuilder> {
  /// Rating from 1 to 5
  @BuiltValueField(wireName: r'rating')
  num get rating;

  /// Review title
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Review body text
  @BuiltValueField(wireName: r'body')
  String get body;

  CreateReviewDto._();

  factory CreateReviewDto([void updates(CreateReviewDtoBuilder b)]) = _$CreateReviewDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateReviewDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateReviewDto> get serializer => _$CreateReviewDtoSerializer();
}

class _$CreateReviewDtoSerializer implements PrimitiveSerializer<CreateReviewDto> {
  @override
  final Iterable<Type> types = const [CreateReviewDto, _$CreateReviewDto];

  @override
  final String wireName = r'CreateReviewDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateReviewDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'rating';
    yield serializers.serialize(
      object.rating,
      specifiedType: const FullType(num),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'body';
    yield serializers.serialize(
      object.body,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateReviewDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateReviewDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'rating':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.rating = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'body':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.body = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateReviewDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateReviewDtoBuilder();
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

