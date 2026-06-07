// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_collection_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateCollectionDto extends CreateCollectionDto {
  @override
  final String key;
  @override
  final BuiltList<TranslationDto> translations;
  @override
  final num? sortOrder;

  factory _$CreateCollectionDto(
          [void Function(CreateCollectionDtoBuilder)? updates]) =>
      (CreateCollectionDtoBuilder()..update(updates))._build();

  _$CreateCollectionDto._(
      {required this.key, required this.translations, this.sortOrder})
      : super._();
  @override
  CreateCollectionDto rebuild(
          void Function(CreateCollectionDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateCollectionDtoBuilder toBuilder() =>
      CreateCollectionDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateCollectionDto &&
        key == other.key &&
        translations == other.translations &&
        sortOrder == other.sortOrder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateCollectionDto')
          ..add('key', key)
          ..add('translations', translations)
          ..add('sortOrder', sortOrder))
        .toString();
  }
}

class CreateCollectionDtoBuilder
    implements Builder<CreateCollectionDto, CreateCollectionDtoBuilder> {
  _$CreateCollectionDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  ListBuilder<TranslationDto>? _translations;
  ListBuilder<TranslationDto> get translations =>
      _$this._translations ??= ListBuilder<TranslationDto>();
  set translations(ListBuilder<TranslationDto>? translations) =>
      _$this._translations = translations;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  CreateCollectionDtoBuilder() {
    CreateCollectionDto._defaults(this);
  }

  CreateCollectionDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _translations = $v.translations.toBuilder();
      _sortOrder = $v.sortOrder;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateCollectionDto other) {
    _$v = other as _$CreateCollectionDto;
  }

  @override
  void update(void Function(CreateCollectionDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateCollectionDto build() => _build();

  _$CreateCollectionDto _build() {
    _$CreateCollectionDto _$result;
    try {
      _$result = _$v ??
          _$CreateCollectionDto._(
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'CreateCollectionDto', 'key'),
            translations: translations.build(),
            sortOrder: sortOrder,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CreateCollectionDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
