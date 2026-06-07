//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_export_user_brief_dto.g.dart';

/// ReportExportUserBriefDto
///
/// Properties:
/// * [id]
/// * [displayName]
/// * [userType]
@BuiltValue()
abstract class ReportExportUserBriefDto
    implements
        Built<ReportExportUserBriefDto, ReportExportUserBriefDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'displayName')
  String get displayName;

  @BuiltValueField(wireName: r'userType')
  String get userType;

  ReportExportUserBriefDto._();

  factory ReportExportUserBriefDto(
          [void updates(ReportExportUserBriefDtoBuilder b)]) =
      _$ReportExportUserBriefDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReportExportUserBriefDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReportExportUserBriefDto> get serializer =>
      _$ReportExportUserBriefDtoSerializer();
}

class _$ReportExportUserBriefDtoSerializer
    implements PrimitiveSerializer<ReportExportUserBriefDto> {
  @override
  final Iterable<Type> types = const [
    ReportExportUserBriefDto,
    _$ReportExportUserBriefDto
  ];

  @override
  final String wireName = r'ReportExportUserBriefDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReportExportUserBriefDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'displayName';
    yield serializers.serialize(
      object.displayName,
      specifiedType: const FullType(String),
    );
    yield r'userType';
    yield serializers.serialize(
      object.userType,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReportExportUserBriefDto object, {
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
    required ReportExportUserBriefDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'displayName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.displayName = valueDes;
          break;
        case r'userType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReportExportUserBriefDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReportExportUserBriefDtoBuilder();
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
