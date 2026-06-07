// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_payment_attempts_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedPaymentAttemptsDto extends PaginatedPaymentAttemptsDto {
  @override
  final BuiltList<PaymentAttemptResponseDto> items;
  @override
  final String? nextCursor;

  factory _$PaginatedPaymentAttemptsDto(
          [void Function(PaginatedPaymentAttemptsDtoBuilder)? updates]) =>
      (PaginatedPaymentAttemptsDtoBuilder()..update(updates))._build();

  _$PaginatedPaymentAttemptsDto._({required this.items, this.nextCursor})
      : super._();
  @override
  PaginatedPaymentAttemptsDto rebuild(
          void Function(PaginatedPaymentAttemptsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedPaymentAttemptsDtoBuilder toBuilder() =>
      PaginatedPaymentAttemptsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedPaymentAttemptsDto &&
        items == other.items &&
        nextCursor == other.nextCursor;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, nextCursor.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaginatedPaymentAttemptsDto')
          ..add('items', items)
          ..add('nextCursor', nextCursor))
        .toString();
  }
}

class PaginatedPaymentAttemptsDtoBuilder
    implements
        Builder<PaginatedPaymentAttemptsDto,
            PaginatedPaymentAttemptsDtoBuilder> {
  _$PaginatedPaymentAttemptsDto? _$v;

  ListBuilder<PaymentAttemptResponseDto>? _items;
  ListBuilder<PaymentAttemptResponseDto> get items =>
      _$this._items ??= ListBuilder<PaymentAttemptResponseDto>();
  set items(ListBuilder<PaymentAttemptResponseDto>? items) =>
      _$this._items = items;

  String? _nextCursor;
  String? get nextCursor => _$this._nextCursor;
  set nextCursor(String? nextCursor) => _$this._nextCursor = nextCursor;

  PaginatedPaymentAttemptsDtoBuilder() {
    PaginatedPaymentAttemptsDto._defaults(this);
  }

  PaginatedPaymentAttemptsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _nextCursor = $v.nextCursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedPaymentAttemptsDto other) {
    _$v = other as _$PaginatedPaymentAttemptsDto;
  }

  @override
  void update(void Function(PaginatedPaymentAttemptsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedPaymentAttemptsDto build() => _build();

  _$PaginatedPaymentAttemptsDto _build() {
    _$PaginatedPaymentAttemptsDto _$result;
    try {
      _$result = _$v ??
          _$PaginatedPaymentAttemptsDto._(
            items: items.build(),
            nextCursor: nextCursor,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PaginatedPaymentAttemptsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
