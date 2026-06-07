// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_references_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LegalReferencesResponseDto extends LegalReferencesResponseDto {
  @override
  final PublicLegalReferenceDto? terms;
  @override
  final PublicLegalReferenceDto? privacy;
  @override
  final PublicLegalReferenceDto? returns;
  @override
  final PublicLegalReferenceDto? shipping;

  factory _$LegalReferencesResponseDto(
          [void Function(LegalReferencesResponseDtoBuilder)? updates]) =>
      (LegalReferencesResponseDtoBuilder()..update(updates))._build();

  _$LegalReferencesResponseDto._(
      {this.terms, this.privacy, this.returns, this.shipping})
      : super._();
  @override
  LegalReferencesResponseDto rebuild(
          void Function(LegalReferencesResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LegalReferencesResponseDtoBuilder toBuilder() =>
      LegalReferencesResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LegalReferencesResponseDto &&
        terms == other.terms &&
        privacy == other.privacy &&
        returns == other.returns &&
        shipping == other.shipping;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, terms.hashCode);
    _$hash = $jc(_$hash, privacy.hashCode);
    _$hash = $jc(_$hash, returns.hashCode);
    _$hash = $jc(_$hash, shipping.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LegalReferencesResponseDto')
          ..add('terms', terms)
          ..add('privacy', privacy)
          ..add('returns', returns)
          ..add('shipping', shipping))
        .toString();
  }
}

class LegalReferencesResponseDtoBuilder
    implements
        Builder<LegalReferencesResponseDto, LegalReferencesResponseDtoBuilder> {
  _$LegalReferencesResponseDto? _$v;

  PublicLegalReferenceDtoBuilder? _terms;
  PublicLegalReferenceDtoBuilder get terms =>
      _$this._terms ??= PublicLegalReferenceDtoBuilder();
  set terms(PublicLegalReferenceDtoBuilder? terms) => _$this._terms = terms;

  PublicLegalReferenceDtoBuilder? _privacy;
  PublicLegalReferenceDtoBuilder get privacy =>
      _$this._privacy ??= PublicLegalReferenceDtoBuilder();
  set privacy(PublicLegalReferenceDtoBuilder? privacy) =>
      _$this._privacy = privacy;

  PublicLegalReferenceDtoBuilder? _returns;
  PublicLegalReferenceDtoBuilder get returns =>
      _$this._returns ??= PublicLegalReferenceDtoBuilder();
  set returns(PublicLegalReferenceDtoBuilder? returns) =>
      _$this._returns = returns;

  PublicLegalReferenceDtoBuilder? _shipping;
  PublicLegalReferenceDtoBuilder get shipping =>
      _$this._shipping ??= PublicLegalReferenceDtoBuilder();
  set shipping(PublicLegalReferenceDtoBuilder? shipping) =>
      _$this._shipping = shipping;

  LegalReferencesResponseDtoBuilder() {
    LegalReferencesResponseDto._defaults(this);
  }

  LegalReferencesResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _terms = $v.terms?.toBuilder();
      _privacy = $v.privacy?.toBuilder();
      _returns = $v.returns?.toBuilder();
      _shipping = $v.shipping?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LegalReferencesResponseDto other) {
    _$v = other as _$LegalReferencesResponseDto;
  }

  @override
  void update(void Function(LegalReferencesResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LegalReferencesResponseDto build() => _build();

  _$LegalReferencesResponseDto _build() {
    _$LegalReferencesResponseDto _$result;
    try {
      _$result = _$v ??
          _$LegalReferencesResponseDto._(
            terms: _terms?.build(),
            privacy: _privacy?.build(),
            returns: _returns?.build(),
            shipping: _shipping?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'terms';
        _terms?.build();
        _$failedField = 'privacy';
        _privacy?.build();
        _$failedField = 'returns';
        _returns?.build();
        _$failedField = 'shipping';
        _shipping?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'LegalReferencesResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
