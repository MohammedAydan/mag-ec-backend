// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_export_response_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReportExportResponseDto extends ReportExportResponseDto {
  @override
  final String id;
  @override
  final String reportType;
  @override
  final JsonObject parametersJson;
  @override
  final String status;
  @override
  final String requestedByUserId;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final ReportExportUserBriefDto requestedBy;
  @override
  final String? resultObjectKey;
  @override
  final String? errorMessage;
  @override
  final String? startedAt;
  @override
  final String? completedAt;
  @override
  final String? failedAt;

  factory _$ReportExportResponseDto(
          [void Function(ReportExportResponseDtoBuilder)? updates]) =>
      (ReportExportResponseDtoBuilder()..update(updates))._build();

  _$ReportExportResponseDto._(
      {required this.id,
      required this.reportType,
      required this.parametersJson,
      required this.status,
      required this.requestedByUserId,
      required this.createdAt,
      required this.updatedAt,
      required this.requestedBy,
      this.resultObjectKey,
      this.errorMessage,
      this.startedAt,
      this.completedAt,
      this.failedAt})
      : super._();
  @override
  ReportExportResponseDto rebuild(
          void Function(ReportExportResponseDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportExportResponseDtoBuilder toBuilder() =>
      ReportExportResponseDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportExportResponseDto &&
        id == other.id &&
        reportType == other.reportType &&
        parametersJson == other.parametersJson &&
        status == other.status &&
        requestedByUserId == other.requestedByUserId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        requestedBy == other.requestedBy &&
        resultObjectKey == other.resultObjectKey &&
        errorMessage == other.errorMessage &&
        startedAt == other.startedAt &&
        completedAt == other.completedAt &&
        failedAt == other.failedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, reportType.hashCode);
    _$hash = $jc(_$hash, parametersJson.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, requestedByUserId.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, requestedBy.hashCode);
    _$hash = $jc(_$hash, resultObjectKey.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jc(_$hash, startedAt.hashCode);
    _$hash = $jc(_$hash, completedAt.hashCode);
    _$hash = $jc(_$hash, failedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportExportResponseDto')
          ..add('id', id)
          ..add('reportType', reportType)
          ..add('parametersJson', parametersJson)
          ..add('status', status)
          ..add('requestedByUserId', requestedByUserId)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('requestedBy', requestedBy)
          ..add('resultObjectKey', resultObjectKey)
          ..add('errorMessage', errorMessage)
          ..add('startedAt', startedAt)
          ..add('completedAt', completedAt)
          ..add('failedAt', failedAt))
        .toString();
  }
}

class ReportExportResponseDtoBuilder
    implements
        Builder<ReportExportResponseDto, ReportExportResponseDtoBuilder> {
  _$ReportExportResponseDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _reportType;
  String? get reportType => _$this._reportType;
  set reportType(String? reportType) => _$this._reportType = reportType;

  JsonObject? _parametersJson;
  JsonObject? get parametersJson => _$this._parametersJson;
  set parametersJson(JsonObject? parametersJson) =>
      _$this._parametersJson = parametersJson;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _requestedByUserId;
  String? get requestedByUserId => _$this._requestedByUserId;
  set requestedByUserId(String? requestedByUserId) =>
      _$this._requestedByUserId = requestedByUserId;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  ReportExportUserBriefDtoBuilder? _requestedBy;
  ReportExportUserBriefDtoBuilder get requestedBy =>
      _$this._requestedBy ??= ReportExportUserBriefDtoBuilder();
  set requestedBy(ReportExportUserBriefDtoBuilder? requestedBy) =>
      _$this._requestedBy = requestedBy;

  String? _resultObjectKey;
  String? get resultObjectKey => _$this._resultObjectKey;
  set resultObjectKey(String? resultObjectKey) =>
      _$this._resultObjectKey = resultObjectKey;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  String? _startedAt;
  String? get startedAt => _$this._startedAt;
  set startedAt(String? startedAt) => _$this._startedAt = startedAt;

  String? _completedAt;
  String? get completedAt => _$this._completedAt;
  set completedAt(String? completedAt) => _$this._completedAt = completedAt;

  String? _failedAt;
  String? get failedAt => _$this._failedAt;
  set failedAt(String? failedAt) => _$this._failedAt = failedAt;

  ReportExportResponseDtoBuilder() {
    ReportExportResponseDto._defaults(this);
  }

  ReportExportResponseDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _reportType = $v.reportType;
      _parametersJson = $v.parametersJson;
      _status = $v.status;
      _requestedByUserId = $v.requestedByUserId;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _requestedBy = $v.requestedBy.toBuilder();
      _resultObjectKey = $v.resultObjectKey;
      _errorMessage = $v.errorMessage;
      _startedAt = $v.startedAt;
      _completedAt = $v.completedAt;
      _failedAt = $v.failedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportExportResponseDto other) {
    _$v = other as _$ReportExportResponseDto;
  }

  @override
  void update(void Function(ReportExportResponseDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportExportResponseDto build() => _build();

  _$ReportExportResponseDto _build() {
    _$ReportExportResponseDto _$result;
    try {
      _$result = _$v ??
          _$ReportExportResponseDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ReportExportResponseDto', 'id'),
            reportType: BuiltValueNullFieldError.checkNotNull(
                reportType, r'ReportExportResponseDto', 'reportType'),
            parametersJson: BuiltValueNullFieldError.checkNotNull(
                parametersJson, r'ReportExportResponseDto', 'parametersJson'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'ReportExportResponseDto', 'status'),
            requestedByUserId: BuiltValueNullFieldError.checkNotNull(
                requestedByUserId,
                r'ReportExportResponseDto',
                'requestedByUserId'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'ReportExportResponseDto', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, r'ReportExportResponseDto', 'updatedAt'),
            requestedBy: requestedBy.build(),
            resultObjectKey: resultObjectKey,
            errorMessage: errorMessage,
            startedAt: startedAt,
            completedAt: completedAt,
            failedAt: failedAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'requestedBy';
        requestedBy.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReportExportResponseDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
