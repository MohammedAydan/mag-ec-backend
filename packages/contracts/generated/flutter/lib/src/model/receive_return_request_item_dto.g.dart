// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_return_request_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ReceiveReturnRequestItemDtoFinalDispositionEnum
    _$receiveReturnRequestItemDtoFinalDispositionEnum_RESTOCK =
    const ReceiveReturnRequestItemDtoFinalDispositionEnum._('RESTOCK');
const ReceiveReturnRequestItemDtoFinalDispositionEnum
    _$receiveReturnRequestItemDtoFinalDispositionEnum_INSPECT =
    const ReceiveReturnRequestItemDtoFinalDispositionEnum._('INSPECT');
const ReceiveReturnRequestItemDtoFinalDispositionEnum
    _$receiveReturnRequestItemDtoFinalDispositionEnum_DISCARD =
    const ReceiveReturnRequestItemDtoFinalDispositionEnum._('DISCARD');

ReceiveReturnRequestItemDtoFinalDispositionEnum
    _$receiveReturnRequestItemDtoFinalDispositionEnumValueOf(String name) {
  switch (name) {
    case 'RESTOCK':
      return _$receiveReturnRequestItemDtoFinalDispositionEnum_RESTOCK;
    case 'INSPECT':
      return _$receiveReturnRequestItemDtoFinalDispositionEnum_INSPECT;
    case 'DISCARD':
      return _$receiveReturnRequestItemDtoFinalDispositionEnum_DISCARD;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReceiveReturnRequestItemDtoFinalDispositionEnum>
    _$receiveReturnRequestItemDtoFinalDispositionEnumValues = BuiltSet<
        ReceiveReturnRequestItemDtoFinalDispositionEnum>(const <ReceiveReturnRequestItemDtoFinalDispositionEnum>[
  _$receiveReturnRequestItemDtoFinalDispositionEnum_RESTOCK,
  _$receiveReturnRequestItemDtoFinalDispositionEnum_INSPECT,
  _$receiveReturnRequestItemDtoFinalDispositionEnum_DISCARD,
]);

Serializer<ReceiveReturnRequestItemDtoFinalDispositionEnum>
    _$receiveReturnRequestItemDtoFinalDispositionEnumSerializer =
    _$ReceiveReturnRequestItemDtoFinalDispositionEnumSerializer();

class _$ReceiveReturnRequestItemDtoFinalDispositionEnumSerializer
    implements
        PrimitiveSerializer<ReceiveReturnRequestItemDtoFinalDispositionEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'RESTOCK': 'RESTOCK',
    'INSPECT': 'INSPECT',
    'DISCARD': 'DISCARD',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'RESTOCK': 'RESTOCK',
    'INSPECT': 'INSPECT',
    'DISCARD': 'DISCARD',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ReceiveReturnRequestItemDtoFinalDispositionEnum
  ];
  @override
  final String wireName = 'ReceiveReturnRequestItemDtoFinalDispositionEnum';

  @override
  Object serialize(Serializers serializers,
          ReceiveReturnRequestItemDtoFinalDispositionEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ReceiveReturnRequestItemDtoFinalDispositionEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ReceiveReturnRequestItemDtoFinalDispositionEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ReceiveReturnRequestItemDto extends ReceiveReturnRequestItemDto {
  @override
  final String returnRequestItemId;
  @override
  final num receivedQuantity;
  @override
  final ReceiveReturnRequestItemDtoFinalDispositionEnum finalDisposition;
  @override
  final String? warehouseId;
  @override
  final String? conditionNotes;

  factory _$ReceiveReturnRequestItemDto(
          [void Function(ReceiveReturnRequestItemDtoBuilder)? updates]) =>
      (ReceiveReturnRequestItemDtoBuilder()..update(updates))._build();

  _$ReceiveReturnRequestItemDto._(
      {required this.returnRequestItemId,
      required this.receivedQuantity,
      required this.finalDisposition,
      this.warehouseId,
      this.conditionNotes})
      : super._();
  @override
  ReceiveReturnRequestItemDto rebuild(
          void Function(ReceiveReturnRequestItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReceiveReturnRequestItemDtoBuilder toBuilder() =>
      ReceiveReturnRequestItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReceiveReturnRequestItemDto &&
        returnRequestItemId == other.returnRequestItemId &&
        receivedQuantity == other.receivedQuantity &&
        finalDisposition == other.finalDisposition &&
        warehouseId == other.warehouseId &&
        conditionNotes == other.conditionNotes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, returnRequestItemId.hashCode);
    _$hash = $jc(_$hash, receivedQuantity.hashCode);
    _$hash = $jc(_$hash, finalDisposition.hashCode);
    _$hash = $jc(_$hash, warehouseId.hashCode);
    _$hash = $jc(_$hash, conditionNotes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReceiveReturnRequestItemDto')
          ..add('returnRequestItemId', returnRequestItemId)
          ..add('receivedQuantity', receivedQuantity)
          ..add('finalDisposition', finalDisposition)
          ..add('warehouseId', warehouseId)
          ..add('conditionNotes', conditionNotes))
        .toString();
  }
}

class ReceiveReturnRequestItemDtoBuilder
    implements
        Builder<ReceiveReturnRequestItemDto,
            ReceiveReturnRequestItemDtoBuilder> {
  _$ReceiveReturnRequestItemDto? _$v;

  String? _returnRequestItemId;
  String? get returnRequestItemId => _$this._returnRequestItemId;
  set returnRequestItemId(String? returnRequestItemId) =>
      _$this._returnRequestItemId = returnRequestItemId;

  num? _receivedQuantity;
  num? get receivedQuantity => _$this._receivedQuantity;
  set receivedQuantity(num? receivedQuantity) =>
      _$this._receivedQuantity = receivedQuantity;

  ReceiveReturnRequestItemDtoFinalDispositionEnum? _finalDisposition;
  ReceiveReturnRequestItemDtoFinalDispositionEnum? get finalDisposition =>
      _$this._finalDisposition;
  set finalDisposition(
          ReceiveReturnRequestItemDtoFinalDispositionEnum? finalDisposition) =>
      _$this._finalDisposition = finalDisposition;

  String? _warehouseId;
  String? get warehouseId => _$this._warehouseId;
  set warehouseId(String? warehouseId) => _$this._warehouseId = warehouseId;

  String? _conditionNotes;
  String? get conditionNotes => _$this._conditionNotes;
  set conditionNotes(String? conditionNotes) =>
      _$this._conditionNotes = conditionNotes;

  ReceiveReturnRequestItemDtoBuilder() {
    ReceiveReturnRequestItemDto._defaults(this);
  }

  ReceiveReturnRequestItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _returnRequestItemId = $v.returnRequestItemId;
      _receivedQuantity = $v.receivedQuantity;
      _finalDisposition = $v.finalDisposition;
      _warehouseId = $v.warehouseId;
      _conditionNotes = $v.conditionNotes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReceiveReturnRequestItemDto other) {
    _$v = other as _$ReceiveReturnRequestItemDto;
  }

  @override
  void update(void Function(ReceiveReturnRequestItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReceiveReturnRequestItemDto build() => _build();

  _$ReceiveReturnRequestItemDto _build() {
    final _$result = _$v ??
        _$ReceiveReturnRequestItemDto._(
          returnRequestItemId: BuiltValueNullFieldError.checkNotNull(
              returnRequestItemId,
              r'ReceiveReturnRequestItemDto',
              'returnRequestItemId'),
          receivedQuantity: BuiltValueNullFieldError.checkNotNull(
              receivedQuantity,
              r'ReceiveReturnRequestItemDto',
              'receivedQuantity'),
          finalDisposition: BuiltValueNullFieldError.checkNotNull(
              finalDisposition,
              r'ReceiveReturnRequestItemDto',
              'finalDisposition'),
          warehouseId: warehouseId,
          conditionNotes: conditionNotes,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
