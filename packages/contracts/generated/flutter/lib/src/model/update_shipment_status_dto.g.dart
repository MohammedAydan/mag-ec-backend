// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_shipment_status_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UpdateShipmentStatusDtoStatusEnum
    _$updateShipmentStatusDtoStatusEnum_PENDING =
    const UpdateShipmentStatusDtoStatusEnum._('PENDING');
const UpdateShipmentStatusDtoStatusEnum
    _$updateShipmentStatusDtoStatusEnum_SHIPPED =
    const UpdateShipmentStatusDtoStatusEnum._('SHIPPED');
const UpdateShipmentStatusDtoStatusEnum
    _$updateShipmentStatusDtoStatusEnum_DELIVERED =
    const UpdateShipmentStatusDtoStatusEnum._('DELIVERED');
const UpdateShipmentStatusDtoStatusEnum
    _$updateShipmentStatusDtoStatusEnum_CANCELLED =
    const UpdateShipmentStatusDtoStatusEnum._('CANCELLED');

UpdateShipmentStatusDtoStatusEnum _$updateShipmentStatusDtoStatusEnumValueOf(
    String name) {
  switch (name) {
    case 'PENDING':
      return _$updateShipmentStatusDtoStatusEnum_PENDING;
    case 'SHIPPED':
      return _$updateShipmentStatusDtoStatusEnum_SHIPPED;
    case 'DELIVERED':
      return _$updateShipmentStatusDtoStatusEnum_DELIVERED;
    case 'CANCELLED':
      return _$updateShipmentStatusDtoStatusEnum_CANCELLED;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UpdateShipmentStatusDtoStatusEnum>
    _$updateShipmentStatusDtoStatusEnumValues = BuiltSet<
        UpdateShipmentStatusDtoStatusEnum>(const <UpdateShipmentStatusDtoStatusEnum>[
  _$updateShipmentStatusDtoStatusEnum_PENDING,
  _$updateShipmentStatusDtoStatusEnum_SHIPPED,
  _$updateShipmentStatusDtoStatusEnum_DELIVERED,
  _$updateShipmentStatusDtoStatusEnum_CANCELLED,
]);

Serializer<UpdateShipmentStatusDtoStatusEnum>
    _$updateShipmentStatusDtoStatusEnumSerializer =
    _$UpdateShipmentStatusDtoStatusEnumSerializer();

class _$UpdateShipmentStatusDtoStatusEnumSerializer
    implements PrimitiveSerializer<UpdateShipmentStatusDtoStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'PENDING': 'PENDING',
    'SHIPPED': 'SHIPPED',
    'DELIVERED': 'DELIVERED',
    'CANCELLED': 'CANCELLED',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'PENDING': 'PENDING',
    'SHIPPED': 'SHIPPED',
    'DELIVERED': 'DELIVERED',
    'CANCELLED': 'CANCELLED',
  };

  @override
  final Iterable<Type> types = const <Type>[UpdateShipmentStatusDtoStatusEnum];
  @override
  final String wireName = 'UpdateShipmentStatusDtoStatusEnum';

  @override
  Object serialize(
          Serializers serializers, UpdateShipmentStatusDtoStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UpdateShipmentStatusDtoStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UpdateShipmentStatusDtoStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$UpdateShipmentStatusDto extends UpdateShipmentStatusDto {
  @override
  final UpdateShipmentStatusDtoStatusEnum status;
  @override
  final String? trackingNumber;
  @override
  final String? trackingUrl;
  @override
  final String? notes;

  factory _$UpdateShipmentStatusDto(
          [void Function(UpdateShipmentStatusDtoBuilder)? updates]) =>
      (UpdateShipmentStatusDtoBuilder()..update(updates))._build();

  _$UpdateShipmentStatusDto._(
      {required this.status, this.trackingNumber, this.trackingUrl, this.notes})
      : super._();
  @override
  UpdateShipmentStatusDto rebuild(
          void Function(UpdateShipmentStatusDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateShipmentStatusDtoBuilder toBuilder() =>
      UpdateShipmentStatusDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateShipmentStatusDto &&
        status == other.status &&
        trackingNumber == other.trackingNumber &&
        trackingUrl == other.trackingUrl &&
        notes == other.notes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, trackingNumber.hashCode);
    _$hash = $jc(_$hash, trackingUrl.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateShipmentStatusDto')
          ..add('status', status)
          ..add('trackingNumber', trackingNumber)
          ..add('trackingUrl', trackingUrl)
          ..add('notes', notes))
        .toString();
  }
}

class UpdateShipmentStatusDtoBuilder
    implements
        Builder<UpdateShipmentStatusDto, UpdateShipmentStatusDtoBuilder> {
  _$UpdateShipmentStatusDto? _$v;

  UpdateShipmentStatusDtoStatusEnum? _status;
  UpdateShipmentStatusDtoStatusEnum? get status => _$this._status;
  set status(UpdateShipmentStatusDtoStatusEnum? status) =>
      _$this._status = status;

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

  UpdateShipmentStatusDtoBuilder() {
    UpdateShipmentStatusDto._defaults(this);
  }

  UpdateShipmentStatusDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _trackingNumber = $v.trackingNumber;
      _trackingUrl = $v.trackingUrl;
      _notes = $v.notes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateShipmentStatusDto other) {
    _$v = other as _$UpdateShipmentStatusDto;
  }

  @override
  void update(void Function(UpdateShipmentStatusDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateShipmentStatusDto build() => _build();

  _$UpdateShipmentStatusDto _build() {
    final _$result = _$v ??
        _$UpdateShipmentStatusDto._(
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'UpdateShipmentStatusDto', 'status'),
          trackingNumber: trackingNumber,
          trackingUrl: trackingUrl,
          notes: notes,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
