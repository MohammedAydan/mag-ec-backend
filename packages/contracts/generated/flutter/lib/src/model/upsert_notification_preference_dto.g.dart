// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_notification_preference_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UpsertNotificationPreferenceDtoChannelEnum
    _$upsertNotificationPreferenceDtoChannelEnum_EMAIL =
    const UpsertNotificationPreferenceDtoChannelEnum._('EMAIL');
const UpsertNotificationPreferenceDtoChannelEnum
    _$upsertNotificationPreferenceDtoChannelEnum_PUSH =
    const UpsertNotificationPreferenceDtoChannelEnum._('PUSH');
const UpsertNotificationPreferenceDtoChannelEnum
    _$upsertNotificationPreferenceDtoChannelEnum_IN_APP =
    const UpsertNotificationPreferenceDtoChannelEnum._('IN_APP');

UpsertNotificationPreferenceDtoChannelEnum
    _$upsertNotificationPreferenceDtoChannelEnumValueOf(String name) {
  switch (name) {
    case 'EMAIL':
      return _$upsertNotificationPreferenceDtoChannelEnum_EMAIL;
    case 'PUSH':
      return _$upsertNotificationPreferenceDtoChannelEnum_PUSH;
    case 'IN_APP':
      return _$upsertNotificationPreferenceDtoChannelEnum_IN_APP;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UpsertNotificationPreferenceDtoChannelEnum>
    _$upsertNotificationPreferenceDtoChannelEnumValues = BuiltSet<
        UpsertNotificationPreferenceDtoChannelEnum>(const <UpsertNotificationPreferenceDtoChannelEnum>[
  _$upsertNotificationPreferenceDtoChannelEnum_EMAIL,
  _$upsertNotificationPreferenceDtoChannelEnum_PUSH,
  _$upsertNotificationPreferenceDtoChannelEnum_IN_APP,
]);

Serializer<UpsertNotificationPreferenceDtoChannelEnum>
    _$upsertNotificationPreferenceDtoChannelEnumSerializer =
    _$UpsertNotificationPreferenceDtoChannelEnumSerializer();

class _$UpsertNotificationPreferenceDtoChannelEnumSerializer
    implements PrimitiveSerializer<UpsertNotificationPreferenceDtoChannelEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'EMAIL': 'EMAIL',
    'PUSH': 'PUSH',
    'IN_APP': 'IN_APP',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'EMAIL': 'EMAIL',
    'PUSH': 'PUSH',
    'IN_APP': 'IN_APP',
  };

  @override
  final Iterable<Type> types = const <Type>[
    UpsertNotificationPreferenceDtoChannelEnum
  ];
  @override
  final String wireName = 'UpsertNotificationPreferenceDtoChannelEnum';

  @override
  Object serialize(Serializers serializers,
          UpsertNotificationPreferenceDtoChannelEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UpsertNotificationPreferenceDtoChannelEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UpsertNotificationPreferenceDtoChannelEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$UpsertNotificationPreferenceDto
    extends UpsertNotificationPreferenceDto {
  @override
  final UpsertNotificationPreferenceDtoChannelEnum channel;
  @override
  final bool? orderConfirmations;
  @override
  final bool? orderShipments;
  @override
  final bool? orderDeliveries;
  @override
  final bool? returnStatusUpdates;
  @override
  final bool? reviewReplies;
  @override
  final bool? backInStock;
  @override
  final bool? lowStockAlerts;
  @override
  final bool? promotionalMessages;

  factory _$UpsertNotificationPreferenceDto(
          [void Function(UpsertNotificationPreferenceDtoBuilder)? updates]) =>
      (UpsertNotificationPreferenceDtoBuilder()..update(updates))._build();

  _$UpsertNotificationPreferenceDto._(
      {required this.channel,
      this.orderConfirmations,
      this.orderShipments,
      this.orderDeliveries,
      this.returnStatusUpdates,
      this.reviewReplies,
      this.backInStock,
      this.lowStockAlerts,
      this.promotionalMessages})
      : super._();
  @override
  UpsertNotificationPreferenceDto rebuild(
          void Function(UpsertNotificationPreferenceDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpsertNotificationPreferenceDtoBuilder toBuilder() =>
      UpsertNotificationPreferenceDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpsertNotificationPreferenceDto &&
        channel == other.channel &&
        orderConfirmations == other.orderConfirmations &&
        orderShipments == other.orderShipments &&
        orderDeliveries == other.orderDeliveries &&
        returnStatusUpdates == other.returnStatusUpdates &&
        reviewReplies == other.reviewReplies &&
        backInStock == other.backInStock &&
        lowStockAlerts == other.lowStockAlerts &&
        promotionalMessages == other.promotionalMessages;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, channel.hashCode);
    _$hash = $jc(_$hash, orderConfirmations.hashCode);
    _$hash = $jc(_$hash, orderShipments.hashCode);
    _$hash = $jc(_$hash, orderDeliveries.hashCode);
    _$hash = $jc(_$hash, returnStatusUpdates.hashCode);
    _$hash = $jc(_$hash, reviewReplies.hashCode);
    _$hash = $jc(_$hash, backInStock.hashCode);
    _$hash = $jc(_$hash, lowStockAlerts.hashCode);
    _$hash = $jc(_$hash, promotionalMessages.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpsertNotificationPreferenceDto')
          ..add('channel', channel)
          ..add('orderConfirmations', orderConfirmations)
          ..add('orderShipments', orderShipments)
          ..add('orderDeliveries', orderDeliveries)
          ..add('returnStatusUpdates', returnStatusUpdates)
          ..add('reviewReplies', reviewReplies)
          ..add('backInStock', backInStock)
          ..add('lowStockAlerts', lowStockAlerts)
          ..add('promotionalMessages', promotionalMessages))
        .toString();
  }
}

class UpsertNotificationPreferenceDtoBuilder
    implements
        Builder<UpsertNotificationPreferenceDto,
            UpsertNotificationPreferenceDtoBuilder> {
  _$UpsertNotificationPreferenceDto? _$v;

  UpsertNotificationPreferenceDtoChannelEnum? _channel;
  UpsertNotificationPreferenceDtoChannelEnum? get channel => _$this._channel;
  set channel(UpsertNotificationPreferenceDtoChannelEnum? channel) =>
      _$this._channel = channel;

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

  UpsertNotificationPreferenceDtoBuilder() {
    UpsertNotificationPreferenceDto._defaults(this);
  }

  UpsertNotificationPreferenceDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _channel = $v.channel;
      _orderConfirmations = $v.orderConfirmations;
      _orderShipments = $v.orderShipments;
      _orderDeliveries = $v.orderDeliveries;
      _returnStatusUpdates = $v.returnStatusUpdates;
      _reviewReplies = $v.reviewReplies;
      _backInStock = $v.backInStock;
      _lowStockAlerts = $v.lowStockAlerts;
      _promotionalMessages = $v.promotionalMessages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpsertNotificationPreferenceDto other) {
    _$v = other as _$UpsertNotificationPreferenceDto;
  }

  @override
  void update(void Function(UpsertNotificationPreferenceDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpsertNotificationPreferenceDto build() => _build();

  _$UpsertNotificationPreferenceDto _build() {
    final _$result = _$v ??
        _$UpsertNotificationPreferenceDto._(
          channel: BuiltValueNullFieldError.checkNotNull(
              channel, r'UpsertNotificationPreferenceDto', 'channel'),
          orderConfirmations: orderConfirmations,
          orderShipments: orderShipments,
          orderDeliveries: orderDeliveries,
          returnStatusUpdates: returnStatusUpdates,
          reviewReplies: reviewReplies,
          backInStock: backInStock,
          lowStockAlerts: lowStockAlerts,
          promotionalMessages: promotionalMessages,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
