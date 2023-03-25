// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NumberFieldCWProxy {
  NumberField name(String name);

  NumberField id(String? id);

  NumberField showInList(bool showInList);

  NumberField isRequired(bool isRequired);

  NumberField sort(int sort);

  NumberField width(double? width);

  NumberField validator(String? Function(Object?)? validator);

  NumberField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NumberField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NumberField(...).copyWith(id: 12, name: "My name")
  /// ````
  NumberField call({
    String? name,
    String? id,
    bool? showInList,
    bool? isRequired,
    int? sort,
    double? width,
    String? Function(Object?)? validator,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNumberField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNumberField.copyWith.fieldName(...)`
class _$NumberFieldCWProxyImpl implements _$NumberFieldCWProxy {
  const _$NumberFieldCWProxyImpl(this._value);

  final NumberField _value;

  @override
  NumberField name(String name) => this(name: name);

  @override
  NumberField id(String? id) => this(id: id);

  @override
  NumberField showInList(bool showInList) => this(showInList: showInList);

  @override
  NumberField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  NumberField sort(int sort) => this(sort: sort);

  @override
  NumberField width(double? width) => this(width: width);

  @override
  NumberField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  NumberField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NumberField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NumberField(...).copyWith(id: 12, name: "My name")
  /// ````
  NumberField call({
    Object? name = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return NumberField(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      showInList:
          showInList == const $CopyWithPlaceholder() || showInList == null
              ? _value.showInList
              // ignore: cast_nullable_to_non_nullable
              : showInList as bool,
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
      validator: validator == const $CopyWithPlaceholder()
          ? _value.validator
          // ignore: cast_nullable_to_non_nullable
          : validator as String? Function(Object?)?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as FieldType,
    );
  }
}

extension $NumberFieldCopyWith on NumberField {
  /// Returns a callable class that can be used as follows: `instanceOfNumberField.copyWith(...)` or like so:`instanceOfNumberField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NumberFieldCWProxy get copyWith => _$NumberFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberField _$NumberFieldFromJson(Map<String, dynamic> json) => NumberField(
      name: json['name'] as String,
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      width: (json['width'] as num?)?.toDouble(),
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.numberField,
    );

Map<String, dynamic> _$NumberFieldToJson(NumberField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
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
