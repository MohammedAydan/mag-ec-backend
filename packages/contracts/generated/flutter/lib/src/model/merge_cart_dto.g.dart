// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merge_cart_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MergeCartDto extends MergeCartDto {
  @override
  final String sourceGuestToken;

  factory _$MergeCartDto([void Function(MergeCartDtoBuilder)? updates]) =>
      (MergeCartDtoBuilder()..update(updates))._build();

  _$MergeCartDto._({required this.sourceGuestToken}) : super._();
  @override
  MergeCartDto rebuild(void Function(MergeCartDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MergeCartDtoBuilder toBuilder() => MergeCartDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MergeCartDto && sourceGuestToken == other.sourceGuestToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sourceGuestToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MergeCartDto')
          ..add('sourceGuestToken', sourceGuestToken))
        .toString();
  }
}

class MergeCartDtoBuilder
    implements Builder<MergeCartDto, MergeCartDtoBuilder> {
  _$MergeCartDto? _$v;

  String? _sourceGuestToken;
  String? get sourceGuestToken => _$this._sourceGuestToken;
  set sourceGuestToken(String? sourceGuestToken) =>
      _$this._sourceGuestToken = sourceGuestToken;

  MergeCartDtoBuilder() {
    MergeCartDto._defaults(this);
  }

  MergeCartDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sourceGuestToken = $v.sourceGuestToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MergeCartDto other) {
    _$v = other as _$MergeCartDto;
  }

  @override
  void update(void Function(MergeCartDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MergeCartDto build() => _build();

  _$MergeCartDto _build() {
    final _$result = _$v ??
        _$MergeCartDto._(
          sourceGuestToken: BuiltValueNullFieldError.checkNotNull(
              sourceGuestToken, r'MergeCartDto', 'sourceGuestToken'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
