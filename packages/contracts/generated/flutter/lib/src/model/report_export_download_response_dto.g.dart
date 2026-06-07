// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_export_download_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReportExportDownloadResponseDto
    extends ReportExportDownloadResponseDto {
  @override
  final String exportId;
  @override
  final String downloadUrl;
  @override
  final num expiresInSeconds;

  factory _$ReportExportDownloadResponseDto(
          [void Function(ReportExportDownloadResponseDtoBuilder)? updates]) =>
      (ReportExportDownloadResponseDtoBuilder()..update(updates))._build();

  _$ReportExportDownloadResponseDto._(
      {required this.exportId,
      required this.downloadUrl,
      required this.expiresInSeconds})
      : super._();
  @override
  ReportExportDownloadResponseDto rebuild(
          void Function(ReportExportDownloadResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportExportDownloadResponseDtoBuilder toBuilder() =>
      ReportExportDownloadResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportExportDownloadResponseDto &&
        exportId == other.exportId &&
        downloadUrl == other.downloadUrl &&
        expiresInSeconds == other.expiresInSeconds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, exportId.hashCode);
    _$hash = $jc(_$hash, downloadUrl.hashCode);
    _$hash = $jc(_$hash, expiresInSeconds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportExportDownloadResponseDto')
          ..add('exportId', exportId)
          ..add('downloadUrl', downloadUrl)
          ..add('expiresInSeconds', expiresInSeconds))
        .toString();
  }
}

class ReportExportDownloadResponseDtoBuilder
    implements
        Builder<ReportExportDownloadResponseDto,
            ReportExportDownloadResponseDtoBuilder> {
  _$ReportExportDownloadResponseDto? _$v;

  String? _exportId;
  String? get exportId => _$this._exportId;
  set exportId(String? exportId) => _$this._exportId = exportId;

  String? _downloadUrl;
  String? get downloadUrl => _$this._downloadUrl;
  set downloadUrl(String? downloadUrl) => _$this._downloadUrl = downloadUrl;

  num? _expiresInSeconds;
  num? get expiresInSeconds => _$this._expiresInSeconds;
  set expiresInSeconds(num? expiresInSeconds) =>
      _$this._expiresInSeconds = expiresInSeconds;

  ReportExportDownloadResponseDtoBuilder() {
    ReportExportDownloadResponseDto._defaults(this);
  }

  ReportExportDownloadResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _exportId = $v.exportId;
      _downloadUrl = $v.downloadUrl;
      _expiresInSeconds = $v.expiresInSeconds;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportExportDownloadResponseDto other) {
    _$v = other as _$ReportExportDownloadResponseDto;
  }

  @override
  void update(void Function(ReportExportDownloadResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportExportDownloadResponseDto build() => _build();

  _$ReportExportDownloadResponseDto _build() {
    final _$result = _$v ??
        _$ReportExportDownloadResponseDto._(
          exportId: BuiltValueNullFieldError.checkNotNull(
              exportId, r'ReportExportDownloadResponseDto', 'exportId'),
          downloadUrl: BuiltValueNullFieldError.checkNotNull(
              downloadUrl, r'ReportExportDownloadResponseDto', 'downloadUrl'),
          expiresInSeconds: BuiltValueNullFieldError.checkNotNull(
              expiresInSeconds,
              r'ReportExportDownloadResponseDto',
              'expiresInSeconds'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
