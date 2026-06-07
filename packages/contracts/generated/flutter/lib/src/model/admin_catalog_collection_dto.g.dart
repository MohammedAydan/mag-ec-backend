// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_catalog_collection_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminCatalogCollectionDto extends AdminCatalogCollectionDto {
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

  factory _$AdminCatalogCollectionDto(
          [void Function(AdminCatalogCollectionDtoBuilder)? updates]) =>
      (AdminCatalogCollectionDtoBuilder()..update(updates))._build();

  _$AdminCatalogCollectionDto._(
      {required this.id,
      required this.key,
      required this.status,
      required this.sortOrder,
      required this.translations})
      : super._();
  @override
  AdminCatalogCollectionDto rebuild(
          void Function(AdminCatalogCollectionDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminCatalogCollectionDtoBuilder toBuilder() =>
      AdminCatalogCollectionDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminCatalogCollectionDto &&
        id == other.id &&
        key == other.key &&
        status == other.status &&
        sortOrder == other.sortOrder &&
        translations == other.translations;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminCatalogCollectionDto')
          ..add('id', id)
          ..add('key', key)
          ..add('status', status)
          ..add('sortOrder', sortOrder)
          ..add('translations', translations))
        .toString();
  }
}

class AdminCatalogCollectionDtoBuilder
    implements
        Builder<AdminCatalogCollectionDto, AdminCatalogCollectionDtoBuilder> {
  _$AdminCatalogCollectionDto? _$v;

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

  AdminCatalogCollectionDtoBuilder() {
    AdminCatalogCollectionDto._defaults(this);
  }

  AdminCatalogCollectionDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _status = $v.status;
      _sortOrder = $v.sortOrder;
      _translations = $v.translations.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminCatalogCollectionDto other) {
    _$v = other as _$AdminCatalogCollectionDto;
  }

  @override
  void update(void Function(AdminCatalogCollectionDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminCatalogCollectionDto build() => _build();

  _$AdminCatalogCollectionDto _build() {
    _$AdminCatalogCollectionDto _$result;
    try {
      _$result = _$v ??
          _$AdminCatalogCollectionDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AdminCatalogCollectionDto', 'id'),
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'AdminCatalogCollectionDto', 'key'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AdminCatalogCollectionDto', 'status'),
            sortOrder: BuiltValueNullFieldError.checkNotNull(
                sortOrder, r'AdminCatalogCollectionDto', 'sortOrder'),
            translations: translations.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AdminCatalogCollectionDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
