//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upsert_coupon_dto.g.dart';

/// UpsertCouponDto
///
/// Properties:
/// * [code] - Unique coupon code
/// * [status] - Coupon status
/// * [startsAt] - Start date (ISO 8601)
/// * [endsAt] - End date (ISO 8601)
/// * [totalUsageLimit] - Maximum number of total redemptions for this coupon
/// * [perCustomerUsageLimit] - Maximum redemptions per customer for this coupon
@BuiltValue()
abstract class UpsertCouponDto
    implements Built<UpsertCouponDto, UpsertCouponDtoBuilder> {
  /// Unique coupon code
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Coupon status
  @BuiltValueField(wireName: r'status')
  UpsertCouponDtoStatusEnum get status;
  // enum statusEnum {  ACTIVE,  DISABLED,  ARCHIVED,  };

  /// Start date (ISO 8601)
  @BuiltValueField(wireName: r'startsAt')
  DateTime? get startsAt;

  /// End date (ISO 8601)
  @BuiltValueField(wireName: r'endsAt')
  DateTime? get endsAt;

  /// Maximum number of total redemptions for this coupon
  @BuiltValueField(wireName: r'totalUsageLimit')
  num? get totalUsageLimit;

  /// Maximum redemptions per customer for this coupon
  @BuiltValueField(wireName: r'perCustomerUsageLimit')
  num? get perCustomerUsageLimit;

  UpsertCouponDto._();

  factory UpsertCouponDto([void updates(UpsertCouponDtoBuilder b)]) =
      _$UpsertCouponDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpsertCouponDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpsertCouponDto> get serializer =>
      _$UpsertCouponDtoSerializer();
}

class _$UpsertCouponDtoSerializer
    implements PrimitiveSerializer<UpsertCouponDto> {
  @override
  final Iterable<Type> types = const [UpsertCouponDto, _$UpsertCouponDto];

  @override
  final String wireName = r'UpsertCouponDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpsertCouponDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(UpsertCouponDtoStatusEnum),
    );
    if (object.startsAt != null) {
      yield r'startsAt';
      yield serializers.serialize(
        object.startsAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.endsAt != null) {
      yield r'endsAt';
      yield serializers.serialize(
        object.endsAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.totalUsageLimit != null) {
      yield r'totalUsageLimit';
      yield serializers.serialize(
        object.totalUsageLimit,
        specifiedType: const FullType(num),
      );
    }
    if (object.perCustomerUsageLimit != null) {
      yield r'perCustomerUsageLimit';
      yield serializers.serialize(
        object.perCustomerUsageLimit,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpsertCouponDto object, {
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
    required UpsertCouponDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UpsertCouponDtoStatusEnum),
          ) as UpsertCouponDtoStatusEnum;
          result.status = valueDes;
          break;
        case r'startsAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startsAt = valueDes;
          break;
        case r'endsAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endsAt = valueDes;
          break;
        case r'totalUsageLimit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.totalUsageLimit = valueDes;
          break;
        case r'perCustomerUsageLimit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
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
  UpsertCouponDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpsertCouponDtoBuilder();
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

class UpsertCouponDtoStatusEnum extends EnumClass {
  /// Coupon status
  @BuiltValueEnumConst(wireName: r'ACTIVE')
  static const UpsertCouponDtoStatusEnum ACTIVE =
      _$upsertCouponDtoStatusEnum_ACTIVE;

  /// Coupon status
  @BuiltValueEnumConst(wireName: r'DISABLED')
  static const UpsertCouponDtoStatusEnum DISABLED =
      _$upsertCouponDtoStatusEnum_DISABLED;

  /// Coupon status
  @BuiltValueEnumConst(wireName: r'ARCHIVED')
  static const UpsertCouponDtoStatusEnum ARCHIVED =
      _$upsertCouponDtoStatusEnum_ARCHIVED;

  static Serializer<UpsertCouponDtoStatusEnum> get serializer =>
      _$upsertCouponDtoStatusEnumSerializer;

  const UpsertCouponDtoStatusEnum._(String name) : super(name);

  static BuiltSet<UpsertCouponDtoStatusEnum> get values =>
      _$upsertCouponDtoStatusEnumValues;
  static UpsertCouponDtoStatusEnum valueOf(String name) =>
      _$upsertCouponDtoStatusEnumValueOf(name);
}
