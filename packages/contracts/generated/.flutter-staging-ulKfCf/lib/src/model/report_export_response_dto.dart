//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/report_export_user_brief_dto.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_export_response_dto.g.dart';

/// ReportExportResponseDto
///
/// Properties:
/// * [id] 
/// * [reportType] 
/// * [parametersJson] 
/// * [status] 
/// * [requestedByUserId] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [requestedBy] 
/// * [resultObjectKey] 
/// * [errorMessage] 
/// * [startedAt] 
/// * [completedAt] 
/// * [failedAt] 
@BuiltValue()
abstract class ReportExportResponseDto implements Built<ReportExportResponseDto, ReportExportResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'reportType')
  String get reportType;

  @BuiltValueField(wireName: r'parametersJson')
  JsonObject get parametersJson;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'requestedByUserId')
  String get requestedByUserId;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  @BuiltValueField(wireName: r'requestedBy')
  ReportExportUserBriefDto get requestedBy;

  @BuiltValueField(wireName: r'resultObjectKey')
  String? get resultObjectKey;

  @BuiltValueField(wireName: r'errorMessage')
  String? get errorMessage;

  @BuiltValueField(wireName: r'startedAt')
  String? get startedAt;

  @BuiltValueField(wireName: r'completedAt')
  String? get completedAt;

  @BuiltValueField(wireName: r'failedAt')
  String? get failedAt;

  ReportExportResponseDto._();

  factory ReportExportResponseDto([void updates(ReportExportResponseDtoBuilder b)]) = _$ReportExportResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReportExportResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReportExportResponseDto> get serializer => _$ReportExportResponseDtoSerializer();
}

class _$ReportExportResponseDtoSerializer implements PrimitiveSerializer<ReportExportResponseDto> {
  @override
  final Iterable<Type> types = const [ReportExportResponseDto, _$ReportExportResponseDto];

  @override
  final String wireName = r'ReportExportResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReportExportResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'reportType';
    yield serializers.serialize(
      object.reportType,
      specifiedType: const FullType(String),
    );
    yield r'parametersJson';
    yield serializers.serialize(
      object.parametersJson,
      specifiedType: const FullType(JsonObject),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'requestedByUserId';
    yield serializers.serialize(
      object.requestedByUserId,
      specifiedType: const FullType(String),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(String),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(String),
    );
    yield r'requestedBy';
    yield serializers.serialize(
      object.requestedBy,
      specifiedType: const FullType(ReportExportUserBriefDto),
    );
    if (object.resultObjectKey != null) {
      yield r'resultObjectKey';
      yield serializers.serialize(
        object.resultObjectKey,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.errorMessage != null) {
      yield r'errorMessage';
      yield serializers.serialize(
        object.errorMessage,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.startedAt != null) {
      yield r'startedAt';
      yield serializers.serialize(
        object.startedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.completedAt != null) {
      yield r'completedAt';
      yield serializers.serialize(
        object.completedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.failedAt != null) {
      yield r'failedAt';
      yield serializers.serialize(
        object.failedAt,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReportExportResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReportExportResponseDtoBuilder result,
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
        case r'reportType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reportType = valueDes;
          break;
        case r'parametersJson':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.parametersJson = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'requestedByUserId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.requestedByUserId = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.updatedAt = valueDes;
          break;
        case r'requestedBy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReportExportUserBriefDto),
          ) as ReportExportUserBriefDto;
          result.requestedBy.replace(valueDes);
          break;
        case r'resultObjectKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.resultObjectKey = valueDes;
          break;
        case r'errorMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMessage = valueDes;
          break;
        case r'startedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.startedAt = valueDes;
          break;
        case r'completedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.completedAt = valueDes;
          break;
        case r'failedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.failedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReportExportResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReportExportResponseDtoBuilder();
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

