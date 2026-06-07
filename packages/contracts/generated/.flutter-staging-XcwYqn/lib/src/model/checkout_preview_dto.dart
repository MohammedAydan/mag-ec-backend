//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/checkout_preview_item_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'checkout_preview_dto.g.dart';

/// CheckoutPreviewDto
///
/// Properties:
/// * [currencyCode] - ISO 4217 currency code (e.g. USD)
/// * [countryCode] - ISO 3166-1 alpha-2 country code for tax and shipping
/// * [items] - Line items to include in the preview
/// * [customerLocale] - Locale for translated output (e.g. en-US)
/// * [customerId] - Customer identifier for personalised pricing
/// * [couponCodes] - Coupon codes to apply during preview
@BuiltValue()
abstract class CheckoutPreviewDto implements Built<CheckoutPreviewDto, CheckoutPreviewDtoBuilder> {
  /// ISO 4217 currency code (e.g. USD)
  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  /// ISO 3166-1 alpha-2 country code for tax and shipping
  @BuiltValueField(wireName: r'countryCode')
  String get countryCode;

  /// Line items to include in the preview
  @BuiltValueField(wireName: r'items')
  BuiltList<CheckoutPreviewItemDto> get items;

  /// Locale for translated output (e.g. en-US)
  @BuiltValueField(wireName: r'customerLocale')
  String? get customerLocale;

  /// Customer identifier for personalised pricing
  @BuiltValueField(wireName: r'customerId')
  String? get customerId;

  /// Coupon codes to apply during preview
  @BuiltValueField(wireName: r'couponCodes')
  BuiltList<String>? get couponCodes;

  CheckoutPreviewDto._();

  factory CheckoutPreviewDto([void updates(CheckoutPreviewDtoBuilder b)]) = _$CheckoutPreviewDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckoutPreviewDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckoutPreviewDto> get serializer => _$CheckoutPreviewDtoSerializer();
}

class _$CheckoutPreviewDtoSerializer implements PrimitiveSerializer<CheckoutPreviewDto> {
  @override
  final Iterable<Type> types = const [CheckoutPreviewDto, _$CheckoutPreviewDto];

  @override
  final String wireName = r'CheckoutPreviewDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckoutPreviewDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'currencyCode';
    yield serializers.serialize(
      object.currencyCode,
      specifiedType: const FullType(String),
    );
    yield r'countryCode';
    yield serializers.serialize(
      object.countryCode,
      specifiedType: const FullType(String),
    );
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(CheckoutPreviewItemDto)]),
    );
    if (object.customerLocale != null) {
      yield r'customerLocale';
      yield serializers.serialize(
        object.customerLocale,
        specifiedType: const FullType(String),
      );
    }
    if (object.customerId != null) {
      yield r'customerId';
      yield serializers.serialize(
        object.customerId,
        specifiedType: const FullType(String),
      );
    }
    if (object.couponCodes != null) {
      yield r'couponCodes';
      yield serializers.serialize(
        object.couponCodes,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CheckoutPreviewDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CheckoutPreviewDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currencyCode = valueDes;
          break;
        case r'countryCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.countryCode = valueDes;
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(CheckoutPreviewItemDto)]),
          ) as BuiltList<CheckoutPreviewItemDto>;
          result.items.replace(valueDes);
          break;
        case r'customerLocale':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.customerLocale = valueDes;
          break;
        case r'customerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.customerId = valueDes;
          break;
        case r'couponCodes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.couponCodes.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CheckoutPreviewDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckoutPreviewDtoBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

