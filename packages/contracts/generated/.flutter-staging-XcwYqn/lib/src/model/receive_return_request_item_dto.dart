//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'receive_return_request_item_dto.g.dart';

/// ReceiveReturnRequestItemDto
///
/// Properties:
/// * [returnRequestItemId] - Return request item identifier
/// * [receivedQuantity] - Quantity actually received
/// * [finalDisposition] - Final disposition after inspection
/// * [warehouseId] - Warehouse identifier for restocking
/// * [conditionNotes] - Condition notes after inspection
@BuiltValue()
abstract class ReceiveReturnRequestItemDto implements Built<ReceiveReturnRequestItemDto, ReceiveReturnRequestItemDtoBuilder> {
  /// Return request item identifier
  @BuiltValueField(wireName: r'returnRequestItemId')
  String get returnRequestItemId;

  /// Quantity actually received
  @BuiltValueField(wireName: r'receivedQuantity')
  num get receivedQuantity;

  /// Final disposition after inspection
  @BuiltValueField(wireName: r'finalDisposition')
  ReceiveReturnRequestItemDtoFinalDispositionEnum get finalDisposition;
  // enum finalDispositionEnum {  RESTOCK,  INSPECT,  DISCARD,  };

  /// Warehouse identifier for restocking
  @BuiltValueField(wireName: r'warehouseId')
  String? get warehouseId;

  /// Condition notes after inspection
  @BuiltValueField(wireName: r'conditionNotes')
  String? get conditionNotes;

  ReceiveReturnRequestItemDto._();

  factory ReceiveReturnRequestItemDto([void updates(ReceiveReturnRequestItemDtoBuilder b)]) = _$ReceiveReturnRequestItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReceiveReturnRequestItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReceiveReturnRequestItemDto> get serializer => _$ReceiveReturnRequestItemDtoSerializer();
}

class _$ReceiveReturnRequestItemDtoSerializer implements PrimitiveSerializer<ReceiveReturnRequestItemDto> {
  @override
  final Iterable<Type> types = const [ReceiveReturnRequestItemDto, _$ReceiveReturnRequestItemDto];

  @override
  final String wireName = r'ReceiveReturnRequestItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReceiveReturnRequestItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'returnRequestItemId';
    yield serializers.serialize(
      object.returnRequestItemId,
      specifiedType: const FullType(String),
    );
    yield r'receivedQuantity';
    yield serializers.serialize(
      object.receivedQuantity,
      specifiedType: const FullType(num),
    );
    yield r'finalDisposition';
    yield serializers.serialize(
      object.finalDisposition,
      specifiedType: const FullType(ReceiveReturnRequestItemDtoFinalDispositionEnum),
    );
    if (object.warehouseId != null) {
      yield r'warehouseId';
      yield serializers.serialize(
        object.warehouseId,
        specifiedType: const FullType(String),
      );
    }
    if (object.conditionNotes != null) {
      yield r'conditionNotes';
      yield serializers.serialize(
        object.conditionNotes,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReceiveReturnRequestItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReceiveReturnRequestItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'returnRequestItemId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.returnRequestItemId = valueDes;
          break;
        case r'receivedQuantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.receivedQuantity = valueDes;
          break;
        case r'finalDisposition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReceiveReturnRequestItemDtoFinalDispositionEnum),
          ) as ReceiveReturnRequestItemDtoFinalDispositionEnum;
          result.finalDisposition = valueDes;
          break;
        case r'warehouseId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.warehouseId = valueDes;
          break;
        case r'conditionNotes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.conditionNotes = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReceiveReturnRequestItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReceiveReturnRequestItemDtoBuilder();
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

class ReceiveReturnRequestItemDtoFinalDispositionEnum extends EnumClass {

  /// Final disposition after inspection
  @BuiltValueEnumConst(wireName: r'RESTOCK')
  static const ReceiveReturnRequestItemDtoFinalDispositionEnum RESTOCK = _$receiveReturnRequestItemDtoFinalDispositionEnum_RESTOCK;
  /// Final disposition after inspection
  @BuiltValueEnumConst(wireName: r'INSPECT')
  static const ReceiveReturnRequestItemDtoFinalDispositionEnum INSPECT = _$receiveReturnRequestItemDtoFinalDispositionEnum_INSPECT;
  /// Final disposition after inspection
  @BuiltValueEnumConst(wireName: r'DISCARD')
  static const ReceiveReturnRequestItemDtoFinalDispositionEnum DISCARD = _$receiveReturnRequestItemDtoFinalDispositionEnum_DISCARD;

  static Serializer<ReceiveReturnRequestItemDtoFinalDispositionEnum> get serializer => _$receiveReturnRequestItemDtoFinalDispositionEnumSerializer;

  const ReceiveReturnRequestItemDtoFinalDispositionEnum._(String name): super(name);

  static BuiltSet<ReceiveReturnRequestItemDtoFinalDispositionEnum> get values => _$receiveReturnRequestItemDtoFinalDispositionEnumValues;
  static ReceiveReturnRequestItemDtoFinalDispositionEnum valueOf(String name) => _$receiveReturnRequestItemDtoFinalDispositionEnumValueOf(name);
}

