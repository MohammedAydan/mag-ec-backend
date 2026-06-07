// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_refunds_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedRefundsDto extends PaginatedRefundsDto {
  @override
  final BuiltList<RefundResponseDto> items;
  @override
  final String? nextCursor;

  factory _$PaginatedRefundsDto(
          [void Function(PaginatedRefundsDtoBuilder)? updates]) =>
      (PaginatedRefundsDtoBuilder()..update(updates))._build();

  _$PaginatedRefundsDto._({required this.items, this.nextCursor}) : super._();
  @override
  PaginatedRefundsDto rebuild(
          void Function(PaginatedRefundsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedRefundsDtoBuilder toBuilder() =>
      PaginatedRefundsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedRefundsDto &&
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
    return (newBuiltValueToStringHelper(r'PaginatedRefundsDto')
          ..add('items', items)
          ..add('nextCursor', nextCursor))
        .toString();
  }
}

class PaginatedRefundsDtoBuilder
    implements Builder<PaginatedRefundsDto, PaginatedRefundsDtoBuilder> {
  _$PaginatedRefundsDto? _$v;

  ListBuilder<RefundResponseDto>? _items;
  ListBuilder<RefundResponseDto> get items =>
      _$this._items ??= ListBuilder<RefundResponseDto>();
  set items(ListBuilder<RefundResponseDto>? items) => _$this._items = items;

  String? _nextCursor;
  String? get nextCursor => _$this._nextCursor;
  set nextCursor(String? nextCursor) => _$this._nextCursor = nextCursor;

  PaginatedRefundsDtoBuilder() {
    PaginatedRefundsDto._defaults(this);
  }

  PaginatedRefundsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _nextCursor = $v.nextCursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedRefundsDto other) {
    _$v = other as _$PaginatedRefundsDto;
  }

  @override
  void update(void Function(PaginatedRefundsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedRefundsDto build() => _build();

  _$PaginatedRefundsDto _build() {
    _$PaginatedRefundsDto _$result;
    try {
      _$result = _$v ??
          _$PaginatedRefundsDto._(
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
            r'PaginatedRefundsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
