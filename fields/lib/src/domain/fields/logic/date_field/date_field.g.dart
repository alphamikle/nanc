// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DateFieldCWProxy {
  DateField id(String? id);

  DateField isCreatedAtField(bool isCreatedAtField);

  DateField isRequired(bool isRequired);

  DateField isUpdatedAtField(bool isUpdatedAtField);

  DateField name(String name);

  DateField showInList(bool showInList);

  DateField sort(int sort);

  DateField type(FieldType type);

  DateField validator(String? Function(Object?)? validator);

  DateField width(double? width);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DateField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DateField(...).copyWith(id: 12, name: "My name")
  /// ````
  DateField call({
    String? id,
    bool? isCreatedAtField,
    bool? isRequired,
    bool? isUpdatedAtField,
    String? name,
    bool? showInList,
    int? sort,
    FieldType? type,
    String? Function(Object?)? validator,
    double? width,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDateField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDateField.copyWith.fieldName(...)`
class _$DateFieldCWProxyImpl implements _$DateFieldCWProxy {
  final DateField _value;

  const _$DateFieldCWProxyImpl(this._value);

  @override
  DateField id(String? id) => this(id: id);

  @override
  DateField isCreatedAtField(bool isCreatedAtField) =>
      this(isCreatedAtField: isCreatedAtField);

  @override
  DateField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  DateField isUpdatedAtField(bool isUpdatedAtField) =>
      this(isUpdatedAtField: isUpdatedAtField);

  @override
  DateField name(String name) => this(name: name);

  @override
  DateField showInList(bool showInList) => this(showInList: showInList);

  @override
  DateField sort(int sort) => this(sort: sort);

  @override
  DateField type(FieldType type) => this(type: type);

  @override
  DateField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  DateField width(double? width) => this(width: width);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DateField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DateField(...).copyWith(id: 12, name: "My name")
  /// ````
  DateField call({
    Object? id = const $CopyWithPlaceholder(),
    Object? isCreatedAtField = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? isUpdatedAtField = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
  }) {
    return DateField(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      isCreatedAtField: isCreatedAtField == const $CopyWithPlaceholder() ||
              isCreatedAtField == null
          ? _value.isCreatedAtField
          // ignore: cast_nullable_to_non_nullable
          : isCreatedAtField as bool,
      isRequired:
          isRequired == const $CopyWithPlaceholder() || isRequired == null
              ? _value.isRequired
              // ignore: cast_nullable_to_non_nullable
              : isRequired as bool,
      isUpdatedAtField: isUpdatedAtField == const $CopyWithPlaceholder() ||
              isUpdatedAtField == null
          ? _value.isUpdatedAtField
          // ignore: cast_nullable_to_non_nullable
          : isUpdatedAtField as bool,
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

extension $DateFieldCopyWith on DateField {
  /// Returns a callable class that can be used as follows: `instanceOfDateField.copyWith(...)` or like so:`instanceOfDateField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DateFieldCWProxy get copyWith => _$DateFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateField _$DateFieldFromJson(Map<String, dynamic> json) => DateField(
      name: json['name'] as String,
      isCreatedAtField: json['isCreatedAtField'] as bool? ?? false,
      isUpdatedAtField: json['isUpdatedAtField'] as bool? ?? false,
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      width: (json['width'] as num?)?.toDouble(),
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.dateField,
    );

Map<String, dynamic> _$DateFieldToJson(DateField instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
      'width': instance.width,
      'type': _$FieldTypeEnumMap[instance.type]!,
      'isCreatedAtField': instance.isCreatedAtField,
      'isUpdatedAtField': instance.isUpdatedAtField,
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
};
