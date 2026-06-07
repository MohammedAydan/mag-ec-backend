// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_media_upload_intent_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CreateMediaUploadIntentDtoMediaTypeEnum
    _$createMediaUploadIntentDtoMediaTypeEnum_IMAGE =
    const CreateMediaUploadIntentDtoMediaTypeEnum._('IMAGE');
const CreateMediaUploadIntentDtoMediaTypeEnum
    _$createMediaUploadIntentDtoMediaTypeEnum_VIDEO =
    const CreateMediaUploadIntentDtoMediaTypeEnum._('VIDEO');
const CreateMediaUploadIntentDtoMediaTypeEnum
    _$createMediaUploadIntentDtoMediaTypeEnum_FILE =
    const CreateMediaUploadIntentDtoMediaTypeEnum._('FILE');

CreateMediaUploadIntentDtoMediaTypeEnum
    _$createMediaUploadIntentDtoMediaTypeEnumValueOf(String name) {
  switch (name) {
    case 'IMAGE':
      return _$createMediaUploadIntentDtoMediaTypeEnum_IMAGE;
    case 'VIDEO':
      return _$createMediaUploadIntentDtoMediaTypeEnum_VIDEO;
    case 'FILE':
      return _$createMediaUploadIntentDtoMediaTypeEnum_FILE;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<CreateMediaUploadIntentDtoMediaTypeEnum>
    _$createMediaUploadIntentDtoMediaTypeEnumValues = BuiltSet<
        CreateMediaUploadIntentDtoMediaTypeEnum>(const <CreateMediaUploadIntentDtoMediaTypeEnum>[
  _$createMediaUploadIntentDtoMediaTypeEnum_IMAGE,
  _$createMediaUploadIntentDtoMediaTypeEnum_VIDEO,
  _$createMediaUploadIntentDtoMediaTypeEnum_FILE,
]);

const CreateMediaUploadIntentDtoRoleEnum
    _$createMediaUploadIntentDtoRoleEnum_PRIMARY =
    const CreateMediaUploadIntentDtoRoleEnum._('PRIMARY');
const CreateMediaUploadIntentDtoRoleEnum
    _$createMediaUploadIntentDtoRoleEnum_GALLERY =
    const CreateMediaUploadIntentDtoRoleEnum._('GALLERY');
const CreateMediaUploadIntentDtoRoleEnum
    _$createMediaUploadIntentDtoRoleEnum_SWATCH =
    const CreateMediaUploadIntentDtoRoleEnum._('SWATCH');
const CreateMediaUploadIntentDtoRoleEnum
    _$createMediaUploadIntentDtoRoleEnum_DETAIL =
    const CreateMediaUploadIntentDtoRoleEnum._('DETAIL');

CreateMediaUploadIntentDtoRoleEnum _$createMediaUploadIntentDtoRoleEnumValueOf(
    String name) {
  switch (name) {
    case 'PRIMARY':
      return _$createMediaUploadIntentDtoRoleEnum_PRIMARY;
    case 'GALLERY':
      return _$createMediaUploadIntentDtoRoleEnum_GALLERY;
    case 'SWATCH':
      return _$createMediaUploadIntentDtoRoleEnum_SWATCH;
    case 'DETAIL':
      return _$createMediaUploadIntentDtoRoleEnum_DETAIL;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<CreateMediaUploadIntentDtoRoleEnum>
    _$createMediaUploadIntentDtoRoleEnumValues = BuiltSet<
        CreateMediaUploadIntentDtoRoleEnum>(const <CreateMediaUploadIntentDtoRoleEnum>[
  _$createMediaUploadIntentDtoRoleEnum_PRIMARY,
  _$createMediaUploadIntentDtoRoleEnum_GALLERY,
  _$createMediaUploadIntentDtoRoleEnum_SWATCH,
  _$createMediaUploadIntentDtoRoleEnum_DETAIL,
]);

Serializer<CreateMediaUploadIntentDtoMediaTypeEnum>
    _$createMediaUploadIntentDtoMediaTypeEnumSerializer =
    _$CreateMediaUploadIntentDtoMediaTypeEnumSerializer();
Serializer<CreateMediaUploadIntentDtoRoleEnum>
    _$createMediaUploadIntentDtoRoleEnumSerializer =
    _$CreateMediaUploadIntentDtoRoleEnumSerializer();

class _$CreateMediaUploadIntentDtoMediaTypeEnumSerializer
    implements PrimitiveSerializer<CreateMediaUploadIntentDtoMediaTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'IMAGE': 'IMAGE',
    'VIDEO': 'VIDEO',
    'FILE': 'FILE',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'IMAGE': 'IMAGE',
    'VIDEO': 'VIDEO',
    'FILE': 'FILE',
  };

  @override
  final Iterable<Type> types = const <Type>[
    CreateMediaUploadIntentDtoMediaTypeEnum
  ];
  @override
  final String wireName = 'CreateMediaUploadIntentDtoMediaTypeEnum';

  @override
  Object serialize(Serializers serializers,
          CreateMediaUploadIntentDtoMediaTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CreateMediaUploadIntentDtoMediaTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CreateMediaUploadIntentDtoMediaTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CreateMediaUploadIntentDtoRoleEnumSerializer
    implements PrimitiveSerializer<CreateMediaUploadIntentDtoRoleEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'PRIMARY': 'PRIMARY',
    'GALLERY': 'GALLERY',
    'SWATCH': 'SWATCH',
    'DETAIL': 'DETAIL',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'PRIMARY': 'PRIMARY',
    'GALLERY': 'GALLERY',
    'SWATCH': 'SWATCH',
    'DETAIL': 'DETAIL',
  };

  @override
  final Iterable<Type> types = const <Type>[CreateMediaUploadIntentDtoRoleEnum];
  @override
  final String wireName = 'CreateMediaUploadIntentDtoRoleEnum';

  @override
  Object serialize(
          Serializers serializers, CreateMediaUploadIntentDtoRoleEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CreateMediaUploadIntentDtoRoleEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CreateMediaUploadIntentDtoRoleEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CreateMediaUploadIntentDto extends CreateMediaUploadIntentDto {
  @override
  final CreateMediaUploadIntentDtoMediaTypeEnum mediaType;
  @override
  final CreateMediaUploadIntentDtoRoleEnum role;
  @override
  final String mimeType;
  @override
  final num sizeBytes;
  @override
  final String? variantId;

  factory _$CreateMediaUploadIntentDto(
          [void Function(CreateMediaUploadIntentDtoBuilder)? updates]) =>
      (CreateMediaUploadIntentDtoBuilder()..update(updates))._build();

  _$CreateMediaUploadIntentDto._(
      {required this.mediaType,
      required this.role,
      required this.mimeType,
      required this.sizeBytes,
      this.variantId})
      : super._();
  @override
  CreateMediaUploadIntentDto rebuild(
          void Function(CreateMediaUploadIntentDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateMediaUploadIntentDtoBuilder toBuilder() =>
      CreateMediaUploadIntentDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateMediaUploadIntentDto &&
        mediaType == other.mediaType &&
        role == other.role &&
        mimeType == other.mimeType &&
        sizeBytes == other.sizeBytes &&
        variantId == other.variantId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mediaType.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, mimeType.hashCode);
    _$hash = $jc(_$hash, sizeBytes.hashCode);
    _$hash = $jc(_$hash, variantId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateMediaUploadIntentDto')
          ..add('mediaType', mediaType)
          ..add('role', role)
          ..add('mimeType', mimeType)
          ..add('sizeBytes', sizeBytes)
          ..add('variantId', variantId))
        .toString();
  }
}

class CreateMediaUploadIntentDtoBuilder
    implements
        Builder<CreateMediaUploadIntentDto, CreateMediaUploadIntentDtoBuilder> {
  _$CreateMediaUploadIntentDto? _$v;

  CreateMediaUploadIntentDtoMediaTypeEnum? _mediaType;
  CreateMediaUploadIntentDtoMediaTypeEnum? get mediaType => _$this._mediaType;
  set mediaType(CreateMediaUploadIntentDtoMediaTypeEnum? mediaType) =>
      _$this._mediaType = mediaType;

  CreateMediaUploadIntentDtoRoleEnum? _role;
  CreateMediaUploadIntentDtoRoleEnum? get role => _$this._role;
  set role(CreateMediaUploadIntentDtoRoleEnum? role) => _$this._role = role;

  String? _mimeType;
  String? get mimeType => _$this._mimeType;
  set mimeType(String? mimeType) => _$this._mimeType = mimeType;

  num? _sizeBytes;
  num? get sizeBytes => _$this._sizeBytes;
  set sizeBytes(num? sizeBytes) => _$this._sizeBytes = sizeBytes;

  String? _variantId;
  String? get variantId => _$this._variantId;
  set variantId(String? variantId) => _$this._variantId = variantId;

  CreateMediaUploadIntentDtoBuilder() {
    CreateMediaUploadIntentDto._defaults(this);
  }

  CreateMediaUploadIntentDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mediaType = $v.mediaType;
      _role = $v.role;
      _mimeType = $v.mimeType;
      _sizeBytes = $v.sizeBytes;
      _variantId = $v.variantId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateMediaUploadIntentDto other) {
    _$v = other as _$CreateMediaUploadIntentDto;
  }

  @override
  void update(void Function(CreateMediaUploadIntentDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateMediaUploadIntentDto build() => _build();

  _$CreateMediaUploadIntentDto _build() {
    final _$result = _$v ??
        _$CreateMediaUploadIntentDto._(
          mediaType: BuiltValueNullFieldError.checkNotNull(
              mediaType, r'CreateMediaUploadIntentDto', 'mediaType'),
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'CreateMediaUploadIntentDto', 'role'),
          mimeType: BuiltValueNullFieldError.checkNotNull(
              mimeType, r'CreateMediaUploadIntentDto', 'mimeType'),
          sizeBytes: BuiltValueNullFieldError.checkNotNull(
              sizeBytes, r'CreateMediaUploadIntentDto', 'sizeBytes'),
          variantId: variantId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
