// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_coupon_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UpsertCouponDtoStatusEnum _$upsertCouponDtoStatusEnum_ACTIVE =
    const UpsertCouponDtoStatusEnum._('ACTIVE');
const UpsertCouponDtoStatusEnum _$upsertCouponDtoStatusEnum_DISABLED =
    const UpsertCouponDtoStatusEnum._('DISABLED');
const UpsertCouponDtoStatusEnum _$upsertCouponDtoStatusEnum_ARCHIVED =
    const UpsertCouponDtoStatusEnum._('ARCHIVED');

UpsertCouponDtoStatusEnum _$upsertCouponDtoStatusEnumValueOf(String name) {
  switch (name) {
    case 'ACTIVE':
      return _$upsertCouponDtoStatusEnum_ACTIVE;
    case 'DISABLED':
      return _$upsertCouponDtoStatusEnum_DISABLED;
    case 'ARCHIVED':
      return _$upsertCouponDtoStatusEnum_ARCHIVED;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UpsertCouponDtoStatusEnum> _$upsertCouponDtoStatusEnumValues =
    BuiltSet<UpsertCouponDtoStatusEnum>(const <UpsertCouponDtoStatusEnum>[
  _$upsertCouponDtoStatusEnum_ACTIVE,
  _$upsertCouponDtoStatusEnum_DISABLED,
  _$upsertCouponDtoStatusEnum_ARCHIVED,
]);

Serializer<UpsertCouponDtoStatusEnum> _$upsertCouponDtoStatusEnumSerializer =
    _$UpsertCouponDtoStatusEnumSerializer();

class _$UpsertCouponDtoStatusEnumSerializer
    implements PrimitiveSerializer<UpsertCouponDtoStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ACTIVE': 'ACTIVE',
    'DISABLED': 'DISABLED',
    'ARCHIVED': 'ARCHIVED',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ACTIVE': 'ACTIVE',
    'DISABLED': 'DISABLED',
    'ARCHIVED': 'ARCHIVED',
  };

  @override
  final Iterable<Type> types = const <Type>[UpsertCouponDtoStatusEnum];
  @override
  final String wireName = 'UpsertCouponDtoStatusEnum';

  @override
  Object serialize(Serializers serializers, UpsertCouponDtoStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UpsertCouponDtoStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UpsertCouponDtoStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$UpsertCouponDto extends UpsertCouponDto {
  @override
  final String code;
  @override
  final UpsertCouponDtoStatusEnum status;
  @override
  final DateTime? startsAt;
  @override
  final DateTime? endsAt;
  @override
  final num? totalUsageLimit;
  @override
  final num? perCustomerUsageLimit;

  factory _$UpsertCouponDto([void Function(UpsertCouponDtoBuilder)? updates]) =>
      (UpsertCouponDtoBuilder()..update(updates))._build();

  _$UpsertCouponDto._(
      {required this.code,
      required this.status,
      this.startsAt,
      this.endsAt,
      this.totalUsageLimit,
      this.perCustomerUsageLimit})
      : super._();
  @override
  UpsertCouponDto rebuild(void Function(UpsertCouponDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpsertCouponDtoBuilder toBuilder() => UpsertCouponDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpsertCouponDto &&
        code == other.code &&
        status == other.status &&
        startsAt == other.startsAt &&
        endsAt == other.endsAt &&
        totalUsageLimit == other.totalUsageLimit &&
        perCustomerUsageLimit == other.perCustomerUsageLimit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, startsAt.hashCode);
    _$hash = $jc(_$hash, endsAt.hashCode);
    _$hash = $jc(_$hash, totalUsageLimit.hashCode);
    _$hash = $jc(_$hash, perCustomerUsageLimit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpsertCouponDto')
          ..add('code', code)
          ..add('status', status)
          ..add('startsAt', startsAt)
          ..add('endsAt', endsAt)
          ..add('totalUsageLimit', totalUsageLimit)
          ..add('perCustomerUsageLimit', perCustomerUsageLimit))
        .toString();
  }
}

class UpsertCouponDtoBuilder
    implements Builder<UpsertCouponDto, UpsertCouponDtoBuilder> {
  _$UpsertCouponDto? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  UpsertCouponDtoStatusEnum? _status;
  UpsertCouponDtoStatusEnum? get status => _$this._status;
  set status(UpsertCouponDtoStatusEnum? status) => _$this._status = status;

  DateTime? _startsAt;
  DateTime? get startsAt => _$this._startsAt;
  set startsAt(DateTime? startsAt) => _$this._startsAt = startsAt;

  DateTime? _endsAt;
  DateTime? get endsAt => _$this._endsAt;
  set endsAt(DateTime? endsAt) => _$this._endsAt = endsAt;

  num? _totalUsageLimit;
  num? get totalUsageLimit => _$this._totalUsageLimit;
  set totalUsageLimit(num? totalUsageLimit) =>
      _$this._totalUsageLimit = totalUsageLimit;

  num? _perCustomerUsageLimit;
  num? get perCustomerUsageLimit => _$this._perCustomerUsageLimit;
  set perCustomerUsageLimit(num? perCustomerUsageLimit) =>
      _$this._perCustomerUsageLimit = perCustomerUsageLimit;

  UpsertCouponDtoBuilder() {
    UpsertCouponDto._defaults(this);
  }

  UpsertCouponDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _status = $v.status;
      _startsAt = $v.startsAt;
      _endsAt = $v.endsAt;
      _totalUsageLimit = $v.totalUsageLimit;
      _perCustomerUsageLimit = $v.perCustomerUsageLimit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpsertCouponDto other) {
    _$v = other as _$UpsertCouponDto;
  }

  @override
  void update(void Function(UpsertCouponDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpsertCouponDto build() => _build();

  _$UpsertCouponDto _build() {
    final _$result = _$v ??
        _$UpsertCouponDto._(
          code: BuiltValueNullFieldError.checkNotNull(
              code, r'UpsertCouponDto', 'code'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'UpsertCouponDto', 'status'),
          startsAt: startsAt,
          endsAt: endsAt,
          totalUsageLimit: totalUsageLimit,
          perCustomerUsageLimit: perCustomerUsageLimit,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
