//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'review_moderation_action_dto.g.dart';

/// ReviewModerationActionDto
///
/// Properties:
/// * [id] 
/// * [reviewId] 
/// * [moderatorUserId] 
/// * [actionType] 
/// * [createdAt] 
/// * [reason] 
@BuiltValue()
abstract class ReviewModerationActionDto implements Built<ReviewModerationActionDto, ReviewModerationActionDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'reviewId')
  String get reviewId;

  @BuiltValueField(wireName: r'moderatorUserId')
  String get moderatorUserId;

  @BuiltValueField(wireName: r'actionType')
  String get actionType;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'reason')
  String? get reason;

  ReviewModerationActionDto._();

  factory ReviewModerationActionDto([void updates(ReviewModerationActionDtoBuilder b)]) = _$ReviewModerationActionDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReviewModerationActionDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReviewModerationActionDto> get serializer => _$ReviewModerationActionDtoSerializer();
}

class _$ReviewModerationActionDtoSerializer implements PrimitiveSerializer<ReviewModerationActionDto> {
  @override
  final Iterable<Type> types = const [ReviewModerationActionDto, _$ReviewModerationActionDto];

  @override
  final String wireName = r'ReviewModerationActionDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReviewModerationActionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'reviewId';
    yield serializers.serialize(
      object.reviewId,
      specifiedType: const FullType(String),
    );
    yield r'moderatorUserId';
    yield serializers.serialize(
      object.moderatorUserId,
      specifiedType: const FullType(String),
    );
    yield r'actionType';
    yield serializers.serialize(
      object.actionType,
      specifiedType: const FullType(String),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(String),
    );
    if (object.reason != null) {
      yield r'reason';
      yield serializers.serialize(
        object.reason,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReviewModerationActionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReviewModerationActionDtoBuilder result,
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
        case r'reviewId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reviewId = valueDes;
          break;
        case r'moderatorUserId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.moderatorUserId = valueDes;
          break;
        case r'actionType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.actionType = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reason = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReviewModerationActionDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReviewModerationActionDtoBuilder();
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

