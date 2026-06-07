//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/refund_response_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_refunds_dto.g.dart';

/// PaginatedRefundsDto
///
/// Properties:
/// * [items]
/// * [nextCursor]
@BuiltValue()
abstract class PaginatedRefundsDto
    implements Built<PaginatedRefundsDto, PaginatedRefundsDtoBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<RefundResponseDto> get items;

  @BuiltValueField(wireName: r'nextCursor')
  String? get nextCursor;

  PaginatedRefundsDto._();

  factory PaginatedRefundsDto([void updates(PaginatedRefundsDtoBuilder b)]) =
      _$PaginatedRefundsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedRefundsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedRefundsDto> get serializer =>
      _$PaginatedRefundsDtoSerializer();
}

class _$PaginatedRefundsDtoSerializer
    implements PrimitiveSerializer<PaginatedRefundsDto> {
  @override
  final Iterable<Type> types = const [
    PaginatedRefundsDto,
    _$PaginatedRefundsDto
  ];

  @override
  final String wireName = r'PaginatedRefundsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedRefundsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(RefundResponseDto)]),
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
    PaginatedRefundsDto object, {
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
    required PaginatedRefundsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(RefundResponseDto)]),
          ) as BuiltList<RefundResponseDto>;
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
  PaginatedRefundsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedRefundsDtoBuilder();
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
