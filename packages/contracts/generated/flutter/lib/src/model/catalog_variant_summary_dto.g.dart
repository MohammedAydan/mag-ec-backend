// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_variant_summary_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CatalogVariantSummaryDto extends CatalogVariantSummaryDto {
  @override
  final String id;
  @override
  final String sku;
  @override
  final bool isDefault;
  @override
  final BuiltList<CatalogVariantOptionSummaryDto> options;
  @override
  final String? name;
  @override
  final CatalogVariantPriceDto? price;

  factory _$CatalogVariantSummaryDto(
          [void Function(CatalogVariantSummaryDtoBuilder)? updates]) =>
      (CatalogVariantSummaryDtoBuilder()..update(updates))._build();

  _$CatalogVariantSummaryDto._(
      {required this.id,
      required this.sku,
      required this.isDefault,
      required this.options,
      this.name,
      this.price})
      : super._();
  @override
  CatalogVariantSummaryDto rebuild(
          void Function(CatalogVariantSummaryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CatalogVariantSummaryDtoBuilder toBuilder() =>
      CatalogVariantSummaryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CatalogVariantSummaryDto &&
        id == other.id &&
        sku == other.sku &&
        isDefault == other.isDefault &&
        options == other.options &&
        name == other.name &&
        price == other.price;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, isDefault.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CatalogVariantSummaryDto')
          ..add('id', id)
          ..add('sku', sku)
          ..add('isDefault', isDefault)
          ..add('options', options)
          ..add('name', name)
          ..add('price', price))
        .toString();
  }
}

class CatalogVariantSummaryDtoBuilder
    implements
        Builder<CatalogVariantSummaryDto, CatalogVariantSummaryDtoBuilder> {
  _$CatalogVariantSummaryDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  bool? _isDefault;
  bool? get isDefault => _$this._isDefault;
  set isDefault(bool? isDefault) => _$this._isDefault = isDefault;

  ListBuilder<CatalogVariantOptionSummaryDto>? _options;
  ListBuilder<CatalogVariantOptionSummaryDto> get options =>
      _$this._options ??= ListBuilder<CatalogVariantOptionSummaryDto>();
  set options(ListBuilder<CatalogVariantOptionSummaryDto>? options) =>
      _$this._options = options;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  CatalogVariantPriceDtoBuilder? _price;
  CatalogVariantPriceDtoBuilder get price =>
      _$this._price ??= CatalogVariantPriceDtoBuilder();
  set price(CatalogVariantPriceDtoBuilder? price) => _$this._price = price;

  CatalogVariantSummaryDtoBuilder() {
    CatalogVariantSummaryDto._defaults(this);
  }

  CatalogVariantSummaryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _sku = $v.sku;
      _isDefault = $v.isDefault;
      _options = $v.options.toBuilder();
      _name = $v.name;
      _price = $v.price?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CatalogVariantSummaryDto other) {
    _$v = other as _$CatalogVariantSummaryDto;
  }

  @override
  void update(void Function(CatalogVariantSummaryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CatalogVariantSummaryDto build() => _build();

  _$CatalogVariantSummaryDto _build() {
    _$CatalogVariantSummaryDto _$result;
    try {
      _$result = _$v ??
          _$CatalogVariantSummaryDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CatalogVariantSummaryDto', 'id'),
            sku: BuiltValueNullFieldError.checkNotNull(
                sku, r'CatalogVariantSummaryDto', 'sku'),
            isDefault: BuiltValueNullFieldError.checkNotNull(
                isDefault, r'CatalogVariantSummaryDto', 'isDefault'),
            options: options.build(),
            name: name,
            price: _price?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        options.build();

        _$failedField = 'price';
        _price?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CatalogVariantSummaryDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
