//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_legal_references_dto.g.dart';

/// UpdateLegalReferencesDto
///
/// Properties:
/// * [termsPageKey] - Key of the terms-of-service page (null to unset)
/// * [privacyPageKey] - Key of the privacy-policy page (null to unset)
/// * [returnsPageKey] - Key of the returns-policy page (null to unset)
/// * [shippingPageKey] - Key of the shipping-policy page (null to unset)
@BuiltValue()
abstract class UpdateLegalReferencesDto
    implements
        Built<UpdateLegalReferencesDto, UpdateLegalReferencesDtoBuilder> {
  /// Key of the terms-of-service page (null to unset)
  @BuiltValueField(wireName: r'termsPageKey')
  JsonObject? get termsPageKey;

  /// Key of the privacy-policy page (null to unset)
  @BuiltValueField(wireName: r'privacyPageKey')
  JsonObject? get privacyPageKey;

  /// Key of the returns-policy page (null to unset)
  @BuiltValueField(wireName: r'returnsPageKey')
  JsonObject? get returnsPageKey;

  /// Key of the shipping-policy page (null to unset)
  @BuiltValueField(wireName: r'shippingPageKey')
  JsonObject? get shippingPageKey;

  UpdateLegalReferencesDto._();

  factory UpdateLegalReferencesDto(
          [void updates(UpdateLegalReferencesDtoBuilder b)]) =
      _$UpdateLegalReferencesDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateLegalReferencesDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateLegalReferencesDto> get serializer =>
      _$UpdateLegalReferencesDtoSerializer();
}

class _$UpdateLegalReferencesDtoSerializer
    implements PrimitiveSerializer<UpdateLegalReferencesDto> {
  @override
  final Iterable<Type> types = const [
    UpdateLegalReferencesDto,
    _$UpdateLegalReferencesDto
  ];

  @override
  final String wireName = r'UpdateLegalReferencesDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateLegalReferencesDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.termsPageKey != null) {
      yield r'termsPageKey';
      yield serializers.serialize(
        object.termsPageKey,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.privacyPageKey != null) {
      yield r'privacyPageKey';
      yield serializers.serialize(
        object.privacyPageKey,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.returnsPageKey != null) {
      yield r'returnsPageKey';
      yield serializers.serialize(
        object.returnsPageKey,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.shippingPageKey != null) {
      yield r'shippingPageKey';
      yield serializers.serialize(
        object.shippingPageKey,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateLegalReferencesDto object, {
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
    required UpdateLegalReferencesDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'termsPageKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.termsPageKey = valueDes;
          break;
        case r'privacyPageKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.privacyPageKey = valueDes;
          break;
        case r'returnsPageKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.returnsPageKey = valueDes;
          break;
        case r'shippingPageKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.shippingPageKey = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateLegalReferencesDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateLegalReferencesDtoBuilder();
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
