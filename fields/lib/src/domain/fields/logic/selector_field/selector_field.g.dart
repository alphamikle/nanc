// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selector_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SelectorFieldCWProxy {
  SelectorField id(String? id);

  SelectorField isRequired(bool isRequired);

  SelectorField model(Model model);

  SelectorField name(String name);

  SelectorField showInList(bool showInList);

  SelectorField sort(int sort);

  SelectorField structure(SelectorFieldStructure structure);

  SelectorField titleFields(List<String> titleFields);

  SelectorField type(FieldType type);

  SelectorField validator(String? Function(Object?)? validator);

  SelectorField width(double? width);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SelectorField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SelectorField(...).copyWith(id: 12, name: "My name")
  /// ````
  SelectorField call({
    String? id,
    bool? isRequired,
    Model? model,
    String? name,
    bool? showInList,
    int? sort,
    SelectorFieldStructure? structure,
    List<String>? titleFields,
    FieldType? type,
    String? Function(Object?)? validator,
    double? width,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSelectorField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSelectorField.copyWith.fieldName(...)`
class _$SelectorFieldCWProxyImpl implements _$SelectorFieldCWProxy {
  final SelectorField _value;

  const _$SelectorFieldCWProxyImpl(this._value);

  @override
  SelectorField id(String? id) => this(id: id);

  @override
  SelectorField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  SelectorField model(Model model) => this(model: model);

  @override
  SelectorField name(String name) => this(name: name);

  @override
  SelectorField showInList(bool showInList) => this(showInList: showInList);

  @override
  SelectorField sort(int sort) => this(sort: sort);

  @override
  SelectorField structure(SelectorFieldStructure structure) =>
      this(structure: structure);

  @override
  SelectorField titleFields(List<String> titleFields) =>
      this(titleFields: titleFields);

  @override
  SelectorField type(FieldType type) => this(type: type);

  @override
  SelectorField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  SelectorField width(double? width) => this(width: width);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SelectorField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SelectorField(...).copyWith(id: 12, name: "My name")
  /// ````
  SelectorField call({
    Object? id = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? model = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? structure = const $CopyWithPlaceholder(),
    Object? titleFields = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
  }) {
    return SelectorField(
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
          : structure as SelectorFieldStructure,
      titleFields:
          titleFields == const $CopyWithPlaceholder() || titleFields == null
              ? _value.titleFields
              // ignore: cast_nullable_to_non_nullable
              : titleFields as List<String>,
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

extension $SelectorFieldCopyWith on SelectorField {
  /// Returns a callable class that can be used as follows: `instanceOfSelectorField.copyWith(...)` or like so:`instanceOfSelectorField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SelectorFieldCWProxy get copyWith => _$SelectorFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectorField _$SelectorFieldFromJson(Map<String, dynamic> json) =>
    SelectorField(
      name: json['name'] as String,
      model: _entityFromJson(json['model']),
      titleFields: (json['titleFields'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      structure:
          $enumDecode(_$SelectorFieldStructureEnumMap, json['structure']),
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? true,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      width: (json['width'] as num?)?.toDouble(),
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.selectorField,
    );

Map<String, dynamic> _$SelectorFieldToJson(SelectorField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
      'width': instance.width,
      'type': _$FieldTypeEnumMap[instance.type]!,
      'model': _entityToJson(instance.model),
      'titleFields': instance.titleFields,
      'structure': _$SelectorFieldStructureEnumMap[instance.structure]!,
    };

const _$SelectorFieldStructureEnumMap = {
  SelectorFieldStructure.id: 'id',
  SelectorFieldStructure.object: 'object',
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
