// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adjust_stock_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AdjustStockDtoTypeEnum _$adjustStockDtoTypeEnum_RECEIPT =
    const AdjustStockDtoTypeEnum._('RECEIPT');
const AdjustStockDtoTypeEnum _$adjustStockDtoTypeEnum_ADJUSTMENT =
    const AdjustStockDtoTypeEnum._('ADJUSTMENT');
const AdjustStockDtoTypeEnum _$adjustStockDtoTypeEnum_SALE =
    const AdjustStockDtoTypeEnum._('SALE');
const AdjustStockDtoTypeEnum _$adjustStockDtoTypeEnum_RETURN_RESTOCK =
    const AdjustStockDtoTypeEnum._('RETURN_RESTOCK');
const AdjustStockDtoTypeEnum _$adjustStockDtoTypeEnum_WASTE =
    const AdjustStockDtoTypeEnum._('WASTE');

AdjustStockDtoTypeEnum _$adjustStockDtoTypeEnumValueOf(String name) {
  switch (name) {
    case 'RECEIPT':
      return _$adjustStockDtoTypeEnum_RECEIPT;
    case 'ADJUSTMENT':
      return _$adjustStockDtoTypeEnum_ADJUSTMENT;
    case 'SALE':
      return _$adjustStockDtoTypeEnum_SALE;
    case 'RETURN_RESTOCK':
      return _$adjustStockDtoTypeEnum_RETURN_RESTOCK;
    case 'WASTE':
      return _$adjustStockDtoTypeEnum_WASTE;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AdjustStockDtoTypeEnum> _$adjustStockDtoTypeEnumValues =
    BuiltSet<AdjustStockDtoTypeEnum>(const <AdjustStockDtoTypeEnum>[
  _$adjustStockDtoTypeEnum_RECEIPT,
  _$adjustStockDtoTypeEnum_ADJUSTMENT,
  _$adjustStockDtoTypeEnum_SALE,
  _$adjustStockDtoTypeEnum_RETURN_RESTOCK,
  _$adjustStockDtoTypeEnum_WASTE,
]);

Serializer<AdjustStockDtoTypeEnum> _$adjustStockDtoTypeEnumSerializer =
    _$AdjustStockDtoTypeEnumSerializer();

class _$AdjustStockDtoTypeEnumSerializer
    implements PrimitiveSerializer<AdjustStockDtoTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'RECEIPT': 'RECEIPT',
    'ADJUSTMENT': 'ADJUSTMENT',
    'SALE': 'SALE',
    'RETURN_RESTOCK': 'RETURN_RESTOCK',
    'WASTE': 'WASTE',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'RECEIPT': 'RECEIPT',
    'ADJUSTMENT': 'ADJUSTMENT',
    'SALE': 'SALE',
    'RETURN_RESTOCK': 'RETURN_RESTOCK',
    'WASTE': 'WASTE',
  };

  @override
  final Iterable<Type> types = const <Type>[AdjustStockDtoTypeEnum];
  @override
  final String wireName = 'AdjustStockDtoTypeEnum';

  @override
  Object serialize(Serializers serializers, AdjustStockDtoTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AdjustStockDtoTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AdjustStockDtoTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AdjustStockDto extends AdjustStockDto {
  @override
  final String warehouseId;
  @override
  final String variantId;
  @override
  final num quantityChanged;
  @override
  final AdjustStockDtoTypeEnum type;
  @override
  final String? referenceType;
  @override
  final String? referenceId;
  @override
  final String? reason;

  factory _$AdjustStockDto([void Function(AdjustStockDtoBuilder)? updates]) =>
      (AdjustStockDtoBuilder()..update(updates))._build();

  _$AdjustStockDto._(
      {required this.warehouseId,
      required this.variantId,
      required this.quantityChanged,
      required this.type,
      this.referenceType,
      this.referenceId,
      this.reason})
      : super._();
  @override
  AdjustStockDto rebuild(void Function(AdjustStockDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdjustStockDtoBuilder toBuilder() => AdjustStockDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdjustStockDto &&
        warehouseId == other.warehouseId &&
        variantId == other.variantId &&
        quantityChanged == other.quantityChanged &&
        type == other.type &&
        referenceType == other.referenceType &&
        referenceId == other.referenceId &&
        reason == other.reason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, warehouseId.hashCode);
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, quantityChanged.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, referenceType.hashCode);
    _$hash = $jc(_$hash, referenceId.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdjustStockDto')
          ..add('warehouseId', warehouseId)
          ..add('variantId', variantId)
          ..add('quantityChanged', quantityChanged)
          ..add('type', type)
          ..add('referenceType', referenceType)
          ..add('referenceId', referenceId)
          ..add('reason', reason))
        .toString();
  }
}

class AdjustStockDtoBuilder
    implements Builder<AdjustStockDto, AdjustStockDtoBuilder> {
  _$AdjustStockDto? _$v;

  String? _warehouseId;
  String? get warehouseId => _$this._warehouseId;
  set warehouseId(String? warehouseId) => _$this._warehouseId = warehouseId;

  String? _variantId;
  String? get variantId => _$this._variantId;
  set variantId(String? variantId) => _$this._variantId = variantId;

  num? _quantityChanged;
  num? get quantityChanged => _$this._quantityChanged;
  set quantityChanged(num? quantityChanged) =>
      _$this._quantityChanged = quantityChanged;

  AdjustStockDtoTypeEnum? _type;
  AdjustStockDtoTypeEnum? get type => _$this._type;
  set type(AdjustStockDtoTypeEnum? type) => _$this._type = type;

  String? _referenceType;
  String? get referenceType => _$this._referenceType;
  set referenceType(String? referenceType) =>
      _$this._referenceType = referenceType;

  String? _referenceId;
  String? get referenceId => _$this._referenceId;
  set referenceId(String? referenceId) => _$this._referenceId = referenceId;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  AdjustStockDtoBuilder() {
    AdjustStockDto._defaults(this);
  }

  AdjustStockDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _warehouseId = $v.warehouseId;
      _variantId = $v.variantId;
      _quantityChanged = $v.quantityChanged;
      _type = $v.type;
      _referenceType = $v.referenceType;
      _referenceId = $v.referenceId;
      _reason = $v.reason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdjustStockDto other) {
    _$v = other as _$AdjustStockDto;
  }

  @override
  void update(void Function(AdjustStockDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdjustStockDto build() => _build();

  _$AdjustStockDto _build() {
    final _$result = _$v ??
        _$AdjustStockDto._(
          warehouseId: BuiltValueNullFieldError.checkNotNull(
              warehouseId, r'AdjustStockDto', 'warehouseId'),
          variantId: BuiltValueNullFieldError.checkNotNull(
              variantId, r'AdjustStockDto', 'variantId'),
          quantityChanged: BuiltValueNullFieldError.checkNotNull(
              quantityChanged, r'AdjustStockDto', 'quantityChanged'),
          type: BuiltValueNullFieldError.checkNotNull(
              type, r'AdjustStockDto', 'type'),
          referenceType: referenceType,
          referenceId: referenceId,
          reason: reason,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
