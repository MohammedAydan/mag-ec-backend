//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reporting_count_metric_dto.g.dart';

/// ReportingCountMetricDto
///
/// Properties:
/// * [all]
@BuiltValue()
abstract class ReportingCountMetricDto
    implements Built<ReportingCountMetricDto, ReportingCountMetricDtoBuilder> {
  @BuiltValueField(wireName: r'_all')
  num get all;

  ReportingCountMetricDto._();

  factory ReportingCountMetricDto(
          [void updates(ReportingCountMetricDtoBuilder b)]) =
      _$ReportingCountMetricDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReportingCountMetricDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReportingCountMetricDto> get serializer =>
      _$ReportingCountMetricDtoSerializer();
}

class _$ReportingCountMetricDtoSerializer
    implements PrimitiveSerializer<ReportingCountMetricDto> {
  @override
  final Iterable<Type> types = const [
    ReportingCountMetricDto,
    _$ReportingCountMetricDto
  ];

  @override
  final String wireName = r'ReportingCountMetricDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReportingCountMetricDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'_all';
    yield serializers.serialize(
      object.all,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReportingCountMetricDto object, {
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
    required ReportingCountMetricDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'_all':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.all = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReportingCountMetricDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReportingCountMetricDtoBuilder();
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
