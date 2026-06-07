// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_return_request_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateReturnRequestDto extends CreateReturnRequestDto {
  @override
  final String reason;
  @override
  final BuiltList<CreateReturnRequestItemDto> items;
  @override
  final String? notes;

  factory _$CreateReturnRequestDto(
          [void Function(CreateReturnRequestDtoBuilder)? updates]) =>
      (CreateReturnRequestDtoBuilder()..update(updates))._build();

  _$CreateReturnRequestDto._(
      {required this.reason, required this.items, this.notes})
      : super._();
  @override
  CreateReturnRequestDto rebuild(
          void Function(CreateReturnRequestDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateReturnRequestDtoBuilder toBuilder() =>
      CreateReturnRequestDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateReturnRequestDto &&
        reason == other.reason &&
        items == other.items &&
        notes == other.notes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateReturnRequestDto')
          ..add('reason', reason)
          ..add('items', items)
          ..add('notes', notes))
        .toString();
  }
}

class CreateReturnRequestDtoBuilder
    implements Builder<CreateReturnRequestDto, CreateReturnRequestDtoBuilder> {
  _$CreateReturnRequestDto? _$v;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  ListBuilder<CreateReturnRequestItemDto>? _items;
  ListBuilder<CreateReturnRequestItemDto> get items =>
      _$this._items ??= ListBuilder<CreateReturnRequestItemDto>();
  set items(ListBuilder<CreateReturnRequestItemDto>? items) =>
      _$this._items = items;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  CreateReturnRequestDtoBuilder() {
    CreateReturnRequestDto._defaults(this);
  }

  CreateReturnRequestDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reason = $v.reason;
      _items = $v.items.toBuilder();
      _notes = $v.notes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateReturnRequestDto other) {
    _$v = other as _$CreateReturnRequestDto;
  }

  @override
  void update(void Function(CreateReturnRequestDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateReturnRequestDto build() => _build();

  _$CreateReturnRequestDto _build() {
    _$CreateReturnRequestDto _$result;
    try {
      _$result = _$v ??
          _$CreateReturnRequestDto._(
            reason: BuiltValueNullFieldError.checkNotNull(
                reason, r'CreateReturnRequestDto', 'reason'),
            items: items.build(),
            notes: notes,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CreateReturnRequestDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
