// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_tag_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateTagDto extends CreateTagDto {
  @override
  final String key;
  @override
  final BuiltList<TranslationDto> translations;

  factory _$CreateTagDto([void Function(CreateTagDtoBuilder)? updates]) =>
      (CreateTagDtoBuilder()..update(updates))._build();

  _$CreateTagDto._({required this.key, required this.translations}) : super._();
  @override
  CreateTagDto rebuild(void Function(CreateTagDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateTagDtoBuilder toBuilder() => CreateTagDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateTagDto &&
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
    return (newBuiltValueToStringHelper(r'CreateTagDto')
          ..add('key', key)
          ..add('translations', translations))
        .toString();
  }
}

class CreateTagDtoBuilder
    implements Builder<CreateTagDto, CreateTagDtoBuilder> {
  _$CreateTagDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  ListBuilder<TranslationDto>? _translations;
  ListBuilder<TranslationDto> get translations =>
      _$this._translations ??= ListBuilder<TranslationDto>();
  set translations(ListBuilder<TranslationDto>? translations) =>
      _$this._translations = translations;

  CreateTagDtoBuilder() {
    CreateTagDto._defaults(this);
  }

  CreateTagDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _translations = $v.translations.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateTagDto other) {
    _$v = other as _$CreateTagDto;
  }

  @override
  void update(void Function(CreateTagDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateTagDto build() => _build();

  _$CreateTagDto _build() {
    _$CreateTagDto _$result;
    try {
      _$result = _$v ??
          _$CreateTagDto._(
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'CreateTagDto', 'key'),
            translations: translations.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CreateTagDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
