//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_return_request_item_dto.g.dart';

/// CreateReturnRequestItemDto
///
/// Properties:
/// * [orderLineId] - Order line identifier to return
/// * [quantity] - Quantity to return for this order line
/// * [requestedDisposition] - Requested disposition for the returned item
/// * [reason] - Reason for returning this specific item
@BuiltValue()
abstract class CreateReturnRequestItemDto
    implements
        Built<CreateReturnRequestItemDto, CreateReturnRequestItemDtoBuilder> {
  /// Order line identifier to return
  @BuiltValueField(wireName: r'orderLineId')
  String get orderLineId;

  /// Quantity to return for this order line
  @BuiltValueField(wireName: r'quantity')
  num get quantity;

  /// Requested disposition for the returned item
  @BuiltValueField(wireName: r'requestedDisposition')
  CreateReturnRequestItemDtoRequestedDispositionEnum? get requestedDisposition;
  // enum requestedDispositionEnum {  RESTOCK,  INSPECT,  DISCARD,  };

  /// Reason for returning this specific item
  @BuiltValueField(wireName: r'reason')
  String? get reason;

  CreateReturnRequestItemDto._();

  factory CreateReturnRequestItemDto(
          [void updates(CreateReturnRequestItemDtoBuilder b)]) =
      _$CreateReturnRequestItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateReturnRequestItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateReturnRequestItemDto> get serializer =>
      _$CreateReturnRequestItemDtoSerializer();
}

class _$CreateReturnRequestItemDtoSerializer
    implements PrimitiveSerializer<CreateReturnRequestItemDto> {
  @override
  final Iterable<Type> types = const [
    CreateReturnRequestItemDto,
    _$CreateReturnRequestItemDto
  ];

  @override
  final String wireName = r'CreateReturnRequestItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateReturnRequestItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'orderLineId';
    yield serializers.serialize(
      object.orderLineId,
      specifiedType: const FullType(String),
    );
    yield r'quantity';
    yield serializers.serialize(
      object.quantity,
      specifiedType: const FullType(num),
    );
    if (object.requestedDisposition != null) {
      yield r'requestedDisposition';
      yield serializers.serialize(
        object.requestedDisposition,
        specifiedType:
            const FullType(CreateReturnRequestItemDtoRequestedDispositionEnum),
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
    CreateReturnRequestItemDto object, {
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
    required CreateReturnRequestItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'orderLineId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.orderLineId = valueDes;
          break;
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.quantity = valueDes;
          break;
        case r'requestedDisposition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                CreateReturnRequestItemDtoRequestedDispositionEnum),
          ) as CreateReturnRequestItemDtoRequestedDispositionEnum;
          result.requestedDisposition = valueDes;
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
  CreateReturnRequestItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateReturnRequestItemDtoBuilder();
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

class CreateReturnRequestItemDtoRequestedDispositionEnum extends EnumClass {
  /// Requested disposition for the returned item
  @BuiltValueEnumConst(wireName: r'RESTOCK')
  static const CreateReturnRequestItemDtoRequestedDispositionEnum RESTOCK =
      _$createReturnRequestItemDtoRequestedDispositionEnum_RESTOCK;

  /// Requested disposition for the returned item
  @BuiltValueEnumConst(wireName: r'INSPECT')
  static const CreateReturnRequestItemDtoRequestedDispositionEnum INSPECT =
      _$createReturnRequestItemDtoRequestedDispositionEnum_INSPECT;

  /// Requested disposition for the returned item
  @BuiltValueEnumConst(wireName: r'DISCARD')
  static const CreateReturnRequestItemDtoRequestedDispositionEnum DISCARD =
      _$createReturnRequestItemDtoRequestedDispositionEnum_DISCARD;

  static Serializer<CreateReturnRequestItemDtoRequestedDispositionEnum>
      get serializer =>
          _$createReturnRequestItemDtoRequestedDispositionEnumSerializer;

  const CreateReturnRequestItemDtoRequestedDispositionEnum._(String name)
      : super(name);

  static BuiltSet<CreateReturnRequestItemDtoRequestedDispositionEnum>
      get values => _$createReturnRequestItemDtoRequestedDispositionEnumValues;
  static CreateReturnRequestItemDtoRequestedDispositionEnum valueOf(
          String name) =>
      _$createReturnRequestItemDtoRequestedDispositionEnumValueOf(name);
}
