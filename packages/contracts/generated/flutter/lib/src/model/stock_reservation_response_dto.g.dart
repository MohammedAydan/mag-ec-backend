// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_reservation_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StockReservationResponseDto extends StockReservationResponseDto {
  @override
  final String id;
  @override
  final String warehouseId;
  @override
  final String variantId;
  @override
  final num quantity;
  @override
  final String status;
  @override
  final String createdAt;
  @override
  final StockReservationWarehouseDto warehouse;
  @override
  final StockReservationVariantDto variant;
  @override
  final String? expiresAt;
  @override
  final StockReservationUserDto? user;

  factory _$StockReservationResponseDto(
          [void Function(StockReservationResponseDtoBuilder)? updates]) =>
      (StockReservationResponseDtoBuilder()..update(updates))._build();

  _$StockReservationResponseDto._(
      {required this.id,
      required this.warehouseId,
      required this.variantId,
      required this.quantity,
      required this.status,
      required this.createdAt,
      required this.warehouse,
      required this.variant,
      this.expiresAt,
      this.user})
      : super._();
  @override
  StockReservationResponseDto rebuild(
          void Function(StockReservationResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockReservationResponseDtoBuilder toBuilder() =>
      StockReservationResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockReservationResponseDto &&
        id == other.id &&
        warehouseId == other.warehouseId &&
        variantId == other.variantId &&
        quantity == other.quantity &&
        status == other.status &&
        createdAt == other.createdAt &&
        warehouse == other.warehouse &&
        variant == other.variant &&
        expiresAt == other.expiresAt &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, warehouseId.hashCode);
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, warehouse.hashCode);
    _$hash = $jc(_$hash, variant.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StockReservationResponseDto')
          ..add('id', id)
          ..add('warehouseId', warehouseId)
          ..add('variantId', variantId)
          ..add('quantity', quantity)
          ..add('status', status)
          ..add('createdAt', createdAt)
          ..add('warehouse', warehouse)
          ..add('variant', variant)
          ..add('expiresAt', expiresAt)
          ..add('user', user))
        .toString();
  }
}

class StockReservationResponseDtoBuilder
    implements
        Builder<StockReservationResponseDto,
            StockReservationResponseDtoBuilder> {
  _$StockReservationResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _warehouseId;
  String? get warehouseId => _$this._warehouseId;
  set warehouseId(String? warehouseId) => _$this._warehouseId = warehouseId;

  String? _variantId;
  String? get variantId => _$this._variantId;
  set variantId(String? variantId) => _$this._variantId = variantId;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  StockReservationWarehouseDtoBuilder? _warehouse;
  StockReservationWarehouseDtoBuilder get warehouse =>
      _$this._warehouse ??= StockReservationWarehouseDtoBuilder();
  set warehouse(StockReservationWarehouseDtoBuilder? warehouse) =>
      _$this._warehouse = warehouse;

  StockReservationVariantDtoBuilder? _variant;
  StockReservationVariantDtoBuilder get variant =>
      _$this._variant ??= StockReservationVariantDtoBuilder();
  set variant(StockReservationVariantDtoBuilder? variant) =>
      _$this._variant = variant;

  String? _expiresAt;
  String? get expiresAt => _$this._expiresAt;
  set expiresAt(String? expiresAt) => _$this._expiresAt = expiresAt;

  StockReservationUserDtoBuilder? _user;
  StockReservationUserDtoBuilder get user =>
      _$this._user ??= StockReservationUserDtoBuilder();
  set user(StockReservationUserDtoBuilder? user) => _$this._user = user;

  StockReservationResponseDtoBuilder() {
    StockReservationResponseDto._defaults(this);
  }

  StockReservationResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _warehouseId = $v.warehouseId;
      _variantId = $v.variantId;
      _quantity = $v.quantity;
      _status = $v.status;
      _createdAt = $v.createdAt;
      _warehouse = $v.warehouse.toBuilder();
      _variant = $v.variant.toBuilder();
      _expiresAt = $v.expiresAt;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StockReservationResponseDto other) {
    _$v = other as _$StockReservationResponseDto;
  }

  @override
  void update(void Function(StockReservationResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockReservationResponseDto build() => _build();

  _$StockReservationResponseDto _build() {
    _$StockReservationResponseDto _$result;
    try {
      _$result = _$v ??
          _$StockReservationResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'StockReservationResponseDto', 'id'),
            warehouseId: BuiltValueNullFieldError.checkNotNull(
                warehouseId, r'StockReservationResponseDto', 'warehouseId'),
            variantId: BuiltValueNullFieldError.checkNotNull(
                variantId, r'StockReservationResponseDto', 'variantId'),
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, r'StockReservationResponseDto', 'quantity'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'StockReservationResponseDto', 'status'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'StockReservationResponseDto', 'createdAt'),
            warehouse: warehouse.build(),
            variant: variant.build(),
            expiresAt: expiresAt,
            user: _user?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'warehouse';
        warehouse.build();
        _$failedField = 'variant';
        variant.build();

        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'StockReservationResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
