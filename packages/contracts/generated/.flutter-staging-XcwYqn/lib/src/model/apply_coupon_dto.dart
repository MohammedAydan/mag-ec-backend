//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apply_coupon_dto.g.dart';

/// ApplyCouponDto
///
/// Properties:
/// * [couponCode] - Coupon code to apply
@BuiltValue()
abstract class ApplyCouponDto implements Built<ApplyCouponDto, ApplyCouponDtoBuilder> {
  /// Coupon code to apply
  @BuiltValueField(wireName: r'couponCode')
  String get couponCode;

  ApplyCouponDto._();

  factory ApplyCouponDto([void updates(ApplyCouponDtoBuilder b)]) = _$ApplyCouponDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApplyCouponDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApplyCouponDto> get serializer => _$ApplyCouponDtoSerializer();
}

class _$ApplyCouponDtoSerializer implements PrimitiveSerializer<ApplyCouponDto> {
  @override
  final Iterable<Type> types = const [ApplyCouponDto, _$ApplyCouponDto];

  @override
  final String wireName = r'ApplyCouponDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApplyCouponDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'couponCode';
    yield serializers.serialize(
      object.couponCode,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ApplyCouponDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApplyCouponDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'couponCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.couponCode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApplyCouponDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApplyCouponDtoBuilder();
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

