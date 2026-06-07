// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_movement_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StockMovementItemDto extends StockMovementItemDto {
  @override
  final String id;
  @override
  final String type;
  @override
  final num quantityChanged;
  @override
  final String createdAt;
  @override
  final StockMovementVariantDto variant;
  @override
  final StockMovementWarehouseDto warehouse;
  @override
  final String? referenceType;
  @override
  final String? referenceId;
  @override
  final StockMovementActorDto? actorUser;

  factory _$StockMovementItemDto(
          [void Function(StockMovementItemDtoBuilder)? updates]) =>
      (StockMovementItemDtoBuilder()..update(updates))._build();

  _$StockMovementItemDto._(
      {required this.id,
      required this.type,
      required this.quantityChanged,
      required this.createdAt,
      required this.variant,
      required this.warehouse,
      this.referenceType,
      this.referenceId,
      this.actorUser})
      : super._();
  @override
  StockMovementItemDto rebuild(
          void Function(StockMovementItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockMovementItemDtoBuilder toBuilder() =>
      StockMovementItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockMovementItemDto &&
        id == other.id &&
        type == other.type &&
        quantityChanged == other.quantityChanged &&
        createdAt == other.createdAt &&
        variant == other.variant &&
        warehouse == other.warehouse &&
        referenceType == other.referenceType &&
        referenceId == other.referenceId &&
        actorUser == other.actorUser;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, quantityChanged.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, variant.hashCode);
    _$hash = $jc(_$hash, warehouse.hashCode);
    _$hash = $jc(_$hash, referenceType.hashCode);
    _$hash = $jc(_$hash, referenceId.hashCode);
    _$hash = $jc(_$hash, actorUser.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StockMovementItemDto')
          ..add('id', id)
          ..add('type', type)
          ..add('quantityChanged', quantityChanged)
          ..add('createdAt', createdAt)
          ..add('variant', variant)
          ..add('warehouse', warehouse)
          ..add('referenceType', referenceType)
          ..add('referenceId', referenceId)
          ..add('actorUser', actorUser))
        .toString();
  }
}

class StockMovementItemDtoBuilder
    implements Builder<StockMovementItemDto, StockMovementItemDtoBuilder> {
  _$StockMovementItemDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

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

  StockMovementVariantDtoBuilder? _variant;
  StockMovementVariantDtoBuilder get variant =>
      _$this._variant ??= StockMovementVariantDtoBuilder();
  set variant(StockMovementVariantDtoBuilder? variant) =>
      _$this._variant = variant;

  StockMovementWarehouseDtoBuilder? _warehouse;
  StockMovementWarehouseDtoBuilder get warehouse =>
      _$this._warehouse ??= StockMovementWarehouseDtoBuilder();
  set warehouse(StockMovementWarehouseDtoBuilder? warehouse) =>
      _$this._warehouse = warehouse;

  String? _referenceType;
  String? get referenceType => _$this._referenceType;
  set referenceType(String? referenceType) =>
      _$this._referenceType = referenceType;

  String? _referenceId;
  String? get referenceId => _$this._referenceId;
  set referenceId(String? referenceId) => _$this._referenceId = referenceId;

  StockMovementActorDtoBuilder? _actorUser;
  StockMovementActorDtoBuilder get actorUser =>
      _$this._actorUser ??= StockMovementActorDtoBuilder();
  set actorUser(StockMovementActorDtoBuilder? actorUser) =>
      _$this._actorUser = actorUser;

  StockMovementItemDtoBuilder() {
    StockMovementItemDto._defaults(this);
  }

  StockMovementItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _quantityChanged = $v.quantityChanged;
      _createdAt = $v.createdAt;
      _variant = $v.variant.toBuilder();
      _warehouse = $v.warehouse.toBuilder();
      _referenceType = $v.referenceType;
      _referenceId = $v.referenceId;
      _actorUser = $v.actorUser?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StockMovementItemDto other) {
    _$v = other as _$StockMovementItemDto;
  }

  @override
  void update(void Function(StockMovementItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockMovementItemDto build() => _build();

  _$StockMovementItemDto _build() {
    _$StockMovementItemDto _$result;
    try {
      _$result = _$v ??
          _$StockMovementItemDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'StockMovementItemDto', 'id'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'StockMovementItemDto', 'type'),
            quantityChanged: BuiltValueNullFieldError.checkNotNull(
                quantityChanged, r'StockMovementItemDto', 'quantityChanged'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'StockMovementItemDto', 'createdAt'),
            variant: variant.build(),
            warehouse: warehouse.build(),
            referenceType: referenceType,
            referenceId: referenceId,
            actorUser: _actorUser?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'variant';
        variant.build();
        _$failedField = 'warehouse';
        warehouse.build();

        _$failedField = 'actorUser';
        _actorUser?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'StockMovementItemDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
