// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_product_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TopProductDto extends TopProductDto {
  @override
  final String productId;
  @override
  final String productName;
  @override
  final TopProductSumDto sum;

  factory _$TopProductDto([void Function(TopProductDtoBuilder)? updates]) =>
      (TopProductDtoBuilder()..update(updates))._build();

  _$TopProductDto._(
      {required this.productId, required this.productName, required this.sum})
      : super._();
  @override
  TopProductDto rebuild(void Function(TopProductDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TopProductDtoBuilder toBuilder() => TopProductDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TopProductDto &&
        productId == other.productId &&
        productName == other.productName &&
        sum == other.sum;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, productName.hashCode);
    _$hash = $jc(_$hash, sum.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TopProductDto')
          ..add('productId', productId)
          ..add('productName', productName)
          ..add('sum', sum))
        .toString();
  }
}

class TopProductDtoBuilder
    implements Builder<TopProductDto, TopProductDtoBuilder> {
  _$TopProductDto? _$v;

  String? _productId;
  String? get productId => _$this._productId;
  set productId(String? productId) => _$this._productId = productId;

  String? _productName;
  String? get productName => _$this._productName;
  set productName(String? productName) => _$this._productName = productName;

  TopProductSumDtoBuilder? _sum;
  TopProductSumDtoBuilder get sum => _$this._sum ??= TopProductSumDtoBuilder();
  set sum(TopProductSumDtoBuilder? sum) => _$this._sum = sum;

  TopProductDtoBuilder() {
    TopProductDto._defaults(this);
  }

  TopProductDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _productId = $v.productId;
      _productName = $v.productName;
      _sum = $v.sum.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TopProductDto other) {
    _$v = other as _$TopProductDto;
  }

  @override
  void update(void Function(TopProductDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TopProductDto build() => _build();

  _$TopProductDto _build() {
    _$TopProductDto _$result;
    try {
      _$result = _$v ??
          _$TopProductDto._(
            productId: BuiltValueNullFieldError.checkNotNull(
                productId, r'TopProductDto', 'productId'),
            productName: BuiltValueNullFieldError.checkNotNull(
                productName, r'TopProductDto', 'productName'),
            sum: sum.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sum';
        sum.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'TopProductDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
