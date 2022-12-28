// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DynamicFieldCWProxy {
  DynamicField contentColor(Color? contentColor);

  DynamicField contentIcon(String? contentIcon);

  DynamicField id(String? id);

  DynamicField isRequired(bool isRequired);

  DynamicField name(String name);

  DynamicField showInList(bool showInList);

  DynamicField sort(int sort);

  DynamicField type(FieldType type);

  DynamicField validator(String? Function(Object?)? validator);

  DynamicField width(double? width);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DynamicField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DynamicField(...).copyWith(id: 12, name: "My name")
  /// ````
  DynamicField call({
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

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDynamicField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDynamicField.copyWith.fieldName(...)`
class _$DynamicFieldCWProxyImpl implements _$DynamicFieldCWProxy {
  final DynamicField _value;

  const _$DynamicFieldCWProxyImpl(this._value);

  @override
  DynamicField contentColor(Color? contentColor) =>
      this(contentColor: contentColor);

  @override
  DynamicField contentIcon(String? contentIcon) =>
      this(contentIcon: contentIcon);

  @override
  DynamicField id(String? id) => this(id: id);

  @override
  DynamicField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  DynamicField name(String name) => this(name: name);

  @override
  DynamicField showInList(bool showInList) => this(showInList: showInList);

  @override
  DynamicField sort(int sort) => this(sort: sort);

  @override
  DynamicField type(FieldType type) => this(type: type);

  @override
  DynamicField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  DynamicField width(double? width) => this(width: width);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DynamicField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DynamicField(...).copyWith(id: 12, name: "My name")
  /// ````
  DynamicField call({
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
    return DynamicField(
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

extension $DynamicFieldCopyWith on DynamicField {
  /// Returns a callable class that can be used as follows: `instanceOfDynamicField.copyWith(...)` or like so:`instanceOfDynamicField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DynamicFieldCWProxy get copyWith => _$DynamicFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicField _$DynamicFieldFromJson(Map<String, dynamic> json) => DynamicField(
      name: json['name'] as String,
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? true,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      width: (json['width'] as num?)?.toDouble(),
      contentIcon: json['contentIcon'] as String?,
      contentColor: colorFromJson(json['contentColor'] as String?),
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.dynamicField,
    );

Map<String, dynamic> _$DynamicFieldToJson(DynamicField instance) =>
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
};
