// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_catalog_product_variant_option_value_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdminCatalogProductVariantOptionValueDto
    extends AdminCatalogProductVariantOptionValueDto {
  @override
  final String id;
  @override
  final String attributeId;
  @override
  final String optionId;
  @override
  final AdminCatalogAttributeDto? attribute;
  @override
  final AdminCatalogAttributeOptionDto? option;

  factory _$AdminCatalogProductVariantOptionValueDto(
          [void Function(AdminCatalogProductVariantOptionValueDtoBuilder)?
              updates]) =>
      (AdminCatalogProductVariantOptionValueDtoBuilder()..update(updates))
          ._build();

  _$AdminCatalogProductVariantOptionValueDto._(
      {required this.id,
      required this.attributeId,
      required this.optionId,
      this.attribute,
      this.option})
      : super._();
  @override
  AdminCatalogProductVariantOptionValueDto rebuild(
          void Function(AdminCatalogProductVariantOptionValueDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdminCatalogProductVariantOptionValueDtoBuilder toBuilder() =>
      AdminCatalogProductVariantOptionValueDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminCatalogProductVariantOptionValueDto &&
        id == other.id &&
        attributeId == other.attributeId &&
        optionId == other.optionId &&
        attribute == other.attribute &&
        option == other.option;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, attributeId.hashCode);
    _$hash = $jc(_$hash, optionId.hashCode);
    _$hash = $jc(_$hash, attribute.hashCode);
    _$hash = $jc(_$hash, option.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AdminCatalogProductVariantOptionValueDto')
          ..add('id', id)
          ..add('attributeId', attributeId)
          ..add('optionId', optionId)
          ..add('attribute', attribute)
          ..add('option', option))
        .toString();
  }
}

class AdminCatalogProductVariantOptionValueDtoBuilder
    implements
        Builder<AdminCatalogProductVariantOptionValueDto,
            AdminCatalogProductVariantOptionValueDtoBuilder> {
  _$AdminCatalogProductVariantOptionValueDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _attributeId;
  String? get attributeId => _$this._attributeId;
  set attributeId(String? attributeId) => _$this._attributeId = attributeId;

  String? _optionId;
  String? get optionId => _$this._optionId;
  set optionId(String? optionId) => _$this._optionId = optionId;

  AdminCatalogAttributeDtoBuilder? _attribute;
  AdminCatalogAttributeDtoBuilder get attribute =>
      _$this._attribute ??= AdminCatalogAttributeDtoBuilder();
  set attribute(AdminCatalogAttributeDtoBuilder? attribute) =>
      _$this._attribute = attribute;

  AdminCatalogAttributeOptionDtoBuilder? _option;
  AdminCatalogAttributeOptionDtoBuilder get option =>
      _$this._option ??= AdminCatalogAttributeOptionDtoBuilder();
  set option(AdminCatalogAttributeOptionDtoBuilder? option) =>
      _$this._option = option;

  AdminCatalogProductVariantOptionValueDtoBuilder() {
    AdminCatalogProductVariantOptionValueDto._defaults(this);
  }

  AdminCatalogProductVariantOptionValueDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _attributeId = $v.attributeId;
      _optionId = $v.optionId;
      _attribute = $v.attribute?.toBuilder();
      _option = $v.option?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminCatalogProductVariantOptionValueDto other) {
    _$v = other as _$AdminCatalogProductVariantOptionValueDto;
  }

  @override
  void update(
      void Function(AdminCatalogProductVariantOptionValueDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdminCatalogProductVariantOptionValueDto build() => _build();

  _$AdminCatalogProductVariantOptionValueDto _build() {
    _$AdminCatalogProductVariantOptionValueDto _$result;
    try {
      _$result = _$v ??
          _$AdminCatalogProductVariantOptionValueDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'AdminCatalogProductVariantOptionValueDto', 'id'),
            attributeId: BuiltValueNullFieldError.checkNotNull(attributeId,
                r'AdminCatalogProductVariantOptionValueDto', 'attributeId'),
            optionId: BuiltValueNullFieldError.checkNotNull(optionId,
                r'AdminCatalogProductVariantOptionValueDto', 'optionId'),
            attribute: _attribute?.build(),
            option: _option?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'attribute';
        _attribute?.build();
        _$failedField = 'option';
        _option?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AdminCatalogProductVariantOptionValueDto',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
