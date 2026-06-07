// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_level_variant_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StockLevelVariantDto extends StockLevelVariantDto {
  @override
  final String id;
  @override
  final String sku;
  @override
  final bool isDefault;

  factory _$StockLevelVariantDto(
          [void Function(StockLevelVariantDtoBuilder)? updates]) =>
      (StockLevelVariantDtoBuilder()..update(updates))._build();

  _$StockLevelVariantDto._(
      {required this.id, required this.sku, required this.isDefault})
      : super._();
  @override
  StockLevelVariantDto rebuild(
          void Function(StockLevelVariantDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StockLevelVariantDtoBuilder toBuilder() =>
      StockLevelVariantDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockLevelVariantDto &&
        id == other.id &&
        sku == other.sku &&
        isDefault == other.isDefault;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, sku.hashCode);
    _$hash = $jc(_$hash, isDefault.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StockLevelVariantDto')
          ..add('id', id)
          ..add('sku', sku)
          ..add('isDefault', isDefault))
        .toString();
  }
}

class StockLevelVariantDtoBuilder
    implements Builder<StockLevelVariantDto, StockLevelVariantDtoBuilder> {
  _$StockLevelVariantDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _sku;
  String? get sku => _$this._sku;
  set sku(String? sku) => _$this._sku = sku;

  bool? _isDefault;
  bool? get isDefault => _$this._isDefault;
  set isDefault(bool? isDefault) => _$this._isDefault = isDefault;

  StockLevelVariantDtoBuilder() {
    StockLevelVariantDto._defaults(this);
  }

  StockLevelVariantDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _sku = $v.sku;
      _isDefault = $v.isDefault;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StockLevelVariantDto other) {
    _$v = other as _$StockLevelVariantDto;
  }

  @override
  void update(void Function(StockLevelVariantDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StockLevelVariantDto build() => _build();

  _$StockLevelVariantDto _build() {
    final _$result = _$v ??
        _$StockLevelVariantDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'StockLevelVariantDto', 'id'),
          sku: BuiltValueNullFieldError.checkNotNull(
              sku, r'StockLevelVariantDto', 'sku'),
          isDefault: BuiltValueNullFieldError.checkNotNull(
              isDefault, r'StockLevelVariantDto', 'isDefault'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
