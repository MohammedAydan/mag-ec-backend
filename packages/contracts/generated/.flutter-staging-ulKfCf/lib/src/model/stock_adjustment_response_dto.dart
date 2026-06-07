//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stock_adjustment_response_dto.g.dart';

/// StockAdjustmentResponseDto
///
/// Properties:
/// * [id] 
/// * [warehouseId] 
/// * [variantId] 
/// * [type] 
/// * [quantityChanged] 
/// * [createdAt] 
/// * [referenceType] 
/// * [referenceId] 
/// * [actorUserId] 
@BuiltValue()
abstract class StockAdjustmentResponseDto implements Built<StockAdjustmentResponseDto, StockAdjustmentResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'warehouseId')
  String get warehouseId;

  @BuiltValueField(wireName: r'variantId')
  String get variantId;

  @BuiltValueField(wireName: r'type')
  String get type;

  @BuiltValueField(wireName: r'quantityChanged')
  num get quantityChanged;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'referenceType')
  String? get referenceType;

  @BuiltValueField(wireName: r'referenceId')
  String? get referenceId;

  @BuiltValueField(wireName: r'actorUserId')
  String? get actorUserId;

  StockAdjustmentResponseDto._();

  factory StockAdjustmentResponseDto([void updates(StockAdjustmentResponseDtoBuilder b)]) = _$StockAdjustmentResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StockAdjustmentResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StockAdjustmentResponseDto> get serializer => _$StockAdjustmentResponseDtoSerializer();
}

class _$StockAdjustmentResponseDtoSerializer implements PrimitiveSerializer<StockAdjustmentResponseDto> {
  @override
  final Iterable<Type> types = const [StockAdjustmentResponseDto, _$StockAdjustmentResponseDto];

  @override
  final String wireName = r'StockAdjustmentResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StockAdjustmentResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'warehouseId';
    yield serializers.serialize(
      object.warehouseId,
      specifiedType: const FullType(String),
    );
    yield r'variantId';
    yield serializers.serialize(
      object.variantId,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(String),
    );
    yield r'quantityChanged';
    yield serializers.serialize(
      object.quantityChanged,
      specifiedType: const FullType(num),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(String),
    );
    if (object.referenceType != null) {
      yield r'referenceType';
      yield serializers.serialize(
        object.referenceType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.referenceId != null) {
      yield r'referenceId';
      yield serializers.serialize(
        object.referenceId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.actorUserId != null) {
      yield r'actorUserId';
      yield serializers.serialize(
        object.actorUserId,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    StockAdjustmentResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required StockAdjustmentResponseDtoBuilder result,
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
        case r'warehouseId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.warehouseId = valueDes;
          break;
        case r'variantId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.variantId = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'quantityChanged':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.quantityChanged = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'referenceType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.referenceType = valueDes;
          break;
        case r'referenceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.referenceId = valueDes;
          break;
        case r'actorUserId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.actorUserId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StockAdjustmentResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StockAdjustmentResponseDtoBuilder();
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

