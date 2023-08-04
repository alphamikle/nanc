// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_filter_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$QueryFilterFieldAutoequal on QueryFilterField {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$QueryFilterFieldCWProxy {
  QueryFilterField name(String name);

  QueryFilterField id(String? id);

  QueryFilterField showInList(bool showInList);

  QueryFilterField isRequired(bool isRequired);

  QueryFilterField sort(int sort);

  QueryFilterField validator(String? Function(Object?)? validator);

  QueryFilterField contentIcon(String? contentIcon);

  QueryFilterField contentColor(Color? contentColor);

  QueryFilterField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueryFilterField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueryFilterField(...).copyWith(id: 12, name: "My name")
  /// ````
  QueryFilterField call({
    String? name,
    String? id,
    bool? showInList,
    bool? isRequired,
    int? sort,
    String? Function(Object?)? validator,
    String? contentIcon,
    Color? contentColor,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQueryFilterField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQueryFilterField.copyWith.fieldName(...)`
class _$QueryFilterFieldCWProxyImpl implements _$QueryFilterFieldCWProxy {
  const _$QueryFilterFieldCWProxyImpl(this._value);

  final QueryFilterField _value;

  @override
  QueryFilterField name(String name) => this(name: name);

  @override
  QueryFilterField id(String? id) => this(id: id);

  @override
  QueryFilterField showInList(bool showInList) => this(showInList: showInList);

  @override
  QueryFilterField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  QueryFilterField sort(int sort) => this(sort: sort);

  @override
  QueryFilterField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  QueryFilterField contentIcon(String? contentIcon) =>
      this(contentIcon: contentIcon);

  @override
  QueryFilterField contentColor(Color? contentColor) =>
      this(contentColor: contentColor);

  @override
  QueryFilterField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueryFilterField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueryFilterField(...).copyWith(id: 12, name: "My name")
  /// ````
  QueryFilterField call({
    Object? name = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? contentIcon = const $CopyWithPlaceholder(),
    Object? contentColor = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return QueryFilterField(
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
      contentIcon: contentIcon == const $CopyWithPlaceholder()
          ? _value.contentIcon
          // ignore: cast_nullable_to_non_nullable
          : contentIcon as String?,
      contentColor: contentColor == const $CopyWithPlaceholder()
          ? _value.contentColor
          // ignore: cast_nullable_to_non_nullable
          : contentColor as Color?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as FieldType,
    );
  }
}

extension $QueryFilterFieldCopyWith on QueryFilterField {
  /// Returns a callable class that can be used as follows: `instanceOfQueryFilterField.copyWith(...)` or like so:`instanceOfQueryFilterField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QueryFilterFieldCWProxy get copyWith => _$QueryFilterFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryFilterField _$QueryFilterFieldFromJson(Map<String, dynamic> json) =>
    QueryFilterField(
      name: json['name'] as String,
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      contentIcon: json['contentIcon'] as String?,
      contentColor: nullableColorFromJson(json['contentColor'] as String?),
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.queryFilterField,
    );

Map<String, dynamic> _$QueryFilterFieldToJson(QueryFilterField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
      'type': _$FieldTypeEnumMap[instance.type]!,
      'contentIcon': instance.contentIcon,
      'contentColor': colorToJson(instance.contentColor),
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
  FieldType.headerField: 'headerField',
  FieldType.groupField: 'groupField',
  FieldType.fontField: 'fontField',
  FieldType.modelsSelectorField: 'modelsSelectorField',
  FieldType.titleFieldsField: 'titleFieldsField',
};
