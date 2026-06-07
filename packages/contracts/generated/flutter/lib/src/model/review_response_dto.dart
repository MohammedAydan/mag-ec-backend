//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/review_order_line_dto.dart';
import 'package:mag_api_client/src/model/review_product_dto.dart';
import 'package:mag_api_client/src/model/review_moderation_action_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'review_response_dto.g.dart';

/// ReviewResponseDto
///
/// Properties:
/// * [id]
/// * [productId]
/// * [userId]
/// * [orderLineId]
/// * [rating]
/// * [title]
/// * [body]
/// * [isVerifiedPurchase]
/// * [status]
/// * [createdAt]
/// * [updatedAt]
/// * [product]
/// * [orderLine]
/// * [moderationActions]
/// * [rejectionReason]
@BuiltValue()
abstract class ReviewResponseDto
    implements Built<ReviewResponseDto, ReviewResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'productId')
  String get productId;

  @BuiltValueField(wireName: r'userId')
  String get userId;

  @BuiltValueField(wireName: r'orderLineId')
  String get orderLineId;

  @BuiltValueField(wireName: r'rating')
  num get rating;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'body')
  String get body;

  @BuiltValueField(wireName: r'isVerifiedPurchase')
  bool get isVerifiedPurchase;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  @BuiltValueField(wireName: r'product')
  ReviewProductDto get product;

  @BuiltValueField(wireName: r'orderLine')
  ReviewOrderLineDto get orderLine;

  @BuiltValueField(wireName: r'moderationActions')
  BuiltList<ReviewModerationActionDto> get moderationActions;

  @BuiltValueField(wireName: r'rejectionReason')
  String? get rejectionReason;

  ReviewResponseDto._();

  factory ReviewResponseDto([void updates(ReviewResponseDtoBuilder b)]) =
      _$ReviewResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReviewResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReviewResponseDto> get serializer =>
      _$ReviewResponseDtoSerializer();
}

class _$ReviewResponseDtoSerializer
    implements PrimitiveSerializer<ReviewResponseDto> {
  @override
  final Iterable<Type> types = const [ReviewResponseDto, _$ReviewResponseDto];

  @override
  final String wireName = r'ReviewResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReviewResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'productId';
    yield serializers.serialize(
      object.productId,
      specifiedType: const FullType(String),
    );
    yield r'userId';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(String),
    );
    yield r'orderLineId';
    yield serializers.serialize(
      object.orderLineId,
      specifiedType: const FullType(String),
    );
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
    yield r'isVerifiedPurchase';
    yield serializers.serialize(
      object.isVerifiedPurchase,
      specifiedType: const FullType(bool),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(String),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(String),
    );
    yield r'product';
    yield serializers.serialize(
      object.product,
      specifiedType: const FullType(ReviewProductDto),
    );
    yield r'orderLine';
    yield serializers.serialize(
      object.orderLine,
      specifiedType: const FullType(ReviewOrderLineDto),
    );
    yield r'moderationActions';
    yield serializers.serialize(
      object.moderationActions,
      specifiedType:
          const FullType(BuiltList, [FullType(ReviewModerationActionDto)]),
    );
    if (object.rejectionReason != null) {
      yield r'rejectionReason';
      yield serializers.serialize(
        object.rejectionReason,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReviewResponseDto object, {
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
    required ReviewResponseDtoBuilder result,
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
        case r'productId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.productId = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        case r'orderLineId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.orderLineId = valueDes;
          break;
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
        case r'isVerifiedPurchase':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isVerifiedPurchase = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.updatedAt = valueDes;
          break;
        case r'product':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReviewProductDto),
          ) as ReviewProductDto;
          result.product.replace(valueDes);
          break;
        case r'orderLine':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReviewOrderLineDto),
          ) as ReviewOrderLineDto;
          result.orderLine.replace(valueDes);
          break;
        case r'moderationActions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(ReviewModerationActionDto)]),
          ) as BuiltList<ReviewModerationActionDto>;
          result.moderationActions.replace(valueDes);
          break;
        case r'rejectionReason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
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
  ReviewResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReviewResponseDtoBuilder();
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
