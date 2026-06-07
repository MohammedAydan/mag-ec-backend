// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_content_page_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UpsertContentPageDtoStatusEnum _$upsertContentPageDtoStatusEnum_DRAFT =
    const UpsertContentPageDtoStatusEnum._('DRAFT');
const UpsertContentPageDtoStatusEnum
    _$upsertContentPageDtoStatusEnum_PUBLISHED =
    const UpsertContentPageDtoStatusEnum._('PUBLISHED');
const UpsertContentPageDtoStatusEnum _$upsertContentPageDtoStatusEnum_ARCHIVED =
    const UpsertContentPageDtoStatusEnum._('ARCHIVED');

UpsertContentPageDtoStatusEnum _$upsertContentPageDtoStatusEnumValueOf(
    String name) {
  switch (name) {
    case 'DRAFT':
      return _$upsertContentPageDtoStatusEnum_DRAFT;
    case 'PUBLISHED':
      return _$upsertContentPageDtoStatusEnum_PUBLISHED;
    case 'ARCHIVED':
      return _$upsertContentPageDtoStatusEnum_ARCHIVED;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UpsertContentPageDtoStatusEnum>
    _$upsertContentPageDtoStatusEnumValues = BuiltSet<
        UpsertContentPageDtoStatusEnum>(const <UpsertContentPageDtoStatusEnum>[
  _$upsertContentPageDtoStatusEnum_DRAFT,
  _$upsertContentPageDtoStatusEnum_PUBLISHED,
  _$upsertContentPageDtoStatusEnum_ARCHIVED,
]);

Serializer<UpsertContentPageDtoStatusEnum>
    _$upsertContentPageDtoStatusEnumSerializer =
    _$UpsertContentPageDtoStatusEnumSerializer();

class _$UpsertContentPageDtoStatusEnumSerializer
    implements PrimitiveSerializer<UpsertContentPageDtoStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'DRAFT': 'DRAFT',
    'PUBLISHED': 'PUBLISHED',
    'ARCHIVED': 'ARCHIVED',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'DRAFT': 'DRAFT',
    'PUBLISHED': 'PUBLISHED',
    'ARCHIVED': 'ARCHIVED',
  };

  @override
  final Iterable<Type> types = const <Type>[UpsertContentPageDtoStatusEnum];
  @override
  final String wireName = 'UpsertContentPageDtoStatusEnum';

  @override
  Object serialize(
          Serializers serializers, UpsertContentPageDtoStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UpsertContentPageDtoStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UpsertContentPageDtoStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$UpsertContentPageDto extends UpsertContentPageDto {
  @override
  final String slug;
  @override
  final String title;
  @override
  final String body;
  @override
  final UpsertContentPageDtoStatusEnum status;
  @override
  final num? sortOrder;
  @override
  final bool? isLegal;
  @override
  final String? locale;

  factory _$UpsertContentPageDto(
          [void Function(UpsertContentPageDtoBuilder)? updates]) =>
      (UpsertContentPageDtoBuilder()..update(updates))._build();

  _$UpsertContentPageDto._(
      {required this.slug,
      required this.title,
      required this.body,
      required this.status,
      this.sortOrder,
      this.isLegal,
      this.locale})
      : super._();
  @override
  UpsertContentPageDto rebuild(
          void Function(UpsertContentPageDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpsertContentPageDtoBuilder toBuilder() =>
      UpsertContentPageDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpsertContentPageDto &&
        slug == other.slug &&
        title == other.title &&
        body == other.body &&
        status == other.status &&
        sortOrder == other.sortOrder &&
        isLegal == other.isLegal &&
        locale == other.locale;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, isLegal.hashCode);
    _$hash = $jc(_$hash, locale.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpsertContentPageDto')
          ..add('slug', slug)
          ..add('title', title)
          ..add('body', body)
          ..add('status', status)
          ..add('sortOrder', sortOrder)
          ..add('isLegal', isLegal)
          ..add('locale', locale))
        .toString();
  }
}

class UpsertContentPageDtoBuilder
    implements Builder<UpsertContentPageDto, UpsertContentPageDtoBuilder> {
  _$UpsertContentPageDto? _$v;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  UpsertContentPageDtoStatusEnum? _status;
  UpsertContentPageDtoStatusEnum? get status => _$this._status;
  set status(UpsertContentPageDtoStatusEnum? status) => _$this._status = status;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  bool? _isLegal;
  bool? get isLegal => _$this._isLegal;
  set isLegal(bool? isLegal) => _$this._isLegal = isLegal;

  String? _locale;
  String? get locale => _$this._locale;
  set locale(String? locale) => _$this._locale = locale;

  UpsertContentPageDtoBuilder() {
    UpsertContentPageDto._defaults(this);
  }

  UpsertContentPageDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _slug = $v.slug;
      _title = $v.title;
      _body = $v.body;
      _status = $v.status;
      _sortOrder = $v.sortOrder;
      _isLegal = $v.isLegal;
      _locale = $v.locale;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpsertContentPageDto other) {
    _$v = other as _$UpsertContentPageDto;
  }

  @override
  void update(void Function(UpsertContentPageDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpsertContentPageDto build() => _build();

  _$UpsertContentPageDto _build() {
    final _$result = _$v ??
        _$UpsertContentPageDto._(
          slug: BuiltValueNullFieldError.checkNotNull(
              slug, r'UpsertContentPageDto', 'slug'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'UpsertContentPageDto', 'title'),
          body: BuiltValueNullFieldError.checkNotNull(
              body, r'UpsertContentPageDto', 'body'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'UpsertContentPageDto', 'status'),
          sortOrder: sortOrder,
          isLegal: isLegal,
          locale: locale,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
