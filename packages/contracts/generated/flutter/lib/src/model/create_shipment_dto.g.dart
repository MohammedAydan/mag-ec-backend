// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_shipment_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateShipmentDto extends CreateShipmentDto {
  @override
  final BuiltList<CreateShipmentItemDto> items;
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

  factory _$CreateShipmentDto(
          [void Function(CreateShipmentDtoBuilder)? updates]) =>
      (CreateShipmentDtoBuilder()..update(updates))._build();

  _$CreateShipmentDto._(
      {required this.items,
      this.carrierKey,
      this.carrierName,
      this.trackingNumber,
      this.trackingUrl,
      this.notes})
      : super._();
  @override
  CreateShipmentDto rebuild(void Function(CreateShipmentDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateShipmentDtoBuilder toBuilder() =>
      CreateShipmentDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateShipmentDto &&
        items == other.items &&
        carrierKey == other.carrierKey &&
        carrierName == other.carrierName &&
        trackingNumber == other.trackingNumber &&
        trackingUrl == other.trackingUrl &&
        notes == other.notes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, carrierKey.hashCode);
    _$hash = $jc(_$hash, carrierName.hashCode);
    _$hash = $jc(_$hash, trackingNumber.hashCode);
    _$hash = $jc(_$hash, trackingUrl.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateShipmentDto')
          ..add('items', items)
          ..add('carrierKey', carrierKey)
          ..add('carrierName', carrierName)
          ..add('trackingNumber', trackingNumber)
          ..add('trackingUrl', trackingUrl)
          ..add('notes', notes))
        .toString();
  }
}

class CreateShipmentDtoBuilder
    implements Builder<CreateShipmentDto, CreateShipmentDtoBuilder> {
  _$CreateShipmentDto? _$v;

  ListBuilder<CreateShipmentItemDto>? _items;
  ListBuilder<CreateShipmentItemDto> get items =>
      _$this._items ??= ListBuilder<CreateShipmentItemDto>();
  set items(ListBuilder<CreateShipmentItemDto>? items) => _$this._items = items;

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

  CreateShipmentDtoBuilder() {
    CreateShipmentDto._defaults(this);
  }

  CreateShipmentDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _carrierKey = $v.carrierKey;
      _carrierName = $v.carrierName;
      _trackingNumber = $v.trackingNumber;
      _trackingUrl = $v.trackingUrl;
      _notes = $v.notes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateShipmentDto other) {
    _$v = other as _$CreateShipmentDto;
  }

  @override
  void update(void Function(CreateShipmentDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateShipmentDto build() => _build();

  _$CreateShipmentDto _build() {
    _$CreateShipmentDto _$result;
    try {
      _$result = _$v ??
          _$CreateShipmentDto._(
            items: items.build(),
            carrierKey: carrierKey,
            carrierName: carrierName,
            trackingNumber: trackingNumber,
            trackingUrl: trackingUrl,
            notes: notes,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CreateShipmentDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
