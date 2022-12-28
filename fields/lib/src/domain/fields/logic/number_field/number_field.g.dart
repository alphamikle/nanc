// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NumberFieldCWProxy {
  NumberField id(String? id);

  NumberField isRequired(bool isRequired);

  NumberField name(String name);

  NumberField showInList(bool showInList);

  NumberField sort(int sort);

  NumberField type(FieldType type);

  NumberField validator(String? Function(Object?)? validator);

  NumberField width(double? width);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NumberField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NumberField(...).copyWith(id: 12, name: "My name")
  /// ````
  NumberField call({
    String? id,
    bool? isRequired,
    String? name,
    bool? showInList,
    int? sort,
    FieldType? type,
    String? Function(Object?)? validator,
    double? width,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNumberField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNumberField.copyWith.fieldName(...)`
class _$NumberFieldCWProxyImpl implements _$NumberFieldCWProxy {
  final NumberField _value;

  const _$NumberFieldCWProxyImpl(this._value);

  @override
  NumberField id(String? id) => this(id: id);

  @override
  NumberField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  NumberField name(String name) => this(name: name);

  @override
  NumberField showInList(bool showInList) => this(showInList: showInList);

  @override
  NumberField sort(int sort) => this(sort: sort);

  @override
  NumberField type(FieldType type) => this(type: type);

  @override
  NumberField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  NumberField width(double? width) => this(width: width);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NumberField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NumberField(...).copyWith(id: 12, name: "My name")
  /// ````
  NumberField call({
    Object? id = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
  }) {
    return NumberField(
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
      width: width == const $CopyWithPlaceholder()
          ? _value.width
          // ignore: cast_nullable_to_non_nullable
          : width as double?,
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
      showInList: json['showInList'] as bool? ?? true,
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
};
