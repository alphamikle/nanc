// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_time_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$DateTimeFieldAutoequal on DateTimeField {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [isCreatedAtField, isUpdatedAtField];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DateTimeFieldCWProxy {
  DateTimeField name(String name);

  DateTimeField isCreatedAtField(bool isCreatedAtField);

  DateTimeField isUpdatedAtField(bool isUpdatedAtField);

  DateTimeField id(String? id);

  DateTimeField showInList(bool showInList);

  DateTimeField isRequired(bool isRequired);

  DateTimeField sort(int sort);

  DateTimeField width(double? width);

  DateTimeField validator(String? Function(Object?)? validator);

  DateTimeField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DateTimeField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DateTimeField(...).copyWith(id: 12, name: "My name")
  /// ````
  DateTimeField call({
    String? name,
    bool? isCreatedAtField,
    bool? isUpdatedAtField,
    String? id,
    bool? showInList,
    bool? isRequired,
    int? sort,
    double? width,
    String? Function(Object?)? validator,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDateTimeField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDateTimeField.copyWith.fieldName(...)`
class _$DateTimeFieldCWProxyImpl implements _$DateTimeFieldCWProxy {
  const _$DateTimeFieldCWProxyImpl(this._value);

  final DateTimeField _value;

  @override
  DateTimeField name(String name) => this(name: name);

  @override
  DateTimeField isCreatedAtField(bool isCreatedAtField) =>
      this(isCreatedAtField: isCreatedAtField);

  @override
  DateTimeField isUpdatedAtField(bool isUpdatedAtField) =>
      this(isUpdatedAtField: isUpdatedAtField);

  @override
  DateTimeField id(String? id) => this(id: id);

  @override
  DateTimeField showInList(bool showInList) => this(showInList: showInList);

  @override
  DateTimeField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  DateTimeField sort(int sort) => this(sort: sort);

  @override
  DateTimeField width(double? width) => this(width: width);

  @override
  DateTimeField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  DateTimeField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DateTimeField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DateTimeField(...).copyWith(id: 12, name: "My name")
  /// ````
  DateTimeField call({
    Object? name = const $CopyWithPlaceholder(),
    Object? isCreatedAtField = const $CopyWithPlaceholder(),
    Object? isUpdatedAtField = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return DateTimeField(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      isCreatedAtField: isCreatedAtField == const $CopyWithPlaceholder() ||
              isCreatedAtField == null
          ? _value.isCreatedAtField
          // ignore: cast_nullable_to_non_nullable
          : isCreatedAtField as bool,
      isUpdatedAtField: isUpdatedAtField == const $CopyWithPlaceholder() ||
              isUpdatedAtField == null
          ? _value.isUpdatedAtField
          // ignore: cast_nullable_to_non_nullable
          : isUpdatedAtField as bool,
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

extension $DateTimeFieldCopyWith on DateTimeField {
  /// Returns a callable class that can be used as follows: `instanceOfDateTimeField.copyWith(...)` or like so:`instanceOfDateTimeField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DateTimeFieldCWProxy get copyWith => _$DateTimeFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateTimeField _$DateTimeFieldFromJson(Map<String, dynamic> json) =>
    DateTimeField(
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

Map<String, dynamic> _$DateTimeFieldToJson(DateTimeField instance) =>
    <String, dynamic>{
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
  FieldType.groupField: 'groupField',
  FieldType.fontField: 'fontField',
  FieldType.modelsSelectorField: 'modelsSelectorField',
  FieldType.titleFieldsField: 'titleFieldsField',
};
