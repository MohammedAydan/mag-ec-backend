// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_option_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AttributeOptionDto extends AttributeOptionDto {
  @override
  final String key;
  @override
  final BuiltList<AttributeOptionTranslationDto> translations;
  @override
  final num? sortOrder;
  @override
  final String? colorHex;

  factory _$AttributeOptionDto(
          [void Function(AttributeOptionDtoBuilder)? updates]) =>
      (AttributeOptionDtoBuilder()..update(updates))._build();

  _$AttributeOptionDto._(
      {required this.key,
      required this.translations,
      this.sortOrder,
      this.colorHex})
      : super._();
  @override
  AttributeOptionDto rebuild(
          void Function(AttributeOptionDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AttributeOptionDtoBuilder toBuilder() =>
      AttributeOptionDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AttributeOptionDto &&
        key == other.key &&
        translations == other.translations &&
        sortOrder == other.sortOrder &&
        colorHex == other.colorHex;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, colorHex.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AttributeOptionDto')
          ..add('key', key)
          ..add('translations', translations)
          ..add('sortOrder', sortOrder)
          ..add('colorHex', colorHex))
        .toString();
  }
}

class AttributeOptionDtoBuilder
    implements Builder<AttributeOptionDto, AttributeOptionDtoBuilder> {
  _$AttributeOptionDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  ListBuilder<AttributeOptionTranslationDto>? _translations;
  ListBuilder<AttributeOptionTranslationDto> get translations =>
      _$this._translations ??= ListBuilder<AttributeOptionTranslationDto>();
  set translations(ListBuilder<AttributeOptionTranslationDto>? translations) =>
      _$this._translations = translations;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  String? _colorHex;
  String? get colorHex => _$this._colorHex;
  set colorHex(String? colorHex) => _$this._colorHex = colorHex;

  AttributeOptionDtoBuilder() {
    AttributeOptionDto._defaults(this);
  }

  AttributeOptionDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _translations = $v.translations.toBuilder();
      _sortOrder = $v.sortOrder;
      _colorHex = $v.colorHex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AttributeOptionDto other) {
    _$v = other as _$AttributeOptionDto;
  }

  @override
  void update(void Function(AttributeOptionDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AttributeOptionDto build() => _build();

  _$AttributeOptionDto _build() {
    _$AttributeOptionDto _$result;
    try {
      _$result = _$v ??
          _$AttributeOptionDto._(
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'AttributeOptionDto', 'key'),
            translations: translations.build(),
            sortOrder: sortOrder,
            colorHex: colorHex,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AttributeOptionDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
