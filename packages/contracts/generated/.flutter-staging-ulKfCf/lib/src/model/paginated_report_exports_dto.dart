//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/report_export_response_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_report_exports_dto.g.dart';

/// PaginatedReportExportsDto
///
/// Properties:
/// * [items] 
/// * [nextCursor] 
@BuiltValue()
abstract class PaginatedReportExportsDto implements Built<PaginatedReportExportsDto, PaginatedReportExportsDtoBuilder> {
  @BuiltValueField(wireName: r'items')
  BuiltList<ReportExportResponseDto> get items;

  @BuiltValueField(wireName: r'nextCursor')
  String? get nextCursor;

  PaginatedReportExportsDto._();

  factory PaginatedReportExportsDto([void updates(PaginatedReportExportsDtoBuilder b)]) = _$PaginatedReportExportsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedReportExportsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedReportExportsDto> get serializer => _$PaginatedReportExportsDtoSerializer();
}

class _$PaginatedReportExportsDtoSerializer implements PrimitiveSerializer<PaginatedReportExportsDto> {
  @override
  final Iterable<Type> types = const [PaginatedReportExportsDto, _$PaginatedReportExportsDto];

  @override
  final String wireName = r'PaginatedReportExportsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedReportExportsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(ReportExportResponseDto)]),
    );
    if (object.nextCursor != null) {
      yield r'nextCursor';
      yield serializers.serialize(
        object.nextCursor,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaginatedReportExportsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedReportExportsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ReportExportResponseDto)]),
          ) as BuiltList<ReportExportResponseDto>;
          result.items.replace(valueDes);
          break;
        case r'nextCursor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nextCursor = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaginatedReportExportsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedReportExportsDtoBuilder();
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

