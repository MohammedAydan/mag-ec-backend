// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_report_exports_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedReportExportsDto extends PaginatedReportExportsDto {
  @override
  final BuiltList<ReportExportResponseDto> items;
  @override
  final String? nextCursor;

  factory _$PaginatedReportExportsDto(
          [void Function(PaginatedReportExportsDtoBuilder)? updates]) =>
      (PaginatedReportExportsDtoBuilder()..update(updates))._build();

  _$PaginatedReportExportsDto._({required this.items, this.nextCursor})
      : super._();
  @override
  PaginatedReportExportsDto rebuild(
          void Function(PaginatedReportExportsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedReportExportsDtoBuilder toBuilder() =>
      PaginatedReportExportsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedReportExportsDto &&
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
    return (newBuiltValueToStringHelper(r'PaginatedReportExportsDto')
          ..add('items', items)
          ..add('nextCursor', nextCursor))
        .toString();
  }
}

class PaginatedReportExportsDtoBuilder
    implements
        Builder<PaginatedReportExportsDto, PaginatedReportExportsDtoBuilder> {
  _$PaginatedReportExportsDto? _$v;

  ListBuilder<ReportExportResponseDto>? _items;
  ListBuilder<ReportExportResponseDto> get items =>
      _$this._items ??= ListBuilder<ReportExportResponseDto>();
  set items(ListBuilder<ReportExportResponseDto>? items) =>
      _$this._items = items;

  String? _nextCursor;
  String? get nextCursor => _$this._nextCursor;
  set nextCursor(String? nextCursor) => _$this._nextCursor = nextCursor;

  PaginatedReportExportsDtoBuilder() {
    PaginatedReportExportsDto._defaults(this);
  }

  PaginatedReportExportsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _nextCursor = $v.nextCursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedReportExportsDto other) {
    _$v = other as _$PaginatedReportExportsDto;
  }

  @override
  void update(void Function(PaginatedReportExportsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedReportExportsDto build() => _build();

  _$PaginatedReportExportsDto _build() {
    _$PaginatedReportExportsDto _$result;
    try {
      _$result = _$v ??
          _$PaginatedReportExportsDto._(
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
            r'PaginatedReportExportsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
