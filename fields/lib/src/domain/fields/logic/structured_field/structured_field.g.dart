// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structured_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StructuredFieldCWProxy {
  StructuredField contentColor(Color? contentColor);

  StructuredField contentIcon(String? contentIcon);

  StructuredField id(String? id);

  StructuredField isRequired(bool isRequired);

  StructuredField name(String name);

  StructuredField showInList(bool showInList);

  StructuredField sort(int sort);

  StructuredField structure(List<Field> structure);

  StructuredField type(FieldType type);

  StructuredField validator(String? Function(Object?)? validator);

  StructuredField width(double? width);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StructuredField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StructuredField(...).copyWith(id: 12, name: "My name")
  /// ````
  StructuredField call({
    Color? contentColor,
    String? contentIcon,
    String? id,
    bool? isRequired,
    String? name,
    bool? showInList,
    int? sort,
    List<Field>? structure,
    FieldType? type,
    String? Function(Object?)? validator,
    double? width,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStructuredField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStructuredField.copyWith.fieldName(...)`
class _$StructuredFieldCWProxyImpl implements _$StructuredFieldCWProxy {
  final StructuredField _value;

  const _$StructuredFieldCWProxyImpl(this._value);

  @override
  StructuredField contentColor(Color? contentColor) =>
      this(contentColor: contentColor);

  @override
  StructuredField contentIcon(String? contentIcon) =>
      this(contentIcon: contentIcon);

  @override
  StructuredField id(String? id) => this(id: id);

  @override
  StructuredField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  StructuredField name(String name) => this(name: name);

  @override
  StructuredField showInList(bool showInList) => this(showInList: showInList);

  @override
  StructuredField sort(int sort) => this(sort: sort);

  @override
  StructuredField structure(List<Field> structure) =>
      this(structure: structure);

  @override
  StructuredField type(FieldType type) => this(type: type);

  @override
  StructuredField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  StructuredField width(double? width) => this(width: width);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StructuredField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StructuredField(...).copyWith(id: 12, name: "My name")
  /// ````
  StructuredField call({
    Object? contentColor = const $CopyWithPlaceholder(),
    Object? contentIcon = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? structure = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
  }) {
    return StructuredField(
      contentColor: contentColor == const $CopyWithPlaceholder()
          ? _value.contentColor
          // ignore: cast_nullable_to_non_nullable
          : contentColor as Color?,
      contentIcon: contentIcon == const $CopyWithPlaceholder()
          ? _value.contentIcon
          // ignore: cast_nullable_to_non_nullable
          : contentIcon as String?,
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
      structure: structure == const $CopyWithPlaceholder() || structure == null
          ? _value.structure
          // ignore: cast_nullable_to_non_nullable
          : structure as List<Field>,
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

extension $StructuredFieldCopyWith on StructuredField {
  /// Returns a callable class that can be used as follows: `instanceOfStructuredField.copyWith(...)` or like so:`instanceOfStructuredField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StructuredFieldCWProxy get copyWith => _$StructuredFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StructuredField _$StructuredFieldFromJson(Map<String, dynamic> json) =>
    StructuredField(
      name: json['name'] as String,
      structure: json['structure'] == null
          ? []
          : fieldsFromJsonRow(json['structure'] as List),
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      width: (json['width'] as num?)?.toDouble(),
      contentIcon: json['contentIcon'] as String?,
      contentColor: nullableColorFromJson(json['contentColor'] as String?),
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.structuredField,
    );

Map<String, dynamic> _$StructuredFieldToJson(StructuredField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
      'width': instance.width,
      'type': _$FieldTypeEnumMap[instance.type]!,
      'contentIcon': instance.contentIcon,
      'contentColor': colorToJson(instance.contentColor),
      'structure': fieldsToJsonRow(instance.structure),
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
