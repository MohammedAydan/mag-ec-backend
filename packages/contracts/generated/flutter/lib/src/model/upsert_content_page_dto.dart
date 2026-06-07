//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upsert_content_page_dto.g.dart';

/// UpsertContentPageDto
///
/// Properties:
/// * [slug] - URL-friendly page slug
/// * [title] - Page title
/// * [body] - Page body content
/// * [status] - Publishing status
/// * [sortOrder] - Display order
/// * [isLegal] - Whether this page is a legal reference target
/// * [locale] - Locale code (e.g. en, ar)
@BuiltValue()
abstract class UpsertContentPageDto
    implements Built<UpsertContentPageDto, UpsertContentPageDtoBuilder> {
  /// URL-friendly page slug
  @BuiltValueField(wireName: r'slug')
  String get slug;

  /// Page title
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Page body content
  @BuiltValueField(wireName: r'body')
  String get body;

  /// Publishing status
  @BuiltValueField(wireName: r'status')
  UpsertContentPageDtoStatusEnum get status;
  // enum statusEnum {  DRAFT,  PUBLISHED,  ARCHIVED,  };

  /// Display order
  @BuiltValueField(wireName: r'sortOrder')
  num? get sortOrder;

  /// Whether this page is a legal reference target
  @BuiltValueField(wireName: r'isLegal')
  bool? get isLegal;

  /// Locale code (e.g. en, ar)
  @BuiltValueField(wireName: r'locale')
  String? get locale;

  UpsertContentPageDto._();

  factory UpsertContentPageDto([void updates(UpsertContentPageDtoBuilder b)]) =
      _$UpsertContentPageDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpsertContentPageDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpsertContentPageDto> get serializer =>
      _$UpsertContentPageDtoSerializer();
}

class _$UpsertContentPageDtoSerializer
    implements PrimitiveSerializer<UpsertContentPageDto> {
  @override
  final Iterable<Type> types = const [
    UpsertContentPageDto,
    _$UpsertContentPageDto
  ];

  @override
  final String wireName = r'UpsertContentPageDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpsertContentPageDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'slug';
    yield serializers.serialize(
      object.slug,
      specifiedType: const FullType(String),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'body';
    yield serializers.serialize(
      object.body,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(UpsertContentPageDtoStatusEnum),
    );
    if (object.sortOrder != null) {
      yield r'sortOrder';
      yield serializers.serialize(
        object.sortOrder,
        specifiedType: const FullType(num),
      );
    }
    if (object.isLegal != null) {
      yield r'isLegal';
      yield serializers.serialize(
        object.isLegal,
        specifiedType: const FullType(bool),
      );
    }
    if (object.locale != null) {
      yield r'locale';
      yield serializers.serialize(
        object.locale,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpsertContentPageDto object, {
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
    required UpsertContentPageDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'slug':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.slug = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'body':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.body = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UpsertContentPageDtoStatusEnum),
          ) as UpsertContentPageDtoStatusEnum;
          result.status = valueDes;
          break;
        case r'sortOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.sortOrder = valueDes;
          break;
        case r'isLegal':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isLegal = valueDes;
          break;
        case r'locale':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.locale = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpsertContentPageDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpsertContentPageDtoBuilder();
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

class UpsertContentPageDtoStatusEnum extends EnumClass {
  /// Publishing status
  @BuiltValueEnumConst(wireName: r'DRAFT')
  static const UpsertContentPageDtoStatusEnum DRAFT =
      _$upsertContentPageDtoStatusEnum_DRAFT;

  /// Publishing status
  @BuiltValueEnumConst(wireName: r'PUBLISHED')
  static const UpsertContentPageDtoStatusEnum PUBLISHED =
      _$upsertContentPageDtoStatusEnum_PUBLISHED;

  /// Publishing status
  @BuiltValueEnumConst(wireName: r'ARCHIVED')
  static const UpsertContentPageDtoStatusEnum ARCHIVED =
      _$upsertContentPageDtoStatusEnum_ARCHIVED;

  static Serializer<UpsertContentPageDtoStatusEnum> get serializer =>
      _$upsertContentPageDtoStatusEnumSerializer;

  const UpsertContentPageDtoStatusEnum._(String name) : super(name);

  static BuiltSet<UpsertContentPageDtoStatusEnum> get values =>
      _$upsertContentPageDtoStatusEnumValues;
  static UpsertContentPageDtoStatusEnum valueOf(String name) =>
      _$upsertContentPageDtoStatusEnumValueOf(name);
}
