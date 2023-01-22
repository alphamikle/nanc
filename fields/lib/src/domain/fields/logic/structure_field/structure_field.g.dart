// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structure_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StructureFieldCWProxy {
  StructureField contentColor(Color? contentColor);

  StructureField contentIcon(String? contentIcon);

  StructureField id(String? id);

  StructureField isRequired(bool isRequired);

  StructureField name(String name);

  StructureField showInList(bool showInList);

  StructureField sort(int sort);

  StructureField type(FieldType type);

  StructureField validator(String? Function(Object?)? validator);

  StructureField width(double? width);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StructureField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StructureField(...).copyWith(id: 12, name: "My name")
  /// ````
  StructureField call({
    Color? contentColor,
    String? contentIcon,
    String? id,
    bool? isRequired,
    String? name,
    bool? showInList,
    int? sort,
    FieldType? type,
    String? Function(Object?)? validator,
    double? width,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStructureField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStructureField.copyWith.fieldName(...)`
class _$StructureFieldCWProxyImpl implements _$StructureFieldCWProxy {
  final StructureField _value;

  const _$StructureFieldCWProxyImpl(this._value);

  @override
  StructureField contentColor(Color? contentColor) =>
      this(contentColor: contentColor);

  @override
  StructureField contentIcon(String? contentIcon) =>
      this(contentIcon: contentIcon);

  @override
  StructureField id(String? id) => this(id: id);

  @override
  StructureField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  StructureField name(String name) => this(name: name);

  @override
  StructureField showInList(bool showInList) => this(showInList: showInList);

  @override
  StructureField sort(int sort) => this(sort: sort);

  @override
  StructureField type(FieldType type) => this(type: type);

  @override
  StructureField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  StructureField width(double? width) => this(width: width);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StructureField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StructureField(...).copyWith(id: 12, name: "My name")
  /// ````
  StructureField call({
    Object? contentColor = const $CopyWithPlaceholder(),
    Object? contentIcon = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
  }) {
    return StructureField(
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
      contentColor: colorFromJson(json['contentColor'] as String?),
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
};
