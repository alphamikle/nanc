// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_selector_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$MultiSelectorFieldAutoequal on MultiSelectorField {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [model, titleFields, thirdTable, structure];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MultiSelectorFieldCWProxy {
  MultiSelectorField name(String name);

  MultiSelectorField model(Model model);

  MultiSelectorField titleFields(List<TitleField> titleFields);

  MultiSelectorField structure(MultiSelectorFieldStructure structure);

  MultiSelectorField id(String? id);

  MultiSelectorField thirdTable(ThirdTable? thirdTable);

  MultiSelectorField showInList(bool showInList);

  MultiSelectorField isRequired(bool isRequired);

  MultiSelectorField sort(int sort);

  MultiSelectorField width(double? width);

  MultiSelectorField validator(String? Function(Object?)? validator);

  MultiSelectorField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MultiSelectorField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MultiSelectorField(...).copyWith(id: 12, name: "My name")
  /// ````
  MultiSelectorField call({
    String? name,
    Model? model,
    List<TitleField>? titleFields,
    MultiSelectorFieldStructure? structure,
    String? id,
    ThirdTable? thirdTable,
    bool? showInList,
    bool? isRequired,
    int? sort,
    double? width,
    String? Function(Object?)? validator,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMultiSelectorField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMultiSelectorField.copyWith.fieldName(...)`
class _$MultiSelectorFieldCWProxyImpl implements _$MultiSelectorFieldCWProxy {
  const _$MultiSelectorFieldCWProxyImpl(this._value);

  final MultiSelectorField _value;

  @override
  MultiSelectorField name(String name) => this(name: name);

  @override
  MultiSelectorField model(Model model) => this(model: model);

  @override
  MultiSelectorField titleFields(List<TitleField> titleFields) =>
      this(titleFields: titleFields);

  @override
  MultiSelectorField structure(MultiSelectorFieldStructure structure) =>
      this(structure: structure);

  @override
  MultiSelectorField id(String? id) => this(id: id);

  @override
  MultiSelectorField thirdTable(ThirdTable? thirdTable) =>
      this(thirdTable: thirdTable);

  @override
  MultiSelectorField showInList(bool showInList) =>
      this(showInList: showInList);

  @override
  MultiSelectorField isRequired(bool isRequired) =>
      this(isRequired: isRequired);

  @override
  MultiSelectorField sort(int sort) => this(sort: sort);

  @override
  MultiSelectorField width(double? width) => this(width: width);

  @override
  MultiSelectorField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  MultiSelectorField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MultiSelectorField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MultiSelectorField(...).copyWith(id: 12, name: "My name")
  /// ````
  MultiSelectorField call({
    Object? name = const $CopyWithPlaceholder(),
    Object? model = const $CopyWithPlaceholder(),
    Object? titleFields = const $CopyWithPlaceholder(),
    Object? structure = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? thirdTable = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return MultiSelectorField(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      model: model == const $CopyWithPlaceholder() || model == null
          ? _value.model
          // ignore: cast_nullable_to_non_nullable
          : model as Model,
      titleFields:
          titleFields == const $CopyWithPlaceholder() || titleFields == null
              ? _value.titleFields
              // ignore: cast_nullable_to_non_nullable
              : titleFields as List<TitleField>,
      structure: structure == const $CopyWithPlaceholder() || structure == null
          ? _value.structure
          // ignore: cast_nullable_to_non_nullable
          : structure as MultiSelectorFieldStructure,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      thirdTable: thirdTable == const $CopyWithPlaceholder()
          ? _value.thirdTable
          // ignore: cast_nullable_to_non_nullable
          : thirdTable as ThirdTable?,
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

extension $MultiSelectorFieldCopyWith on MultiSelectorField {
  /// Returns a callable class that can be used as follows: `instanceOfMultiSelectorField.copyWith(...)` or like so:`instanceOfMultiSelectorField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MultiSelectorFieldCWProxy get copyWith =>
      _$MultiSelectorFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultiSelectorField _$MultiSelectorFieldFromJson(Map<String, dynamic> json) =>
    MultiSelectorField(
      name: json['name'] as String,
      model: Model.fromJson(json['model']),
      titleFields: titleFieldsFromJson(json['titleFields']),
      structure:
          $enumDecode(_$MultiSelectorFieldStructureEnumMap, json['structure']),
      id: json['id'] as String?,
      thirdTable: json['thirdTable'] == null
          ? null
          : ThirdTable.fromJson(json['thirdTable']),
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      width: (json['width'] as num?)?.toDouble(),
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.multiSelectorField,
    );

Map<String, dynamic> _$MultiSelectorFieldToJson(MultiSelectorField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
      'width': instance.width,
      'type': _$FieldTypeEnumMap[instance.type]!,
      'model': instance.model.toJson(),
      'titleFields': titleFieldsToJson(instance.titleFields),
      'thirdTable': instance.thirdTable?.toJson(),
      'structure': _$MultiSelectorFieldStructureEnumMap[instance.structure]!,
    };

const _$MultiSelectorFieldStructureEnumMap = {
  MultiSelectorFieldStructure.arrayOfIds: 'arrayOfIds',
  MultiSelectorFieldStructure.thirdTable: 'thirdTable',
  MultiSelectorFieldStructure.arrayOfObjects: 'arrayOfObjects',
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
};
