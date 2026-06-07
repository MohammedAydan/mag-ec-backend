//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_report_export_dto.g.dart';

/// CreateReportExportDto
///
/// Properties:
/// * [reportType] - Report type identifier (sales_summary, top_products, promotion_performance, inventory_kpis)
/// * [parameters] - Optional parameters to constrain the report scope
@BuiltValue()
abstract class CreateReportExportDto implements Built<CreateReportExportDto, CreateReportExportDtoBuilder> {
  /// Report type identifier (sales_summary, top_products, promotion_performance, inventory_kpis)
  @BuiltValueField(wireName: r'reportType')
  CreateReportExportDtoReportTypeEnum get reportType;
  // enum reportTypeEnum {  sales_summary,  top_products,  promotion_performance,  inventory_kpis,  };

  /// Optional parameters to constrain the report scope
  @BuiltValueField(wireName: r'parameters')
  JsonObject? get parameters;

  CreateReportExportDto._();

  factory CreateReportExportDto([void updates(CreateReportExportDtoBuilder b)]) = _$CreateReportExportDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateReportExportDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateReportExportDto> get serializer => _$CreateReportExportDtoSerializer();
}

class _$CreateReportExportDtoSerializer implements PrimitiveSerializer<CreateReportExportDto> {
  @override
  final Iterable<Type> types = const [CreateReportExportDto, _$CreateReportExportDto];

  @override
  final String wireName = r'CreateReportExportDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateReportExportDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'reportType';
    yield serializers.serialize(
      object.reportType,
      specifiedType: const FullType(CreateReportExportDtoReportTypeEnum),
    );
    if (object.parameters != null) {
      yield r'parameters';
      yield serializers.serialize(
        object.parameters,
        specifiedType: const FullType(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateReportExportDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateReportExportDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'reportType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreateReportExportDtoReportTypeEnum),
          ) as CreateReportExportDtoReportTypeEnum;
          result.reportType = valueDes;
          break;
        case r'parameters':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.parameters = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateReportExportDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateReportExportDtoBuilder();
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

class CreateReportExportDtoReportTypeEnum extends EnumClass {

  /// Report type identifier (sales_summary, top_products, promotion_performance, inventory_kpis)
  @BuiltValueEnumConst(wireName: r'sales_summary')
  static const CreateReportExportDtoReportTypeEnum salesSummary = _$createReportExportDtoReportTypeEnum_salesSummary;
  /// Report type identifier (sales_summary, top_products, promotion_performance, inventory_kpis)
  @BuiltValueEnumConst(wireName: r'top_products')
  static const CreateReportExportDtoReportTypeEnum topProducts = _$createReportExportDtoReportTypeEnum_topProducts;
  /// Report type identifier (sales_summary, top_products, promotion_performance, inventory_kpis)
  @BuiltValueEnumConst(wireName: r'promotion_performance')
  static const CreateReportExportDtoReportTypeEnum promotionPerformance = _$createReportExportDtoReportTypeEnum_promotionPerformance;
  /// Report type identifier (sales_summary, top_products, promotion_performance, inventory_kpis)
  @BuiltValueEnumConst(wireName: r'inventory_kpis')
  static const CreateReportExportDtoReportTypeEnum inventoryKpis = _$createReportExportDtoReportTypeEnum_inventoryKpis;

  static Serializer<CreateReportExportDtoReportTypeEnum> get serializer => _$createReportExportDtoReportTypeEnumSerializer;

  const CreateReportExportDtoReportTypeEnum._(String name): super(name);

  static BuiltSet<CreateReportExportDtoReportTypeEnum> get values => _$createReportExportDtoReportTypeEnumValues;
  static CreateReportExportDtoReportTypeEnum valueOf(String name) => _$createReportExportDtoReportTypeEnumValueOf(name);
}

