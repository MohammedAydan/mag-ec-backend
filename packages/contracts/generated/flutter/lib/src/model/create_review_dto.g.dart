// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_review_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateReviewDto extends CreateReviewDto {
  @override
  final num rating;
  @override
  final String title;
  @override
  final String body;

  factory _$CreateReviewDto([void Function(CreateReviewDtoBuilder)? updates]) =>
      (CreateReviewDtoBuilder()..update(updates))._build();

  _$CreateReviewDto._(
      {required this.rating, required this.title, required this.body})
      : super._();
  @override
  CreateReviewDto rebuild(void Function(CreateReviewDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateReviewDtoBuilder toBuilder() => CreateReviewDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateReviewDto &&
        rating == other.rating &&
        title == other.title &&
        body == other.body;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateReviewDto')
          ..add('rating', rating)
          ..add('title', title)
          ..add('body', body))
        .toString();
  }
}

class CreateReviewDtoBuilder
    implements Builder<CreateReviewDto, CreateReviewDtoBuilder> {
  _$CreateReviewDto? _$v;

  num? _rating;
  num? get rating => _$this._rating;
  set rating(num? rating) => _$this._rating = rating;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  CreateReviewDtoBuilder() {
    CreateReviewDto._defaults(this);
  }

  CreateReviewDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rating = $v.rating;
      _title = $v.title;
      _body = $v.body;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateReviewDto other) {
    _$v = other as _$CreateReviewDto;
  }

  @override
  void update(void Function(CreateReviewDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateReviewDto build() => _build();

  _$CreateReviewDto _build() {
    final _$result = _$v ??
        _$CreateReviewDto._(
          rating: BuiltValueNullFieldError.checkNotNull(
              rating, r'CreateReviewDto', 'rating'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'CreateReviewDto', 'title'),
          body: BuiltValueNullFieldError.checkNotNull(
              body, r'CreateReviewDto', 'body'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
