// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EnumFieldCWProxy {
  EnumField id(String? id);

  EnumField isRequired(bool isRequired);

  EnumField name(String name);

  EnumField showInList(bool showInList);

  EnumField sort(int sort);

  EnumField type(FieldType type);

  EnumField validator(String? Function(Object?)? validator);

  EnumField values(List<EnumValue> values);

  EnumField width(double? width);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EnumField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EnumField(...).copyWith(id: 12, name: "My name")
  /// ````
  EnumField call({
    String? id,
    bool? isRequired,
    String? name,
    bool? showInList,
    int? sort,
    FieldType? type,
    String? Function(Object?)? validator,
    List<EnumValue>? values,
    double? width,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEnumField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEnumField.copyWith.fieldName(...)`
class _$EnumFieldCWProxyImpl implements _$EnumFieldCWProxy {
  final EnumField _value;

  const _$EnumFieldCWProxyImpl(this._value);

  @override
  EnumField id(String? id) => this(id: id);

  @override
  EnumField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  EnumField name(String name) => this(name: name);

  @override
  EnumField showInList(bool showInList) => this(showInList: showInList);

  @override
  EnumField sort(int sort) => this(sort: sort);

  @override
  EnumField type(FieldType type) => this(type: type);

  @override
  EnumField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  EnumField values(List<EnumValue> values) => this(values: values);

  @override
  EnumField width(double? width) => this(width: width);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EnumField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EnumField(...).copyWith(id: 12, name: "My name")
  /// ````
  EnumField call({
    Object? id = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? values = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
  }) {
    return EnumField(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      isRequired:
          isRequired == const $CopyWithPlaceholder() || isRequired == null
              ? _value.isRequired
              // ignore: cast_nullable_to_non_nullable
              : isRequired as bool,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      showInList:
          showInList == const $CopyWithPlaceholder() || showInList == null
              ? _value.showInList
              // ignore: cast_nullable_to_non_nullable
              : showInList as bool,
      sort: sort == const $CopyWithPlaceholder() || sort == null
          ? _value.sort
          // ignore: cast_nullable_to_non_nullable
          : sort as int,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as FieldType,
      validator: validator == const $CopyWithPlaceholder()
          ? _value.validator
          // ignore: cast_nullable_to_non_nullable
          : validator as String? Function(Object?)?,
      values: values == const $CopyWithPlaceholder() || values == null
          ? _value.values
          // ignore: cast_nullable_to_non_nullable
          : values as List<EnumValue>,
      width: width == const $CopyWithPlaceholder()
          ? _value.width
          // ignore: cast_nullable_to_non_nullable
          : width as double?,
    );
  }
}

extension $EnumFieldCopyWith on EnumField {
  /// Returns a callable class that can be used as follows: `instanceOfEnumField.copyWith(...)` or like so:`instanceOfEnumField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EnumFieldCWProxy get copyWith => _$EnumFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnumField _$EnumFieldFromJson(Map<String, dynamic> json) => EnumField(
      name: json['name'] as String,
      values: (json['values'] as List<dynamic>)
          .map((e) => EnumValue.fromJson(e))
          .toList(),
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? true,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      width: (json['width'] as num?)?.toDouble(),
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.enumField,
    );

Map<String, dynamic> _$EnumFieldToJson(EnumField instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
      'width': instance.width,
      'type': _$FieldTypeEnumMap[instance.type]!,
      'values': instance.values.map((e) => e.toJson()).toList(),
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
};
