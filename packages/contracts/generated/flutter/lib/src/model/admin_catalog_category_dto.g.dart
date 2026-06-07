// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_catalog_category_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminCatalogCategoryDto extends AdminCatalogCategoryDto {
  @override
  final String id;
  @override
  final String key;
  @override
  final String status;
  @override
  final num sortOrder;
  @override
  final BuiltList<AdminCatalogTranslationDto> translations;
  @override
  final String? parentId;

  factory _$AdminCatalogCategoryDto(
          [void Function(AdminCatalogCategoryDtoBuilder)? updates]) =>
      (AdminCatalogCategoryDtoBuilder()..update(updates))._build();

  _$AdminCatalogCategoryDto._(
      {required this.id,
      required this.key,
      required this.status,
      required this.sortOrder,
      required this.translations,
      this.parentId})
      : super._();
  @override
  AdminCatalogCategoryDto rebuild(
          void Function(AdminCatalogCategoryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminCatalogCategoryDtoBuilder toBuilder() =>
      AdminCatalogCategoryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminCatalogCategoryDto &&
        id == other.id &&
        key == other.key &&
        status == other.status &&
        sortOrder == other.sortOrder &&
        translations == other.translations &&
        parentId == other.parentId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, parentId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminCatalogCategoryDto')
          ..add('id', id)
          ..add('key', key)
          ..add('status', status)
          ..add('sortOrder', sortOrder)
          ..add('translations', translations)
          ..add('parentId', parentId))
        .toString();
  }
}

class AdminCatalogCategoryDtoBuilder
    implements
        Builder<AdminCatalogCategoryDto, AdminCatalogCategoryDtoBuilder> {
  _$AdminCatalogCategoryDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  ListBuilder<AdminCatalogTranslationDto>? _translations;
  ListBuilder<AdminCatalogTranslationDto> get translations =>
      _$this._translations ??= ListBuilder<AdminCatalogTranslationDto>();
  set translations(ListBuilder<AdminCatalogTranslationDto>? translations) =>
      _$this._translations = translations;

  String? _parentId;
  String? get parentId => _$this._parentId;
  set parentId(String? parentId) => _$this._parentId = parentId;

  AdminCatalogCategoryDtoBuilder() {
    AdminCatalogCategoryDto._defaults(this);
  }

  AdminCatalogCategoryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _status = $v.status;
      _sortOrder = $v.sortOrder;
      _translations = $v.translations.toBuilder();
      _parentId = $v.parentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminCatalogCategoryDto other) {
    _$v = other as _$AdminCatalogCategoryDto;
  }

  @override
  void update(void Function(AdminCatalogCategoryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminCatalogCategoryDto build() => _build();

  _$AdminCatalogCategoryDto _build() {
    _$AdminCatalogCategoryDto _$result;
    try {
      _$result = _$v ??
          _$AdminCatalogCategoryDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AdminCatalogCategoryDto', 'id'),
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'AdminCatalogCategoryDto', 'key'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AdminCatalogCategoryDto', 'status'),
            sortOrder: BuiltValueNullFieldError.checkNotNull(
                sortOrder, r'AdminCatalogCategoryDto', 'sortOrder'),
            translations: translations.build(),
            parentId: parentId,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AdminCatalogCategoryDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
