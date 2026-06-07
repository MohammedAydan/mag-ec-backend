// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_return_request_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CreateReturnRequestItemDtoRequestedDispositionEnum
    _$createReturnRequestItemDtoRequestedDispositionEnum_RESTOCK =
    const CreateReturnRequestItemDtoRequestedDispositionEnum._('RESTOCK');
const CreateReturnRequestItemDtoRequestedDispositionEnum
    _$createReturnRequestItemDtoRequestedDispositionEnum_INSPECT =
    const CreateReturnRequestItemDtoRequestedDispositionEnum._('INSPECT');
const CreateReturnRequestItemDtoRequestedDispositionEnum
    _$createReturnRequestItemDtoRequestedDispositionEnum_DISCARD =
    const CreateReturnRequestItemDtoRequestedDispositionEnum._('DISCARD');

CreateReturnRequestItemDtoRequestedDispositionEnum
    _$createReturnRequestItemDtoRequestedDispositionEnumValueOf(String name) {
  switch (name) {
    case 'RESTOCK':
      return _$createReturnRequestItemDtoRequestedDispositionEnum_RESTOCK;
    case 'INSPECT':
      return _$createReturnRequestItemDtoRequestedDispositionEnum_INSPECT;
    case 'DISCARD':
      return _$createReturnRequestItemDtoRequestedDispositionEnum_DISCARD;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<CreateReturnRequestItemDtoRequestedDispositionEnum>
    _$createReturnRequestItemDtoRequestedDispositionEnumValues = BuiltSet<
        CreateReturnRequestItemDtoRequestedDispositionEnum>(const <CreateReturnRequestItemDtoRequestedDispositionEnum>[
  _$createReturnRequestItemDtoRequestedDispositionEnum_RESTOCK,
  _$createReturnRequestItemDtoRequestedDispositionEnum_INSPECT,
  _$createReturnRequestItemDtoRequestedDispositionEnum_DISCARD,
]);

Serializer<CreateReturnRequestItemDtoRequestedDispositionEnum>
    _$createReturnRequestItemDtoRequestedDispositionEnumSerializer =
    _$CreateReturnRequestItemDtoRequestedDispositionEnumSerializer();

class _$CreateReturnRequestItemDtoRequestedDispositionEnumSerializer
    implements
        PrimitiveSerializer<
            CreateReturnRequestItemDtoRequestedDispositionEnum> {
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
    CreateReturnRequestItemDtoRequestedDispositionEnum
  ];
  @override
  final String wireName = 'CreateReturnRequestItemDtoRequestedDispositionEnum';

  @override
  Object serialize(Serializers serializers,
          CreateReturnRequestItemDtoRequestedDispositionEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CreateReturnRequestItemDtoRequestedDispositionEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CreateReturnRequestItemDtoRequestedDispositionEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CreateReturnRequestItemDto extends CreateReturnRequestItemDto {
  @override
  final String orderLineId;
  @override
  final num quantity;
  @override
  final CreateReturnRequestItemDtoRequestedDispositionEnum?
      requestedDisposition;
  @override
  final String? reason;

  factory _$CreateReturnRequestItemDto(
          [void Function(CreateReturnRequestItemDtoBuilder)? updates]) =>
      (CreateReturnRequestItemDtoBuilder()..update(updates))._build();

  _$CreateReturnRequestItemDto._(
      {required this.orderLineId,
      required this.quantity,
      this.requestedDisposition,
      this.reason})
      : super._();
  @override
  CreateReturnRequestItemDto rebuild(
          void Function(CreateReturnRequestItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateReturnRequestItemDtoBuilder toBuilder() =>
      CreateReturnRequestItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateReturnRequestItemDto &&
        orderLineId == other.orderLineId &&
        quantity == other.quantity &&
        requestedDisposition == other.requestedDisposition &&
        reason == other.reason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, orderLineId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, requestedDisposition.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateReturnRequestItemDto')
          ..add('orderLineId', orderLineId)
          ..add('quantity', quantity)
          ..add('requestedDisposition', requestedDisposition)
          ..add('reason', reason))
        .toString();
  }
}

class CreateReturnRequestItemDtoBuilder
    implements
        Builder<CreateReturnRequestItemDto, CreateReturnRequestItemDtoBuilder> {
  _$CreateReturnRequestItemDto? _$v;

  String? _orderLineId;
  String? get orderLineId => _$this._orderLineId;
  set orderLineId(String? orderLineId) => _$this._orderLineId = orderLineId;

  num? _quantity;
  num? get quantity => _$this._quantity;
  set quantity(num? quantity) => _$this._quantity = quantity;

  CreateReturnRequestItemDtoRequestedDispositionEnum? _requestedDisposition;
  CreateReturnRequestItemDtoRequestedDispositionEnum?
      get requestedDisposition => _$this._requestedDisposition;
  set requestedDisposition(
          CreateReturnRequestItemDtoRequestedDispositionEnum?
              requestedDisposition) =>
      _$this._requestedDisposition = requestedDisposition;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  CreateReturnRequestItemDtoBuilder() {
    CreateReturnRequestItemDto._defaults(this);
  }

  CreateReturnRequestItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderLineId = $v.orderLineId;
      _quantity = $v.quantity;
      _requestedDisposition = $v.requestedDisposition;
      _reason = $v.reason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateReturnRequestItemDto other) {
    _$v = other as _$CreateReturnRequestItemDto;
  }

  @override
  void update(void Function(CreateReturnRequestItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateReturnRequestItemDto build() => _build();

  _$CreateReturnRequestItemDto _build() {
    final _$result = _$v ??
        _$CreateReturnRequestItemDto._(
          orderLineId: BuiltValueNullFieldError.checkNotNull(
              orderLineId, r'CreateReturnRequestItemDto', 'orderLineId'),
          quantity: BuiltValueNullFieldError.checkNotNull(
              quantity, r'CreateReturnRequestItemDto', 'quantity'),
          requestedDisposition: requestedDisposition,
          reason: reason,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
