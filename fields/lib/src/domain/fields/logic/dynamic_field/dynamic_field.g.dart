// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$DynamicFieldAutoequal on DynamicField {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [contentIcon, contentColor];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DynamicFieldCWProxy {
  DynamicField name(String name);

  DynamicField id(String? id);

  DynamicField showInList(bool showInList);

  DynamicField isRequired(bool isRequired);

  DynamicField sort(int sort);

  DynamicField width(double? width);

  DynamicField validator(String? Function(Object?)? validator);

  DynamicField contentIcon(String? contentIcon);

  DynamicField contentColor(Color? contentColor);

  DynamicField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DynamicField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DynamicField(...).copyWith(id: 12, name: "My name")
  /// ````
  DynamicField call({
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

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDynamicField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDynamicField.copyWith.fieldName(...)`
class _$DynamicFieldCWProxyImpl implements _$DynamicFieldCWProxy {
  const _$DynamicFieldCWProxyImpl(this._value);

  final DynamicField _value;

  @override
  DynamicField name(String name) => this(name: name);

  @override
  DynamicField id(String? id) => this(id: id);

  @override
  DynamicField showInList(bool showInList) => this(showInList: showInList);

  @override
  DynamicField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  DynamicField sort(int sort) => this(sort: sort);

  @override
  DynamicField width(double? width) => this(width: width);

  @override
  DynamicField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  DynamicField contentIcon(String? contentIcon) =>
      this(contentIcon: contentIcon);

  @override
  DynamicField contentColor(Color? contentColor) =>
      this(contentColor: contentColor);

  @override
  DynamicField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DynamicField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DynamicField(...).copyWith(id: 12, name: "My name")
  /// ````
  DynamicField call({
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
    return DynamicField(
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
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      width: (json['width'] as num?)?.toDouble(),
      contentIcon: json['contentIcon'] as String?,
      contentColor: nullableColorFromJson(json['contentColor'] as String?),
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
  FieldType.headerField: 'headerField',
  FieldType.groupField: 'groupField',
  FieldType.fontField: 'fontField',
};
