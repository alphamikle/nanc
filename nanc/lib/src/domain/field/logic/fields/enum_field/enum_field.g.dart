// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$EnumFieldAutoequal on EnumField {
  List<Object?> get _$props => [
        values,
        id,
        name,
        showInList,
        isRequired,
        sort,
        realField,
        validator,
        type,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EnumFieldCWProxy {
  EnumField name(String name);

  EnumField values(List<EnumValue> values);

  EnumField id(String? id);

  EnumField showInList(bool showInList);

  EnumField isRequired(bool isRequired);

  EnumField sort(int sort);

  EnumField validator(String? Function(Object?)? validator);

  EnumField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EnumField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EnumField(...).copyWith(id: 12, name: "My name")
  /// ````
  EnumField call({
    String? name,
    List<EnumValue>? values,
    String? id,
    bool? showInList,
    bool? isRequired,
    int? sort,
    String? Function(Object?)? validator,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEnumField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEnumField.copyWith.fieldName(...)`
class _$EnumFieldCWProxyImpl implements _$EnumFieldCWProxy {
  const _$EnumFieldCWProxyImpl(this._value);

  final EnumField _value;

  @override
  EnumField name(String name) => this(name: name);

  @override
  EnumField values(List<EnumValue> values) => this(values: values);

  @override
  EnumField id(String? id) => this(id: id);

  @override
  EnumField showInList(bool showInList) => this(showInList: showInList);

  @override
  EnumField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  EnumField sort(int sort) => this(sort: sort);

  @override
  EnumField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  EnumField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EnumField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EnumField(...).copyWith(id: 12, name: "My name")
  /// ````
  EnumField call({
    Object? name = const $CopyWithPlaceholder(),
    Object? values = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return EnumField(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      values: values == const $CopyWithPlaceholder() || values == null
          ? _value.values
          // ignore: cast_nullable_to_non_nullable
          : values as List<EnumValue>,
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
      values:
          (json['values'] as List<dynamic>).map(EnumValue.fromJson).toList(),
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: (json['sort'] as num?)?.toInt() ?? 0,
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.enumField,
    );

Map<String, dynamic> _$EnumFieldToJson(EnumField instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
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
  FieldType.queryFilterField: 'queryFilterField',
  FieldType.queryFilterValueField: 'queryFilterValueField',
  FieldType.selectorField: 'selectorField',
  FieldType.boolField: 'boolField',
  FieldType.dynamicField: 'dynamicField',
  FieldType.structuredField: 'structuredField',
  FieldType.structureField: 'structureField',
  FieldType.colorField: 'colorField',
  FieldType.screenField: 'screenField',
  FieldType.binaryField: 'binaryField',
  FieldType.headerField: 'headerField',
  FieldType.groupField: 'groupField',
  FieldType.fontField: 'fontField',
  FieldType.modelsSelectorField: 'modelsSelectorField',
  FieldType.titleFieldsField: 'titleFieldsField',
};
