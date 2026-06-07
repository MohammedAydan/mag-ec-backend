//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'execute_return_refund_dto.g.dart';

/// ExecuteReturnRefundDto
///
/// Properties:
/// * [amount] - Refund amount in the smallest currency unit (e.g., cents)
/// * [reason] - Reason for the refund
/// * [isOverride] - Set to true to override the automatic refund cap derived from received return items. Requires refunds.override_cap permission.
/// * [overrideReason] - Required when isOverride is true. Explains why the refund exceeds the received-items cap.
@BuiltValue()
abstract class ExecuteReturnRefundDto
    implements Built<ExecuteReturnRefundDto, ExecuteReturnRefundDtoBuilder> {
  /// Refund amount in the smallest currency unit (e.g., cents)
  @BuiltValueField(wireName: r'amount')
  num get amount;

  /// Reason for the refund
  @BuiltValueField(wireName: r'reason')
  String? get reason;

  /// Set to true to override the automatic refund cap derived from received return items. Requires refunds.override_cap permission.
  @BuiltValueField(wireName: r'isOverride')
  bool? get isOverride;

  /// Required when isOverride is true. Explains why the refund exceeds the received-items cap.
  @BuiltValueField(wireName: r'overrideReason')
  String? get overrideReason;

  ExecuteReturnRefundDto._();

  factory ExecuteReturnRefundDto(
          [void updates(ExecuteReturnRefundDtoBuilder b)]) =
      _$ExecuteReturnRefundDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExecuteReturnRefundDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExecuteReturnRefundDto> get serializer =>
      _$ExecuteReturnRefundDtoSerializer();
}

class _$ExecuteReturnRefundDtoSerializer
    implements PrimitiveSerializer<ExecuteReturnRefundDto> {
  @override
  final Iterable<Type> types = const [
    ExecuteReturnRefundDto,
    _$ExecuteReturnRefundDto
  ];

  @override
  final String wireName = r'ExecuteReturnRefundDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExecuteReturnRefundDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'amount';
    yield serializers.serialize(
      object.amount,
      specifiedType: const FullType(num),
    );
    if (object.reason != null) {
      yield r'reason';
      yield serializers.serialize(
        object.reason,
        specifiedType: const FullType(String),
      );
    }
    if (object.isOverride != null) {
      yield r'isOverride';
      yield serializers.serialize(
        object.isOverride,
        specifiedType: const FullType(bool),
      );
    }
    if (object.overrideReason != null) {
      yield r'overrideReason';
      yield serializers.serialize(
        object.overrideReason,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ExecuteReturnRefundDto object, {
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
    required ExecuteReturnRefundDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.amount = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reason = valueDes;
          break;
        case r'isOverride':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isOverride = valueDes;
          break;
        case r'overrideReason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.overrideReason = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExecuteReturnRefundDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExecuteReturnRefundDtoBuilder();
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
