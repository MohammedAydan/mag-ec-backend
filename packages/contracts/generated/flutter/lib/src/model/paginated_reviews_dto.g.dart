// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_reviews_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedReviewsDto extends PaginatedReviewsDto {
  @override
  final BuiltList<ReviewResponseDto> items;
  @override
  final String? nextCursor;

  factory _$PaginatedReviewsDto(
          [void Function(PaginatedReviewsDtoBuilder)? updates]) =>
      (PaginatedReviewsDtoBuilder()..update(updates))._build();

  _$PaginatedReviewsDto._({required this.items, this.nextCursor}) : super._();
  @override
  PaginatedReviewsDto rebuild(
          void Function(PaginatedReviewsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedReviewsDtoBuilder toBuilder() =>
      PaginatedReviewsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedReviewsDto &&
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
    return (newBuiltValueToStringHelper(r'PaginatedReviewsDto')
          ..add('items', items)
          ..add('nextCursor', nextCursor))
        .toString();
  }
}

class PaginatedReviewsDtoBuilder
    implements Builder<PaginatedReviewsDto, PaginatedReviewsDtoBuilder> {
  _$PaginatedReviewsDto? _$v;

  ListBuilder<ReviewResponseDto>? _items;
  ListBuilder<ReviewResponseDto> get items =>
      _$this._items ??= ListBuilder<ReviewResponseDto>();
  set items(ListBuilder<ReviewResponseDto>? items) => _$this._items = items;

  String? _nextCursor;
  String? get nextCursor => _$this._nextCursor;
  set nextCursor(String? nextCursor) => _$this._nextCursor = nextCursor;

  PaginatedReviewsDtoBuilder() {
    PaginatedReviewsDto._defaults(this);
  }

  PaginatedReviewsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _nextCursor = $v.nextCursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedReviewsDto other) {
    _$v = other as _$PaginatedReviewsDto;
  }

  @override
  void update(void Function(PaginatedReviewsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedReviewsDto build() => _build();

  _$PaginatedReviewsDto _build() {
    _$PaginatedReviewsDto _$result;
    try {
      _$result = _$v ??
          _$PaginatedReviewsDto._(
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
            r'PaginatedReviewsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
