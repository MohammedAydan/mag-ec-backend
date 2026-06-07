// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_return_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ReviewReturnRequestDtoDecisionEnum
    _$reviewReturnRequestDtoDecisionEnum_approve =
    const ReviewReturnRequestDtoDecisionEnum._('approve');
const ReviewReturnRequestDtoDecisionEnum
    _$reviewReturnRequestDtoDecisionEnum_reject =
    const ReviewReturnRequestDtoDecisionEnum._('reject');

ReviewReturnRequestDtoDecisionEnum _$reviewReturnRequestDtoDecisionEnumValueOf(
    String name) {
  switch (name) {
    case 'approve':
      return _$reviewReturnRequestDtoDecisionEnum_approve;
    case 'reject':
      return _$reviewReturnRequestDtoDecisionEnum_reject;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReviewReturnRequestDtoDecisionEnum>
    _$reviewReturnRequestDtoDecisionEnumValues = BuiltSet<
        ReviewReturnRequestDtoDecisionEnum>(const <ReviewReturnRequestDtoDecisionEnum>[
  _$reviewReturnRequestDtoDecisionEnum_approve,
  _$reviewReturnRequestDtoDecisionEnum_reject,
]);

Serializer<ReviewReturnRequestDtoDecisionEnum>
    _$reviewReturnRequestDtoDecisionEnumSerializer =
    _$ReviewReturnRequestDtoDecisionEnumSerializer();

class _$ReviewReturnRequestDtoDecisionEnumSerializer
    implements PrimitiveSerializer<ReviewReturnRequestDtoDecisionEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'approve': 'approve',
    'reject': 'reject',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'approve': 'approve',
    'reject': 'reject',
  };

  @override
  final Iterable<Type> types = const <Type>[ReviewReturnRequestDtoDecisionEnum];
  @override
  final String wireName = 'ReviewReturnRequestDtoDecisionEnum';

  @override
  Object serialize(
          Serializers serializers, ReviewReturnRequestDtoDecisionEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ReviewReturnRequestDtoDecisionEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ReviewReturnRequestDtoDecisionEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ReviewReturnRequestDto extends ReviewReturnRequestDto {
  @override
  final ReviewReturnRequestDtoDecisionEnum decision;
  @override
  final String? reviewNotes;
  @override
  final String? rejectionReason;

  factory _$ReviewReturnRequestDto(
          [void Function(ReviewReturnRequestDtoBuilder)? updates]) =>
      (ReviewReturnRequestDtoBuilder()..update(updates))._build();

  _$ReviewReturnRequestDto._(
      {required this.decision, this.reviewNotes, this.rejectionReason})
      : super._();
  @override
  ReviewReturnRequestDto rebuild(
          void Function(ReviewReturnRequestDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewReturnRequestDtoBuilder toBuilder() =>
      ReviewReturnRequestDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewReturnRequestDto &&
        decision == other.decision &&
        reviewNotes == other.reviewNotes &&
        rejectionReason == other.rejectionReason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, decision.hashCode);
    _$hash = $jc(_$hash, reviewNotes.hashCode);
    _$hash = $jc(_$hash, rejectionReason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewReturnRequestDto')
          ..add('decision', decision)
          ..add('reviewNotes', reviewNotes)
          ..add('rejectionReason', rejectionReason))
        .toString();
  }
}

class ReviewReturnRequestDtoBuilder
    implements Builder<ReviewReturnRequestDto, ReviewReturnRequestDtoBuilder> {
  _$ReviewReturnRequestDto? _$v;

  ReviewReturnRequestDtoDecisionEnum? _decision;
  ReviewReturnRequestDtoDecisionEnum? get decision => _$this._decision;
  set decision(ReviewReturnRequestDtoDecisionEnum? decision) =>
      _$this._decision = decision;

  String? _reviewNotes;
  String? get reviewNotes => _$this._reviewNotes;
  set reviewNotes(String? reviewNotes) => _$this._reviewNotes = reviewNotes;

  String? _rejectionReason;
  String? get rejectionReason => _$this._rejectionReason;
  set rejectionReason(String? rejectionReason) =>
      _$this._rejectionReason = rejectionReason;

  ReviewReturnRequestDtoBuilder() {
    ReviewReturnRequestDto._defaults(this);
  }

  ReviewReturnRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _decision = $v.decision;
      _reviewNotes = $v.reviewNotes;
      _rejectionReason = $v.rejectionReason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewReturnRequestDto other) {
    _$v = other as _$ReviewReturnRequestDto;
  }

  @override
  void update(void Function(ReviewReturnRequestDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewReturnRequestDto build() => _build();

  _$ReviewReturnRequestDto _build() {
    final _$result = _$v ??
        _$ReviewReturnRequestDto._(
          decision: BuiltValueNullFieldError.checkNotNull(
              decision, r'ReviewReturnRequestDto', 'decision'),
          reviewNotes: reviewNotes,
          rejectionReason: rejectionReason,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
