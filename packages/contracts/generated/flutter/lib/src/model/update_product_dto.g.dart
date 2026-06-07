// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateProductDto extends UpdateProductDto {
  @override
  final String? brandId;
  @override
  final bool? isFeatured;
  @override
  final BuiltList<String>? categoryIds;
  @override
  final BuiltList<String>? collectionIds;
  @override
  final BuiltList<String>? tagIds;
  @override
  final BuiltList<ProductTranslationDto>? translations;

  factory _$UpdateProductDto(
          [void Function(UpdateProductDtoBuilder)? updates]) =>
      (UpdateProductDtoBuilder()..update(updates))._build();

  _$UpdateProductDto._(
      {this.brandId,
      this.isFeatured,
      this.categoryIds,
      this.collectionIds,
      this.tagIds,
      this.translations})
      : super._();
  @override
  UpdateProductDto rebuild(void Function(UpdateProductDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateProductDtoBuilder toBuilder() =>
      UpdateProductDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateProductDto &&
        brandId == other.brandId &&
        isFeatured == other.isFeatured &&
        categoryIds == other.categoryIds &&
        collectionIds == other.collectionIds &&
        tagIds == other.tagIds &&
        translations == other.translations;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, brandId.hashCode);
    _$hash = $jc(_$hash, isFeatured.hashCode);
    _$hash = $jc(_$hash, categoryIds.hashCode);
    _$hash = $jc(_$hash, collectionIds.hashCode);
    _$hash = $jc(_$hash, tagIds.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateProductDto')
          ..add('brandId', brandId)
          ..add('isFeatured', isFeatured)
          ..add('categoryIds', categoryIds)
          ..add('collectionIds', collectionIds)
          ..add('tagIds', tagIds)
          ..add('translations', translations))
        .toString();
  }
}

class UpdateProductDtoBuilder
    implements Builder<UpdateProductDto, UpdateProductDtoBuilder> {
  _$UpdateProductDto? _$v;

  String? _brandId;
  String? get brandId => _$this._brandId;
  set brandId(String? brandId) => _$this._brandId = brandId;

  bool? _isFeatured;
  bool? get isFeatured => _$this._isFeatured;
  set isFeatured(bool? isFeatured) => _$this._isFeatured = isFeatured;

  ListBuilder<String>? _categoryIds;
  ListBuilder<String> get categoryIds =>
      _$this._categoryIds ??= ListBuilder<String>();
  set categoryIds(ListBuilder<String>? categoryIds) =>
      _$this._categoryIds = categoryIds;

  ListBuilder<String>? _collectionIds;
  ListBuilder<String> get collectionIds =>
      _$this._collectionIds ??= ListBuilder<String>();
  set collectionIds(ListBuilder<String>? collectionIds) =>
      _$this._collectionIds = collectionIds;

  ListBuilder<String>? _tagIds;
  ListBuilder<String> get tagIds => _$this._tagIds ??= ListBuilder<String>();
  set tagIds(ListBuilder<String>? tagIds) => _$this._tagIds = tagIds;

  ListBuilder<ProductTranslationDto>? _translations;
  ListBuilder<ProductTranslationDto> get translations =>
      _$this._translations ??= ListBuilder<ProductTranslationDto>();
  set translations(ListBuilder<ProductTranslationDto>? translations) =>
      _$this._translations = translations;

  UpdateProductDtoBuilder() {
    UpdateProductDto._defaults(this);
  }

  UpdateProductDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _brandId = $v.brandId;
      _isFeatured = $v.isFeatured;
      _categoryIds = $v.categoryIds?.toBuilder();
      _collectionIds = $v.collectionIds?.toBuilder();
      _tagIds = $v.tagIds?.toBuilder();
      _translations = $v.translations?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateProductDto other) {
    _$v = other as _$UpdateProductDto;
  }

  @override
  void update(void Function(UpdateProductDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateProductDto build() => _build();

  _$UpdateProductDto _build() {
    _$UpdateProductDto _$result;
    try {
      _$result = _$v ??
          _$UpdateProductDto._(
            brandId: brandId,
            isFeatured: isFeatured,
            categoryIds: _categoryIds?.build(),
            collectionIds: _collectionIds?.build(),
            tagIds: _tagIds?.build(),
            translations: _translations?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categoryIds';
        _categoryIds?.build();
        _$failedField = 'collectionIds';
        _collectionIds?.build();
        _$failedField = 'tagIds';
        _tagIds?.build();
        _$failedField = 'translations';
        _translations?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UpdateProductDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
