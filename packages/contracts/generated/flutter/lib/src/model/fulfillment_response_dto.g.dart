// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fulfillment_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FulfillmentResponseDto extends FulfillmentResponseDto {
  @override
  final String id;
  @override
  final String orderId;
  @override
  final String shipmentNumber;
  @override
  final String status;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final BuiltList<FulfillmentItemDto> items;
  @override
  final String? carrierKey;
  @override
  final String? carrierName;
  @override
  final String? trackingNumber;
  @override
  final String? trackingUrl;
  @override
  final String? notes;
  @override
  final String? shippedAt;
  @override
  final String? deliveredAt;
  @override
  final String? cancelledAt;

  factory _$FulfillmentResponseDto(
          [void Function(FulfillmentResponseDtoBuilder)? updates]) =>
      (FulfillmentResponseDtoBuilder()..update(updates))._build();

  _$FulfillmentResponseDto._(
      {required this.id,
      required this.orderId,
      required this.shipmentNumber,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      required this.items,
      this.carrierKey,
      this.carrierName,
      this.trackingNumber,
      this.trackingUrl,
      this.notes,
      this.shippedAt,
      this.deliveredAt,
      this.cancelledAt})
      : super._();
  @override
  FulfillmentResponseDto rebuild(
          void Function(FulfillmentResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FulfillmentResponseDtoBuilder toBuilder() =>
      FulfillmentResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FulfillmentResponseDto &&
        id == other.id &&
        orderId == other.orderId &&
        shipmentNumber == other.shipmentNumber &&
        status == other.status &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        items == other.items &&
        carrierKey == other.carrierKey &&
        carrierName == other.carrierName &&
        trackingNumber == other.trackingNumber &&
        trackingUrl == other.trackingUrl &&
        notes == other.notes &&
        shippedAt == other.shippedAt &&
        deliveredAt == other.deliveredAt &&
        cancelledAt == other.cancelledAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, orderId.hashCode);
    _$hash = $jc(_$hash, shipmentNumber.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, carrierKey.hashCode);
    _$hash = $jc(_$hash, carrierName.hashCode);
    _$hash = $jc(_$hash, trackingNumber.hashCode);
    _$hash = $jc(_$hash, trackingUrl.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jc(_$hash, shippedAt.hashCode);
    _$hash = $jc(_$hash, deliveredAt.hashCode);
    _$hash = $jc(_$hash, cancelledAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FulfillmentResponseDto')
          ..add('id', id)
          ..add('orderId', orderId)
          ..add('shipmentNumber', shipmentNumber)
          ..add('status', status)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('items', items)
          ..add('carrierKey', carrierKey)
          ..add('carrierName', carrierName)
          ..add('trackingNumber', trackingNumber)
          ..add('trackingUrl', trackingUrl)
          ..add('notes', notes)
          ..add('shippedAt', shippedAt)
          ..add('deliveredAt', deliveredAt)
          ..add('cancelledAt', cancelledAt))
        .toString();
  }
}

class FulfillmentResponseDtoBuilder
    implements Builder<FulfillmentResponseDto, FulfillmentResponseDtoBuilder> {
  _$FulfillmentResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _orderId;
  String? get orderId => _$this._orderId;
  set orderId(String? orderId) => _$this._orderId = orderId;

  String? _shipmentNumber;
  String? get shipmentNumber => _$this._shipmentNumber;
  set shipmentNumber(String? shipmentNumber) =>
      _$this._shipmentNumber = shipmentNumber;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<FulfillmentItemDto>? _items;
  ListBuilder<FulfillmentItemDto> get items =>
      _$this._items ??= ListBuilder<FulfillmentItemDto>();
  set items(ListBuilder<FulfillmentItemDto>? items) => _$this._items = items;

  String? _carrierKey;
  String? get carrierKey => _$this._carrierKey;
  set carrierKey(String? carrierKey) => _$this._carrierKey = carrierKey;

  String? _carrierName;
  String? get carrierName => _$this._carrierName;
  set carrierName(String? carrierName) => _$this._carrierName = carrierName;

  String? _trackingNumber;
  String? get trackingNumber => _$this._trackingNumber;
  set trackingNumber(String? trackingNumber) =>
      _$this._trackingNumber = trackingNumber;

  String? _trackingUrl;
  String? get trackingUrl => _$this._trackingUrl;
  set trackingUrl(String? trackingUrl) => _$this._trackingUrl = trackingUrl;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  String? _shippedAt;
  String? get shippedAt => _$this._shippedAt;
  set shippedAt(String? shippedAt) => _$this._shippedAt = shippedAt;

  String? _deliveredAt;
  String? get deliveredAt => _$this._deliveredAt;
  set deliveredAt(String? deliveredAt) => _$this._deliveredAt = deliveredAt;

  String? _cancelledAt;
  String? get cancelledAt => _$this._cancelledAt;
  set cancelledAt(String? cancelledAt) => _$this._cancelledAt = cancelledAt;

  FulfillmentResponseDtoBuilder() {
    FulfillmentResponseDto._defaults(this);
  }

  FulfillmentResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _orderId = $v.orderId;
      _shipmentNumber = $v.shipmentNumber;
      _status = $v.status;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _items = $v.items.toBuilder();
      _carrierKey = $v.carrierKey;
      _carrierName = $v.carrierName;
      _trackingNumber = $v.trackingNumber;
      _trackingUrl = $v.trackingUrl;
      _notes = $v.notes;
      _shippedAt = $v.shippedAt;
      _deliveredAt = $v.deliveredAt;
      _cancelledAt = $v.cancelledAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FulfillmentResponseDto other) {
    _$v = other as _$FulfillmentResponseDto;
  }

  @override
  void update(void Function(FulfillmentResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FulfillmentResponseDto build() => _build();

  _$FulfillmentResponseDto _build() {
    _$FulfillmentResponseDto _$result;
    try {
      _$result = _$v ??
          _$FulfillmentResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'FulfillmentResponseDto', 'id'),
            orderId: BuiltValueNullFieldError.checkNotNull(
                orderId, r'FulfillmentResponseDto', 'orderId'),
            shipmentNumber: BuiltValueNullFieldError.checkNotNull(
                shipmentNumber, r'FulfillmentResponseDto', 'shipmentNumber'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'FulfillmentResponseDto', 'status'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'FulfillmentResponseDto', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'FulfillmentResponseDto', 'updatedAt'),
            items: items.build(),
            carrierKey: carrierKey,
            carrierName: carrierName,
            trackingNumber: trackingNumber,
            trackingUrl: trackingUrl,
            notes: notes,
            shippedAt: shippedAt,
            deliveredAt: deliveredAt,
            cancelledAt: cancelledAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'FulfillmentResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
