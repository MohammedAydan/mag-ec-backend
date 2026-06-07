// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_report_export_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CreateReportExportDtoReportTypeEnum
    _$createReportExportDtoReportTypeEnum_salesSummary =
    const CreateReportExportDtoReportTypeEnum._('salesSummary');
const CreateReportExportDtoReportTypeEnum
    _$createReportExportDtoReportTypeEnum_topProducts =
    const CreateReportExportDtoReportTypeEnum._('topProducts');
const CreateReportExportDtoReportTypeEnum
    _$createReportExportDtoReportTypeEnum_promotionPerformance =
    const CreateReportExportDtoReportTypeEnum._('promotionPerformance');
const CreateReportExportDtoReportTypeEnum
    _$createReportExportDtoReportTypeEnum_inventoryKpis =
    const CreateReportExportDtoReportTypeEnum._('inventoryKpis');

CreateReportExportDtoReportTypeEnum
    _$createReportExportDtoReportTypeEnumValueOf(String name) {
  switch (name) {
    case 'salesSummary':
      return _$createReportExportDtoReportTypeEnum_salesSummary;
    case 'topProducts':
      return _$createReportExportDtoReportTypeEnum_topProducts;
    case 'promotionPerformance':
      return _$createReportExportDtoReportTypeEnum_promotionPerformance;
    case 'inventoryKpis':
      return _$createReportExportDtoReportTypeEnum_inventoryKpis;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<CreateReportExportDtoReportTypeEnum>
    _$createReportExportDtoReportTypeEnumValues = BuiltSet<
        CreateReportExportDtoReportTypeEnum>(const <CreateReportExportDtoReportTypeEnum>[
  _$createReportExportDtoReportTypeEnum_salesSummary,
  _$createReportExportDtoReportTypeEnum_topProducts,
  _$createReportExportDtoReportTypeEnum_promotionPerformance,
  _$createReportExportDtoReportTypeEnum_inventoryKpis,
]);

Serializer<CreateReportExportDtoReportTypeEnum>
    _$createReportExportDtoReportTypeEnumSerializer =
    _$CreateReportExportDtoReportTypeEnumSerializer();

class _$CreateReportExportDtoReportTypeEnumSerializer
    implements PrimitiveSerializer<CreateReportExportDtoReportTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'salesSummary': 'sales_summary',
    'topProducts': 'top_products',
    'promotionPerformance': 'promotion_performance',
    'inventoryKpis': 'inventory_kpis',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'sales_summary': 'salesSummary',
    'top_products': 'topProducts',
    'promotion_performance': 'promotionPerformance',
    'inventory_kpis': 'inventoryKpis',
  };

  @override
  final Iterable<Type> types = const <Type>[
    CreateReportExportDtoReportTypeEnum
  ];
  @override
  final String wireName = 'CreateReportExportDtoReportTypeEnum';

  @override
  Object serialize(
          Serializers serializers, CreateReportExportDtoReportTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CreateReportExportDtoReportTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CreateReportExportDtoReportTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CreateReportExportDto extends CreateReportExportDto {
  @override
  final CreateReportExportDtoReportTypeEnum reportType;
  @override
  final JsonObject? parameters;

  factory _$CreateReportExportDto(
          [void Function(CreateReportExportDtoBuilder)? updates]) =>
      (CreateReportExportDtoBuilder()..update(updates))._build();

  _$CreateReportExportDto._({required this.reportType, this.parameters})
      : super._();
  @override
  CreateReportExportDto rebuild(
          void Function(CreateReportExportDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateReportExportDtoBuilder toBuilder() =>
      CreateReportExportDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateReportExportDto &&
        reportType == other.reportType &&
        parameters == other.parameters;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reportType.hashCode);
    _$hash = $jc(_$hash, parameters.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateReportExportDto')
          ..add('reportType', reportType)
          ..add('parameters', parameters))
        .toString();
  }
}

class CreateReportExportDtoBuilder
    implements Builder<CreateReportExportDto, CreateReportExportDtoBuilder> {
  _$CreateReportExportDto? _$v;

  CreateReportExportDtoReportTypeEnum? _reportType;
  CreateReportExportDtoReportTypeEnum? get reportType => _$this._reportType;
  set reportType(CreateReportExportDtoReportTypeEnum? reportType) =>
      _$this._reportType = reportType;

  JsonObject? _parameters;
  JsonObject? get parameters => _$this._parameters;
  set parameters(JsonObject? parameters) => _$this._parameters = parameters;

  CreateReportExportDtoBuilder() {
    CreateReportExportDto._defaults(this);
  }

  CreateReportExportDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reportType = $v.reportType;
      _parameters = $v.parameters;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateReportExportDto other) {
    _$v = other as _$CreateReportExportDto;
  }

  @override
  void update(void Function(CreateReportExportDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateReportExportDto build() => _build();

  _$CreateReportExportDto _build() {
    final _$result = _$v ??
        _$CreateReportExportDto._(
          reportType: BuiltValueNullFieldError.checkNotNull(
              reportType, r'CreateReportExportDto', 'reportType'),
          parameters: parameters,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
