//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'checkout_address_dto.g.dart';

/// CheckoutAddressDto
///
/// Properties:
/// * [recipientName] - Full name of the recipient
/// * [phoneNumber] - Phone number
/// * [countryCode] - ISO 3166-1 alpha-2 country code
/// * [city] - City name
/// * [addressLine1] - First line of the street address
/// * [state] - State / province / region
/// * [postalCode] - Postal / ZIP code
/// * [addressLine2] - Second line of the street address
/// * [company] - Company or organisation name
@BuiltValue()
abstract class CheckoutAddressDto
    implements Built<CheckoutAddressDto, CheckoutAddressDtoBuilder> {
  /// Full name of the recipient
  @BuiltValueField(wireName: r'recipientName')
  String get recipientName;

  /// Phone number
  @BuiltValueField(wireName: r'phoneNumber')
  String get phoneNumber;

  /// ISO 3166-1 alpha-2 country code
  @BuiltValueField(wireName: r'countryCode')
  String get countryCode;

  /// City name
  @BuiltValueField(wireName: r'city')
  String get city;

  /// First line of the street address
  @BuiltValueField(wireName: r'addressLine1')
  String get addressLine1;

  /// State / province / region
  @BuiltValueField(wireName: r'state')
  String? get state;

  /// Postal / ZIP code
  @BuiltValueField(wireName: r'postalCode')
  String? get postalCode;

  /// Second line of the street address
  @BuiltValueField(wireName: r'addressLine2')
  String? get addressLine2;

  /// Company or organisation name
  @BuiltValueField(wireName: r'company')
  String? get company;

  CheckoutAddressDto._();

  factory CheckoutAddressDto([void updates(CheckoutAddressDtoBuilder b)]) =
      _$CheckoutAddressDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckoutAddressDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckoutAddressDto> get serializer =>
      _$CheckoutAddressDtoSerializer();
}

class _$CheckoutAddressDtoSerializer
    implements PrimitiveSerializer<CheckoutAddressDto> {
  @override
  final Iterable<Type> types = const [CheckoutAddressDto, _$CheckoutAddressDto];

  @override
  final String wireName = r'CheckoutAddressDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckoutAddressDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'recipientName';
    yield serializers.serialize(
      object.recipientName,
      specifiedType: const FullType(String),
    );
    yield r'phoneNumber';
    yield serializers.serialize(
      object.phoneNumber,
      specifiedType: const FullType(String),
    );
    yield r'countryCode';
    yield serializers.serialize(
      object.countryCode,
      specifiedType: const FullType(String),
    );
    yield r'city';
    yield serializers.serialize(
      object.city,
      specifiedType: const FullType(String),
    );
    yield r'addressLine1';
    yield serializers.serialize(
      object.addressLine1,
      specifiedType: const FullType(String),
    );
    if (object.state != null) {
      yield r'state';
      yield serializers.serialize(
        object.state,
        specifiedType: const FullType(String),
      );
    }
    if (object.postalCode != null) {
      yield r'postalCode';
      yield serializers.serialize(
        object.postalCode,
        specifiedType: const FullType(String),
      );
    }
    if (object.addressLine2 != null) {
      yield r'addressLine2';
      yield serializers.serialize(
        object.addressLine2,
        specifiedType: const FullType(String),
      );
    }
    if (object.company != null) {
      yield r'company';
      yield serializers.serialize(
        object.company,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CheckoutAddressDto object, {
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
    required CheckoutAddressDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'recipientName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.recipientName = valueDes;
          break;
        case r'phoneNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.phoneNumber = valueDes;
          break;
        case r'countryCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.countryCode = valueDes;
          break;
        case r'city':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.city = valueDes;
          break;
        case r'addressLine1':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.addressLine1 = valueDes;
          break;
        case r'state':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.state = valueDes;
          break;
        case r'postalCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.postalCode = valueDes;
          break;
        case r'addressLine2':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.addressLine2 = valueDes;
          break;
        case r'company':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.company = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CheckoutAddressDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckoutAddressDtoBuilder();
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
