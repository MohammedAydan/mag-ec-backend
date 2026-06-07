//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'review_return_request_dto.g.dart';

/// ReviewReturnRequestDto
///
/// Properties:
/// * [decision] - Review decision for the return request
/// * [reviewNotes] - Internal review notes
/// * [rejectionReason] - Reason for rejection (required when decision is reject)
@BuiltValue()
abstract class ReviewReturnRequestDto
    implements Built<ReviewReturnRequestDto, ReviewReturnRequestDtoBuilder> {
  /// Review decision for the return request
  @BuiltValueField(wireName: r'decision')
  ReviewReturnRequestDtoDecisionEnum get decision;
  // enum decisionEnum {  approve,  reject,  };

  /// Internal review notes
  @BuiltValueField(wireName: r'reviewNotes')
  String? get reviewNotes;

  /// Reason for rejection (required when decision is reject)
  @BuiltValueField(wireName: r'rejectionReason')
  String? get rejectionReason;

  ReviewReturnRequestDto._();

  factory ReviewReturnRequestDto(
          [void updates(ReviewReturnRequestDtoBuilder b)]) =
      _$ReviewReturnRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReviewReturnRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReviewReturnRequestDto> get serializer =>
      _$ReviewReturnRequestDtoSerializer();
}

class _$ReviewReturnRequestDtoSerializer
    implements PrimitiveSerializer<ReviewReturnRequestDto> {
  @override
  final Iterable<Type> types = const [
    ReviewReturnRequestDto,
    _$ReviewReturnRequestDto
  ];

  @override
  final String wireName = r'ReviewReturnRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReviewReturnRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'decision';
    yield serializers.serialize(
      object.decision,
      specifiedType: const FullType(ReviewReturnRequestDtoDecisionEnum),
    );
    if (object.reviewNotes != null) {
      yield r'reviewNotes';
      yield serializers.serialize(
        object.reviewNotes,
        specifiedType: const FullType(String),
      );
    }
    if (object.rejectionReason != null) {
      yield r'rejectionReason';
      yield serializers.serialize(
        object.rejectionReason,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReviewReturnRequestDto object, {
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
    required ReviewReturnRequestDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'decision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReviewReturnRequestDtoDecisionEnum),
          ) as ReviewReturnRequestDtoDecisionEnum;
          result.decision = valueDes;
          break;
        case r'reviewNotes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reviewNotes = valueDes;
          break;
        case r'rejectionReason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.rejectionReason = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReviewReturnRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReviewReturnRequestDtoBuilder();
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

class ReviewReturnRequestDtoDecisionEnum extends EnumClass {
  /// Review decision for the return request
  @BuiltValueEnumConst(wireName: r'approve')
  static const ReviewReturnRequestDtoDecisionEnum approve =
      _$reviewReturnRequestDtoDecisionEnum_approve;

  /// Review decision for the return request
  @BuiltValueEnumConst(wireName: r'reject')
  static const ReviewReturnRequestDtoDecisionEnum reject =
      _$reviewReturnRequestDtoDecisionEnum_reject;

  static Serializer<ReviewReturnRequestDtoDecisionEnum> get serializer =>
      _$reviewReturnRequestDtoDecisionEnumSerializer;

  const ReviewReturnRequestDtoDecisionEnum._(String name) : super(name);

  static BuiltSet<ReviewReturnRequestDtoDecisionEnum> get values =>
      _$reviewReturnRequestDtoDecisionEnumValues;
  static ReviewReturnRequestDtoDecisionEnum valueOf(String name) =>
      _$reviewReturnRequestDtoDecisionEnumValueOf(name);
}
