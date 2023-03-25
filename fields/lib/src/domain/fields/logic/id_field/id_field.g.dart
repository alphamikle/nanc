// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$IdFieldCWProxy {
  IdField id(String? id);

  IdField name(String? name);

  IdField isRequired(bool isRequired);

  IdField sort(int sort);

  IdField width(double? width);

  IdField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IdField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IdField(...).copyWith(id: 12, name: "My name")
  /// ````
  IdField call({
    String? id,
    String? name,
    bool? isRequired,
    int? sort,
    double? width,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfIdField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfIdField.copyWith.fieldName(...)`
class _$IdFieldCWProxyImpl implements _$IdFieldCWProxy {
  const _$IdFieldCWProxyImpl(this._value);

  final IdField _value;

  @override
  IdField id(String? id) => this(id: id);

  @override
  IdField name(String? name) => this(name: name);

  @override
  IdField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  IdField sort(int sort) => this(sort: sort);

  @override
  IdField width(double? width) => this(width: width);

  @override
  IdField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IdField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IdField(...).copyWith(id: 12, name: "My name")
  /// ````
  IdField call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return IdField(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      isRequired:
          isRequired == const $CopyWithPlaceholder() || isRequired == null
              ? _value.isRequired
              // ignore: cast_nullable_to_non_nullable
              : isRequired as bool,
      sort: sort == const $CopyWithPlaceholder() || sort == null
          ? _value.sort
          // ignore: cast_nullable_to_non_nullable
          : sort as int,
      width: width == const $CopyWithPlaceholder()
          ? _value.width
          // ignore: cast_nullable_to_non_nullable
          : width as double?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as FieldType,
    );
  }
}

extension $IdFieldCopyWith on IdField {
  /// Returns a callable class that can be used as follows: `instanceOfIdField.copyWith(...)` or like so:`instanceOfIdField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$IdFieldCWProxy get copyWith => _$IdFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdField _$IdFieldFromJson(Map<String, dynamic> json) => IdField(
      id: json['id'] as String?,
      name: json['name'] as String?,
      isRequired: json['isRequired'] as bool? ?? true,
      sort: json['sort'] as int? ?? 0,
      width: (json['width'] as num?)?.toDouble() ?? 400,
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.idField,
    );

Map<String, dynamic> _$IdFieldToJson(IdField instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
      'width': instance.width,
      'type': _$FieldTypeEnumMap[instance.type]!,
    };

const _$FieldTypeEnumMap = {
  FieldType.custom: 'custom',
  FieldType.field: 'field',
  FieldType.dateField: 'dateField',
  FieldType.enumField: 'enumField',
  FieldType.iconField: 'iconField',
  FieldType.idField: 'idField',
  FieldType.stringField: 'stringField',
  FieldType.multiSelectorField: 'multiSelectorField',
  FieldType.numberField: 'numberField',
  FieldType.selectorField: 'selectorField',
  FieldType.boolField: 'boolField',
  FieldType.dynamicField: 'dynamicField',
  FieldType.structuredField: 'structuredField',
  FieldType.structureField: 'structureField',
  FieldType.colorField: 'colorField',
  FieldType.screenField: 'screenField',
  FieldType.headerField: 'headerField',
  FieldType.groupField: 'groupField',
  FieldType.fontField: 'fontField',
};
