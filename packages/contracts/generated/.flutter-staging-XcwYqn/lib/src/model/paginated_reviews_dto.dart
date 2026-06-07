//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/review_response_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_reviews_dto.g.dart';

/// PaginatedReviewsDto
///
/// Properties:
/// * [items] 
/// * [nextCursor] 
@BuiltValue()
abstract class PaginatedReviewsDto implements Built<PaginatedReviewsDto, PaginatedReviewsDtoBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<ReviewResponseDto> get items;

  @BuiltValueField(wireName: r'nextCursor')
  String? get nextCursor;

  PaginatedReviewsDto._();

  factory PaginatedReviewsDto([void updates(PaginatedReviewsDtoBuilder b)]) = _$PaginatedReviewsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedReviewsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedReviewsDto> get serializer => _$PaginatedReviewsDtoSerializer();
}

class _$PaginatedReviewsDtoSerializer implements PrimitiveSerializer<PaginatedReviewsDto> {
  @override
  final Iterable<Type> types = const [PaginatedReviewsDto, _$PaginatedReviewsDto];

  @override
  final String wireName = r'PaginatedReviewsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedReviewsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(ReviewResponseDto)]),
    );
    if (object.nextCursor != null) {
      yield r'nextCursor';
      yield serializers.serialize(
        object.nextCursor,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaginatedReviewsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedReviewsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ReviewResponseDto)]),
          ) as BuiltList<ReviewResponseDto>;
          result.items.replace(valueDes);
          break;
        case r'nextCursor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nextCursor = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaginatedReviewsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedReviewsDtoBuilder();
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

