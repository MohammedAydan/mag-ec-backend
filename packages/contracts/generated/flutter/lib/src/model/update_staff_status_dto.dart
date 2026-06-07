//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_staff_status_dto.g.dart';

/// UpdateStaffStatusDto
///
/// Properties:
/// * [status] - New staff account status
@BuiltValue()
abstract class UpdateStaffStatusDto
    implements Built<UpdateStaffStatusDto, UpdateStaffStatusDtoBuilder> {
  /// New staff account status
  @BuiltValueField(wireName: r'status')
  UpdateStaffStatusDtoStatusEnum get status;
  // enum statusEnum {  ACTIVE,  SUSPENDED,  DISABLED,  };

  UpdateStaffStatusDto._();

  factory UpdateStaffStatusDto([void updates(UpdateStaffStatusDtoBuilder b)]) =
      _$UpdateStaffStatusDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateStaffStatusDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateStaffStatusDto> get serializer =>
      _$UpdateStaffStatusDtoSerializer();
}

class _$UpdateStaffStatusDtoSerializer
    implements PrimitiveSerializer<UpdateStaffStatusDto> {
  @override
  final Iterable<Type> types = const [
    UpdateStaffStatusDto,
    _$UpdateStaffStatusDto
  ];

  @override
  final String wireName = r'UpdateStaffStatusDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateStaffStatusDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(UpdateStaffStatusDtoStatusEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateStaffStatusDto object, {
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
    required UpdateStaffStatusDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UpdateStaffStatusDtoStatusEnum),
          ) as UpdateStaffStatusDtoStatusEnum;
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
  UpdateStaffStatusDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateStaffStatusDtoBuilder();
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

class UpdateStaffStatusDtoStatusEnum extends EnumClass {
  /// New staff account status
  @BuiltValueEnumConst(wireName: r'ACTIVE')
  static const UpdateStaffStatusDtoStatusEnum ACTIVE =
      _$updateStaffStatusDtoStatusEnum_ACTIVE;

  /// New staff account status
  @BuiltValueEnumConst(wireName: r'SUSPENDED')
  static const UpdateStaffStatusDtoStatusEnum SUSPENDED =
      _$updateStaffStatusDtoStatusEnum_SUSPENDED;

  /// New staff account status
  @BuiltValueEnumConst(wireName: r'DISABLED')
  static const UpdateStaffStatusDtoStatusEnum DISABLED =
      _$updateStaffStatusDtoStatusEnum_DISABLED;

  static Serializer<UpdateStaffStatusDtoStatusEnum> get serializer =>
      _$updateStaffStatusDtoStatusEnumSerializer;

  const UpdateStaffStatusDtoStatusEnum._(String name) : super(name);

  static BuiltSet<UpdateStaffStatusDtoStatusEnum> get values =>
      _$updateStaffStatusDtoStatusEnumValues;
  static UpdateStaffStatusDtoStatusEnum valueOf(String name) =>
      _$updateStaffStatusDtoStatusEnumValueOf(name);
}
