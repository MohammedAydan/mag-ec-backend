// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_variant_option_summary_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CatalogVariantOptionSummaryDto extends CatalogVariantOptionSummaryDto {
  @override
  final String attributeKey;
  @override
  final String optionKey;
  @override
  final String? attributeName;
  @override
  final String? optionLabel;
  @override
  final String? colorHex;

  factory _$CatalogVariantOptionSummaryDto(
          [void Function(CatalogVariantOptionSummaryDtoBuilder)? updates]) =>
      (CatalogVariantOptionSummaryDtoBuilder()..update(updates))._build();

  _$CatalogVariantOptionSummaryDto._(
      {required this.attributeKey,
      required this.optionKey,
      this.attributeName,
      this.optionLabel,
      this.colorHex})
      : super._();
  @override
  CatalogVariantOptionSummaryDto rebuild(
          void Function(CatalogVariantOptionSummaryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CatalogVariantOptionSummaryDtoBuilder toBuilder() =>
      CatalogVariantOptionSummaryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CatalogVariantOptionSummaryDto &&
        attributeKey == other.attributeKey &&
        optionKey == other.optionKey &&
        attributeName == other.attributeName &&
        optionLabel == other.optionLabel &&
        colorHex == other.colorHex;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attributeKey.hashCode);
    _$hash = $jc(_$hash, optionKey.hashCode);
    _$hash = $jc(_$hash, attributeName.hashCode);
    _$hash = $jc(_$hash, optionLabel.hashCode);
    _$hash = $jc(_$hash, colorHex.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CatalogVariantOptionSummaryDto')
          ..add('attributeKey', attributeKey)
          ..add('optionKey', optionKey)
          ..add('attributeName', attributeName)
          ..add('optionLabel', optionLabel)
          ..add('colorHex', colorHex))
        .toString();
  }
}

class CatalogVariantOptionSummaryDtoBuilder
    implements
        Builder<CatalogVariantOptionSummaryDto,
            CatalogVariantOptionSummaryDtoBuilder> {
  _$CatalogVariantOptionSummaryDto? _$v;

  String? _attributeKey;
  String? get attributeKey => _$this._attributeKey;
  set attributeKey(String? attributeKey) => _$this._attributeKey = attributeKey;

  String? _optionKey;
  String? get optionKey => _$this._optionKey;
  set optionKey(String? optionKey) => _$this._optionKey = optionKey;

  String? _attributeName;
  String? get attributeName => _$this._attributeName;
  set attributeName(String? attributeName) =>
      _$this._attributeName = attributeName;

  String? _optionLabel;
  String? get optionLabel => _$this._optionLabel;
  set optionLabel(String? optionLabel) => _$this._optionLabel = optionLabel;

  String? _colorHex;
  String? get colorHex => _$this._colorHex;
  set colorHex(String? colorHex) => _$this._colorHex = colorHex;

  CatalogVariantOptionSummaryDtoBuilder() {
    CatalogVariantOptionSummaryDto._defaults(this);
  }

  CatalogVariantOptionSummaryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attributeKey = $v.attributeKey;
      _optionKey = $v.optionKey;
      _attributeName = $v.attributeName;
      _optionLabel = $v.optionLabel;
      _colorHex = $v.colorHex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CatalogVariantOptionSummaryDto other) {
    _$v = other as _$CatalogVariantOptionSummaryDto;
  }

  @override
  void update(void Function(CatalogVariantOptionSummaryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CatalogVariantOptionSummaryDto build() => _build();

  _$CatalogVariantOptionSummaryDto _build() {
    final _$result = _$v ??
        _$CatalogVariantOptionSummaryDto._(
          attributeKey: BuiltValueNullFieldError.checkNotNull(
              attributeKey, r'CatalogVariantOptionSummaryDto', 'attributeKey'),
          optionKey: BuiltValueNullFieldError.checkNotNull(
              optionKey, r'CatalogVariantOptionSummaryDto', 'optionKey'),
          attributeName: attributeName,
          optionLabel: optionLabel,
          colorHex: colorHex,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
