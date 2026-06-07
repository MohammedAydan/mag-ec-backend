//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:mag_api_client/src/model/health_indicator_detail_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'health_readiness_response_dto.g.dart';

/// HealthReadinessResponseDto
///
/// Properties:
/// * [status]
/// * [details]
/// * [info]
/// * [error]
@BuiltValue()
abstract class HealthReadinessResponseDto
    implements
        Built<HealthReadinessResponseDto, HealthReadinessResponseDtoBuilder> {
  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'details')
  BuiltMap<String, HealthIndicatorDetailDto> get details;

  @BuiltValueField(wireName: r'info')
  BuiltMap<String, HealthIndicatorDetailDto>? get info;

  @BuiltValueField(wireName: r'error')
  BuiltMap<String, HealthIndicatorDetailDto>? get error;

  HealthReadinessResponseDto._();

  factory HealthReadinessResponseDto(
          [void updates(HealthReadinessResponseDtoBuilder b)]) =
      _$HealthReadinessResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HealthReadinessResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HealthReadinessResponseDto> get serializer =>
      _$HealthReadinessResponseDtoSerializer();
}

class _$HealthReadinessResponseDtoSerializer
    implements PrimitiveSerializer<HealthReadinessResponseDto> {
  @override
  final Iterable<Type> types = const [
    HealthReadinessResponseDto,
    _$HealthReadinessResponseDto
  ];

  @override
  final String wireName = r'HealthReadinessResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HealthReadinessResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'details';
    yield serializers.serialize(
      object.details,
      specifiedType: const FullType(
          BuiltMap, [FullType(String), FullType(HealthIndicatorDetailDto)]),
    );
    if (object.info != null) {
      yield r'info';
      yield serializers.serialize(
        object.info,
        specifiedType: const FullType.nullable(
            BuiltMap, [FullType(String), FullType(HealthIndicatorDetailDto)]),
      );
    }
    if (object.error != null) {
      yield r'error';
      yield serializers.serialize(
        object.error,
        specifiedType: const FullType.nullable(
            BuiltMap, [FullType(String), FullType(HealthIndicatorDetailDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    HealthReadinessResponseDto object, {
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
    required HealthReadinessResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'details':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap,
                [FullType(String), FullType(HealthIndicatorDetailDto)]),
          ) as BuiltMap<String, HealthIndicatorDetailDto>;
          result.details.replace(valueDes);
          break;
        case r'info':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap,
                [FullType(String), FullType(HealthIndicatorDetailDto)]),
          ) as BuiltMap<String, HealthIndicatorDetailDto>?;
          if (valueDes == null) continue;
          result.info.replace(valueDes);
          break;
        case r'error':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap,
                [FullType(String), FullType(HealthIndicatorDetailDto)]),
          ) as BuiltMap<String, HealthIndicatorDetailDto>?;
          if (valueDes == null) continue;
          result.error.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HealthReadinessResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HealthReadinessResponseDtoBuilder();
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
