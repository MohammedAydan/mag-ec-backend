// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_paginated_catalog_products_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminPaginatedCatalogProductsDto
    extends AdminPaginatedCatalogProductsDto {
  @override
  final BuiltList<AdminCatalogProductDto> items;
  @override
  final String? nextCursor;

  factory _$AdminPaginatedCatalogProductsDto(
          [void Function(AdminPaginatedCatalogProductsDtoBuilder)? updates]) =>
      (AdminPaginatedCatalogProductsDtoBuilder()..update(updates))._build();

  _$AdminPaginatedCatalogProductsDto._({required this.items, this.nextCursor})
      : super._();
  @override
  AdminPaginatedCatalogProductsDto rebuild(
          void Function(AdminPaginatedCatalogProductsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminPaginatedCatalogProductsDtoBuilder toBuilder() =>
      AdminPaginatedCatalogProductsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminPaginatedCatalogProductsDto &&
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
    return (newBuiltValueToStringHelper(r'AdminPaginatedCatalogProductsDto')
          ..add('items', items)
          ..add('nextCursor', nextCursor))
        .toString();
  }
}

class AdminPaginatedCatalogProductsDtoBuilder
    implements
        Builder<AdminPaginatedCatalogProductsDto,
            AdminPaginatedCatalogProductsDtoBuilder> {
  _$AdminPaginatedCatalogProductsDto? _$v;

  ListBuilder<AdminCatalogProductDto>? _items;
  ListBuilder<AdminCatalogProductDto> get items =>
      _$this._items ??= ListBuilder<AdminCatalogProductDto>();
  set items(ListBuilder<AdminCatalogProductDto>? items) =>
      _$this._items = items;

  String? _nextCursor;
  String? get nextCursor => _$this._nextCursor;
  set nextCursor(String? nextCursor) => _$this._nextCursor = nextCursor;

  AdminPaginatedCatalogProductsDtoBuilder() {
    AdminPaginatedCatalogProductsDto._defaults(this);
  }

  AdminPaginatedCatalogProductsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _nextCursor = $v.nextCursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminPaginatedCatalogProductsDto other) {
    _$v = other as _$AdminPaginatedCatalogProductsDto;
  }

  @override
  void update(void Function(AdminPaginatedCatalogProductsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminPaginatedCatalogProductsDto build() => _build();

  _$AdminPaginatedCatalogProductsDto _build() {
    _$AdminPaginatedCatalogProductsDto _$result;
    try {
      _$result = _$v ??
          _$AdminPaginatedCatalogProductsDto._(
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
            r'AdminPaginatedCatalogProductsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
