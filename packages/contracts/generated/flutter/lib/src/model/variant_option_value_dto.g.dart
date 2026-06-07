// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_option_value_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VariantOptionValueDto extends VariantOptionValueDto {
  @override
  final String attributeId;
  @override
  final String optionId;

  factory _$VariantOptionValueDto(
          [void Function(VariantOptionValueDtoBuilder)? updates]) =>
      (VariantOptionValueDtoBuilder()..update(updates))._build();

  _$VariantOptionValueDto._({required this.attributeId, required this.optionId})
      : super._();
  @override
  VariantOptionValueDto rebuild(
          void Function(VariantOptionValueDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VariantOptionValueDtoBuilder toBuilder() =>
      VariantOptionValueDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VariantOptionValueDto &&
        attributeId == other.attributeId &&
        optionId == other.optionId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attributeId.hashCode);
    _$hash = $jc(_$hash, optionId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VariantOptionValueDto')
          ..add('attributeId', attributeId)
          ..add('optionId', optionId))
        .toString();
  }
}

class VariantOptionValueDtoBuilder
    implements Builder<VariantOptionValueDto, VariantOptionValueDtoBuilder> {
  _$VariantOptionValueDto? _$v;

  String? _attributeId;
  String? get attributeId => _$this._attributeId;
  set attributeId(String? attributeId) => _$this._attributeId = attributeId;

  String? _optionId;
  String? get optionId => _$this._optionId;
  set optionId(String? optionId) => _$this._optionId = optionId;

  VariantOptionValueDtoBuilder() {
    VariantOptionValueDto._defaults(this);
  }

  VariantOptionValueDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attributeId = $v.attributeId;
      _optionId = $v.optionId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VariantOptionValueDto other) {
    _$v = other as _$VariantOptionValueDto;
  }

  @override
  void update(void Function(VariantOptionValueDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VariantOptionValueDto build() => _build();

  _$VariantOptionValueDto _build() {
    final _$result = _$v ??
        _$VariantOptionValueDto._(
          attributeId: BuiltValueNullFieldError.checkNotNull(
              attributeId, r'VariantOptionValueDto', 'attributeId'),
          optionId: BuiltValueNullFieldError.checkNotNull(
              optionId, r'VariantOptionValueDto', 'optionId'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
