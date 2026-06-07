// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_export_user_brief_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReportExportUserBriefDto extends ReportExportUserBriefDto {
  @override
  final String id;
  @override
  final String displayName;
  @override
  final String userType;

  factory _$ReportExportUserBriefDto(
          [void Function(ReportExportUserBriefDtoBuilder)? updates]) =>
      (ReportExportUserBriefDtoBuilder()..update(updates))._build();

  _$ReportExportUserBriefDto._(
      {required this.id, required this.displayName, required this.userType})
      : super._();
  @override
  ReportExportUserBriefDto rebuild(
          void Function(ReportExportUserBriefDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportExportUserBriefDtoBuilder toBuilder() =>
      ReportExportUserBriefDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportExportUserBriefDto &&
        id == other.id &&
        displayName == other.displayName &&
        userType == other.userType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, userType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportExportUserBriefDto')
          ..add('id', id)
          ..add('displayName', displayName)
          ..add('userType', userType))
        .toString();
  }
}

class ReportExportUserBriefDtoBuilder
    implements
        Builder<ReportExportUserBriefDto, ReportExportUserBriefDtoBuilder> {
  _$ReportExportUserBriefDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _userType;
  String? get userType => _$this._userType;
  set userType(String? userType) => _$this._userType = userType;

  ReportExportUserBriefDtoBuilder() {
    ReportExportUserBriefDto._defaults(this);
  }

  ReportExportUserBriefDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _displayName = $v.displayName;
      _userType = $v.userType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportExportUserBriefDto other) {
    _$v = other as _$ReportExportUserBriefDto;
  }

  @override
  void update(void Function(ReportExportUserBriefDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportExportUserBriefDto build() => _build();

  _$ReportExportUserBriefDto _build() {
    final _$result = _$v ??
        _$ReportExportUserBriefDto._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ReportExportUserBriefDto', 'id'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'ReportExportUserBriefDto', 'displayName'),
          userType: BuiltValueNullFieldError.checkNotNull(
              userType, r'ReportExportUserBriefDto', 'userType'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
