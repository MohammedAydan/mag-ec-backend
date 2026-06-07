// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_request_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReturnRequestResponseDto extends ReturnRequestResponseDto {
  @override
  final String id;
  @override
  final String orderId;
  @override
  final String returnNumber;
  @override
  final String requestedByUserId;
  @override
  final String status;
  @override
  final String reason;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final BuiltList<ReturnRequestItemResponseDto> items;
  @override
  final BuiltList<OrderRefundDto> refunds;
  @override
  final String? reviewedByUserId;
  @override
  final String? receivedByUserId;
  @override
  final String? notes;
  @override
  final String? reviewNotes;
  @override
  final String? rejectionReason;
  @override
  final String? approvedAt;
  @override
  final String? rejectedAt;
  @override
  final String? receivedAt;
  @override
  final String? closedAt;

  factory _$ReturnRequestResponseDto(
          [void Function(ReturnRequestResponseDtoBuilder)? updates]) =>
      (ReturnRequestResponseDtoBuilder()..update(updates))._build();

  _$ReturnRequestResponseDto._(
      {required this.id,
      required this.orderId,
      required this.returnNumber,
      required this.requestedByUserId,
      required this.status,
      required this.reason,
      required this.createdAt,
      required this.updatedAt,
      required this.items,
      required this.refunds,
      this.reviewedByUserId,
      this.receivedByUserId,
      this.notes,
      this.reviewNotes,
      this.rejectionReason,
      this.approvedAt,
      this.rejectedAt,
      this.receivedAt,
      this.closedAt})
      : super._();
  @override
  ReturnRequestResponseDto rebuild(
          void Function(ReturnRequestResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReturnRequestResponseDtoBuilder toBuilder() =>
      ReturnRequestResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReturnRequestResponseDto &&
        id == other.id &&
        orderId == other.orderId &&
        returnNumber == other.returnNumber &&
        requestedByUserId == other.requestedByUserId &&
        status == other.status &&
        reason == other.reason &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        items == other.items &&
        refunds == other.refunds &&
        reviewedByUserId == other.reviewedByUserId &&
        receivedByUserId == other.receivedByUserId &&
        notes == other.notes &&
        reviewNotes == other.reviewNotes &&
        rejectionReason == other.rejectionReason &&
        approvedAt == other.approvedAt &&
        rejectedAt == other.rejectedAt &&
        receivedAt == other.receivedAt &&
        closedAt == other.closedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, orderId.hashCode);
    _$hash = $jc(_$hash, returnNumber.hashCode);
    _$hash = $jc(_$hash, requestedByUserId.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, refunds.hashCode);
    _$hash = $jc(_$hash, reviewedByUserId.hashCode);
    _$hash = $jc(_$hash, receivedByUserId.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jc(_$hash, reviewNotes.hashCode);
    _$hash = $jc(_$hash, rejectionReason.hashCode);
    _$hash = $jc(_$hash, approvedAt.hashCode);
    _$hash = $jc(_$hash, rejectedAt.hashCode);
    _$hash = $jc(_$hash, receivedAt.hashCode);
    _$hash = $jc(_$hash, closedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReturnRequestResponseDto')
          ..add('id', id)
          ..add('orderId', orderId)
          ..add('returnNumber', returnNumber)
          ..add('requestedByUserId', requestedByUserId)
          ..add('status', status)
          ..add('reason', reason)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('items', items)
          ..add('refunds', refunds)
          ..add('reviewedByUserId', reviewedByUserId)
          ..add('receivedByUserId', receivedByUserId)
          ..add('notes', notes)
          ..add('reviewNotes', reviewNotes)
          ..add('rejectionReason', rejectionReason)
          ..add('approvedAt', approvedAt)
          ..add('rejectedAt', rejectedAt)
          ..add('receivedAt', receivedAt)
          ..add('closedAt', closedAt))
        .toString();
  }
}

