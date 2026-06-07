// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_attribute_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CreateAttributeDtoInputTypeEnum _$createAttributeDtoInputTypeEnum_TEXT =
    const CreateAttributeDtoInputTypeEnum._('TEXT');
const CreateAttributeDtoInputTypeEnum _$createAttributeDtoInputTypeEnum_SELECT =
    const CreateAttributeDtoInputTypeEnum._('SELECT');
const CreateAttributeDtoInputTypeEnum
    _$createAttributeDtoInputTypeEnum_MULTI_SELECT =
    const CreateAttributeDtoInputTypeEnum._('MULTI_SELECT');
const CreateAttributeDtoInputTypeEnum _$createAttributeDtoInputTypeEnum_COLOR =
    const CreateAttributeDtoInputTypeEnum._('COLOR');
const CreateAttributeDtoInputTypeEnum _$createAttributeDtoInputTypeEnum_SIZE =
    const CreateAttributeDtoInputTypeEnum._('SIZE');
const CreateAttributeDtoInputTypeEnum
    _$createAttributeDtoInputTypeEnum_BOOLEAN =
    const CreateAttributeDtoInputTypeEnum._('BOOLEAN');
const CreateAttributeDtoInputTypeEnum _$createAttributeDtoInputTypeEnum_NUMBER =
    const CreateAttributeDtoInputTypeEnum._('NUMBER');

