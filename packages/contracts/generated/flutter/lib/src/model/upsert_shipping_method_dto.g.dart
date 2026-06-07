// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_shipping_method_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UpsertShippingMethodDtoRateTypeEnum
    _$upsertShippingMethodDtoRateTypeEnum_FLAT =
    const UpsertShippingMethodDtoRateTypeEnum._('FLAT');
const UpsertShippingMethodDtoRateTypeEnum
    _$upsertShippingMethodDtoRateTypeEnum_PERCENTAGE_OF_SUBTOTAL =
    const UpsertShippingMethodDtoRateTypeEnum._('PERCENTAGE_OF_SUBTOTAL');

UpsertShippingMethodDtoRateTypeEnum
    _$upsertShippingMethodDtoRateTypeEnumValueOf(String name) {
  switch (name) {
    case 'FLAT':
      return _$upsertShippingMethodDtoRateTypeEnum_FLAT;
    case 'PERCENTAGE_OF_SUBTOTAL':
      return _$upsertShippingMethodDtoRateTypeEnum_PERCENTAGE_OF_SUBTOTAL;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UpsertShippingMethodDtoRateTypeEnum>
    _$upsertShippingMethodDtoRateTypeEnumValues = BuiltSet<
        UpsertShippingMethodDtoRateTypeEnum>(const <UpsertShippingMethodDtoRateTypeEnum>[
  _$upsertShippingMethodDtoRateTypeEnum_FLAT,
  _$upsertShippingMethodDtoRateTypeEnum_PERCENTAGE_OF_SUBTOTAL,
]);

Serializer<UpsertShippingMethodDtoRateTypeEnum>
    _$upsertShippingMethodDtoRateTypeEnumSerializer =
    _$UpsertShippingMethodDtoRateTypeEnumSerializer();

class _$UpsertShippingMethodDtoRateTypeEnumSerializer
    implements PrimitiveSerializer<UpsertShippingMethodDtoRateTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'FLAT': 'FLAT',
    'PERCENTAGE_OF_SUBTOTAL': 'PERCENTAGE_OF_SUBTOTAL',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'FLAT': 'FLAT',
    'PERCENTAGE_OF_SUBTOTAL': 'PERCENTAGE_OF_SUBTOTAL',
  };

  @override
  final Iterable<Type> types = const <Type>[
    UpsertShippingMethodDtoRateTypeEnum
  ];
  @override
  final String wireName = 'UpsertShippingMethodDtoRateTypeEnum';

  @override
  Object serialize(
          Serializers serializers, UpsertShippingMethodDtoRateTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UpsertShippingMethodDtoRateTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UpsertShippingMethodDtoRateTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$UpsertShippingMethodDto extends UpsertShippingMethodDto {
  @override
  final String name;
  @override
  final UpsertShippingMethodDtoRateTypeEnum rateType;
  @override
  final String currencyCode;
  @override
  final bool? isActive;
  @override
  final num? flatAmount;
  @override
  final num? percentageBps;
  @override
  final num? minSubtotalAmount;
  @override
  final num? maxSubtotalAmount;
  @override
  final num? minItemQuantity;
  @override
  final num? maxItemQuantity;
  @override
  final num? estimatedMinDays;
  @override
  final num? estimatedMaxDays;
  @override
  final num? sortOrder;

  factory _$UpsertShippingMethodDto(
          [void Function(UpsertShippingMethodDtoBuilder)? updates]) =>
      (UpsertShippingMethodDtoBuilder()..update(updates))._build();

  _$UpsertShippingMethodDto._(
      {required this.name,
      required this.rateType,
      required this.currencyCode,
      this.isActive,
      this.flatAmount,
      this.percentageBps,
      this.minSubtotalAmount,
      this.maxSubtotalAmount,
      this.minItemQuantity,
      this.maxItemQuantity,
      this.estimatedMinDays,
      this.estimatedMaxDays,
      this.sortOrder})
      : super._();
  @override
  UpsertShippingMethodDto rebuild(
          void Function(UpsertShippingMethodDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpsertShippingMethodDtoBuilder toBuilder() =>
      UpsertShippingMethodDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpsertShippingMethodDto &&
        name == other.name &&
        rateType == other.rateType &&
        currencyCode == other.currencyCode &&
        isActive == other.isActive &&
        flatAmount == other.flatAmount &&
        percentageBps == other.percentageBps &&
        minSubtotalAmount == other.minSubtotalAmount &&
        maxSubtotalAmount == other.maxSubtotalAmount &&
        minItemQuantity == other.minItemQuantity &&
        maxItemQuantity == other.maxItemQuantity &&
        estimatedMinDays == other.estimatedMinDays &&
        estimatedMaxDays == other.estimatedMaxDays &&
        sortOrder == other.sortOrder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, rateType.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jc(_$hash, flatAmount.hashCode);
    _$hash = $jc(_$hash, percentageBps.hashCode);
    _$hash = $jc(_$hash, minSubtotalAmount.hashCode);
    _$hash = $jc(_$hash, maxSubtotalAmount.hashCode);
    _$hash = $jc(_$hash, minItemQuantity.hashCode);
    _$hash = $jc(_$hash, maxItemQuantity.hashCode);
    _$hash = $jc(_$hash, estimatedMinDays.hashCode);
    _$hash = $jc(_$hash, estimatedMaxDays.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpsertShippingMethodDto')
          ..add('name', name)
          ..add('rateType', rateType)
          ..add('currencyCode', currencyCode)
          ..add('isActive', isActive)
          ..add('flatAmount', flatAmount)
          ..add('percentageBps', percentageBps)
          ..add('minSubtotalAmount', minSubtotalAmount)
          ..add('maxSubtotalAmount', maxSubtotalAmount)
          ..add('minItemQuantity', minItemQuantity)
          ..add('maxItemQuantity', maxItemQuantity)
          ..add('estimatedMinDays', estimatedMinDays)
          ..add('estimatedMaxDays', estimatedMaxDays)
          ..add('sortOrder', sortOrder))
        .toString();
  }
}

class UpsertShippingMethodDtoBuilder
    implements
        Builder<UpsertShippingMethodDto, UpsertShippingMethodDtoBuilder> {
  _$UpsertShippingMethodDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  UpsertShippingMethodDtoRateTypeEnum? _rateType;
  UpsertShippingMethodDtoRateTypeEnum? get rateType => _$this._rateType;
  set rateType(UpsertShippingMethodDtoRateTypeEnum? rateType) =>
      _$this._rateType = rateType;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  num? _flatAmount;
  num? get flatAmount => _$this._flatAmount;
  set flatAmount(num? flatAmount) => _$this._flatAmount = flatAmount;

  num? _percentageBps;
  num? get percentageBps => _$this._percentageBps;
  set percentageBps(num? percentageBps) =>
      _$this._percentageBps = percentageBps;

  num? _minSubtotalAmount;
  num? get minSubtotalAmount => _$this._minSubtotalAmount;
  set minSubtotalAmount(num? minSubtotalAmount) =>
      _$this._minSubtotalAmount = minSubtotalAmount;

  num? _maxSubtotalAmount;
  num? get maxSubtotalAmount => _$this._maxSubtotalAmount;
  set maxSubtotalAmount(num? maxSubtotalAmount) =>
      _$this._maxSubtotalAmount = maxSubtotalAmount;

  num? _minItemQuantity;
  num? get minItemQuantity => _$this._minItemQuantity;
  set minItemQuantity(num? minItemQuantity) =>
      _$this._minItemQuantity = minItemQuantity;

  num? _maxItemQuantity;
  num? get maxItemQuantity => _$this._maxItemQuantity;
  set maxItemQuantity(num? maxItemQuantity) =>
      _$this._maxItemQuantity = maxItemQuantity;

  num? _estimatedMinDays;
  num? get estimatedMinDays => _$this._estimatedMinDays;
  set estimatedMinDays(num? estimatedMinDays) =>
      _$this._estimatedMinDays = estimatedMinDays;

  num? _estimatedMaxDays;
  num? get estimatedMaxDays => _$this._estimatedMaxDays;
  set estimatedMaxDays(num? estimatedMaxDays) =>
      _$this._estimatedMaxDays = estimatedMaxDays;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  UpsertShippingMethodDtoBuilder() {
    UpsertShippingMethodDto._defaults(this);
  }

  UpsertShippingMethodDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _rateType = $v.rateType;
      _currencyCode = $v.currencyCode;
      _isActive = $v.isActive;
      _flatAmount = $v.flatAmount;
      _percentageBps = $v.percentageBps;
      _minSubtotalAmount = $v.minSubtotalAmount;
      _maxSubtotalAmount = $v.maxSubtotalAmount;
      _minItemQuantity = $v.minItemQuantity;
      _maxItemQuantity = $v.maxItemQuantity;
      _estimatedMinDays = $v.estimatedMinDays;
      _estimatedMaxDays = $v.estimatedMaxDays;
      _sortOrder = $v.sortOrder;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpsertShippingMethodDto other) {
    _$v = other as _$UpsertShippingMethodDto;
  }

  @override
  void update(void Function(UpsertShippingMethodDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpsertShippingMethodDto build() => _build();

  _$UpsertShippingMethodDto _build() {
    final _$result = _$v ??
        _$UpsertShippingMethodDto._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'UpsertShippingMethodDto', 'name'),
          rateType: BuiltValueNullFieldError.checkNotNull(
              rateType, r'UpsertShippingMethodDto', 'rateType'),
          currencyCode: BuiltValueNullFieldError.checkNotNull(
              currencyCode, r'UpsertShippingMethodDto', 'currencyCode'),
          isActive: isActive,
          flatAmount: flatAmount,
          percentageBps: percentageBps,
          minSubtotalAmount: minSubtotalAmount,
          maxSubtotalAmount: maxSubtotalAmount,
          minItemQuantity: minItemQuantity,
          maxItemQuantity: maxItemQuantity,
          estimatedMinDays: estimatedMinDays,
          estimatedMaxDays: estimatedMaxDays,
          sortOrder: sortOrder,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
