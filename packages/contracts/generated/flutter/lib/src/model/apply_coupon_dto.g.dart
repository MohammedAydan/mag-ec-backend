// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_coupon_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApplyCouponDto extends ApplyCouponDto {
  @override
  final String couponCode;

  factory _$ApplyCouponDto([void Function(ApplyCouponDtoBuilder)? updates]) =>
      (ApplyCouponDtoBuilder()..update(updates))._build();

  _$ApplyCouponDto._({required this.couponCode}) : super._();
  @override
  ApplyCouponDto rebuild(void Function(ApplyCouponDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApplyCouponDtoBuilder toBuilder() => ApplyCouponDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApplyCouponDto && couponCode == other.couponCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, couponCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApplyCouponDto')
          ..add('couponCode', couponCode))
        .toString();
  }
}

class ApplyCouponDtoBuilder
    implements Builder<ApplyCouponDto, ApplyCouponDtoBuilder> {
  _$ApplyCouponDto? _$v;

  String? _couponCode;
  String? get couponCode => _$this._couponCode;
  set couponCode(String? couponCode) => _$this._couponCode = couponCode;

  ApplyCouponDtoBuilder() {
    ApplyCouponDto._defaults(this);
  }

  ApplyCouponDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _couponCode = $v.couponCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApplyCouponDto other) {
    _$v = other as _$ApplyCouponDto;
  }

  @override
  void update(void Function(ApplyCouponDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApplyCouponDto build() => _build();

  _$ApplyCouponDto _build() {
    final _$result = _$v ??
        _$ApplyCouponDto._(
          couponCode: BuiltValueNullFieldError.checkNotNull(
              couponCode, r'ApplyCouponDto', 'couponCode'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
