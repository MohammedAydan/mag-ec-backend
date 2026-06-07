// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CouponResponseDto extends CouponResponseDto {
  @override
  final String id;
  @override
  final String promotionId;
  @override
  final String code;
  @override
  final String normalizedCode;
  @override
  final String status;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String? startsAt;
  @override
  final String? endsAt;
  @override
  final num? totalUsageLimit;
  @override
  final num? perCustomerUsageLimit;

  factory _$CouponResponseDto(
          [void Function(CouponResponseDtoBuilder)? updates]) =>
      (CouponResponseDtoBuilder()..update(updates))._build();

  _$CouponResponseDto._(
      {required this.id,
      required this.promotionId,
      required this.code,
      required this.normalizedCode,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      this.startsAt,
      this.endsAt,
      this.totalUsageLimit,
      this.perCustomerUsageLimit})
      : super._();
  @override
  CouponResponseDto rebuild(void Function(CouponResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CouponResponseDtoBuilder toBuilder() =>
      CouponResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CouponResponseDto &&
        id == other.id &&
        promotionId == other.promotionId &&
        code == other.code &&
        normalizedCode == other.normalizedCode &&
        status == other.status &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        startsAt == other.startsAt &&
        endsAt == other.endsAt &&
        totalUsageLimit == other.totalUsageLimit &&
        perCustomerUsageLimit == other.perCustomerUsageLimit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, promotionId.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, normalizedCode.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, startsAt.hashCode);
    _$hash = $jc(_$hash, endsAt.hashCode);
    _$hash = $jc(_$hash, totalUsageLimit.hashCode);
    _$hash = $jc(_$hash, perCustomerUsageLimit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CouponResponseDto')
          ..add('id', id)
          ..add('promotionId', promotionId)
          ..add('code', code)
          ..add('normalizedCode', normalizedCode)
          ..add('status', status)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('startsAt', startsAt)
          ..add('endsAt', endsAt)
          ..add('totalUsageLimit', totalUsageLimit)
          ..add('perCustomerUsageLimit', perCustomerUsageLimit))
        .toString();
  }
}

class CouponResponseDtoBuilder
    implements Builder<CouponResponseDto, CouponResponseDtoBuilder> {
  _$CouponResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _promotionId;
  String? get promotionId => _$this._promotionId;
  set promotionId(String? promotionId) => _$this._promotionId = promotionId;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _normalizedCode;
  String? get normalizedCode => _$this._normalizedCode;
  set normalizedCode(String? normalizedCode) =>
      _$this._normalizedCode = normalizedCode;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  String? _startsAt;
  String? get startsAt => _$this._startsAt;
  set startsAt(String? startsAt) => _$this._startsAt = startsAt;

  String? _endsAt;
  String? get endsAt => _$this._endsAt;
  set endsAt(String? endsAt) => _$this._endsAt = endsAt;

  num? _totalUsageLimit;
  num? get totalUsageLimit => _$this._totalUsageLimit;
  set totalUsageLimit(num? totalUsageLimit) =>
      _$this._totalUsageLimit = totalUsageLimit;

  num? _perCustomerUsageLimit;
  num? get perCustomerUsageLimit => _$this._perCustomerUsageLimit;
  set perCustomerUsageLimit(num? perCustomerUsageLimit) =>
      _$this._perCustomerUsageLimit = perCustomerUsageLimit;

  CouponResponseDtoBuilder() {
    CouponResponseDto._defaults(this);
  }

  CouponResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _promotionId = $v.promotionId;
      _code = $v.code;
      _normalizedCode = $v.normalizedCode;
      _status = $v.status;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _startsAt = $v.startsAt;
      _endsAt = $v.endsAt;
      _totalUsageLimit = $v.totalUsageLimit;
      _perCustomerUsageLimit = $v.perCustomerUsageLimit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CouponResponseDto other) {
    _$v = other as _$CouponResponseDto;
  }

  @override
  void update(void Function(CouponResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CouponResponseDto build() => _build();

  _$CouponResponseDto _build() {
    final _$result = _$v ??
        _$CouponResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'CouponResponseDto', 'id'),
          promotionId: BuiltValueNullFieldError.checkNotNull(
              promotionId, r'CouponResponseDto', 'promotionId'),
          code: BuiltValueNullFieldError.checkNotNull(
              code, r'CouponResponseDto', 'code'),
          normalizedCode: BuiltValueNullFieldError.checkNotNull(
              normalizedCode, r'CouponResponseDto', 'normalizedCode'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'CouponResponseDto', 'status'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'CouponResponseDto', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'CouponResponseDto', 'updatedAt'),
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
