// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$GroupFieldAutoequal on GroupField {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [fields];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GroupFieldCWProxy {
  GroupField name(String name);

  GroupField fields(List<Field> fields);

  GroupField id(String? id);

  GroupField showInList(bool showInList);

  GroupField isRequired(bool isRequired);

  GroupField sort(int sort);

  GroupField width(double? width);

  GroupField validator(String? Function(Object?)? validator);

  GroupField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GroupField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GroupField(...).copyWith(id: 12, name: "My name")
  /// ````
  GroupField call({
    String? name,
    List<Field>? fields,
    String? id,
    bool? showInList,
    bool? isRequired,
    int? sort,
    double? width,
    String? Function(Object?)? validator,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGroupField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGroupField.copyWith.fieldName(...)`
class _$GroupFieldCWProxyImpl implements _$GroupFieldCWProxy {
  const _$GroupFieldCWProxyImpl(this._value);

  final GroupField _value;

  @override
  GroupField name(String name) => this(name: name);

  @override
  GroupField fields(List<Field> fields) => this(fields: fields);

  @override
  GroupField id(String? id) => this(id: id);

  @override
  GroupField showInList(bool showInList) => this(showInList: showInList);

  @override
  GroupField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  GroupField sort(int sort) => this(sort: sort);

  @override
  GroupField width(double? width) => this(width: width);

  @override
  GroupField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  GroupField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GroupField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GroupField(...).copyWith(id: 12, name: "My name")
  /// ````
  GroupField call({
    Object? name = const $CopyWithPlaceholder(),
    Object? fields = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return GroupField(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      fields: fields == const $CopyWithPlaceholder() || fields == null
          ? _value.fields
          // ignore: cast_nullable_to_non_nullable
          : fields as List<Field>,
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

extension $GroupFieldCopyWith on GroupField {
  /// Returns a callable class that can be used as follows: `instanceOfGroupField.copyWith(...)` or like so:`instanceOfGroupField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GroupFieldCWProxy get copyWith => _$GroupFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupField _$GroupFieldFromJson(Map<String, dynamic> json) => GroupField(
      name: json['name'] as String,
      fields: fieldsFromJsonRow(json['fields'] as List),
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      width: (json['width'] as num?)?.toDouble(),
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.groupField,
    );

Map<String, dynamic> _$GroupFieldToJson(GroupField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
      'width': instance.width,
      'type': _$FieldTypeEnumMap[instance.type]!,
      'fields': fieldsToJsonRow(instance.fields),
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
