// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_audit_logs_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedAuditLogsDto extends PaginatedAuditLogsDto {
  @override
  final BuiltList<AuditLogResponseDto> items;
  @override
  final String? nextCursor;

  factory _$PaginatedAuditLogsDto(
          [void Function(PaginatedAuditLogsDtoBuilder)? updates]) =>
      (PaginatedAuditLogsDtoBuilder()..update(updates))._build();

  _$PaginatedAuditLogsDto._({required this.items, this.nextCursor}) : super._();
  @override
  PaginatedAuditLogsDto rebuild(
          void Function(PaginatedAuditLogsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedAuditLogsDtoBuilder toBuilder() =>
      PaginatedAuditLogsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedAuditLogsDto &&
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
    return (newBuiltValueToStringHelper(r'PaginatedAuditLogsDto')
          ..add('items', items)
          ..add('nextCursor', nextCursor))
        .toString();
  }
}

class PaginatedAuditLogsDtoBuilder
    implements Builder<PaginatedAuditLogsDto, PaginatedAuditLogsDtoBuilder> {
  _$PaginatedAuditLogsDto? _$v;

  ListBuilder<AuditLogResponseDto>? _items;
  ListBuilder<AuditLogResponseDto> get items =>
      _$this._items ??= ListBuilder<AuditLogResponseDto>();
  set items(ListBuilder<AuditLogResponseDto>? items) => _$this._items = items;

  String? _nextCursor;
  String? get nextCursor => _$this._nextCursor;
  set nextCursor(String? nextCursor) => _$this._nextCursor = nextCursor;

  PaginatedAuditLogsDtoBuilder() {
    PaginatedAuditLogsDto._defaults(this);
  }

  PaginatedAuditLogsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _nextCursor = $v.nextCursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedAuditLogsDto other) {
    _$v = other as _$PaginatedAuditLogsDto;
  }

  @override
  void update(void Function(PaginatedAuditLogsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedAuditLogsDto build() => _build();

  _$PaginatedAuditLogsDto _build() {
    _$PaginatedAuditLogsDto _$result;
    try {
      _$result = _$v ??
          _$PaginatedAuditLogsDto._(
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
            r'PaginatedAuditLogsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
