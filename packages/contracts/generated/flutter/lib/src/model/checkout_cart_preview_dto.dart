//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'checkout_cart_preview_dto.g.dart';

/// CheckoutCartPreviewDto
///
/// Properties:
/// * [cartId] - Cart ID to evaluate for checkout
/// * [currencyCode] - ISO 4217 currency code (e.g. SAR, EGP)
/// * [countryCode] - ISO 3166-1 alpha-2 country code (e.g. SA, EG)
/// * [customerLocale] - Customer locale in BCP-47 format (e.g. ar-SA)
/// * [reserveStockOnPreview] - Whether to hold inventory during preview (default false)
@BuiltValue()
abstract class CheckoutCartPreviewDto
    implements Built<CheckoutCartPreviewDto, CheckoutCartPreviewDtoBuilder> {
  /// Cart ID to evaluate for checkout
  @BuiltValueField(wireName: r'cartId')
  String get cartId;

  /// ISO 4217 currency code (e.g. SAR, EGP)
  @BuiltValueField(wireName: r'currencyCode')
  String get currencyCode;

  /// ISO 3166-1 alpha-2 country code (e.g. SA, EG)
  @BuiltValueField(wireName: r'countryCode')
  String get countryCode;

  /// Customer locale in BCP-47 format (e.g. ar-SA)
  @BuiltValueField(wireName: r'customerLocale')
  String? get customerLocale;

  /// Whether to hold inventory during preview (default false)
  @BuiltValueField(wireName: r'reserveStockOnPreview')
  bool? get reserveStockOnPreview;

  CheckoutCartPreviewDto._();

  factory CheckoutCartPreviewDto(
          [void updates(CheckoutCartPreviewDtoBuilder b)]) =
      _$CheckoutCartPreviewDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckoutCartPreviewDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckoutCartPreviewDto> get serializer =>
      _$CheckoutCartPreviewDtoSerializer();
}

class _$CheckoutCartPreviewDtoSerializer
    implements PrimitiveSerializer<CheckoutCartPreviewDto> {
  @override
  final Iterable<Type> types = const [
    CheckoutCartPreviewDto,
    _$CheckoutCartPreviewDto
  ];

  @override
  final String wireName = r'CheckoutCartPreviewDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckoutCartPreviewDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cartId';
    yield serializers.serialize(
      object.cartId,
      specifiedType: const FullType(String),
    );
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
    if (object.customerLocale != null) {
      yield r'customerLocale';
      yield serializers.serialize(
        object.customerLocale,
        specifiedType: const FullType(String),
      );
    }
    if (object.reserveStockOnPreview != null) {
      yield r'reserveStockOnPreview';
      yield serializers.serialize(
        object.reserveStockOnPreview,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CheckoutCartPreviewDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CheckoutCartPreviewDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'cartId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.cartId = valueDes;
          break;
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
        case r'customerLocale':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.customerLocale = valueDes;
          break;
        case r'reserveStockOnPreview':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.reserveStockOnPreview = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CheckoutCartPreviewDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckoutCartPreviewDtoBuilder();
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
