//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mag_api_client/src/model/promotion_performance_sum_dto.dart';
import 'package:mag_api_client/src/model/reporting_count_metric_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'promotion_performance_dto.g.dart';

/// PromotionPerformanceDto
///
/// Properties:
/// * [promotionId] 
/// * [key] 
/// * [name] 
/// * [source_] 
/// * [count] 
/// * [sum] 
@BuiltValue()
abstract class PromotionPerformanceDto implements Built<PromotionPerformanceDto, PromotionPerformanceDtoBuilder> {
  @BuiltValueField(wireName: r'promotionId')
  String get promotionId;

  @BuiltValueField(wireName: r'key')
  String get key;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'source')
  String get source_;

  @BuiltValueField(wireName: r'_count')
  ReportingCountMetricDto get count;

  @BuiltValueField(wireName: r'_sum')
  PromotionPerformanceSumDto get sum;

  PromotionPerformanceDto._();

  factory PromotionPerformanceDto([void updates(PromotionPerformanceDtoBuilder b)]) = _$PromotionPerformanceDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PromotionPerformanceDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PromotionPerformanceDto> get serializer => _$PromotionPerformanceDtoSerializer();
}

class _$PromotionPerformanceDtoSerializer implements PrimitiveSerializer<PromotionPerformanceDto> {
  @override
  final Iterable<Type> types = const [PromotionPerformanceDto, _$PromotionPerformanceDto];

  @override
  final String wireName = r'PromotionPerformanceDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PromotionPerformanceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'promotionId';
    yield serializers.serialize(
      object.promotionId,
      specifiedType: const FullType(String),
    );
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'source';
    yield serializers.serialize(
      object.source_,
      specifiedType: const FullType(String),
    );
    yield r'_count';
    yield serializers.serialize(
      object.count,
      specifiedType: const FullType(ReportingCountMetricDto),
    );
    yield r'_sum';
    yield serializers.serialize(
      object.sum,
      specifiedType: const FullType(PromotionPerformanceSumDto),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PromotionPerformanceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PromotionPerformanceDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'promotionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.promotionId = valueDes;
          break;
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'source':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.source_ = valueDes;
          break;
        case r'_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ReportingCountMetricDto),
          ) as ReportingCountMetricDto;
          result.count.replace(valueDes);
          break;
        case r'_sum':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PromotionPerformanceSumDto),
          ) as PromotionPerformanceSumDto;
          result.sum.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PromotionPerformanceDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PromotionPerformanceDtoBuilder();
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

