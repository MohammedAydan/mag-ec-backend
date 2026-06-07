//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/create_shipment_item_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_shipment_dto.g.dart';

/// CreateShipmentDto
///
/// Properties:
/// * [items] - Shipment line items
/// * [carrierKey] - Carrier service key (e.g., ups_ground)
/// * [carrierName] - Human-readable carrier name
/// * [trackingNumber] - Shipment tracking number
/// * [trackingUrl] - Tracking URL for the shipment
/// * [notes] - Internal notes about the shipment
@BuiltValue()
abstract class CreateShipmentDto
    implements Built<CreateShipmentDto, CreateShipmentDtoBuilder> {
  /// Shipment line items
  @BuiltValueField(wireName: r'items')
  BuiltList<CreateShipmentItemDto> get items;

  /// Carrier service key (e.g., ups_ground)
  @BuiltValueField(wireName: r'carrierKey')
  String? get carrierKey;

  /// Human-readable carrier name
  @BuiltValueField(wireName: r'carrierName')
  String? get carrierName;

  /// Shipment tracking number
  @BuiltValueField(wireName: r'trackingNumber')
  String? get trackingNumber;

  /// Tracking URL for the shipment
  @BuiltValueField(wireName: r'trackingUrl')
  String? get trackingUrl;

  /// Internal notes about the shipment
  @BuiltValueField(wireName: r'notes')
  String? get notes;

  CreateShipmentDto._();

  factory CreateShipmentDto([void updates(CreateShipmentDtoBuilder b)]) =
      _$CreateShipmentDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateShipmentDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateShipmentDto> get serializer =>
      _$CreateShipmentDtoSerializer();
}

class _$CreateShipmentDtoSerializer
    implements PrimitiveSerializer<CreateShipmentDto> {
  @override
  final Iterable<Type> types = const [CreateShipmentDto, _$CreateShipmentDto];

  @override
  final String wireName = r'CreateShipmentDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateShipmentDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(CreateShipmentItemDto)]),
    );
    if (object.carrierKey != null) {
      yield r'carrierKey';
      yield serializers.serialize(
        object.carrierKey,
        specifiedType: const FullType(String),
      );
    }
    if (object.carrierName != null) {
      yield r'carrierName';
      yield serializers.serialize(
        object.carrierName,
        specifiedType: const FullType(String),
      );
    }
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
    CreateShipmentDto object, {
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
    required CreateShipmentDtoBuilder result,
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
                const FullType(BuiltList, [FullType(CreateShipmentItemDto)]),
          ) as BuiltList<CreateShipmentItemDto>;
          result.items.replace(valueDes);
          break;
        case r'carrierKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.carrierKey = valueDes;
          break;
        case r'carrierName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.carrierName = valueDes;
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
  CreateShipmentDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateShipmentDtoBuilder();
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
