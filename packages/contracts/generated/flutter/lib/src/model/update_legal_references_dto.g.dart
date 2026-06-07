// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_legal_references_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateLegalReferencesDto extends UpdateLegalReferencesDto {
  @override
  final JsonObject? termsPageKey;
  @override
  final JsonObject? privacyPageKey;
  @override
  final JsonObject? returnsPageKey;
  @override
  final JsonObject? shippingPageKey;

  factory _$UpdateLegalReferencesDto(
          [void Function(UpdateLegalReferencesDtoBuilder)? updates]) =>
      (UpdateLegalReferencesDtoBuilder()..update(updates))._build();

  _$UpdateLegalReferencesDto._(
      {this.termsPageKey,
      this.privacyPageKey,
      this.returnsPageKey,
      this.shippingPageKey})
      : super._();
  @override
  UpdateLegalReferencesDto rebuild(
          void Function(UpdateLegalReferencesDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateLegalReferencesDtoBuilder toBuilder() =>
      UpdateLegalReferencesDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateLegalReferencesDto &&
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
    return (newBuiltValueToStringHelper(r'UpdateLegalReferencesDto')
          ..add('termsPageKey', termsPageKey)
          ..add('privacyPageKey', privacyPageKey)
          ..add('returnsPageKey', returnsPageKey)
          ..add('shippingPageKey', shippingPageKey))
        .toString();
  }
}

class UpdateLegalReferencesDtoBuilder
    implements
        Builder<UpdateLegalReferencesDto, UpdateLegalReferencesDtoBuilder> {
  _$UpdateLegalReferencesDto? _$v;

  JsonObject? _termsPageKey;
  JsonObject? get termsPageKey => _$this._termsPageKey;
  set termsPageKey(JsonObject? termsPageKey) =>
      _$this._termsPageKey = termsPageKey;

  JsonObject? _privacyPageKey;
  JsonObject? get privacyPageKey => _$this._privacyPageKey;
  set privacyPageKey(JsonObject? privacyPageKey) =>
      _$this._privacyPageKey = privacyPageKey;

  JsonObject? _returnsPageKey;
  JsonObject? get returnsPageKey => _$this._returnsPageKey;
  set returnsPageKey(JsonObject? returnsPageKey) =>
      _$this._returnsPageKey = returnsPageKey;

  JsonObject? _shippingPageKey;
  JsonObject? get shippingPageKey => _$this._shippingPageKey;
  set shippingPageKey(JsonObject? shippingPageKey) =>
      _$this._shippingPageKey = shippingPageKey;

  UpdateLegalReferencesDtoBuilder() {
    UpdateLegalReferencesDto._defaults(this);
  }

  UpdateLegalReferencesDtoBuilder get _$this {
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
  void replace(UpdateLegalReferencesDto other) {
    _$v = other as _$UpdateLegalReferencesDto;
  }

  @override
  void update(void Function(UpdateLegalReferencesDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateLegalReferencesDto build() => _build();

  _$UpdateLegalReferencesDto _build() {
    final _$result = _$v ??
        _$UpdateLegalReferencesDto._(
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
