// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_sent_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InvitationSentResponseDto extends InvitationSentResponseDto {
  @override
  final bool invitationSent;

  factory _$InvitationSentResponseDto(
          [void Function(InvitationSentResponseDtoBuilder)? updates]) =>
      (InvitationSentResponseDtoBuilder()..update(updates))._build();

  _$InvitationSentResponseDto._({required this.invitationSent}) : super._();
  @override
  InvitationSentResponseDto rebuild(
          void Function(InvitationSentResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvitationSentResponseDtoBuilder toBuilder() =>
      InvitationSentResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvitationSentResponseDto &&
        invitationSent == other.invitationSent;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, invitationSent.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InvitationSentResponseDto')
          ..add('invitationSent', invitationSent))
        .toString();
  }
}

class InvitationSentResponseDtoBuilder
    implements
        Builder<InvitationSentResponseDto, InvitationSentResponseDtoBuilder> {
  _$InvitationSentResponseDto? _$v;

  bool? _invitationSent;
  bool? get invitationSent => _$this._invitationSent;
  set invitationSent(bool? invitationSent) =>
      _$this._invitationSent = invitationSent;

  InvitationSentResponseDtoBuilder() {
    InvitationSentResponseDto._defaults(this);
  }

  InvitationSentResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _invitationSent = $v.invitationSent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvitationSentResponseDto other) {
    _$v = other as _$InvitationSentResponseDto;
  }

  @override
  void update(void Function(InvitationSentResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InvitationSentResponseDto build() => _build();

  _$InvitationSentResponseDto _build() {
    final _$result = _$v ??
        _$InvitationSentResponseDto._(
          invitationSent: BuiltValueNullFieldError.checkNotNull(
              invitationSent, r'InvitationSentResponseDto', 'invitationSent'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
