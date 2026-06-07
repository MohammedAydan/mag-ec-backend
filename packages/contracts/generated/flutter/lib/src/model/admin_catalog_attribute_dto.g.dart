// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_catalog_attribute_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminCatalogAttributeDto extends AdminCatalogAttributeDto {
  @override
  final String id;
  @override
  final String key;
  @override
  final String inputType;
  @override
  final bool isFilterable;
  @override
  final bool isVariantDefining;
  @override
  final num sortOrder;
  @override
  final BuiltList<AdminCatalogTranslationDto> translations;
  @override
  final BuiltList<AdminCatalogAttributeOptionDto> options;

  factory _$AdminCatalogAttributeDto(
          [void Function(AdminCatalogAttributeDtoBuilder)? updates]) =>
      (AdminCatalogAttributeDtoBuilder()..update(updates))._build();

  _$AdminCatalogAttributeDto._(
      {required this.id,
      required this.key,
      required this.inputType,
      required this.isFilterable,
      required this.isVariantDefining,
      required this.sortOrder,
      required this.translations,
      required this.options})
      : super._();
  @override
  AdminCatalogAttributeDto rebuild(
          void Function(AdminCatalogAttributeDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminCatalogAttributeDtoBuilder toBuilder() =>
      AdminCatalogAttributeDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminCatalogAttributeDto &&
        id == other.id &&
        key == other.key &&
        inputType == other.inputType &&
        isFilterable == other.isFilterable &&
        isVariantDefining == other.isVariantDefining &&
        sortOrder == other.sortOrder &&
        translations == other.translations &&
        options == other.options;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, inputType.hashCode);
    _$hash = $jc(_$hash, isFilterable.hashCode);
    _$hash = $jc(_$hash, isVariantDefining.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminCatalogAttributeDto')
          ..add('id', id)
          ..add('key', key)
          ..add('inputType', inputType)
          ..add('isFilterable', isFilterable)
          ..add('isVariantDefining', isVariantDefining)
          ..add('sortOrder', sortOrder)
          ..add('translations', translations)
          ..add('options', options))
        .toString();
  }
}

class AdminCatalogAttributeDtoBuilder
    implements
        Builder<AdminCatalogAttributeDto, AdminCatalogAttributeDtoBuilder> {
  _$AdminCatalogAttributeDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _inputType;
  String? get inputType => _$this._inputType;
  set inputType(String? inputType) => _$this._inputType = inputType;

  bool? _isFilterable;
  bool? get isFilterable => _$this._isFilterable;
  set isFilterable(bool? isFilterable) => _$this._isFilterable = isFilterable;

  bool? _isVariantDefining;
  bool? get isVariantDefining => _$this._isVariantDefining;
  set isVariantDefining(bool? isVariantDefining) =>
      _$this._isVariantDefining = isVariantDefining;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  ListBuilder<AdminCatalogTranslationDto>? _translations;
  ListBuilder<AdminCatalogTranslationDto> get translations =>
      _$this._translations ??= ListBuilder<AdminCatalogTranslationDto>();
  set translations(ListBuilder<AdminCatalogTranslationDto>? translations) =>
      _$this._translations = translations;

  ListBuilder<AdminCatalogAttributeOptionDto>? _options;
  ListBuilder<AdminCatalogAttributeOptionDto> get options =>
      _$this._options ??= ListBuilder<AdminCatalogAttributeOptionDto>();
  set options(ListBuilder<AdminCatalogAttributeOptionDto>? options) =>
      _$this._options = options;

  AdminCatalogAttributeDtoBuilder() {
    AdminCatalogAttributeDto._defaults(this);
  }

  AdminCatalogAttributeDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _inputType = $v.inputType;
      _isFilterable = $v.isFilterable;
      _isVariantDefining = $v.isVariantDefining;
      _sortOrder = $v.sortOrder;
      _translations = $v.translations.toBuilder();
      _options = $v.options.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminCatalogAttributeDto other) {
    _$v = other as _$AdminCatalogAttributeDto;
  }

  @override
  void update(void Function(AdminCatalogAttributeDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminCatalogAttributeDto build() => _build();

  _$AdminCatalogAttributeDto _build() {
    _$AdminCatalogAttributeDto _$result;
    try {
      _$result = _$v ??
          _$AdminCatalogAttributeDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AdminCatalogAttributeDto', 'id'),
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'AdminCatalogAttributeDto', 'key'),
            inputType: BuiltValueNullFieldError.checkNotNull(
                inputType, r'AdminCatalogAttributeDto', 'inputType'),
            isFilterable: BuiltValueNullFieldError.checkNotNull(
                isFilterable, r'AdminCatalogAttributeDto', 'isFilterable'),
            isVariantDefining: BuiltValueNullFieldError.checkNotNull(
                isVariantDefining,
                r'AdminCatalogAttributeDto',
                'isVariantDefining'),
            sortOrder: BuiltValueNullFieldError.checkNotNull(
                sortOrder, r'AdminCatalogAttributeDto', 'sortOrder'),
            translations: translations.build(),
            options: options.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
        _$failedField = 'options';
        options.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AdminCatalogAttributeDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
