//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'invite_staff_dto.g.dart';

/// InviteStaffDto
///
/// Properties:
/// * [email] - Email address of the staff member to invite
/// * [displayName] - Display name for the invited staff member
/// * [roleIds] - Role IDs to assign upon invitation
@BuiltValue()
abstract class InviteStaffDto implements Built<InviteStaffDto, InviteStaffDtoBuilder> {
  /// Email address of the staff member to invite
  @BuiltValueField(wireName: r'email')
  String get email;

  /// Display name for the invited staff member
  @BuiltValueField(wireName: r'displayName')
  String get displayName;

  /// Role IDs to assign upon invitation
  @BuiltValueField(wireName: r'roleIds')
  BuiltList<String> get roleIds;

  InviteStaffDto._();

  factory InviteStaffDto([void updates(InviteStaffDtoBuilder b)]) = _$InviteStaffDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InviteStaffDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InviteStaffDto> get serializer => _$InviteStaffDtoSerializer();
}

class _$InviteStaffDtoSerializer implements PrimitiveSerializer<InviteStaffDto> {
  @override
  final Iterable<Type> types = const [InviteStaffDto, _$InviteStaffDto];

  @override
  final String wireName = r'InviteStaffDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InviteStaffDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'displayName';
    yield serializers.serialize(
      object.displayName,
      specifiedType: const FullType(String),
    );
    yield r'roleIds';
    yield serializers.serialize(
      object.roleIds,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    InviteStaffDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InviteStaffDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'displayName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.displayName = valueDes;
          break;
        case r'roleIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.roleIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InviteStaffDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InviteStaffDtoBuilder();
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

