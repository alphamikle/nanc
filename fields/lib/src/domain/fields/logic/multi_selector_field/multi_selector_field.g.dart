// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_selector_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MultiSelectorFieldCWProxy {
  MultiSelectorField id(String? id);

  MultiSelectorField isRequired(bool isRequired);

  MultiSelectorField model(Model model);

  MultiSelectorField name(String name);

  MultiSelectorField showInList(bool showInList);

  MultiSelectorField sort(int sort);

  MultiSelectorField structure(MultiSelectorFieldStructure structure);

  MultiSelectorField thirdTable(ThirdTable? thirdTable);

  MultiSelectorField titleField(String titleField);

  MultiSelectorField type(FieldType type);

  MultiSelectorField validator(String? Function(Object?)? validator);

  MultiSelectorField width(double? width);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MultiSelectorField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MultiSelectorField(...).copyWith(id: 12, name: "My name")
  /// ````
  MultiSelectorField call({
    String? id,
    bool? isRequired,
    Model? model,
    String? name,
    bool? showInList,
    int? sort,
    MultiSelectorFieldStructure? structure,
    ThirdTable? thirdTable,
    String? titleField,
    FieldType? type,
    String? Function(Object?)? validator,
    double? width,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMultiSelectorField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMultiSelectorField.copyWith.fieldName(...)`
class _$MultiSelectorFieldCWProxyImpl implements _$MultiSelectorFieldCWProxy {
  final MultiSelectorField _value;

  const _$MultiSelectorFieldCWProxyImpl(this._value);

  @override
  MultiSelectorField id(String? id) => this(id: id);

  @override
  MultiSelectorField isRequired(bool isRequired) =>
      this(isRequired: isRequired);

  @override
  MultiSelectorField model(Model model) => this(model: model);

  @override
  MultiSelectorField name(String name) => this(name: name);

  @override
  MultiSelectorField showInList(bool showInList) =>
      this(showInList: showInList);

  @override
  MultiSelectorField sort(int sort) => this(sort: sort);

  @override
  MultiSelectorField structure(MultiSelectorFieldStructure structure) =>
      this(structure: structure);

  @override
  MultiSelectorField thirdTable(ThirdTable? thirdTable) =>
      this(thirdTable: thirdTable);

  @override
  MultiSelectorField titleField(String titleField) =>
      this(titleField: titleField);

  @override
  MultiSelectorField type(FieldType type) => this(type: type);

  @override
  MultiSelectorField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  MultiSelectorField width(double? width) => this(width: width);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MultiSelectorField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MultiSelectorField(...).copyWith(id: 12, name: "My name")
  /// ````
  MultiSelectorField call({
    Object? id = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? model = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? structure = const $CopyWithPlaceholder(),
    Object? thirdTable = const $CopyWithPlaceholder(),
    Object? titleField = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
  }) {
    return MultiSelectorField(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      isRequired:
          isRequired == const $CopyWithPlaceholder() || isRequired == null
              ? _value.isRequired
              // ignore: cast_nullable_to_non_nullable
              : isRequired as bool,
      model: model == const $CopyWithPlaceholder() || model == null
          ? _value.model
          // ignore: cast_nullable_to_non_nullable
          : model as Model,
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
      structure: structure == const $CopyWithPlaceholder() || structure == null
          ? _value.structure
          // ignore: cast_nullable_to_non_nullable
          : structure as MultiSelectorFieldStructure,
      thirdTable: thirdTable == const $CopyWithPlaceholder()
          ? _value.thirdTable
          // ignore: cast_nullable_to_non_nullable
          : thirdTable as ThirdTable?,
      titleField:
          titleField == const $CopyWithPlaceholder() || titleField == null
              ? _value.titleField
              // ignore: cast_nullable_to_non_nullable
              : titleField as String,
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
      titleField: json['titleField'] as String,
      structure:
          $enumDecode(_$MultiSelectorFieldStructureEnumMap, json['structure']),
      id: json['id'] as String?,
      thirdTable: json['thirdTable'] == null
          ? null
          : ThirdTable.fromJson(json['thirdTable']),
      showInList: json['showInList'] as bool? ?? true,
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
      'titleField': instance.titleField,
      'thirdTable': instance.thirdTable?.toJson(),
      'structure': _$MultiSelectorFieldStructureEnumMap[instance.structure]!,
    };

const _$MultiSelectorFieldStructureEnumMap = {
  MultiSelectorFieldStructure.arrayOfIds: 'arrayOfIds',
  MultiSelectorFieldStructure.thirdTable: 'thirdTable',
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
