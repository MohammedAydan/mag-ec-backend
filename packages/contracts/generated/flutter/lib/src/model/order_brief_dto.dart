//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_brief_dto.g.dart';

/// OrderBriefDto
///
/// Properties:
/// * [orderNumber]
/// * [paymentStatus]
/// * [status]
@BuiltValue()
abstract class OrderBriefDto
    implements Built<OrderBriefDto, OrderBriefDtoBuilder> {
  @BuiltValueField(wireName: r'orderNumber')
  String get orderNumber;

  @BuiltValueField(wireName: r'paymentStatus')
  String get paymentStatus;

  @BuiltValueField(wireName: r'status')
  String get status;

  OrderBriefDto._();

  factory OrderBriefDto([void updates(OrderBriefDtoBuilder b)]) =
      _$OrderBriefDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrderBriefDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrderBriefDto> get serializer =>
      _$OrderBriefDtoSerializer();
}

class _$OrderBriefDtoSerializer implements PrimitiveSerializer<OrderBriefDto> {
  @override
  final Iterable<Type> types = const [OrderBriefDto, _$OrderBriefDto];

  @override
  final String wireName = r'OrderBriefDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrderBriefDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'orderNumber';
    yield serializers.serialize(
      object.orderNumber,
      specifiedType: const FullType(String),
    );
    yield r'paymentStatus';
    yield serializers.serialize(
      object.paymentStatus,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    OrderBriefDto object, {
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
    required OrderBriefDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'orderNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.orderNumber = valueDes;
          break;
        case r'paymentStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.paymentStatus = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrderBriefDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrderBriefDtoBuilder();
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
