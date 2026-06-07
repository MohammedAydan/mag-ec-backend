// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_localized_reference_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CatalogLocalizedReferenceDto extends CatalogLocalizedReferenceDto {
  @override
  final String key;
  @override
  final String? name;
  @override
  final String? slug;

  factory _$CatalogLocalizedReferenceDto(
          [void Function(CatalogLocalizedReferenceDtoBuilder)? updates]) =>
      (CatalogLocalizedReferenceDtoBuilder()..update(updates))._build();

  _$CatalogLocalizedReferenceDto._({required this.key, this.name, this.slug})
      : super._();
  @override
  CatalogLocalizedReferenceDto rebuild(
          void Function(CatalogLocalizedReferenceDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CatalogLocalizedReferenceDtoBuilder toBuilder() =>
      CatalogLocalizedReferenceDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CatalogLocalizedReferenceDto &&
        key == other.key &&
        name == other.name &&
        slug == other.slug;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CatalogLocalizedReferenceDto')
          ..add('key', key)
          ..add('name', name)
          ..add('slug', slug))
        .toString();
  }
}

class CatalogLocalizedReferenceDtoBuilder
    implements
        Builder<CatalogLocalizedReferenceDto,
            CatalogLocalizedReferenceDtoBuilder> {
  _$CatalogLocalizedReferenceDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  CatalogLocalizedReferenceDtoBuilder() {
    CatalogLocalizedReferenceDto._defaults(this);
  }

  CatalogLocalizedReferenceDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _name = $v.name;
      _slug = $v.slug;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CatalogLocalizedReferenceDto other) {
    _$v = other as _$CatalogLocalizedReferenceDto;
  }

  @override
  void update(void Function(CatalogLocalizedReferenceDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CatalogLocalizedReferenceDto build() => _build();

  _$CatalogLocalizedReferenceDto _build() {
    final _$result = _$v ??
        _$CatalogLocalizedReferenceDto._(
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'CatalogLocalizedReferenceDto', 'key'),
          name: name,
          slug: slug,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
