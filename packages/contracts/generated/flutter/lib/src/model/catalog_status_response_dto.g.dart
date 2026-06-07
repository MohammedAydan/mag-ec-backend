// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_status_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CatalogStatusResponseDto extends CatalogStatusResponseDto {
  @override
  final String id;
  @override
  final String status;
  @override
  final String updatedAt;
  @override
  final String? publishedAt;
  @override
  final String? archivedAt;

  factory _$CatalogStatusResponseDto(
          [void Function(CatalogStatusResponseDtoBuilder)? updates]) =>
      (CatalogStatusResponseDtoBuilder()..update(updates))._build();

  _$CatalogStatusResponseDto._(
      {required this.id,
      required this.status,
      required this.updatedAt,
      this.publishedAt,
      this.archivedAt})
      : super._();
  @override
  CatalogStatusResponseDto rebuild(
          void Function(CatalogStatusResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CatalogStatusResponseDtoBuilder toBuilder() =>
      CatalogStatusResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CatalogStatusResponseDto &&
        id == other.id &&
        status == other.status &&
        updatedAt == other.updatedAt &&
        publishedAt == other.publishedAt &&
        archivedAt == other.archivedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, publishedAt.hashCode);
    _$hash = $jc(_$hash, archivedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CatalogStatusResponseDto')
          ..add('id', id)
          ..add('status', status)
          ..add('updatedAt', updatedAt)
          ..add('publishedAt', publishedAt)
          ..add('archivedAt', archivedAt))
        .toString();
  }
}

class CatalogStatusResponseDtoBuilder
    implements
        Builder<CatalogStatusResponseDto, CatalogStatusResponseDtoBuilder> {
  _$CatalogStatusResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  String? _publishedAt;
  String? get publishedAt => _$this._publishedAt;
  set publishedAt(String? publishedAt) => _$this._publishedAt = publishedAt;

  String? _archivedAt;
  String? get archivedAt => _$this._archivedAt;
  set archivedAt(String? archivedAt) => _$this._archivedAt = archivedAt;

  CatalogStatusResponseDtoBuilder() {
    CatalogStatusResponseDto._defaults(this);
  }

  CatalogStatusResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _status = $v.status;
      _updatedAt = $v.updatedAt;
      _publishedAt = $v.publishedAt;
      _archivedAt = $v.archivedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CatalogStatusResponseDto other) {
    _$v = other as _$CatalogStatusResponseDto;
  }

  @override
  void update(void Function(CatalogStatusResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CatalogStatusResponseDto build() => _build();

  _$CatalogStatusResponseDto _build() {
    final _$result = _$v ??
        _$CatalogStatusResponseDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'CatalogStatusResponseDto', 'id'),
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'CatalogStatusResponseDto', 'status'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'CatalogStatusResponseDto', 'updatedAt'),
          publishedAt: publishedAt,
          archivedAt: archivedAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
