// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_filter_value_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$QueryFilterValueFieldAutoequal on QueryFilterValueField {
  List<Object?> get _$props => [
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

abstract class _$QueryFilterValueFieldCWProxy {
  QueryFilterValueField name(String name);

  QueryFilterValueField id(String? id);

  QueryFilterValueField showInList(bool showInList);

  QueryFilterValueField isRequired(bool isRequired);

  QueryFilterValueField sort(int sort);

  QueryFilterValueField validator(String? Function(Object?)? validator);

  QueryFilterValueField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueryFilterValueField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueryFilterValueField(...).copyWith(id: 12, name: "My name")
  /// ````
  QueryFilterValueField call({
    String? name,
    String? id,
    bool? showInList,
    bool? isRequired,
    int? sort,
    String? Function(Object?)? validator,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQueryFilterValueField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQueryFilterValueField.copyWith.fieldName(...)`
class _$QueryFilterValueFieldCWProxyImpl
    implements _$QueryFilterValueFieldCWProxy {
  const _$QueryFilterValueFieldCWProxyImpl(this._value);

  final QueryFilterValueField _value;

  @override
  QueryFilterValueField name(String name) => this(name: name);

  @override
  QueryFilterValueField id(String? id) => this(id: id);

  @override
  QueryFilterValueField showInList(bool showInList) =>
      this(showInList: showInList);

  @override
  QueryFilterValueField isRequired(bool isRequired) =>
      this(isRequired: isRequired);

  @override
  QueryFilterValueField sort(int sort) => this(sort: sort);

  @override
  QueryFilterValueField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  QueryFilterValueField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueryFilterValueField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueryFilterValueField(...).copyWith(id: 12, name: "My name")
  /// ````
  QueryFilterValueField call({
    Object? name = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return QueryFilterValueField(
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

extension $QueryFilterValueFieldCopyWith on QueryFilterValueField {
  /// Returns a callable class that can be used as follows: `instanceOfQueryFilterValueField.copyWith(...)` or like so:`instanceOfQueryFilterValueField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QueryFilterValueFieldCWProxy get copyWith =>
      _$QueryFilterValueFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryFilterValueField _$QueryFilterValueFieldFromJson(
        Map<String, dynamic> json) =>
    QueryFilterValueField(
      name: json['name'] as String,
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.queryFilterValueField,
    );

Map<String, dynamic> _$QueryFilterValueFieldToJson(
        QueryFilterValueField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
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