CreateAttributeDtoInputTypeEnum _$createAttributeDtoInputTypeEnumValueOf(
    String name) {
  switch (name) {
    case 'TEXT':
      return _$createAttributeDtoInputTypeEnum_TEXT;
    case 'SELECT':
      return _$createAttributeDtoInputTypeEnum_SELECT;
    case 'MULTI_SELECT':
      return _$createAttributeDtoInputTypeEnum_MULTI_SELECT;
    case 'COLOR':
      return _$createAttributeDtoInputTypeEnum_COLOR;
    case 'SIZE':
      return _$createAttributeDtoInputTypeEnum_SIZE;
    case 'BOOLEAN':
      return _$createAttributeDtoInputTypeEnum_BOOLEAN;
    case 'NUMBER':
      return _$createAttributeDtoInputTypeEnum_NUMBER;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<CreateAttributeDtoInputTypeEnum>
    _$createAttributeDtoInputTypeEnumValues = BuiltSet<
        CreateAttributeDtoInputTypeEnum>(const <CreateAttributeDtoInputTypeEnum>[
  _$createAttributeDtoInputTypeEnum_TEXT,
  _$createAttributeDtoInputTypeEnum_SELECT,
  _$createAttributeDtoInputTypeEnum_MULTI_SELECT,
  _$createAttributeDtoInputTypeEnum_COLOR,
  _$createAttributeDtoInputTypeEnum_SIZE,
  _$createAttributeDtoInputTypeEnum_BOOLEAN,
  _$createAttributeDtoInputTypeEnum_NUMBER,
]);

Serializer<CreateAttributeDtoInputTypeEnum>
    _$createAttributeDtoInputTypeEnumSerializer =
    _$CreateAttributeDtoInputTypeEnumSerializer();

class _$CreateAttributeDtoInputTypeEnumSerializer
    implements PrimitiveSerializer<CreateAttributeDtoInputTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'TEXT': 'TEXT',
    'SELECT': 'SELECT',
    'MULTI_SELECT': 'MULTI_SELECT',
    'COLOR': 'COLOR',
    'SIZE': 'SIZE',
    'BOOLEAN': 'BOOLEAN',
    'NUMBER': 'NUMBER',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'TEXT': 'TEXT',
    'SELECT': 'SELECT',
    'MULTI_SELECT': 'MULTI_SELECT',
    'COLOR': 'COLOR',
    'SIZE': 'SIZE',
    'BOOLEAN': 'BOOLEAN',
    'NUMBER': 'NUMBER',
  };

  @override
  final Iterable<Type> types = const <Type>[CreateAttributeDtoInputTypeEnum];
  @override
  final String wireName = 'CreateAttributeDtoInputTypeEnum';

  @override
  Object serialize(
          Serializers serializers, CreateAttributeDtoInputTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CreateAttributeDtoInputTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CreateAttributeDtoInputTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CreateAttributeDto extends CreateAttributeDto {
  @override
  final String key;
  @override
  final CreateAttributeDtoInputTypeEnum inputType;
  @override
  final BuiltList<AttributeTranslationDto> translations;
  @override
  final bool? isFilterable;
  @override
  final bool? isVariantDefining;
  @override
  final num? sortOrder;
  @override
  final BuiltList<AttributeOptionDto>? options;

  factory _$CreateAttributeDto(
          [void Function(CreateAttributeDtoBuilder)? updates]) =>
      (CreateAttributeDtoBuilder()..update(updates))._build();

  _$CreateAttributeDto._(
      {required this.key,
      required this.inputType,
      required this.translations,
      this.isFilterable,
      this.isVariantDefining,
      this.sortOrder,
      this.options})
      : super._();
  @override
  CreateAttributeDto rebuild(
          void Function(CreateAttributeDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateAttributeDtoBuilder toBuilder() =>
      CreateAttributeDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateAttributeDto &&
        key == other.key &&
        inputType == other.inputType &&
        translations == other.translations &&
        isFilterable == other.isFilterable &&
        isVariantDefining == other.isVariantDefining &&
        sortOrder == other.sortOrder &&
        options == other.options;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, inputType.hashCode);
    _$hash = $jc(_$hash, translations.hashCode);
    _$hash = $jc(_$hash, isFilterable.hashCode);
    _$hash = $jc(_$hash, isVariantDefining.hashCode);
    _$hash = $jc(_$hash, sortOrder.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateAttributeDto')
          ..add('key', key)
          ..add('inputType', inputType)
          ..add('translations', translations)
          ..add('isFilterable', isFilterable)
          ..add('isVariantDefining', isVariantDefining)
          ..add('sortOrder', sortOrder)
          ..add('options', options))
        .toString();
  }
}

class CreateAttributeDtoBuilder
    implements Builder<CreateAttributeDto, CreateAttributeDtoBuilder> {
  _$CreateAttributeDto? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  CreateAttributeDtoInputTypeEnum? _inputType;
  CreateAttributeDtoInputTypeEnum? get inputType => _$this._inputType;
  set inputType(CreateAttributeDtoInputTypeEnum? inputType) =>
      _$this._inputType = inputType;

  ListBuilder<AttributeTranslationDto>? _translations;
  ListBuilder<AttributeTranslationDto> get translations =>
      _$this._translations ??= ListBuilder<AttributeTranslationDto>();
  set translations(ListBuilder<AttributeTranslationDto>? translations) =>
      _$this._translations = translations;

  bool? _isFilterable;
  bool? get isFilterable => _$this._isFilterable;
  set isFilterable(bool? isFilterable) => _$this._isFilterable = isFilterable;

  bool? _isVariantDefining;
  bool? get isVariantDefining => _$this._isVariantDefining;
  set isVariantDefining(bool? isVariantDefining) =>
      _$this._isVariantDefining = isVariantDefining;

  num? _sortOrder;
  num? get sortOrder => _$this._sortOrder;
  set sortOrder(num? sortOrder) => _$this._sortOrder = sortOrder;

  ListBuilder<AttributeOptionDto>? _options;
  ListBuilder<AttributeOptionDto> get options =>
      _$this._options ??= ListBuilder<AttributeOptionDto>();
  set options(ListBuilder<AttributeOptionDto>? options) =>
      _$this._options = options;

  CreateAttributeDtoBuilder() {
    CreateAttributeDto._defaults(this);
  }

  CreateAttributeDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _inputType = $v.inputType;
      _translations = $v.translations.toBuilder();
      _isFilterable = $v.isFilterable;
      _isVariantDefining = $v.isVariantDefining;
      _sortOrder = $v.sortOrder;
      _options = $v.options?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateAttributeDto other) {
    _$v = other as _$CreateAttributeDto;
  }

  @override
  void update(void Function(CreateAttributeDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateAttributeDto build() => _build();

  _$CreateAttributeDto _build() {
    _$CreateAttributeDto _$result;
    try {
      _$result = _$v ??
          _$CreateAttributeDto._(
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'CreateAttributeDto', 'key'),
            inputType: BuiltValueNullFieldError.checkNotNull(
                inputType, r'CreateAttributeDto', 'inputType'),
            translations: translations.build(),
            isFilterable: isFilterable,
            isVariantDefining: isVariantDefining,
            sortOrder: sortOrder,
            options: _options?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'translations';
        translations.build();

        _$failedField = 'options';
        _options?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'CreateAttributeDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
