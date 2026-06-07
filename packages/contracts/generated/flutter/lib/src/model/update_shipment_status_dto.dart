//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_shipment_status_dto.g.dart';

/// UpdateShipmentStatusDto
///
/// Properties:
/// * [status]
/// * [trackingNumber]
/// * [trackingUrl]
/// * [notes]
@BuiltValue()
abstract class UpdateShipmentStatusDto
    implements Built<UpdateShipmentStatusDto, UpdateShipmentStatusDtoBuilder> {
  @BuiltValueField(wireName: r'status')
  UpdateShipmentStatusDtoStatusEnum get status;
  // enum statusEnum {  PENDING,  SHIPPED,  DELIVERED,  CANCELLED,  };

  @BuiltValueField(wireName: r'trackingNumber')
  String? get trackingNumber;

  @BuiltValueField(wireName: r'trackingUrl')
  String? get trackingUrl;

  @BuiltValueField(wireName: r'notes')
  String? get notes;

  UpdateShipmentStatusDto._();

  factory UpdateShipmentStatusDto(
          [void updates(UpdateShipmentStatusDtoBuilder b)]) =
      _$UpdateShipmentStatusDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateShipmentStatusDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateShipmentStatusDto> get serializer =>
      _$UpdateShipmentStatusDtoSerializer();
}

class _$UpdateShipmentStatusDtoSerializer
    implements PrimitiveSerializer<UpdateShipmentStatusDto> {
  @override
  final Iterable<Type> types = const [
    UpdateShipmentStatusDto,
    _$UpdateShipmentStatusDto
  ];

  @override
  final String wireName = r'UpdateShipmentStatusDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateShipmentStatusDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(UpdateShipmentStatusDtoStatusEnum),
    );
    if (object.trackingNumber != null) {
      yield r'trackingNumber';
      yield serializers.serialize(
        object.trackingNumber,
        specifiedType: const FullType(String),
      );
    }
    if (object.trackingUrl != null) {
      yield r'trackingUrl';
      yield serializers.serialize(
        object.trackingUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.notes != null) {
      yield r'notes';
      yield serializers.serialize(
        object.notes,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateShipmentStatusDto object, {
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
    required UpdateShipmentStatusDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UpdateShipmentStatusDtoStatusEnum),
          ) as UpdateShipmentStatusDtoStatusEnum;
          result.status = valueDes;
          break;
        case r'trackingNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.trackingNumber = valueDes;
          break;
        case r'trackingUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.trackingUrl = valueDes;
          break;
        case r'notes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.notes = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateShipmentStatusDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateShipmentStatusDtoBuilder();
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

class UpdateShipmentStatusDtoStatusEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'PENDING')
  static const UpdateShipmentStatusDtoStatusEnum PENDING =
      _$updateShipmentStatusDtoStatusEnum_PENDING;
  @BuiltValueEnumConst(wireName: r'SHIPPED')
  static const UpdateShipmentStatusDtoStatusEnum SHIPPED =
      _$updateShipmentStatusDtoStatusEnum_SHIPPED;
  @BuiltValueEnumConst(wireName: r'DELIVERED')
  static const UpdateShipmentStatusDtoStatusEnum DELIVERED =
      _$updateShipmentStatusDtoStatusEnum_DELIVERED;
  @BuiltValueEnumConst(wireName: r'CANCELLED')
  static const UpdateShipmentStatusDtoStatusEnum CANCELLED =
      _$updateShipmentStatusDtoStatusEnum_CANCELLED;

  static Serializer<UpdateShipmentStatusDtoStatusEnum> get serializer =>
      _$updateShipmentStatusDtoStatusEnumSerializer;

  const UpdateShipmentStatusDtoStatusEnum._(String name) : super(name);

  static BuiltSet<UpdateShipmentStatusDtoStatusEnum> get values =>
      _$updateShipmentStatusDtoStatusEnumValues;
  static UpdateShipmentStatusDtoStatusEnum valueOf(String name) =>
      _$updateShipmentStatusDtoStatusEnumValueOf(name);
}
