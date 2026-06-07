//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/receive_return_request_item_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'receive_return_request_dto.g.dart';

/// ReceiveReturnRequestDto
///
/// Properties:
/// * [items] - List of received return items
@BuiltValue()
abstract class ReceiveReturnRequestDto
    implements Built<ReceiveReturnRequestDto, ReceiveReturnRequestDtoBuilder> {
  /// List of received return items
  @BuiltValueField(wireName: r'items')
  BuiltList<ReceiveReturnRequestItemDto> get items;

  ReceiveReturnRequestDto._();

  factory ReceiveReturnRequestDto(
          [void updates(ReceiveReturnRequestDtoBuilder b)]) =
      _$ReceiveReturnRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReceiveReturnRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReceiveReturnRequestDto> get serializer =>
      _$ReceiveReturnRequestDtoSerializer();
}

class _$ReceiveReturnRequestDtoSerializer
    implements PrimitiveSerializer<ReceiveReturnRequestDto> {
  @override
  final Iterable<Type> types = const [
    ReceiveReturnRequestDto,
    _$ReceiveReturnRequestDto
  ];

  @override
  final String wireName = r'ReceiveReturnRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReceiveReturnRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(ReceiveReturnRequestItemDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReceiveReturnRequestDto object, {
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
    required ReceiveReturnRequestDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(ReceiveReturnRequestItemDto)]),
          ) as BuiltList<ReceiveReturnRequestItemDto>;
          result.items.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReceiveReturnRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReceiveReturnRequestDtoBuilder();
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
