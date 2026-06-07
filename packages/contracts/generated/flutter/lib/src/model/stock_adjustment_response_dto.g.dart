// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_adjustment_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StockAdjustmentResponseDto extends StockAdjustmentResponseDto {
  @override
  final String id;
  @override
  final String warehouseId;
  @override
  final String variantId;
  @override
  final String type;
  @override
  final num quantityChanged;
  @override
  final String createdAt;
  @override
  final String? referenceType;
  @override
  final String? referenceId;
  @override
  final String? actorUserId;

  factory _$StockAdjustmentResponseDto(
          [void Function(StockAdjustmentResponseDtoBuilder)? updates]) =>
      (StockAdjustmentResponseDtoBuilder()..update(updates))._build();

  _$StockAdjustmentResponseDto._(
      {required this.id,
      required this.warehouseId,
      required this.variantId,
      required this.type,
      required this.quantityChanged,
      required this.createdAt,
      this.referenceType,
      this.referenceId,
      this.actorUserId})
      : super._();
  @override
  StockAdjustmentResponseDto rebuild(
          void Function(StockAdjustmentResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockAdjustmentResponseDtoBuilder toBuilder() =>
      StockAdjustmentResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockAdjustmentResponseDto &&
        id == other.id &&
        warehouseId == other.warehouseId &&
        variantId == other.variantId &&
        type == other.type &&
        quantityChanged == other.quantityChanged &&
        createdAt == other.createdAt &&
        referenceType == other.referenceType &&
        referenceId == other.referenceId &&
        actorUserId == other.actorUserId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, warehouseId.hashCode);
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, quantityChanged.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, referenceType.hashCode);
    _$hash = $jc(_$hash, referenceId.hashCode);
    _$hash = $jc(_$hash, actorUserId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StockAdjustmentResponseDto')
          ..add('id', id)
          ..add('warehouseId', warehouseId)
          ..add('variantId', variantId)
          ..add('type', type)
          ..add('quantityChanged', quantityChanged)
          ..add('createdAt', createdAt)
          ..add('referenceType', referenceType)
          ..add('referenceId', referenceId)
          ..add('actorUserId', actorUserId))
        .toString();
  }
}

class StockAdjustmentResponseDtoBuilder
    implements
        Builder<StockAdjustmentResponseDto, StockAdjustmentResponseDtoBuilder> {
  _$StockAdjustmentResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _warehouseId;
  String? get warehouseId => _$this._warehouseId;
  set warehouseId(String? warehouseId) => _$this._warehouseId = warehouseId;

  String? _variantId;
  String? get variantId => _$this._variantId;
  set variantId(String? variantId) => _$this._variantId = variantId;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  num? _quantityChanged;
  num? get quantityChanged => _$this._quantityChanged;
  set quantityChanged(num? quantityChanged) =>
      _$this._quantityChanged = quantityChanged;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _referenceType;
  String? get referenceType => _$this._referenceType;
  set referenceType(String? referenceType) =>
      _$this._referenceType = referenceType;

  String? _referenceId;
  String? get referenceId => _$this._referenceId;
  set referenceId(String? referenceId) => _$this._referenceId = referenceId;

  String? _actorUserId;
  String? get actorUserId => _$this._actorUserId;
  set actorUserId(String? actorUserId) => _$this._actorUserId = actorUserId;

  StockAdjustmentResponseDtoBuilder() {
    StockAdjustmentResponseDto._defaults(this);
  }

  StockAdjustmentResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _warehouseId = $v.warehouseId;
      _variantId = $v.variantId;
      _type = $v.type;
      _quantityChanged = $v.quantityChanged;
      _createdAt = $v.createdAt;
      _referenceType = $v.referenceType;
      _referenceId = $v.referenceId;
      _actorUserId = $v.actorUserId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StockAdjustmentResponseDto other) {
    _$v = other as _$StockAdjustmentResponseDto;
  }

  @override
  void update(void Function(StockAdjustmentResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockAdjustmentResponseDto build() => _build();

  _$StockAdjustmentResponseDto _build() {
    final _$result = _$v ??
        _$StockAdjustmentResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'StockAdjustmentResponseDto', 'id'),
          warehouseId: BuiltValueNullFieldError.checkNotNull(
              warehouseId, r'StockAdjustmentResponseDto', 'warehouseId'),
          variantId: BuiltValueNullFieldError.checkNotNull(
              variantId, r'StockAdjustmentResponseDto', 'variantId'),
          type: BuiltValueNullFieldError.checkNotNull(
              type, r'StockAdjustmentResponseDto', 'type'),
          quantityChanged: BuiltValueNullFieldError.checkNotNull(
              quantityChanged,
              r'StockAdjustmentResponseDto',
              'quantityChanged'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'StockAdjustmentResponseDto', 'createdAt'),
          referenceType: referenceType,
          referenceId: referenceId,
          actorUserId: actorUserId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
