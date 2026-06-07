// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_payment_webhook_events_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedPaymentWebhookEventsDto
    extends PaginatedPaymentWebhookEventsDto {
  @override
  final BuiltList<PaymentWebhookEventResponseDto> items;
  @override
  final String? nextCursor;

  factory _$PaginatedPaymentWebhookEventsDto(
          [void Function(PaginatedPaymentWebhookEventsDtoBuilder)? updates]) =>
      (PaginatedPaymentWebhookEventsDtoBuilder()..update(updates))._build();

  _$PaginatedPaymentWebhookEventsDto._({required this.items, this.nextCursor})
      : super._();
  @override
  PaginatedPaymentWebhookEventsDto rebuild(
          void Function(PaginatedPaymentWebhookEventsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedPaymentWebhookEventsDtoBuilder toBuilder() =>
      PaginatedPaymentWebhookEventsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedPaymentWebhookEventsDto &&
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
    return (newBuiltValueToStringHelper(r'PaginatedPaymentWebhookEventsDto')
          ..add('items', items)
          ..add('nextCursor', nextCursor))
        .toString();
  }
}

class PaginatedPaymentWebhookEventsDtoBuilder
    implements
        Builder<PaginatedPaymentWebhookEventsDto,
            PaginatedPaymentWebhookEventsDtoBuilder> {
  _$PaginatedPaymentWebhookEventsDto? _$v;

  ListBuilder<PaymentWebhookEventResponseDto>? _items;
  ListBuilder<PaymentWebhookEventResponseDto> get items =>
      _$this._items ??= ListBuilder<PaymentWebhookEventResponseDto>();
  set items(ListBuilder<PaymentWebhookEventResponseDto>? items) =>
      _$this._items = items;

  String? _nextCursor;
  String? get nextCursor => _$this._nextCursor;
  set nextCursor(String? nextCursor) => _$this._nextCursor = nextCursor;

  PaginatedPaymentWebhookEventsDtoBuilder() {
    PaginatedPaymentWebhookEventsDto._defaults(this);
  }

  PaginatedPaymentWebhookEventsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _nextCursor = $v.nextCursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedPaymentWebhookEventsDto other) {
    _$v = other as _$PaginatedPaymentWebhookEventsDto;
  }

  @override
  void update(void Function(PaginatedPaymentWebhookEventsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedPaymentWebhookEventsDto build() => _build();

  _$PaginatedPaymentWebhookEventsDto _build() {
    _$PaginatedPaymentWebhookEventsDto _$result;
    try {
      _$result = _$v ??
          _$PaginatedPaymentWebhookEventsDto._(
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
            r'PaginatedPaymentWebhookEventsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
