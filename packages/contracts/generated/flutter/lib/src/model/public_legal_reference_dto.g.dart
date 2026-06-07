// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_legal_reference_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PublicLegalReferenceDto extends PublicLegalReferenceDto {
  @override
  final String key;
  @override
  final String slug;
  @override
  final String title;
  @override
  final String updatedAt;

  factory _$PublicLegalReferenceDto(
          [void Function(PublicLegalReferenceDtoBuilder)? updates]) =>
      (PublicLegalReferenceDtoBuilder()..update(updates))._build();

  _$PublicLegalReferenceDto._(
      {required this.key,
      required this.slug,
      required this.title,
      required this.updatedAt})
      : super._();
  @override
  PublicLegalReferenceDto rebuild(
          void Function(PublicLegalReferenceDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicLegalReferenceDtoBuilder toBuilder() =>
      PublicLegalReferenceDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicLegalReferenceDto &&
        key == other.key &&
        slug == other.slug &&
        title == other.title &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PublicLegalReferenceDto')
          ..add('key', key)
          ..add('slug', slug)
          ..add('title', title)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class PublicLegalReferenceDtoBuilder
    implements
        Builder<PublicLegalReferenceDto, PublicLegalReferenceDtoBuilder> {
  _$PublicLegalReferenceDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  PublicLegalReferenceDtoBuilder() {
    PublicLegalReferenceDto._defaults(this);
  }

  PublicLegalReferenceDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _slug = $v.slug;
      _title = $v.title;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PublicLegalReferenceDto other) {
    _$v = other as _$PublicLegalReferenceDto;
  }

  @override
  void update(void Function(PublicLegalReferenceDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicLegalReferenceDto build() => _build();

  _$PublicLegalReferenceDto _build() {
    final _$result = _$v ??
        _$PublicLegalReferenceDto._(
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'PublicLegalReferenceDto', 'key'),
          slug: BuiltValueNullFieldError.checkNotNull(
              slug, r'PublicLegalReferenceDto', 'slug'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'PublicLegalReferenceDto', 'title'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'PublicLegalReferenceDto', 'updatedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
