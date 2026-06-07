//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_export_download_response_dto.g.dart';

/// ReportExportDownloadResponseDto
///
/// Properties:
/// * [exportId]
/// * [downloadUrl]
/// * [expiresInSeconds]
@BuiltValue()
abstract class ReportExportDownloadResponseDto
    implements
        Built<ReportExportDownloadResponseDto,
            ReportExportDownloadResponseDtoBuilder> {
  @BuiltValueField(wireName: r'exportId')
  String get exportId;

  @BuiltValueField(wireName: r'downloadUrl')
  String get downloadUrl;

  @BuiltValueField(wireName: r'expiresInSeconds')
  num get expiresInSeconds;

  ReportExportDownloadResponseDto._();

  factory ReportExportDownloadResponseDto(
          [void updates(ReportExportDownloadResponseDtoBuilder b)]) =
      _$ReportExportDownloadResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReportExportDownloadResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReportExportDownloadResponseDto> get serializer =>
      _$ReportExportDownloadResponseDtoSerializer();
}

class _$ReportExportDownloadResponseDtoSerializer
    implements PrimitiveSerializer<ReportExportDownloadResponseDto> {
  @override
  final Iterable<Type> types = const [
    ReportExportDownloadResponseDto,
    _$ReportExportDownloadResponseDto
  ];

  @override
  final String wireName = r'ReportExportDownloadResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReportExportDownloadResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'exportId';
    yield serializers.serialize(
      object.exportId,
      specifiedType: const FullType(String),
    );
    yield r'downloadUrl';
    yield serializers.serialize(
      object.downloadUrl,
      specifiedType: const FullType(String),
    );
    yield r'expiresInSeconds';
    yield serializers.serialize(
      object.expiresInSeconds,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReportExportDownloadResponseDto object, {
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
    required ReportExportDownloadResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'exportId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.exportId = valueDes;
          break;
        case r'downloadUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.downloadUrl = valueDes;
          break;
        case r'expiresInSeconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.expiresInSeconds = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReportExportDownloadResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReportExportDownloadResponseDtoBuilder();
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
