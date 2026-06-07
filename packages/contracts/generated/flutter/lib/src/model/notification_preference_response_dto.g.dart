// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_preference_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NotificationPreferenceResponseDto
    extends NotificationPreferenceResponseDto {
  @override
  final String id;
  @override
  final String userId;
  @override
  final String channel;
  @override
  final bool orderConfirmations;
  @override
  final bool orderShipments;
  @override
  final bool orderDeliveries;
  @override
  final bool returnStatusUpdates;
  @override
  final bool reviewReplies;
  @override
  final bool backInStock;
  @override
  final bool lowStockAlerts;
  @override
  final bool promotionalMessages;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  factory _$NotificationPreferenceResponseDto(
          [void Function(NotificationPreferenceResponseDtoBuilder)? updates]) =>
      (NotificationPreferenceResponseDtoBuilder()..update(updates))._build();

  _$NotificationPreferenceResponseDto._(
      {required this.id,
      required this.userId,
      required this.channel,
      required this.orderConfirmations,
      required this.orderShipments,
      required this.orderDeliveries,
      required this.returnStatusUpdates,
      required this.reviewReplies,
      required this.backInStock,
      required this.lowStockAlerts,
      required this.promotionalMessages,
      required this.createdAt,
      required this.updatedAt})
      : super._();
  @override
  NotificationPreferenceResponseDto rebuild(
          void Function(NotificationPreferenceResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationPreferenceResponseDtoBuilder toBuilder() =>
      NotificationPreferenceResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationPreferenceResponseDto &&
        id == other.id &&
        userId == other.userId &&
        channel == other.channel &&
        orderConfirmations == other.orderConfirmations &&
        orderShipments == other.orderShipments &&
        orderDeliveries == other.orderDeliveries &&
        returnStatusUpdates == other.returnStatusUpdates &&
        reviewReplies == other.reviewReplies &&
        backInStock == other.backInStock &&
        lowStockAlerts == other.lowStockAlerts &&
        promotionalMessages == other.promotionalMessages &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, channel.hashCode);
    _$hash = $jc(_$hash, orderConfirmations.hashCode);
    _$hash = $jc(_$hash, orderShipments.hashCode);
    _$hash = $jc(_$hash, orderDeliveries.hashCode);
    _$hash = $jc(_$hash, returnStatusUpdates.hashCode);
    _$hash = $jc(_$hash, reviewReplies.hashCode);
    _$hash = $jc(_$hash, backInStock.hashCode);
    _$hash = $jc(_$hash, lowStockAlerts.hashCode);
    _$hash = $jc(_$hash, promotionalMessages.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationPreferenceResponseDto')
          ..add('id', id)
          ..add('userId', userId)
          ..add('channel', channel)
          ..add('orderConfirmations', orderConfirmations)
          ..add('orderShipments', orderShipments)
          ..add('orderDeliveries', orderDeliveries)
          ..add('returnStatusUpdates', returnStatusUpdates)
          ..add('reviewReplies', reviewReplies)
          ..add('backInStock', backInStock)
          ..add('lowStockAlerts', lowStockAlerts)
          ..add('promotionalMessages', promotionalMessages)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class NotificationPreferenceResponseDtoBuilder
    implements
        Builder<NotificationPreferenceResponseDto,
            NotificationPreferenceResponseDtoBuilder> {
  _$NotificationPreferenceResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _channel;
  String? get channel => _$this._channel;
  set channel(String? channel) => _$this._channel = channel;

  bool? _orderConfirmations;
  bool? get orderConfirmations => _$this._orderConfirmations;
  set orderConfirmations(bool? orderConfirmations) =>
      _$this._orderConfirmations = orderConfirmations;

  bool? _orderShipments;
  bool? get orderShipments => _$this._orderShipments;
  set orderShipments(bool? orderShipments) =>
      _$this._orderShipments = orderShipments;

  bool? _orderDeliveries;
  bool? get orderDeliveries => _$this._orderDeliveries;
  set orderDeliveries(bool? orderDeliveries) =>
      _$this._orderDeliveries = orderDeliveries;

  bool? _returnStatusUpdates;
  bool? get returnStatusUpdates => _$this._returnStatusUpdates;
  set returnStatusUpdates(bool? returnStatusUpdates) =>
      _$this._returnStatusUpdates = returnStatusUpdates;

  bool? _reviewReplies;
  bool? get reviewReplies => _$this._reviewReplies;
  set reviewReplies(bool? reviewReplies) =>
      _$this._reviewReplies = reviewReplies;

  bool? _backInStock;
  bool? get backInStock => _$this._backInStock;
  set backInStock(bool? backInStock) => _$this._backInStock = backInStock;

  bool? _lowStockAlerts;
  bool? get lowStockAlerts => _$this._lowStockAlerts;
  set lowStockAlerts(bool? lowStockAlerts) =>
      _$this._lowStockAlerts = lowStockAlerts;

  bool? _promotionalMessages;
  bool? get promotionalMessages => _$this._promotionalMessages;
  set promotionalMessages(bool? promotionalMessages) =>
      _$this._promotionalMessages = promotionalMessages;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  NotificationPreferenceResponseDtoBuilder() {
    NotificationPreferenceResponseDto._defaults(this);
  }

  NotificationPreferenceResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _channel = $v.channel;
      _orderConfirmations = $v.orderConfirmations;
      _orderShipments = $v.orderShipments;
      _orderDeliveries = $v.orderDeliveries;
      _returnStatusUpdates = $v.returnStatusUpdates;
      _reviewReplies = $v.reviewReplies;
      _backInStock = $v.backInStock;
      _lowStockAlerts = $v.lowStockAlerts;
      _promotionalMessages = $v.promotionalMessages;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationPreferenceResponseDto other) {
    _$v = other as _$NotificationPreferenceResponseDto;
  }

  @override
  void update(
      void Function(NotificationPreferenceResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationPreferenceResponseDto build() => _build();

  _$NotificationPreferenceResponseDto _build() {
    final _$result = _$v ??
        _$NotificationPreferenceResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'NotificationPreferenceResponseDto', 'id'),
          userId: BuiltValueNullFieldError.checkNotNull(
              userId, r'NotificationPreferenceResponseDto', 'userId'),
          channel: BuiltValueNullFieldError.checkNotNull(
              channel, r'NotificationPreferenceResponseDto', 'channel'),
          orderConfirmations: BuiltValueNullFieldError.checkNotNull(
              orderConfirmations,
              r'NotificationPreferenceResponseDto',
              'orderConfirmations'),
          orderShipments: BuiltValueNullFieldError.checkNotNull(orderShipments,
              r'NotificationPreferenceResponseDto', 'orderShipments'),
          orderDeliveries: BuiltValueNullFieldError.checkNotNull(
              orderDeliveries,
              r'NotificationPreferenceResponseDto',
              'orderDeliveries'),
          returnStatusUpdates: BuiltValueNullFieldError.checkNotNull(
              returnStatusUpdates,
              r'NotificationPreferenceResponseDto',
              'returnStatusUpdates'),
          reviewReplies: BuiltValueNullFieldError.checkNotNull(reviewReplies,
              r'NotificationPreferenceResponseDto', 'reviewReplies'),
          backInStock: BuiltValueNullFieldError.checkNotNull(
              backInStock, r'NotificationPreferenceResponseDto', 'backInStock'),
          lowStockAlerts: BuiltValueNullFieldError.checkNotNull(lowStockAlerts,
              r'NotificationPreferenceResponseDto', 'lowStockAlerts'),
          promotionalMessages: BuiltValueNullFieldError.checkNotNull(
              promotionalMessages,
              r'NotificationPreferenceResponseDto',
              'promotionalMessages'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'NotificationPreferenceResponseDto', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'NotificationPreferenceResponseDto', 'updatedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
