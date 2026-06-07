//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/pagination_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/stock_movement_item_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_stock_movements_dto.g.dart';

/// PaginatedStockMovementsDto
///
/// Properties:
/// * [items]
/// * [pagination]
@BuiltValue()
abstract class PaginatedStockMovementsDto
    implements
        Built<PaginatedStockMovementsDto, PaginatedStockMovementsDtoBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<StockMovementItemDto> get items;

  @BuiltValueField(wireName: r'pagination')
  PaginationDto get pagination;

  PaginatedStockMovementsDto._();

  factory PaginatedStockMovementsDto(
          [void updates(PaginatedStockMovementsDtoBuilder b)]) =
      _$PaginatedStockMovementsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedStockMovementsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedStockMovementsDto> get serializer =>
      _$PaginatedStockMovementsDtoSerializer();
}

class _$PaginatedStockMovementsDtoSerializer
    implements PrimitiveSerializer<PaginatedStockMovementsDto> {
  @override
  final Iterable<Type> types = const [
    PaginatedStockMovementsDto,
    _$PaginatedStockMovementsDto
  ];

  @override
  final String wireName = r'PaginatedStockMovementsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedStockMovementsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(StockMovementItemDto)]),
    );
    yield r'pagination';
    yield serializers.serialize(
      object.pagination,
      specifiedType: const FullType(PaginationDto),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PaginatedStockMovementsDto object, {
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
    required PaginatedStockMovementsDtoBuilder result,
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
                const FullType(BuiltList, [FullType(StockMovementItemDto)]),
          ) as BuiltList<StockMovementItemDto>;
          result.items.replace(valueDes);
          break;
        case r'pagination':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PaginationDto),
          ) as PaginationDto;
          result.pagination.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaginatedStockMovementsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedStockMovementsDtoBuilder();
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
