// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_catalog_relation_link_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminCatalogRelationLinkDto extends AdminCatalogRelationLinkDto {
  @override
  final String id;
  @override
  final num sortOrder;
  @override
  final AdminCatalogCategoryDto? category;
  @override
  final AdminCatalogCollectionDto? collection;
  @override
  final AdminCatalogTagDto? tag;

  factory _$AdminCatalogRelationLinkDto(
          [void Function(AdminCatalogRelationLinkDtoBuilder)? updates]) =>
      (AdminCatalogRelationLinkDtoBuilder()..update(updates))._build();

  _$AdminCatalogRelationLinkDto._(
      {required this.id,
      required this.sortOrder,
      this.category,
      this.collection,
      this.tag})
      : super._();
  @override
  AdminCatalogRelationLinkDto rebuild(
          void Function(AdminCatalogRelationLinkDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminCatalogRelationLinkDtoBuilder toBuilder() =>
      AdminCatalogRelationLinkDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminCatalogRelationLinkDto &&
        id == other.id &&
        sortOrder == other.sortOrder &&
        category == other.category &&
        collection == other.collection &&
        tag == other.tag;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, collection.hashCode);
    _$hash = $jc(_$hash, tag.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminCatalogRelationLinkDto')
          ..add('id', id)
          ..add('sortOrder', sortOrder)
          ..add('category', category)
          ..add('collection', collection)
          ..add('tag', tag))
        .toString();
  }
}

class AdminCatalogRelationLinkDtoBuilder
    implements
        Builder<AdminCatalogRelationLinkDto,
            AdminCatalogRelationLinkDtoBuilder> {
  _$AdminCatalogRelationLinkDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  AdminCatalogCategoryDtoBuilder? _category;
  AdminCatalogCategoryDtoBuilder get category =>
      _$this._category ??= AdminCatalogCategoryDtoBuilder();
  set category(AdminCatalogCategoryDtoBuilder? category) =>
      _$this._category = category;

  AdminCatalogCollectionDtoBuilder? _collection;
  AdminCatalogCollectionDtoBuilder get collection =>
      _$this._collection ??= AdminCatalogCollectionDtoBuilder();
  set collection(AdminCatalogCollectionDtoBuilder? collection) =>
      _$this._collection = collection;

  AdminCatalogTagDtoBuilder? _tag;
  AdminCatalogTagDtoBuilder get tag =>
      _$this._tag ??= AdminCatalogTagDtoBuilder();
  set tag(AdminCatalogTagDtoBuilder? tag) => _$this._tag = tag;

  AdminCatalogRelationLinkDtoBuilder() {
    AdminCatalogRelationLinkDto._defaults(this);
  }

  AdminCatalogRelationLinkDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _sortOrder = $v.sortOrder;
      _category = $v.category?.toBuilder();
      _collection = $v.collection?.toBuilder();
      _tag = $v.tag?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminCatalogRelationLinkDto other) {
    _$v = other as _$AdminCatalogRelationLinkDto;
  }

  @override
  void update(void Function(AdminCatalogRelationLinkDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminCatalogRelationLinkDto build() => _build();

  _$AdminCatalogRelationLinkDto _build() {
    _$AdminCatalogRelationLinkDto _$result;
    try {
      _$result = _$v ??
          _$AdminCatalogRelationLinkDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AdminCatalogRelationLinkDto', 'id'),
            sortOrder: BuiltValueNullFieldError.checkNotNull(
                sortOrder, r'AdminCatalogRelationLinkDto', 'sortOrder'),
            category: _category?.build(),
            collection: _collection?.build(),
            tag: _tag?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'category';
        _category?.build();
        _$failedField = 'collection';
        _collection?.build();
        _$failedField = 'tag';
        _tag?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AdminCatalogRelationLinkDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
