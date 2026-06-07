// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_return_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrderReturnRequestDto extends OrderReturnRequestDto {
  @override
  final String id;
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
  final BuiltList<OrderReturnRequestItemDto> items;
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

  factory _$OrderReturnRequestDto(
          [void Function(OrderReturnRequestDtoBuilder)? updates]) =>
      (OrderReturnRequestDtoBuilder()..update(updates))._build();

  _$OrderReturnRequestDto._(
      {required this.id,
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
  OrderReturnRequestDto rebuild(
          void Function(OrderReturnRequestDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderReturnRequestDtoBuilder toBuilder() =>
      OrderReturnRequestDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderReturnRequestDto &&
        id == other.id &&
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
    return (newBuiltValueToStringHelper(r'OrderReturnRequestDto')
          ..add('id', id)
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

class OrderReturnRequestDtoBuilder
    implements Builder<OrderReturnRequestDto, OrderReturnRequestDtoBuilder> {
  _$OrderReturnRequestDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

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

  ListBuilder<OrderReturnRequestItemDto>? _items;
  ListBuilder<OrderReturnRequestItemDto> get items =>
      _$this._items ??= ListBuilder<OrderReturnRequestItemDto>();
  set items(ListBuilder<OrderReturnRequestItemDto>? items) =>
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

  OrderReturnRequestDtoBuilder() {
    OrderReturnRequestDto._defaults(this);
  }

  OrderReturnRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
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
  void replace(OrderReturnRequestDto other) {
    _$v = other as _$OrderReturnRequestDto;
  }

  @override
  void update(void Function(OrderReturnRequestDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderReturnRequestDto build() => _build();

  _$OrderReturnRequestDto _build() {
    _$OrderReturnRequestDto _$result;
    try {
      _$result = _$v ??
          _$OrderReturnRequestDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'OrderReturnRequestDto', 'id'),
            returnNumber: BuiltValueNullFieldError.checkNotNull(
                returnNumber, r'OrderReturnRequestDto', 'returnNumber'),
            requestedByUserId: BuiltValueNullFieldError.checkNotNull(
                requestedByUserId,
                r'OrderReturnRequestDto',
                'requestedByUserId'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'OrderReturnRequestDto', 'status'),
            reason: BuiltValueNullFieldError.checkNotNull(
                reason, r'OrderReturnRequestDto', 'reason'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'OrderReturnRequestDto', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'OrderReturnRequestDto', 'updatedAt'),
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
            r'OrderReturnRequestDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
