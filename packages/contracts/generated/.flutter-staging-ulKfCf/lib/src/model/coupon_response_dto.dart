//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'coupon_response_dto.g.dart';

/// CouponResponseDto
///
/// Properties:
/// * [id] 
/// * [promotionId] 
/// * [code] 
/// * [normalizedCode] 
/// * [status] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [startsAt] 
/// * [endsAt] 
/// * [totalUsageLimit] 
/// * [perCustomerUsageLimit] 
@BuiltValue()
abstract class CouponResponseDto implements Built<CouponResponseDto, CouponResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String get id;

  @BuiltValueField(wireName: r'promotionId')
  String get promotionId;

  @BuiltValueField(wireName: r'code')
  String get code;

  @BuiltValueField(wireName: r'normalizedCode')
  String get normalizedCode;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'createdAt')
  String get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  String get updatedAt;

  @BuiltValueField(wireName: r'startsAt')
  String? get startsAt;

  @BuiltValueField(wireName: r'endsAt')
  String? get endsAt;

  @BuiltValueField(wireName: r'totalUsageLimit')
  num? get totalUsageLimit;

  @BuiltValueField(wireName: r'perCustomerUsageLimit')
  num? get perCustomerUsageLimit;

  CouponResponseDto._();

  factory CouponResponseDto([void updates(CouponResponseDtoBuilder b)]) = _$CouponResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CouponResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CouponResponseDto> get serializer => _$CouponResponseDtoSerializer();
}

class _$CouponResponseDtoSerializer implements PrimitiveSerializer<CouponResponseDto> {
  @override
  final Iterable<Type> types = const [CouponResponseDto, _$CouponResponseDto];

  @override
  final String wireName = r'CouponResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CouponResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'promotionId';
    yield serializers.serialize(
      object.promotionId,
      specifiedType: const FullType(String),
    );
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'normalizedCode';
    yield serializers.serialize(
      object.normalizedCode,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(String),
    );
    yield r'updatedAt';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(String),
    );
    if (object.startsAt != null) {
      yield r'startsAt';
      yield serializers.serialize(
        object.startsAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.endsAt != null) {
      yield r'endsAt';
      yield serializers.serialize(
        object.endsAt,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.totalUsageLimit != null) {
      yield r'totalUsageLimit';
      yield serializers.serialize(
        object.totalUsageLimit,
        specifiedType: const FullType.nullable(num),
      );
    }
    if (object.perCustomerUsageLimit != null) {
      yield r'perCustomerUsageLimit';
      yield serializers.serialize(
        object.perCustomerUsageLimit,
        specifiedType: const FullType.nullable(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CouponResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CouponResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'promotionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.promotionId = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'normalizedCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.normalizedCode = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.updatedAt = valueDes;
          break;
        case r'startsAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.startsAt = valueDes;
          break;
        case r'endsAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.endsAt = valueDes;
          break;
        case r'totalUsageLimit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.totalUsageLimit = valueDes;
          break;
        case r'perCustomerUsageLimit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(num),
          ) as num?;
          if (valueDes == null) continue;
          result.perCustomerUsageLimit = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CouponResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CouponResponseDtoBuilder();
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

