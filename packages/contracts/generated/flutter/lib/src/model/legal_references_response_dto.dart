//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/public_legal_reference_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'legal_references_response_dto.g.dart';

/// LegalReferencesResponseDto
///
/// Properties:
/// * [terms]
/// * [privacy]
/// * [returns]
/// * [shipping]
@BuiltValue()
abstract class LegalReferencesResponseDto
    implements
        Built<LegalReferencesResponseDto, LegalReferencesResponseDtoBuilder> {
  @BuiltValueField(wireName: r'terms')
  PublicLegalReferenceDto? get terms;

  @BuiltValueField(wireName: r'privacy')
  PublicLegalReferenceDto? get privacy;

  @BuiltValueField(wireName: r'returns')
  PublicLegalReferenceDto? get returns;

  @BuiltValueField(wireName: r'shipping')
  PublicLegalReferenceDto? get shipping;

  LegalReferencesResponseDto._();

  factory LegalReferencesResponseDto(
          [void updates(LegalReferencesResponseDtoBuilder b)]) =
      _$LegalReferencesResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LegalReferencesResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LegalReferencesResponseDto> get serializer =>
      _$LegalReferencesResponseDtoSerializer();
}

class _$LegalReferencesResponseDtoSerializer
    implements PrimitiveSerializer<LegalReferencesResponseDto> {
  @override
  final Iterable<Type> types = const [
    LegalReferencesResponseDto,
    _$LegalReferencesResponseDto
  ];

  @override
  final String wireName = r'LegalReferencesResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LegalReferencesResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'terms';
    yield object.terms == null
        ? null
        : serializers.serialize(
            object.terms,
            specifiedType: const FullType.nullable(PublicLegalReferenceDto),
          );
    yield r'privacy';
    yield object.privacy == null
        ? null
        : serializers.serialize(
            object.privacy,
            specifiedType: const FullType.nullable(PublicLegalReferenceDto),
          );
    yield r'returns';
    yield object.returns == null
        ? null
        : serializers.serialize(
            object.returns,
            specifiedType: const FullType.nullable(PublicLegalReferenceDto),
          );
    yield r'shipping';
    yield object.shipping == null
        ? null
        : serializers.serialize(
            object.shipping,
            specifiedType: const FullType.nullable(PublicLegalReferenceDto),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    LegalReferencesResponseDto object, {
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
    required LegalReferencesResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'terms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(PublicLegalReferenceDto),
          ) as PublicLegalReferenceDto?;
          if (valueDes == null) continue;
          result.terms.replace(valueDes);
          break;
        case r'privacy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(PublicLegalReferenceDto),
          ) as PublicLegalReferenceDto?;
          if (valueDes == null) continue;
          result.privacy.replace(valueDes);
          break;
        case r'returns':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(PublicLegalReferenceDto),
          ) as PublicLegalReferenceDto?;
          if (valueDes == null) continue;
          result.returns.replace(valueDes);
          break;
        case r'shipping':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(PublicLegalReferenceDto),
          ) as PublicLegalReferenceDto?;
          if (valueDes == null) continue;
          result.shipping.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LegalReferencesResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LegalReferencesResponseDtoBuilder();
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
