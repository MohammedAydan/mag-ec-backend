// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_catalog_products_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedCatalogProductsDto extends PaginatedCatalogProductsDto {
  @override
  final BuiltList<CatalogProductSummaryDto> items;
  @override
  final int total;
  @override
  final int page;
  @override
  final int pageSize;

  factory _$PaginatedCatalogProductsDto(
          [void Function(PaginatedCatalogProductsDtoBuilder)? updates]) =>
      (PaginatedCatalogProductsDtoBuilder()..update(updates))._build();

  _$PaginatedCatalogProductsDto._(
      {required this.items,
      required this.total,
      required this.page,
      required this.pageSize})
      : super._();
  @override
  PaginatedCatalogProductsDto rebuild(
          void Function(PaginatedCatalogProductsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedCatalogProductsDtoBuilder toBuilder() =>
      PaginatedCatalogProductsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedCatalogProductsDto &&
        items == other.items &&
        total == other.total &&
        page == other.page &&
        pageSize == other.pageSize;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, pageSize.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaginatedCatalogProductsDto')
          ..add('items', items)
          ..add('total', total)
          ..add('page', page)
          ..add('pageSize', pageSize))
        .toString();
  }
}

class PaginatedCatalogProductsDtoBuilder
    implements
        Builder<PaginatedCatalogProductsDto,
            PaginatedCatalogProductsDtoBuilder> {
  _$PaginatedCatalogProductsDto? _$v;

  ListBuilder<CatalogProductSummaryDto>? _items;
  ListBuilder<CatalogProductSummaryDto> get items =>
      _$this._items ??= ListBuilder<CatalogProductSummaryDto>();
  set items(ListBuilder<CatalogProductSummaryDto>? items) =>
      _$this._items = items;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _pageSize;
  int? get pageSize => _$this._pageSize;
  set pageSize(int? pageSize) => _$this._pageSize = pageSize;

  PaginatedCatalogProductsDtoBuilder() {
    PaginatedCatalogProductsDto._defaults(this);
  }

  PaginatedCatalogProductsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _total = $v.total;
      _page = $v.page;
      _pageSize = $v.pageSize;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedCatalogProductsDto other) {
    _$v = other as _$PaginatedCatalogProductsDto;
  }

  @override
  void update(void Function(PaginatedCatalogProductsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedCatalogProductsDto build() => _build();

  _$PaginatedCatalogProductsDto _build() {
    _$PaginatedCatalogProductsDto _$result;
    try {
      _$result = _$v ??
          _$PaginatedCatalogProductsDto._(
            items: items.build(),
            total: BuiltValueNullFieldError.checkNotNull(
                total, r'PaginatedCatalogProductsDto', 'total'),
            page: BuiltValueNullFieldError.checkNotNull(
                page, r'PaginatedCatalogProductsDto', 'page'),
            pageSize: BuiltValueNullFieldError.checkNotNull(
                pageSize, r'PaginatedCatalogProductsDto', 'pageSize'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PaginatedCatalogProductsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
