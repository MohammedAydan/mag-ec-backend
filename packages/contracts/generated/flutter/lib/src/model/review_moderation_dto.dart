//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'review_moderation_dto.g.dart';

/// ReviewModerationDto
///
/// Properties:
/// * [decision] - Moderation decision
/// * [reason] - Reason for the moderation decision
@BuiltValue()
abstract class ReviewModerationDto
    implements Built<ReviewModerationDto, ReviewModerationDtoBuilder> {
  /// Moderation decision
  @BuiltValueField(wireName: r'decision')
  ReviewModerationDtoDecisionEnum get decision;
  // enum decisionEnum {  APPROVE,  REJECT,  FLAG,  HIDE,  };

  /// Reason for the moderation decision
  @BuiltValueField(wireName: r'reason')
  String? get reason;

  ReviewModerationDto._();

  factory ReviewModerationDto([void updates(ReviewModerationDtoBuilder b)]) =
      _$ReviewModerationDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReviewModerationDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReviewModerationDto> get serializer =>
      _$ReviewModerationDtoSerializer();
}

class _$ReviewModerationDtoSerializer
    implements PrimitiveSerializer<ReviewModerationDto> {
  @override
  final Iterable<Type> types = const [
    ReviewModerationDto,
    _$ReviewModerationDto
  ];

  @override
  final String wireName = r'ReviewModerationDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReviewModerationDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'decision';
    yield serializers.serialize(
      object.decision,
      specifiedType: const FullType(ReviewModerationDtoDecisionEnum),
    );
    if (object.reason != null) {
      yield r'reason';
      yield serializers.serialize(
        object.reason,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReviewModerationDto object, {
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
    required ReviewModerationDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'decision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReviewModerationDtoDecisionEnum),
          ) as ReviewModerationDtoDecisionEnum;
          result.decision = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
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
  ReviewModerationDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReviewModerationDtoBuilder();
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

class ReviewModerationDtoDecisionEnum extends EnumClass {
  /// Moderation decision
  @BuiltValueEnumConst(wireName: r'APPROVE')
  static const ReviewModerationDtoDecisionEnum APPROVE =
      _$reviewModerationDtoDecisionEnum_APPROVE;

  /// Moderation decision
  @BuiltValueEnumConst(wireName: r'REJECT')
  static const ReviewModerationDtoDecisionEnum REJECT =
      _$reviewModerationDtoDecisionEnum_REJECT;

  /// Moderation decision
  @BuiltValueEnumConst(wireName: r'FLAG')
  static const ReviewModerationDtoDecisionEnum FLAG =
      _$reviewModerationDtoDecisionEnum_FLAG;

  /// Moderation decision
  @BuiltValueEnumConst(wireName: r'HIDE')
  static const ReviewModerationDtoDecisionEnum HIDE =
      _$reviewModerationDtoDecisionEnum_HIDE;

  static Serializer<ReviewModerationDtoDecisionEnum> get serializer =>
      _$reviewModerationDtoDecisionEnumSerializer;

  const ReviewModerationDtoDecisionEnum._(String name) : super(name);

  static BuiltSet<ReviewModerationDtoDecisionEnum> get values =>
      _$reviewModerationDtoDecisionEnumValues;
  static ReviewModerationDtoDecisionEnum valueOf(String name) =>
      _$reviewModerationDtoDecisionEnumValueOf(name);
}
