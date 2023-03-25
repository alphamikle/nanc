// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structure_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StructureFieldCWProxy {
  StructureField name(String name);

  StructureField id(String? id);

  StructureField showInList(bool showInList);

  StructureField isRequired(bool isRequired);

  StructureField sort(int sort);

  StructureField width(double? width);

  StructureField validator(String? Function(Object?)? validator);

  StructureField contentIcon(String? contentIcon);

  StructureField contentColor(Color? contentColor);

  StructureField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StructureField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StructureField(...).copyWith(id: 12, name: "My name")
  /// ````
  StructureField call({
    String? name,
    String? id,
    bool? showInList,
    bool? isRequired,
    int? sort,
    double? width,
    String? Function(Object?)? validator,
    String? contentIcon,
    Color? contentColor,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStructureField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStructureField.copyWith.fieldName(...)`
class _$StructureFieldCWProxyImpl implements _$StructureFieldCWProxy {
  const _$StructureFieldCWProxyImpl(this._value);

  final StructureField _value;

  @override
  StructureField name(String name) => this(name: name);

  @override
  StructureField id(String? id) => this(id: id);

  @override
  StructureField showInList(bool showInList) => this(showInList: showInList);

  @override
  StructureField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  StructureField sort(int sort) => this(sort: sort);

  @override
  StructureField width(double? width) => this(width: width);

  @override
  StructureField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  StructureField contentIcon(String? contentIcon) =>
      this(contentIcon: contentIcon);

  @override
  StructureField contentColor(Color? contentColor) =>
      this(contentColor: contentColor);

  @override
  StructureField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StructureField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StructureField(...).copyWith(id: 12, name: "My name")
  /// ````
  StructureField call({
    Object? name = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? contentIcon = const $CopyWithPlaceholder(),
    Object? contentColor = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return StructureField(
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
      width: width == const $CopyWithPlaceholder()
          ? _value.width
          // ignore: cast_nullable_to_non_nullable
          : width as double?,
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

extension $StructureFieldCopyWith on StructureField {
  /// Returns a callable class that can be used as follows: `instanceOfStructureField.copyWith(...)` or like so:`instanceOfStructureField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StructureFieldCWProxy get copyWith => _$StructureFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StructureField _$StructureFieldFromJson(Map<String, dynamic> json) =>
    StructureField(
      name: json['name'] as String,
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      width: (json['width'] as num?)?.toDouble(),
      contentIcon: json['contentIcon'] as String?,
      contentColor: nullableColorFromJson(json['contentColor'] as String?),
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.structureField,
    );

Map<String, dynamic> _$StructureFieldToJson(StructureField instance) =>
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
};
