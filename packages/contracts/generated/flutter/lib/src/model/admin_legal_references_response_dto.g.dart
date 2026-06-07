// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_legal_references_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminLegalReferencesResponseDto
    extends AdminLegalReferencesResponseDto {
  @override
  final String? termsPageKey;
  @override
  final String? privacyPageKey;
  @override
  final String? returnsPageKey;
  @override
  final String? shippingPageKey;

  factory _$AdminLegalReferencesResponseDto(
          [void Function(AdminLegalReferencesResponseDtoBuilder)? updates]) =>
      (AdminLegalReferencesResponseDtoBuilder()..update(updates))._build();

  _$AdminLegalReferencesResponseDto._(
      {this.termsPageKey,
      this.privacyPageKey,
      this.returnsPageKey,
      this.shippingPageKey})
      : super._();
  @override
  AdminLegalReferencesResponseDto rebuild(
          void Function(AdminLegalReferencesResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminLegalReferencesResponseDtoBuilder toBuilder() =>
      AdminLegalReferencesResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminLegalReferencesResponseDto &&
        termsPageKey == other.termsPageKey &&
        privacyPageKey == other.privacyPageKey &&
        returnsPageKey == other.returnsPageKey &&
        shippingPageKey == other.shippingPageKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, termsPageKey.hashCode);
    _$hash = $jc(_$hash, privacyPageKey.hashCode);
    _$hash = $jc(_$hash, returnsPageKey.hashCode);
    _$hash = $jc(_$hash, shippingPageKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminLegalReferencesResponseDto')
          ..add('termsPageKey', termsPageKey)
          ..add('privacyPageKey', privacyPageKey)
          ..add('returnsPageKey', returnsPageKey)
          ..add('shippingPageKey', shippingPageKey))
        .toString();
  }
}

class AdminLegalReferencesResponseDtoBuilder
    implements
        Builder<AdminLegalReferencesResponseDto,
            AdminLegalReferencesResponseDtoBuilder> {
  _$AdminLegalReferencesResponseDto? _$v;

  String? _termsPageKey;
  String? get termsPageKey => _$this._termsPageKey;
  set termsPageKey(String? termsPageKey) => _$this._termsPageKey = termsPageKey;

  String? _privacyPageKey;
  String? get privacyPageKey => _$this._privacyPageKey;
  set privacyPageKey(String? privacyPageKey) =>
      _$this._privacyPageKey = privacyPageKey;

  String? _returnsPageKey;
  String? get returnsPageKey => _$this._returnsPageKey;
  set returnsPageKey(String? returnsPageKey) =>
      _$this._returnsPageKey = returnsPageKey;

  String? _shippingPageKey;
  String? get shippingPageKey => _$this._shippingPageKey;
  set shippingPageKey(String? shippingPageKey) =>
      _$this._shippingPageKey = shippingPageKey;

  AdminLegalReferencesResponseDtoBuilder() {
    AdminLegalReferencesResponseDto._defaults(this);
  }

  AdminLegalReferencesResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _termsPageKey = $v.termsPageKey;
      _privacyPageKey = $v.privacyPageKey;
      _returnsPageKey = $v.returnsPageKey;
      _shippingPageKey = $v.shippingPageKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminLegalReferencesResponseDto other) {
    _$v = other as _$AdminLegalReferencesResponseDto;
  }

  @override
  void update(void Function(AdminLegalReferencesResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminLegalReferencesResponseDto build() => _build();

  _$AdminLegalReferencesResponseDto _build() {
    final _$result = _$v ??
        _$AdminLegalReferencesResponseDto._(
          termsPageKey: termsPageKey,
          privacyPageKey: privacyPageKey,
          returnsPageKey: returnsPageKey,
          shippingPageKey: shippingPageKey,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
