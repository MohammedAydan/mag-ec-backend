//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_legal_references_response_dto.g.dart';

/// AdminLegalReferencesResponseDto
///
/// Properties:
/// * [termsPageKey]
/// * [privacyPageKey]
/// * [returnsPageKey]
/// * [shippingPageKey]
@BuiltValue()
abstract class AdminLegalReferencesResponseDto
    implements
        Built<AdminLegalReferencesResponseDto,
            AdminLegalReferencesResponseDtoBuilder> {
  @BuiltValueField(wireName: r'termsPageKey')
  String? get termsPageKey;

  @BuiltValueField(wireName: r'privacyPageKey')
  String? get privacyPageKey;

  @BuiltValueField(wireName: r'returnsPageKey')
  String? get returnsPageKey;

  @BuiltValueField(wireName: r'shippingPageKey')
  String? get shippingPageKey;

  AdminLegalReferencesResponseDto._();

  factory AdminLegalReferencesResponseDto(
          [void updates(AdminLegalReferencesResponseDtoBuilder b)]) =
      _$AdminLegalReferencesResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminLegalReferencesResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminLegalReferencesResponseDto> get serializer =>
      _$AdminLegalReferencesResponseDtoSerializer();
}

class _$AdminLegalReferencesResponseDtoSerializer
    implements PrimitiveSerializer<AdminLegalReferencesResponseDto> {
  @override
  final Iterable<Type> types = const [
    AdminLegalReferencesResponseDto,
    _$AdminLegalReferencesResponseDto
  ];

  @override
  final String wireName = r'AdminLegalReferencesResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminLegalReferencesResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'termsPageKey';
    yield object.termsPageKey == null
        ? null
        : serializers.serialize(
            object.termsPageKey,
            specifiedType: const FullType.nullable(String),
          );
    yield r'privacyPageKey';
    yield object.privacyPageKey == null
        ? null
        : serializers.serialize(
            object.privacyPageKey,
            specifiedType: const FullType.nullable(String),
          );
    yield r'returnsPageKey';
    yield object.returnsPageKey == null
        ? null
        : serializers.serialize(
            object.returnsPageKey,
            specifiedType: const FullType.nullable(String),
          );
    yield r'shippingPageKey';
    yield object.shippingPageKey == null
        ? null
        : serializers.serialize(
            object.shippingPageKey,
            specifiedType: const FullType.nullable(String),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminLegalReferencesResponseDto object, {
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
    required AdminLegalReferencesResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'termsPageKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.termsPageKey = valueDes;
          break;
        case r'privacyPageKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.privacyPageKey = valueDes;
          break;
        case r'returnsPageKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.returnsPageKey = valueDes;
          break;
        case r'shippingPageKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
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
  AdminLegalReferencesResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminLegalReferencesResponseDtoBuilder();
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
