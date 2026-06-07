// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateCategoryDto extends CreateCategoryDto {
  @override
  final String key;
  @override
  final BuiltList<TranslationDto> translations;
  @override
  final String? parentId;
  @override
  final num? sortOrder;

  factory _$CreateCategoryDto(
          [void Function(CreateCategoryDtoBuilder)? updates]) =>
      (CreateCategoryDtoBuilder()..update(updates))._build();

  _$CreateCategoryDto._(
      {required this.key,
      required this.translations,
      this.parentId,
      this.sortOrder})
      : super._();
  @override
  CreateCategoryDto rebuild(void Function(CreateCategoryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateCategoryDtoBuilder toBuilder() =>
      CreateCategoryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateCategoryDto &&
        key == other.key &&
        translations == other.translations &&
        parentId == other.parentId &&
        sortOrder == other.sortOrder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, parentId.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateCategoryDto')
          ..add('key', key)
          ..add('translations', translations)
          ..add('parentId', parentId)
          ..add('sortOrder', sortOrder))
        .toString();
  }
}

class CreateCategoryDtoBuilder
    implements Builder<CreateCategoryDto, CreateCategoryDtoBuilder> {
  _$CreateCategoryDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  ListBuilder<TranslationDto>? _translations;
  ListBuilder<TranslationDto> get translations =>
      _$this._translations ??= ListBuilder<TranslationDto>();
  set translations(ListBuilder<TranslationDto>? translations) =>
      _$this._translations = translations;

  String? _parentId;
  String? get parentId => _$this._parentId;
  set parentId(String? parentId) => _$this._parentId = parentId;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  CreateCategoryDtoBuilder() {
    CreateCategoryDto._defaults(this);
  }

  CreateCategoryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _translations = $v.translations.toBuilder();
      _parentId = $v.parentId;
      _sortOrder = $v.sortOrder;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateCategoryDto other) {
    _$v = other as _$CreateCategoryDto;
  }

  @override
  void update(void Function(CreateCategoryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateCategoryDto build() => _build();

  _$CreateCategoryDto _build() {
    _$CreateCategoryDto _$result;
    try {
      _$result = _$v ??
          _$CreateCategoryDto._(
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'CreateCategoryDto', 'key'),
            translations: translations.build(),
            parentId: parentId,
            sortOrder: sortOrder,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CreateCategoryDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
