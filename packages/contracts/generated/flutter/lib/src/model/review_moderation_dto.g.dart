// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_moderation_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ReviewModerationDtoDecisionEnum
    _$reviewModerationDtoDecisionEnum_APPROVE =
    const ReviewModerationDtoDecisionEnum._('APPROVE');
const ReviewModerationDtoDecisionEnum _$reviewModerationDtoDecisionEnum_REJECT =
    const ReviewModerationDtoDecisionEnum._('REJECT');
const ReviewModerationDtoDecisionEnum _$reviewModerationDtoDecisionEnum_FLAG =
    const ReviewModerationDtoDecisionEnum._('FLAG');
const ReviewModerationDtoDecisionEnum _$reviewModerationDtoDecisionEnum_HIDE =
    const ReviewModerationDtoDecisionEnum._('HIDE');

ReviewModerationDtoDecisionEnum _$reviewModerationDtoDecisionEnumValueOf(
    String name) {
  switch (name) {
    case 'APPROVE':
      return _$reviewModerationDtoDecisionEnum_APPROVE;
    case 'REJECT':
      return _$reviewModerationDtoDecisionEnum_REJECT;
    case 'FLAG':
      return _$reviewModerationDtoDecisionEnum_FLAG;
    case 'HIDE':
      return _$reviewModerationDtoDecisionEnum_HIDE;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReviewModerationDtoDecisionEnum>
    _$reviewModerationDtoDecisionEnumValues = BuiltSet<
        ReviewModerationDtoDecisionEnum>(const <ReviewModerationDtoDecisionEnum>[
  _$reviewModerationDtoDecisionEnum_APPROVE,
  _$reviewModerationDtoDecisionEnum_REJECT,
  _$reviewModerationDtoDecisionEnum_FLAG,
  _$reviewModerationDtoDecisionEnum_HIDE,
]);

Serializer<ReviewModerationDtoDecisionEnum>
    _$reviewModerationDtoDecisionEnumSerializer =
    _$ReviewModerationDtoDecisionEnumSerializer();

class _$ReviewModerationDtoDecisionEnumSerializer
    implements PrimitiveSerializer<ReviewModerationDtoDecisionEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'APPROVE': 'APPROVE',
    'REJECT': 'REJECT',
    'FLAG': 'FLAG',
    'HIDE': 'HIDE',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'APPROVE': 'APPROVE',
    'REJECT': 'REJECT',
    'FLAG': 'FLAG',
    'HIDE': 'HIDE',
  };

  @override
  final Iterable<Type> types = const <Type>[ReviewModerationDtoDecisionEnum];
  @override
  final String wireName = 'ReviewModerationDtoDecisionEnum';

  @override
  Object serialize(
          Serializers serializers, ReviewModerationDtoDecisionEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ReviewModerationDtoDecisionEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ReviewModerationDtoDecisionEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ReviewModerationDto extends ReviewModerationDto {
  @override
  final ReviewModerationDtoDecisionEnum decision;
  @override
  final String? reason;

  factory _$ReviewModerationDto(
          [void Function(ReviewModerationDtoBuilder)? updates]) =>
      (ReviewModerationDtoBuilder()..update(updates))._build();

  _$ReviewModerationDto._({required this.decision, this.reason}) : super._();
  @override
  ReviewModerationDto rebuild(
          void Function(ReviewModerationDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewModerationDtoBuilder toBuilder() =>
      ReviewModerationDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewModerationDto &&
        decision == other.decision &&
        reason == other.reason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, decision.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewModerationDto')
          ..add('decision', decision)
          ..add('reason', reason))
        .toString();
  }
}

class ReviewModerationDtoBuilder
    implements Builder<ReviewModerationDto, ReviewModerationDtoBuilder> {
  _$ReviewModerationDto? _$v;

  ReviewModerationDtoDecisionEnum? _decision;
  ReviewModerationDtoDecisionEnum? get decision => _$this._decision;
  set decision(ReviewModerationDtoDecisionEnum? decision) =>
      _$this._decision = decision;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  ReviewModerationDtoBuilder() {
    ReviewModerationDto._defaults(this);
  }

  ReviewModerationDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _decision = $v.decision;
      _reason = $v.reason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewModerationDto other) {
    _$v = other as _$ReviewModerationDto;
  }

  @override
  void update(void Function(ReviewModerationDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewModerationDto build() => _build();

  _$ReviewModerationDto _build() {
    final _$result = _$v ??
        _$ReviewModerationDto._(
          decision: BuiltValueNullFieldError.checkNotNull(
              decision, r'ReviewModerationDto', 'decision'),
          reason: reason,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
