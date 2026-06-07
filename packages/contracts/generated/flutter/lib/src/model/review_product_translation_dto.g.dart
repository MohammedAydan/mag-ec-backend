// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_product_translation_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReviewProductTranslationDto extends ReviewProductTranslationDto {
  @override
  final String locale;
  @override
  final String name;

  factory _$ReviewProductTranslationDto(
          [void Function(ReviewProductTranslationDtoBuilder)? updates]) =>
      (ReviewProductTranslationDtoBuilder()..update(updates))._build();

  _$ReviewProductTranslationDto._({required this.locale, required this.name})
      : super._();
  @override
  ReviewProductTranslationDto rebuild(
          void Function(ReviewProductTranslationDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewProductTranslationDtoBuilder toBuilder() =>
      ReviewProductTranslationDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewProductTranslationDto &&
        locale == other.locale &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, locale.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewProductTranslationDto')
          ..add('locale', locale)
          ..add('name', name))
        .toString();
  }
}

class ReviewProductTranslationDtoBuilder
    implements
        Builder<ReviewProductTranslationDto,
            ReviewProductTranslationDtoBuilder> {
  _$ReviewProductTranslationDto? _$v;

  String? _locale;
  String? get locale => _$this._locale;
  set locale(String? locale) => _$this._locale = locale;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ReviewProductTranslationDtoBuilder() {
    ReviewProductTranslationDto._defaults(this);
  }

  ReviewProductTranslationDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _locale = $v.locale;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewProductTranslationDto other) {
    _$v = other as _$ReviewProductTranslationDto;
  }

  @override
  void update(void Function(ReviewProductTranslationDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewProductTranslationDto build() => _build();

  _$ReviewProductTranslationDto _build() {
    final _$result = _$v ??
        _$ReviewProductTranslationDto._(
          locale: BuiltValueNullFieldError.checkNotNull(
              locale, r'ReviewProductTranslationDto', 'locale'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'ReviewProductTranslationDto', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
