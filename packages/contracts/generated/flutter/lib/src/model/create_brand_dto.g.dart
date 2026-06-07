// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_brand_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateBrandDto extends CreateBrandDto {
  @override
  final String key;
  @override
  final BuiltList<TranslationDto> translations;

  factory _$CreateBrandDto([void Function(CreateBrandDtoBuilder)? updates]) =>
      (CreateBrandDtoBuilder()..update(updates))._build();

  _$CreateBrandDto._({required this.key, required this.translations})
      : super._();
  @override
  CreateBrandDto rebuild(void Function(CreateBrandDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateBrandDtoBuilder toBuilder() => CreateBrandDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateBrandDto &&
        key == other.key &&
        translations == other.translations;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateBrandDto')
          ..add('key', key)
          ..add('translations', translations))
        .toString();
  }
}

class CreateBrandDtoBuilder
    implements Builder<CreateBrandDto, CreateBrandDtoBuilder> {
  _$CreateBrandDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  ListBuilder<TranslationDto>? _translations;
  ListBuilder<TranslationDto> get translations =>
      _$this._translations ??= ListBuilder<TranslationDto>();
  set translations(ListBuilder<TranslationDto>? translations) =>
      _$this._translations = translations;

  CreateBrandDtoBuilder() {
    CreateBrandDto._defaults(this);
  }

  CreateBrandDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _translations = $v.translations.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateBrandDto other) {
    _$v = other as _$CreateBrandDto;
  }

  @override
  void update(void Function(CreateBrandDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateBrandDto build() => _build();

  _$CreateBrandDto _build() {
    _$CreateBrandDto _$result;
    try {
      _$result = _$v ??
          _$CreateBrandDto._(
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'CreateBrandDto', 'key'),
            translations: translations.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CreateBrandDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
