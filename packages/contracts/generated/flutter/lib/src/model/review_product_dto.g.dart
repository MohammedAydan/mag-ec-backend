// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_product_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReviewProductDto extends ReviewProductDto {
  @override
  final String id;
  @override
  final String sku;
  @override
  final BuiltList<ReviewProductTranslationDto> translations;

  factory _$ReviewProductDto(
          [void Function(ReviewProductDtoBuilder)? updates]) =>
      (ReviewProductDtoBuilder()..update(updates))._build();

  _$ReviewProductDto._(
      {required this.id, required this.sku, required this.translations})
      : super._();
  @override
  ReviewProductDto rebuild(void Function(ReviewProductDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewProductDtoBuilder toBuilder() =>
      ReviewProductDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewProductDto &&
        id == other.id &&
        sku == other.sku &&
        translations == other.translations;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewProductDto')
          ..add('id', id)
          ..add('sku', sku)
          ..add('translations', translations))
        .toString();
  }
}

class ReviewProductDtoBuilder
    implements Builder<ReviewProductDto, ReviewProductDtoBuilder> {
  _$ReviewProductDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  ListBuilder<ReviewProductTranslationDto>? _translations;
  ListBuilder<ReviewProductTranslationDto> get translations =>
      _$this._translations ??= ListBuilder<ReviewProductTranslationDto>();
  set translations(ListBuilder<ReviewProductTranslationDto>? translations) =>
      _$this._translations = translations;

  ReviewProductDtoBuilder() {
    ReviewProductDto._defaults(this);
  }

  ReviewProductDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _sku = $v.sku;
      _translations = $v.translations.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewProductDto other) {
    _$v = other as _$ReviewProductDto;
  }

  @override
  void update(void Function(ReviewProductDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewProductDto build() => _build();

  _$ReviewProductDto _build() {
    _$ReviewProductDto _$result;
    try {
      _$result = _$v ??
          _$ReviewProductDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ReviewProductDto', 'id'),
            sku: BuiltValueNullFieldError.checkNotNull(
                sku, r'ReviewProductDto', 'sku'),
            translations: translations.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReviewProductDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
