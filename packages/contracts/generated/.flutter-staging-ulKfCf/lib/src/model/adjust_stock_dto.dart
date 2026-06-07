//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'adjust_stock_dto.g.dart';

/// AdjustStockDto
///
/// Properties:
/// * [warehouseId] - Warehouse identifier
/// * [variantId] - Catalog variant identifier
/// * [quantityChanged] - Quantity change (positive or negative, must not be zero)
/// * [type] - Movement type
/// * [referenceType] - Reference type for traceability (e.g. order, return)
/// * [referenceId] - Reference identifier for traceability
/// * [reason] - Human-readable reason for the adjustment
@BuiltValue()
abstract class AdjustStockDto implements Built<AdjustStockDto, AdjustStockDtoBuilder> {
  /// Warehouse identifier
  @BuiltValueField(wireName: r'warehouseId')
  String get warehouseId;

  /// Catalog variant identifier
  @BuiltValueField(wireName: r'variantId')
  String get variantId;

  /// Quantity change (positive or negative, must not be zero)
  @BuiltValueField(wireName: r'quantityChanged')
  num get quantityChanged;

  /// Movement type
  @BuiltValueField(wireName: r'type')
  AdjustStockDtoTypeEnum get type;
  // enum typeEnum {  RECEIPT,  ADJUSTMENT,  SALE,  RETURN_RESTOCK,  WASTE,  };

  /// Reference type for traceability (e.g. order, return)
  @BuiltValueField(wireName: r'referenceType')
  String? get referenceType;

  /// Reference identifier for traceability
  @BuiltValueField(wireName: r'referenceId')
  String? get referenceId;

  /// Human-readable reason for the adjustment
  @BuiltValueField(wireName: r'reason')
  String? get reason;

  AdjustStockDto._();

  factory AdjustStockDto([void updates(AdjustStockDtoBuilder b)]) = _$AdjustStockDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdjustStockDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdjustStockDto> get serializer => _$AdjustStockDtoSerializer();
}

class _$AdjustStockDtoSerializer implements PrimitiveSerializer<AdjustStockDto> {
  @override
  final Iterable<Type> types = const [AdjustStockDto, _$AdjustStockDto];

  @override
  final String wireName = r'AdjustStockDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdjustStockDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    yield r'quantityChanged';
    yield serializers.serialize(
      object.quantityChanged,
      specifiedType: const FullType(num),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(AdjustStockDtoTypeEnum),
    );
    if (object.referenceType != null) {
      yield r'referenceType';
      yield serializers.serialize(
        object.referenceType,
        specifiedType: const FullType(String),
      );
    }
    if (object.referenceId != null) {
      yield r'referenceId';
      yield serializers.serialize(
        object.referenceId,
        specifiedType: const FullType(String),
      );
    }
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
    AdjustStockDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdjustStockDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'quantityChanged':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.quantityChanged = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdjustStockDtoTypeEnum),
          ) as AdjustStockDtoTypeEnum;
          result.type = valueDes;
          break;
        case r'referenceType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.referenceType = valueDes;
          break;
        case r'referenceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.referenceId = valueDes;
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
  AdjustStockDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdjustStockDtoBuilder();
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

class AdjustStockDtoTypeEnum extends EnumClass {

  /// Movement type
  @BuiltValueEnumConst(wireName: r'RECEIPT')
  static const AdjustStockDtoTypeEnum RECEIPT = _$adjustStockDtoTypeEnum_RECEIPT;
  /// Movement type
  @BuiltValueEnumConst(wireName: r'ADJUSTMENT')
  static const AdjustStockDtoTypeEnum ADJUSTMENT = _$adjustStockDtoTypeEnum_ADJUSTMENT;
  /// Movement type
  @BuiltValueEnumConst(wireName: r'SALE')
  static const AdjustStockDtoTypeEnum SALE = _$adjustStockDtoTypeEnum_SALE;
  /// Movement type
  @BuiltValueEnumConst(wireName: r'RETURN_RESTOCK')
  static const AdjustStockDtoTypeEnum RETURN_RESTOCK = _$adjustStockDtoTypeEnum_RETURN_RESTOCK;
  /// Movement type
  @BuiltValueEnumConst(wireName: r'WASTE')
  static const AdjustStockDtoTypeEnum WASTE = _$adjustStockDtoTypeEnum_WASTE;

  static Serializer<AdjustStockDtoTypeEnum> get serializer => _$adjustStockDtoTypeEnumSerializer;

  const AdjustStockDtoTypeEnum._(String name): super(name);

  static BuiltSet<AdjustStockDtoTypeEnum> get values => _$adjustStockDtoTypeEnumValues;
  static AdjustStockDtoTypeEnum valueOf(String name) => _$adjustStockDtoTypeEnumValueOf(name);
}

