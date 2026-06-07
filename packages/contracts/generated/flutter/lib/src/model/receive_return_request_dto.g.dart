// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_return_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReceiveReturnRequestDto extends ReceiveReturnRequestDto {
  @override
  final BuiltList<ReceiveReturnRequestItemDto> items;

  factory _$ReceiveReturnRequestDto(
          [void Function(ReceiveReturnRequestDtoBuilder)? updates]) =>
      (ReceiveReturnRequestDtoBuilder()..update(updates))._build();

  _$ReceiveReturnRequestDto._({required this.items}) : super._();
  @override
  ReceiveReturnRequestDto rebuild(
          void Function(ReceiveReturnRequestDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReceiveReturnRequestDtoBuilder toBuilder() =>
      ReceiveReturnRequestDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReceiveReturnRequestDto && items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReceiveReturnRequestDto')
          ..add('items', items))
        .toString();
  }
}

class ReceiveReturnRequestDtoBuilder
    implements
        Builder<ReceiveReturnRequestDto, ReceiveReturnRequestDtoBuilder> {
  _$ReceiveReturnRequestDto? _$v;

  ListBuilder<ReceiveReturnRequestItemDto>? _items;
  ListBuilder<ReceiveReturnRequestItemDto> get items =>
      _$this._items ??= ListBuilder<ReceiveReturnRequestItemDto>();
  set items(ListBuilder<ReceiveReturnRequestItemDto>? items) =>
      _$this._items = items;

  ReceiveReturnRequestDtoBuilder() {
    ReceiveReturnRequestDto._defaults(this);
  }

  ReceiveReturnRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReceiveReturnRequestDto other) {
    _$v = other as _$ReceiveReturnRequestDto;
  }

  @override
  void update(void Function(ReceiveReturnRequestDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReceiveReturnRequestDto build() => _build();

  _$ReceiveReturnRequestDto _build() {
    _$ReceiveReturnRequestDto _$result;
    try {
      _$result = _$v ??
          _$ReceiveReturnRequestDto._(
            items: items.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReceiveReturnRequestDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
