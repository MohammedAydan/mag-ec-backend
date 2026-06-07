// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_stock_movements_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedStockMovementsDto extends PaginatedStockMovementsDto {
  @override
  final BuiltList<StockMovementItemDto> items;
  @override
  final PaginationDto pagination;

  factory _$PaginatedStockMovementsDto(
          [void Function(PaginatedStockMovementsDtoBuilder)? updates]) =>
      (PaginatedStockMovementsDtoBuilder()..update(updates))._build();

  _$PaginatedStockMovementsDto._(
      {required this.items, required this.pagination})
      : super._();
  @override
  PaginatedStockMovementsDto rebuild(
          void Function(PaginatedStockMovementsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedStockMovementsDtoBuilder toBuilder() =>
      PaginatedStockMovementsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedStockMovementsDto &&
        items == other.items &&
        pagination == other.pagination;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, pagination.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaginatedStockMovementsDto')
          ..add('items', items)
          ..add('pagination', pagination))
        .toString();
  }
}

class PaginatedStockMovementsDtoBuilder
    implements
        Builder<PaginatedStockMovementsDto, PaginatedStockMovementsDtoBuilder> {
  _$PaginatedStockMovementsDto? _$v;

  ListBuilder<StockMovementItemDto>? _items;
  ListBuilder<StockMovementItemDto> get items =>
      _$this._items ??= ListBuilder<StockMovementItemDto>();
  set items(ListBuilder<StockMovementItemDto>? items) => _$this._items = items;

  PaginationDtoBuilder? _pagination;
  PaginationDtoBuilder get pagination =>
      _$this._pagination ??= PaginationDtoBuilder();
  set pagination(PaginationDtoBuilder? pagination) =>
      _$this._pagination = pagination;

  PaginatedStockMovementsDtoBuilder() {
    PaginatedStockMovementsDto._defaults(this);
  }

  PaginatedStockMovementsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _pagination = $v.pagination.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedStockMovementsDto other) {
    _$v = other as _$PaginatedStockMovementsDto;
  }

  @override
  void update(void Function(PaginatedStockMovementsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedStockMovementsDto build() => _build();

  _$PaginatedStockMovementsDto _build() {
    _$PaginatedStockMovementsDto _$result;
    try {
      _$result = _$v ??
          _$PaginatedStockMovementsDto._(
            items: items.build(),
            pagination: pagination.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
        _$failedField = 'pagination';
        pagination.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PaginatedStockMovementsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
