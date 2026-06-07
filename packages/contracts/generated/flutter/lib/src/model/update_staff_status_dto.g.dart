// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_staff_status_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UpdateStaffStatusDtoStatusEnum _$updateStaffStatusDtoStatusEnum_ACTIVE =
    const UpdateStaffStatusDtoStatusEnum._('ACTIVE');
const UpdateStaffStatusDtoStatusEnum
    _$updateStaffStatusDtoStatusEnum_SUSPENDED =
    const UpdateStaffStatusDtoStatusEnum._('SUSPENDED');
const UpdateStaffStatusDtoStatusEnum _$updateStaffStatusDtoStatusEnum_DISABLED =
    const UpdateStaffStatusDtoStatusEnum._('DISABLED');

UpdateStaffStatusDtoStatusEnum _$updateStaffStatusDtoStatusEnumValueOf(
    String name) {
  switch (name) {
    case 'ACTIVE':
      return _$updateStaffStatusDtoStatusEnum_ACTIVE;
    case 'SUSPENDED':
      return _$updateStaffStatusDtoStatusEnum_SUSPENDED;
    case 'DISABLED':
      return _$updateStaffStatusDtoStatusEnum_DISABLED;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<UpdateStaffStatusDtoStatusEnum>
    _$updateStaffStatusDtoStatusEnumValues = BuiltSet<
        UpdateStaffStatusDtoStatusEnum>(const <UpdateStaffStatusDtoStatusEnum>[
  _$updateStaffStatusDtoStatusEnum_ACTIVE,
  _$updateStaffStatusDtoStatusEnum_SUSPENDED,
  _$updateStaffStatusDtoStatusEnum_DISABLED,
]);

Serializer<UpdateStaffStatusDtoStatusEnum>
    _$updateStaffStatusDtoStatusEnumSerializer =
    _$UpdateStaffStatusDtoStatusEnumSerializer();

class _$UpdateStaffStatusDtoStatusEnumSerializer
    implements PrimitiveSerializer<UpdateStaffStatusDtoStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ACTIVE': 'ACTIVE',
    'SUSPENDED': 'SUSPENDED',
    'DISABLED': 'DISABLED',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ACTIVE': 'ACTIVE',
    'SUSPENDED': 'SUSPENDED',
    'DISABLED': 'DISABLED',
  };

  @override
  final Iterable<Type> types = const <Type>[UpdateStaffStatusDtoStatusEnum];
  @override
  final String wireName = 'UpdateStaffStatusDtoStatusEnum';

  @override
  Object serialize(
          Serializers serializers, UpdateStaffStatusDtoStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UpdateStaffStatusDtoStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UpdateStaffStatusDtoStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$UpdateStaffStatusDto extends UpdateStaffStatusDto {
  @override
  final UpdateStaffStatusDtoStatusEnum status;

  factory _$UpdateStaffStatusDto(
          [void Function(UpdateStaffStatusDtoBuilder)? updates]) =>
      (UpdateStaffStatusDtoBuilder()..update(updates))._build();

  _$UpdateStaffStatusDto._({required this.status}) : super._();
  @override
  UpdateStaffStatusDto rebuild(
          void Function(UpdateStaffStatusDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateStaffStatusDtoBuilder toBuilder() =>
      UpdateStaffStatusDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateStaffStatusDto && status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateStaffStatusDto')
          ..add('status', status))
        .toString();
  }
}

class UpdateStaffStatusDtoBuilder
    implements Builder<UpdateStaffStatusDto, UpdateStaffStatusDtoBuilder> {
  _$UpdateStaffStatusDto? _$v;

  UpdateStaffStatusDtoStatusEnum? _status;
  UpdateStaffStatusDtoStatusEnum? get status => _$this._status;
  set status(UpdateStaffStatusDtoStatusEnum? status) => _$this._status = status;

  UpdateStaffStatusDtoBuilder() {
    UpdateStaffStatusDto._defaults(this);
  }

  UpdateStaffStatusDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateStaffStatusDto other) {
    _$v = other as _$UpdateStaffStatusDto;
  }

  @override
  void update(void Function(UpdateStaffStatusDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateStaffStatusDto build() => _build();

  _$UpdateStaffStatusDto _build() {
    final _$result = _$v ??
        _$UpdateStaffStatusDto._(
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'UpdateStaffStatusDto', 'status'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
