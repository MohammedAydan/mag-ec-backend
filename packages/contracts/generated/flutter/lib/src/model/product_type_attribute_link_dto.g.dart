// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_type_attribute_link_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProductTypeAttributeLinkDto extends ProductTypeAttributeLinkDto {
  @override
  final String attributeId;
  @override
  final bool? isRequired;
  @override
  final num? sortOrder;

  factory _$ProductTypeAttributeLinkDto(
          [void Function(ProductTypeAttributeLinkDtoBuilder)? updates]) =>
      (ProductTypeAttributeLinkDtoBuilder()..update(updates))._build();

  _$ProductTypeAttributeLinkDto._(
      {required this.attributeId, this.isRequired, this.sortOrder})
      : super._();
  @override
  ProductTypeAttributeLinkDto rebuild(
          void Function(ProductTypeAttributeLinkDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductTypeAttributeLinkDtoBuilder toBuilder() =>
      ProductTypeAttributeLinkDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductTypeAttributeLinkDto &&
        attributeId == other.attributeId &&
        isRequired == other.isRequired &&
        sortOrder == other.sortOrder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attributeId.hashCode);
    _$hash = $jc(_$hash, isRequired.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductTypeAttributeLinkDto')
          ..add('attributeId', attributeId)
          ..add('isRequired', isRequired)
          ..add('sortOrder', sortOrder))
        .toString();
  }
}

class ProductTypeAttributeLinkDtoBuilder
    implements
        Builder<ProductTypeAttributeLinkDto,
            ProductTypeAttributeLinkDtoBuilder> {
  _$ProductTypeAttributeLinkDto? _$v;

  String? _attributeId;
  String? get attributeId => _$this._attributeId;
  set attributeId(String? attributeId) => _$this._attributeId = attributeId;

  bool? _isRequired;
  bool? get isRequired => _$this._isRequired;
  set isRequired(bool? isRequired) => _$this._isRequired = isRequired;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  ProductTypeAttributeLinkDtoBuilder() {
    ProductTypeAttributeLinkDto._defaults(this);
  }

  ProductTypeAttributeLinkDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attributeId = $v.attributeId;
      _isRequired = $v.isRequired;
      _sortOrder = $v.sortOrder;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductTypeAttributeLinkDto other) {
    _$v = other as _$ProductTypeAttributeLinkDto;
  }

  @override
  void update(void Function(ProductTypeAttributeLinkDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductTypeAttributeLinkDto build() => _build();

  _$ProductTypeAttributeLinkDto _build() {
    final _$result = _$v ??
        _$ProductTypeAttributeLinkDto._(
          attributeId: BuiltValueNullFieldError.checkNotNull(
              attributeId, r'ProductTypeAttributeLinkDto', 'attributeId'),
          isRequired: isRequired,
          sortOrder: sortOrder,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
