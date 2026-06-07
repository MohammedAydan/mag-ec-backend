// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReviewResponseDto extends ReviewResponseDto {
  @override
  final String id;
  @override
  final String productId;
  @override
  final String userId;
  @override
  final String orderLineId;
  @override
  final num rating;
  @override
  final String title;
  @override
  final String body;
  @override
  final bool isVerifiedPurchase;
  @override
  final String status;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final ReviewProductDto product;
  @override
  final ReviewOrderLineDto orderLine;
  @override
  final BuiltList<ReviewModerationActionDto> moderationActions;
  @override
  final String? rejectionReason;

  factory _$ReviewResponseDto(
          [void Function(ReviewResponseDtoBuilder)? updates]) =>
      (ReviewResponseDtoBuilder()..update(updates))._build();

  _$ReviewResponseDto._(
      {required this.id,
      required this.productId,
      required this.userId,
      required this.orderLineId,
      required this.rating,
      required this.title,
      required this.body,
      required this.isVerifiedPurchase,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      required this.product,
      required this.orderLine,
      required this.moderationActions,
      this.rejectionReason})
      : super._();
  @override
  ReviewResponseDto rebuild(void Function(ReviewResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewResponseDtoBuilder toBuilder() =>
      ReviewResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewResponseDto &&
        id == other.id &&
        productId == other.productId &&
        userId == other.userId &&
        orderLineId == other.orderLineId &&
        rating == other.rating &&
        title == other.title &&
        body == other.body &&
        isVerifiedPurchase == other.isVerifiedPurchase &&
        status == other.status &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        product == other.product &&
        orderLine == other.orderLine &&
        moderationActions == other.moderationActions &&
        rejectionReason == other.rejectionReason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, orderLineId.hashCode);
    _$hash = $jc(_$hash, rating.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, isVerifiedPurchase.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, product.hashCode);
    _$hash = $jc(_$hash, orderLine.hashCode);
    _$hash = $jc(_$hash, moderationActions.hashCode);
    _$hash = $jc(_$hash, rejectionReason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewResponseDto')
          ..add('id', id)
          ..add('productId', productId)
          ..add('userId', userId)
          ..add('orderLineId', orderLineId)
          ..add('rating', rating)
          ..add('title', title)
          ..add('body', body)
          ..add('isVerifiedPurchase', isVerifiedPurchase)
          ..add('status', status)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('product', product)
          ..add('orderLine', orderLine)
          ..add('moderationActions', moderationActions)
          ..add('rejectionReason', rejectionReason))
        .toString();
  }
}

class ReviewResponseDtoBuilder
    implements Builder<ReviewResponseDto, ReviewResponseDtoBuilder> {
  _$ReviewResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _productId;
  String? get productId => _$this._productId;
  set productId(String? productId) => _$this._productId = productId;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _orderLineId;
  String? get orderLineId => _$this._orderLineId;
  set orderLineId(String? orderLineId) => _$this._orderLineId = orderLineId;

  num? _rating;
  num? get rating => _$this._rating;
  set rating(num? rating) => _$this._rating = rating;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  bool? _isVerifiedPurchase;
  bool? get isVerifiedPurchase => _$this._isVerifiedPurchase;
  set isVerifiedPurchase(bool? isVerifiedPurchase) =>
      _$this._isVerifiedPurchase = isVerifiedPurchase;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ReviewProductDtoBuilder? _product;
  ReviewProductDtoBuilder get product =>
      _$this._product ??= ReviewProductDtoBuilder();
  set product(ReviewProductDtoBuilder? product) => _$this._product = product;

  ReviewOrderLineDtoBuilder? _orderLine;
  ReviewOrderLineDtoBuilder get orderLine =>
      _$this._orderLine ??= ReviewOrderLineDtoBuilder();
  set orderLine(ReviewOrderLineDtoBuilder? orderLine) =>
      _$this._orderLine = orderLine;

  ListBuilder<ReviewModerationActionDto>? _moderationActions;
  ListBuilder<ReviewModerationActionDto> get moderationActions =>
      _$this._moderationActions ??= ListBuilder<ReviewModerationActionDto>();
  set moderationActions(
          ListBuilder<ReviewModerationActionDto>? moderationActions) =>
      _$this._moderationActions = moderationActions;

  String? _rejectionReason;
  String? get rejectionReason => _$this._rejectionReason;
  set rejectionReason(String? rejectionReason) =>
      _$this._rejectionReason = rejectionReason;

  ReviewResponseDtoBuilder() {
    ReviewResponseDto._defaults(this);
  }

  ReviewResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _productId = $v.productId;
      _userId = $v.userId;
      _orderLineId = $v.orderLineId;
      _rating = $v.rating;
      _title = $v.title;
      _body = $v.body;
      _isVerifiedPurchase = $v.isVerifiedPurchase;
      _status = $v.status;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _product = $v.product.toBuilder();
      _orderLine = $v.orderLine.toBuilder();
      _moderationActions = $v.moderationActions.toBuilder();
      _rejectionReason = $v.rejectionReason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewResponseDto other) {
    _$v = other as _$ReviewResponseDto;
  }

  @override
  void update(void Function(ReviewResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewResponseDto build() => _build();

  _$ReviewResponseDto _build() {
    _$ReviewResponseDto _$result;
    try {
      _$result = _$v ??
          _$ReviewResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ReviewResponseDto', 'id'),
            productId: BuiltValueNullFieldError.checkNotNull(
                productId, r'ReviewResponseDto', 'productId'),
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'ReviewResponseDto', 'userId'),
            orderLineId: BuiltValueNullFieldError.checkNotNull(
                orderLineId, r'ReviewResponseDto', 'orderLineId'),
            rating: BuiltValueNullFieldError.checkNotNull(
                rating, r'ReviewResponseDto', 'rating'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'ReviewResponseDto', 'title'),
            body: BuiltValueNullFieldError.checkNotNull(
                body, r'ReviewResponseDto', 'body'),
            isVerifiedPurchase: BuiltValueNullFieldError.checkNotNull(
                isVerifiedPurchase, r'ReviewResponseDto', 'isVerifiedPurchase'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'ReviewResponseDto', 'status'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'ReviewResponseDto', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'ReviewResponseDto', 'updatedAt'),
            product: product.build(),
            orderLine: orderLine.build(),
            moderationActions: moderationActions.build(),
            rejectionReason: rejectionReason,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'product';
        product.build();
        _$failedField = 'orderLine';
        orderLine.build();
        _$failedField = 'moderationActions';
        moderationActions.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReviewResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
