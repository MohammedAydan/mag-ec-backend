// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_notifications_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginatedNotificationsDto extends PaginatedNotificationsDto {
  @override
  final BuiltList<NotificationResponseDto> items;
  @override
  final String? nextCursor;

  factory _$PaginatedNotificationsDto(
          [void Function(PaginatedNotificationsDtoBuilder)? updates]) =>
      (PaginatedNotificationsDtoBuilder()..update(updates))._build();

  _$PaginatedNotificationsDto._({required this.items, this.nextCursor})
      : super._();
  @override
  PaginatedNotificationsDto rebuild(
          void Function(PaginatedNotificationsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedNotificationsDtoBuilder toBuilder() =>
      PaginatedNotificationsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedNotificationsDto &&
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
    return (newBuiltValueToStringHelper(r'PaginatedNotificationsDto')
          ..add('items', items)
          ..add('nextCursor', nextCursor))
        .toString();
  }
}

class PaginatedNotificationsDtoBuilder
    implements
        Builder<PaginatedNotificationsDto, PaginatedNotificationsDtoBuilder> {
  _$PaginatedNotificationsDto? _$v;

  ListBuilder<NotificationResponseDto>? _items;
  ListBuilder<NotificationResponseDto> get items =>
      _$this._items ??= ListBuilder<NotificationResponseDto>();
  set items(ListBuilder<NotificationResponseDto>? items) =>
      _$this._items = items;

  String? _nextCursor;
  String? get nextCursor => _$this._nextCursor;
  set nextCursor(String? nextCursor) => _$this._nextCursor = nextCursor;

  PaginatedNotificationsDtoBuilder() {
    PaginatedNotificationsDto._defaults(this);
  }

  PaginatedNotificationsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _nextCursor = $v.nextCursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedNotificationsDto other) {
    _$v = other as _$PaginatedNotificationsDto;
  }

  @override
  void update(void Function(PaginatedNotificationsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginatedNotificationsDto build() => _build();

  _$PaginatedNotificationsDto _build() {
    _$PaginatedNotificationsDto _$result;
    try {
      _$result = _$v ??
          _$PaginatedNotificationsDto._(
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
            r'PaginatedNotificationsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
