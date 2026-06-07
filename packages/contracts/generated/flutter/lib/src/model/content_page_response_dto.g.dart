// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_page_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ContentPageResponseDto extends ContentPageResponseDto {
  @override
  final String key;
  @override
  final String slug;
  @override
  final String title;
  @override
  final String body;
  @override
  final String status;
  @override
  final String locale;
  @override
  final num sortOrder;
  @override
  final bool isLegal;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  factory _$ContentPageResponseDto(
          [void Function(ContentPageResponseDtoBuilder)? updates]) =>
      (ContentPageResponseDtoBuilder()..update(updates))._build();

  _$ContentPageResponseDto._(
      {required this.key,
      required this.slug,
      required this.title,
      required this.body,
      required this.status,
      required this.locale,
      required this.sortOrder,
      required this.isLegal,
      required this.createdAt,
      required this.updatedAt})
      : super._();
  @override
  ContentPageResponseDto rebuild(
          void Function(ContentPageResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentPageResponseDtoBuilder toBuilder() =>
      ContentPageResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContentPageResponseDto &&
        key == other.key &&
        slug == other.slug &&
        title == other.title &&
        body == other.body &&
        status == other.status &&
        locale == other.locale &&
        sortOrder == other.sortOrder &&
        isLegal == other.isLegal &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, locale.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, isLegal.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContentPageResponseDto')
          ..add('key', key)
          ..add('slug', slug)
          ..add('title', title)
          ..add('body', body)
          ..add('status', status)
          ..add('locale', locale)
          ..add('sortOrder', sortOrder)
          ..add('isLegal', isLegal)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class ContentPageResponseDtoBuilder
    implements Builder<ContentPageResponseDto, ContentPageResponseDtoBuilder> {
  _$ContentPageResponseDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _locale;
  String? get locale => _$this._locale;
  set locale(String? locale) => _$this._locale = locale;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  bool? _isLegal;
  bool? get isLegal => _$this._isLegal;
  set isLegal(bool? isLegal) => _$this._isLegal = isLegal;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ContentPageResponseDtoBuilder() {
    ContentPageResponseDto._defaults(this);
  }

  ContentPageResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _slug = $v.slug;
      _title = $v.title;
      _body = $v.body;
      _status = $v.status;
      _locale = $v.locale;
      _sortOrder = $v.sortOrder;
      _isLegal = $v.isLegal;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContentPageResponseDto other) {
    _$v = other as _$ContentPageResponseDto;
  }

  @override
  void update(void Function(ContentPageResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContentPageResponseDto build() => _build();

  _$ContentPageResponseDto _build() {
    final _$result = _$v ??
        _$ContentPageResponseDto._(
          key: BuiltValueNullFieldError.checkNotNull(
              key, r'ContentPageResponseDto', 'key'),
          slug: BuiltValueNullFieldError.checkNotNull(
              slug, r'ContentPageResponseDto', 'slug'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'ContentPageResponseDto', 'title'),
          body: BuiltValueNullFieldError.checkNotNull(
              body, r'ContentPageResponseDto', 'body'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'ContentPageResponseDto', 'status'),
          locale: BuiltValueNullFieldError.checkNotNull(
              locale, r'ContentPageResponseDto', 'locale'),
          sortOrder: BuiltValueNullFieldError.checkNotNull(
              sortOrder, r'ContentPageResponseDto', 'sortOrder'),
          isLegal: BuiltValueNullFieldError.checkNotNull(
              isLegal, r'ContentPageResponseDto', 'isLegal'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'ContentPageResponseDto', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'ContentPageResponseDto', 'updatedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
