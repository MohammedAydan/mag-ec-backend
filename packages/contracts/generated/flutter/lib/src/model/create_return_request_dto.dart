//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/create_return_request_item_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_return_request_dto.g.dart';

/// CreateReturnRequestDto
///
/// Properties:
/// * [reason] - Overall reason for the return request
/// * [items] - List of order line items to return
/// * [notes] - Additional notes for the return request
@BuiltValue()
abstract class CreateReturnRequestDto
    implements Built<CreateReturnRequestDto, CreateReturnRequestDtoBuilder> {
  /// Overall reason for the return request
  @BuiltValueField(wireName: r'reason')
  String get reason;

  /// List of order line items to return
  @BuiltValueField(wireName: r'items')
  BuiltList<CreateReturnRequestItemDto> get items;

  /// Additional notes for the return request
  @BuiltValueField(wireName: r'notes')
  String? get notes;

  CreateReturnRequestDto._();

  factory CreateReturnRequestDto(
          [void updates(CreateReturnRequestDtoBuilder b)]) =
      _$CreateReturnRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateReturnRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateReturnRequestDto> get serializer =>
      _$CreateReturnRequestDtoSerializer();
}

class _$CreateReturnRequestDtoSerializer
    implements PrimitiveSerializer<CreateReturnRequestDto> {
  @override
  final Iterable<Type> types = const [
    CreateReturnRequestDto,
    _$CreateReturnRequestDto
  ];

  @override
  final String wireName = r'CreateReturnRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateReturnRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'reason';
    yield serializers.serialize(
      object.reason,
      specifiedType: const FullType(String),
    );
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType:
          const FullType(BuiltList, [FullType(CreateReturnRequestItemDto)]),
    );
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
    CreateReturnRequestDto object, {
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
    required CreateReturnRequestDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reason = valueDes;
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(CreateReturnRequestItemDto)]),
          ) as BuiltList<CreateReturnRequestItemDto>;
          result.items.replace(valueDes);
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
  CreateReturnRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateReturnRequestDtoBuilder();
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
