// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginationDto extends PaginationDto {
  @override
  final int page;
  @override
  final int limit;
  @override
  final int total;
  @override
  final int totalPages;

  factory _$PaginationDto([void Function(PaginationDtoBuilder)? updates]) =>
      (PaginationDtoBuilder()..update(updates))._build();

  _$PaginationDto._(
      {required this.page,
      required this.limit,
      required this.total,
      required this.totalPages})
      : super._();
  @override
  PaginationDto rebuild(void Function(PaginationDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationDtoBuilder toBuilder() => PaginationDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginationDto &&
        page == other.page &&
        limit == other.limit &&
        total == other.total &&
        totalPages == other.totalPages;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, totalPages.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaginationDto')
          ..add('page', page)
          ..add('limit', limit)
          ..add('total', total)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class PaginationDtoBuilder
    implements Builder<PaginationDto, PaginationDtoBuilder> {
  _$PaginationDto? _$v;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _totalPages;
  int? get totalPages => _$this._totalPages;
  set totalPages(int? totalPages) => _$this._totalPages = totalPages;

  PaginationDtoBuilder() {
    PaginationDto._defaults(this);
  }

  PaginationDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page;
      _limit = $v.limit;
      _total = $v.total;
      _totalPages = $v.totalPages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginationDto other) {
    _$v = other as _$PaginationDto;
  }

  @override
  void update(void Function(PaginationDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginationDto build() => _build();

  _$PaginationDto _build() {
    final _$result = _$v ??
        _$PaginationDto._(
          page: BuiltValueNullFieldError.checkNotNull(
              page, r'PaginationDto', 'page'),
          limit: BuiltValueNullFieldError.checkNotNull(
              limit, r'PaginationDto', 'limit'),
          total: BuiltValueNullFieldError.checkNotNull(
              total, r'PaginationDto', 'total'),
          totalPages: BuiltValueNullFieldError.checkNotNull(
              totalPages, r'PaginationDto', 'totalPages'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
