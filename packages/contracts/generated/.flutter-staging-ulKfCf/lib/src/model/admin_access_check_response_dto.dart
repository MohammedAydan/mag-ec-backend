//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_access_check_response_dto.g.dart';

/// AdminAccessCheckResponseDto
///
/// Properties:
/// * [allowed] 
@BuiltValue()
abstract class AdminAccessCheckResponseDto implements Built<AdminAccessCheckResponseDto, AdminAccessCheckResponseDtoBuilder> {
  @BuiltValueField(wireName: r'allowed')
  bool get allowed;

  AdminAccessCheckResponseDto._();

  factory AdminAccessCheckResponseDto([void updates(AdminAccessCheckResponseDtoBuilder b)]) = _$AdminAccessCheckResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminAccessCheckResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminAccessCheckResponseDto> get serializer => _$AdminAccessCheckResponseDtoSerializer();
}

class _$AdminAccessCheckResponseDtoSerializer implements PrimitiveSerializer<AdminAccessCheckResponseDto> {
  @override
  final Iterable<Type> types = const [AdminAccessCheckResponseDto, _$AdminAccessCheckResponseDto];

  @override
  final String wireName = r'AdminAccessCheckResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminAccessCheckResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'allowed';
    yield serializers.serialize(
      object.allowed,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminAccessCheckResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminAccessCheckResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'allowed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.allowed = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminAccessCheckResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminAccessCheckResponseDtoBuilder();
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

