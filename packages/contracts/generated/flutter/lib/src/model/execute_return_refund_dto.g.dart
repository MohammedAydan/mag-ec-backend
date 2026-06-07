// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'execute_return_refund_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ExecuteReturnRefundDto extends ExecuteReturnRefundDto {
  @override
  final num amount;
  @override
  final String? reason;
  @override
  final bool? isOverride;
  @override
  final String? overrideReason;

  factory _$ExecuteReturnRefundDto(
          [void Function(ExecuteReturnRefundDtoBuilder)? updates]) =>
      (ExecuteReturnRefundDtoBuilder()..update(updates))._build();

  _$ExecuteReturnRefundDto._(
      {required this.amount, this.reason, this.isOverride, this.overrideReason})
      : super._();
  @override
  ExecuteReturnRefundDto rebuild(
          void Function(ExecuteReturnRefundDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExecuteReturnRefundDtoBuilder toBuilder() =>
      ExecuteReturnRefundDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExecuteReturnRefundDto &&
        amount == other.amount &&
        reason == other.reason &&
        isOverride == other.isOverride &&
        overrideReason == other.overrideReason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, isOverride.hashCode);
    _$hash = $jc(_$hash, overrideReason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExecuteReturnRefundDto')
          ..add('amount', amount)
          ..add('reason', reason)
          ..add('isOverride', isOverride)
          ..add('overrideReason', overrideReason))
        .toString();
  }
}

class ExecuteReturnRefundDtoBuilder
    implements Builder<ExecuteReturnRefundDto, ExecuteReturnRefundDtoBuilder> {
  _$ExecuteReturnRefundDto? _$v;

  num? _amount;
  num? get amount => _$this._amount;
  set amount(num? amount) => _$this._amount = amount;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  bool? _isOverride;
  bool? get isOverride => _$this._isOverride;
  set isOverride(bool? isOverride) => _$this._isOverride = isOverride;

  String? _overrideReason;
  String? get overrideReason => _$this._overrideReason;
  set overrideReason(String? overrideReason) =>
      _$this._overrideReason = overrideReason;

  ExecuteReturnRefundDtoBuilder() {
    ExecuteReturnRefundDto._defaults(this);
  }

  ExecuteReturnRefundDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _reason = $v.reason;
      _isOverride = $v.isOverride;
      _overrideReason = $v.overrideReason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExecuteReturnRefundDto other) {
    _$v = other as _$ExecuteReturnRefundDto;
  }

  @override
  void update(void Function(ExecuteReturnRefundDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExecuteReturnRefundDto build() => _build();

  _$ExecuteReturnRefundDto _build() {
    final _$result = _$v ??
        _$ExecuteReturnRefundDto._(
          amount: BuiltValueNullFieldError.checkNotNull(
              amount, r'ExecuteReturnRefundDto', 'amount'),
          reason: reason,
          isOverride: isOverride,
          overrideReason: overrideReason,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
