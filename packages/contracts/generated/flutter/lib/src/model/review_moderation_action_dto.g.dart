// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_moderation_action_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReviewModerationActionDto extends ReviewModerationActionDto {
  @override
  final String id;
  @override
  final String reviewId;
  @override
  final String moderatorUserId;
  @override
  final String actionType;
  @override
  final String createdAt;
  @override
  final String? reason;

  factory _$ReviewModerationActionDto(
          [void Function(ReviewModerationActionDtoBuilder)? updates]) =>
      (ReviewModerationActionDtoBuilder()..update(updates))._build();

  _$ReviewModerationActionDto._(
      {required this.id,
      required this.reviewId,
      required this.moderatorUserId,
      required this.actionType,
      required this.createdAt,
      this.reason})
      : super._();
  @override
  ReviewModerationActionDto rebuild(
          void Function(ReviewModerationActionDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewModerationActionDtoBuilder toBuilder() =>
      ReviewModerationActionDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewModerationActionDto &&
        id == other.id &&
        reviewId == other.reviewId &&
        moderatorUserId == other.moderatorUserId &&
        actionType == other.actionType &&
        createdAt == other.createdAt &&
        reason == other.reason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, reviewId.hashCode);
    _$hash = $jc(_$hash, moderatorUserId.hashCode);
    _$hash = $jc(_$hash, actionType.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewModerationActionDto')
          ..add('id', id)
          ..add('reviewId', reviewId)
          ..add('moderatorUserId', moderatorUserId)
          ..add('actionType', actionType)
          ..add('createdAt', createdAt)
          ..add('reason', reason))
        .toString();
  }
}

class ReviewModerationActionDtoBuilder
    implements
        Builder<ReviewModerationActionDto, ReviewModerationActionDtoBuilder> {
  _$ReviewModerationActionDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _reviewId;
  String? get reviewId => _$this._reviewId;
  set reviewId(String? reviewId) => _$this._reviewId = reviewId;

  String? _moderatorUserId;
  String? get moderatorUserId => _$this._moderatorUserId;
  set moderatorUserId(String? moderatorUserId) =>
      _$this._moderatorUserId = moderatorUserId;

  String? _actionType;
  String? get actionType => _$this._actionType;
  set actionType(String? actionType) => _$this._actionType = actionType;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  ReviewModerationActionDtoBuilder() {
    ReviewModerationActionDto._defaults(this);
  }

  ReviewModerationActionDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _reviewId = $v.reviewId;
      _moderatorUserId = $v.moderatorUserId;
      _actionType = $v.actionType;
      _createdAt = $v.createdAt;
      _reason = $v.reason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewModerationActionDto other) {
    _$v = other as _$ReviewModerationActionDto;
  }

  @override
  void update(void Function(ReviewModerationActionDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewModerationActionDto build() => _build();

  _$ReviewModerationActionDto _build() {
    final _$result = _$v ??
        _$ReviewModerationActionDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ReviewModerationActionDto', 'id'),
          reviewId: BuiltValueNullFieldError.checkNotNull(
              reviewId, r'ReviewModerationActionDto', 'reviewId'),
          moderatorUserId: BuiltValueNullFieldError.checkNotNull(
              moderatorUserId, r'ReviewModerationActionDto', 'moderatorUserId'),
          actionType: BuiltValueNullFieldError.checkNotNull(
              actionType, r'ReviewModerationActionDto', 'actionType'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'ReviewModerationActionDto', 'createdAt'),
          reason: reason,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
