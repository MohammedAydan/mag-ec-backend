// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_catalog_product_type_attribute_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminCatalogProductTypeAttributeDto
    extends AdminCatalogProductTypeAttributeDto {
  @override
  final String id;
  @override
  final String attributeId;
  @override
  final bool isRequired;
  @override
  final num sortOrder;

  factory _$AdminCatalogProductTypeAttributeDto(
          [void Function(AdminCatalogProductTypeAttributeDtoBuilder)?
              updates]) =>
      (AdminCatalogProductTypeAttributeDtoBuilder()..update(updates))._build();

  _$AdminCatalogProductTypeAttributeDto._(
      {required this.id,
      required this.attributeId,
      required this.isRequired,
      required this.sortOrder})
      : super._();
  @override
  AdminCatalogProductTypeAttributeDto rebuild(
          void Function(AdminCatalogProductTypeAttributeDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminCatalogProductTypeAttributeDtoBuilder toBuilder() =>
      AdminCatalogProductTypeAttributeDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminCatalogProductTypeAttributeDto &&
        id == other.id &&
        attributeId == other.attributeId &&
        isRequired == other.isRequired &&
        sortOrder == other.sortOrder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, attributeId.hashCode);
    _$hash = $jc(_$hash, isRequired.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdminCatalogProductTypeAttributeDto')
          ..add('id', id)
          ..add('attributeId', attributeId)
          ..add('isRequired', isRequired)
          ..add('sortOrder', sortOrder))
        .toString();
  }
}

class AdminCatalogProductTypeAttributeDtoBuilder
    implements
        Builder<AdminCatalogProductTypeAttributeDto,
            AdminCatalogProductTypeAttributeDtoBuilder> {
  _$AdminCatalogProductTypeAttributeDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _attributeId;
  String? get attributeId => _$this._attributeId;
  set attributeId(String? attributeId) => _$this._attributeId = attributeId;

  bool? _isRequired;
  bool? get isRequired => _$this._isRequired;
  set isRequired(bool? isRequired) => _$this._isRequired = isRequired;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  AdminCatalogProductTypeAttributeDtoBuilder() {
    AdminCatalogProductTypeAttributeDto._defaults(this);
  }

  AdminCatalogProductTypeAttributeDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _attributeId = $v.attributeId;
      _isRequired = $v.isRequired;
      _sortOrder = $v.sortOrder;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminCatalogProductTypeAttributeDto other) {
    _$v = other as _$AdminCatalogProductTypeAttributeDto;
  }

  @override
  void update(
      void Function(AdminCatalogProductTypeAttributeDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminCatalogProductTypeAttributeDto build() => _build();

  _$AdminCatalogProductTypeAttributeDto _build() {
    final _$result = _$v ??
        _$AdminCatalogProductTypeAttributeDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'AdminCatalogProductTypeAttributeDto', 'id'),
          attributeId: BuiltValueNullFieldError.checkNotNull(attributeId,
              r'AdminCatalogProductTypeAttributeDto', 'attributeId'),
          isRequired: BuiltValueNullFieldError.checkNotNull(
              isRequired, r'AdminCatalogProductTypeAttributeDto', 'isRequired'),
          sortOrder: BuiltValueNullFieldError.checkNotNull(
              sortOrder, r'AdminCatalogProductTypeAttributeDto', 'sortOrder'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