class ReturnRequestResponseDtoBuilder
    implements
        Builder<ReturnRequestResponseDto, ReturnRequestResponseDtoBuilder> {
  _$ReturnRequestResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _orderId;
  String? get orderId => _$this._orderId;
  set orderId(String? orderId) => _$this._orderId = orderId;

  String? _returnNumber;
  String? get returnNumber => _$this._returnNumber;
  set returnNumber(String? returnNumber) => _$this._returnNumber = returnNumber;

  String? _requestedByUserId;
  String? get requestedByUserId => _$this._requestedByUserId;
  set requestedByUserId(String? requestedByUserId) =>
      _$this._requestedByUserId = requestedByUserId;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<ReturnRequestItemResponseDto>? _items;
  ListBuilder<ReturnRequestItemResponseDto> get items =>
      _$this._items ??= ListBuilder<ReturnRequestItemResponseDto>();
  set items(ListBuilder<ReturnRequestItemResponseDto>? items) =>
      _$this._items = items;

  ListBuilder<OrderRefundDto>? _refunds;
  ListBuilder<OrderRefundDto> get refunds =>
      _$this._refunds ??= ListBuilder<OrderRefundDto>();
  set refunds(ListBuilder<OrderRefundDto>? refunds) =>
      _$this._refunds = refunds;

  String? _reviewedByUserId;
  String? get reviewedByUserId => _$this._reviewedByUserId;
  set reviewedByUserId(String? reviewedByUserId) =>
      _$this._reviewedByUserId = reviewedByUserId;

  String? _receivedByUserId;
  String? get receivedByUserId => _$this._receivedByUserId;
  set receivedByUserId(String? receivedByUserId) =>
      _$this._receivedByUserId = receivedByUserId;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  String? _reviewNotes;
  String? get reviewNotes => _$this._reviewNotes;
  set reviewNotes(String? reviewNotes) => _$this._reviewNotes = reviewNotes;

  String? _rejectionReason;
  String? get rejectionReason => _$this._rejectionReason;
  set rejectionReason(String? rejectionReason) =>
      _$this._rejectionReason = rejectionReason;

  String? _approvedAt;
  String? get approvedAt => _$this._approvedAt;
  set approvedAt(String? approvedAt) => _$this._approvedAt = approvedAt;

  String? _rejectedAt;
  String? get rejectedAt => _$this._rejectedAt;
  set rejectedAt(String? rejectedAt) => _$this._rejectedAt = rejectedAt;

  String? _receivedAt;
  String? get receivedAt => _$this._receivedAt;
  set receivedAt(String? receivedAt) => _$this._receivedAt = receivedAt;

  String? _closedAt;
  String? get closedAt => _$this._closedAt;
  set closedAt(String? closedAt) => _$this._closedAt = closedAt;

  ReturnRequestResponseDtoBuilder() {
    ReturnRequestResponseDto._defaults(this);
  }

  ReturnRequestResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _orderId = $v.orderId;
      _returnNumber = $v.returnNumber;
      _requestedByUserId = $v.requestedByUserId;
      _status = $v.status;
      _reason = $v.reason;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _items = $v.items.toBuilder();
      _refunds = $v.refunds.toBuilder();
      _reviewedByUserId = $v.reviewedByUserId;
      _receivedByUserId = $v.receivedByUserId;
      _notes = $v.notes;
      _reviewNotes = $v.reviewNotes;
      _rejectionReason = $v.rejectionReason;
      _approvedAt = $v.approvedAt;
      _rejectedAt = $v.rejectedAt;
      _receivedAt = $v.receivedAt;
      _closedAt = $v.closedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReturnRequestResponseDto other) {
    _$v = other as _$ReturnRequestResponseDto;
  }

  @override
  void update(void Function(ReturnRequestResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReturnRequestResponseDto build() => _build();

  _$ReturnRequestResponseDto _build() {
    _$ReturnRequestResponseDto _$result;
    try {
      _$result = _$v ??
          _$ReturnRequestResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ReturnRequestResponseDto', 'id'),
            orderId: BuiltValueNullFieldError.checkNotNull(
                orderId, r'ReturnRequestResponseDto', 'orderId'),
            returnNumber: BuiltValueNullFieldError.checkNotNull(
                returnNumber, r'ReturnRequestResponseDto', 'returnNumber'),
            requestedByUserId: BuiltValueNullFieldError.checkNotNull(
                requestedByUserId,
                r'ReturnRequestResponseDto',
                'requestedByUserId'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'ReturnRequestResponseDto', 'status'),
            reason: BuiltValueNullFieldError.checkNotNull(
                reason, r'ReturnRequestResponseDto', 'reason'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'ReturnRequestResponseDto', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'ReturnRequestResponseDto', 'updatedAt'),
            items: items.build(),
            refunds: refunds.build(),
            reviewedByUserId: reviewedByUserId,
            receivedByUserId: receivedByUserId,
            notes: notes,
            reviewNotes: reviewNotes,
            rejectionReason: rejectionReason,
            approvedAt: approvedAt,
            rejectedAt: rejectedAt,
            receivedAt: receivedAt,
            closedAt: closedAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
        _$failedField = 'refunds';
        refunds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReturnRequestResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
