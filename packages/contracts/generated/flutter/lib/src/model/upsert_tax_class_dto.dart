//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upsert_tax_class_dto.g.dart';

/// UpsertTaxClassDto
///
/// Properties:
/// * [name] - Display name of the tax class
/// * [isDefault] - Whether this class is the store default
@BuiltValue()
abstract class UpsertTaxClassDto
    implements Built<UpsertTaxClassDto, UpsertTaxClassDtoBuilder> {
  /// Display name of the tax class
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Whether this class is the store default
  @BuiltValueField(wireName: r'isDefault')
  bool? get isDefault;

  UpsertTaxClassDto._();

  factory UpsertTaxClassDto([void updates(UpsertTaxClassDtoBuilder b)]) =
      _$UpsertTaxClassDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpsertTaxClassDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpsertTaxClassDto> get serializer =>
      _$UpsertTaxClassDtoSerializer();
}

class _$UpsertTaxClassDtoSerializer
    implements PrimitiveSerializer<UpsertTaxClassDto> {
  @override
  final Iterable<Type> types = const [UpsertTaxClassDto, _$UpsertTaxClassDto];

  @override
  final String wireName = r'UpsertTaxClassDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpsertTaxClassDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.isDefault != null) {
      yield r'isDefault';
      yield serializers.serialize(
        object.isDefault,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpsertTaxClassDto object, {
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
    required UpsertTaxClassDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'isDefault':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isDefault = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpsertTaxClassDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpsertTaxClassDtoBuilder();
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
