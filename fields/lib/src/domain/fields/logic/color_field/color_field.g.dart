// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ColorFieldCWProxy {
  ColorField id(String? id);

  ColorField isRequired(bool isRequired);

  ColorField name(String name);

  ColorField showInList(bool showInList);

  ColorField sort(int sort);

  ColorField type(FieldType type);

  ColorField validator(String? Function(Object?)? validator);

  ColorField width(double? width);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ColorField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ColorField(...).copyWith(id: 12, name: "My name")
  /// ````
  ColorField call({
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

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfColorField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfColorField.copyWith.fieldName(...)`
class _$ColorFieldCWProxyImpl implements _$ColorFieldCWProxy {
  final ColorField _value;

  const _$ColorFieldCWProxyImpl(this._value);

  @override
  ColorField id(String? id) => this(id: id);

  @override
  ColorField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  ColorField name(String name) => this(name: name);

  @override
  ColorField showInList(bool showInList) => this(showInList: showInList);

  @override
  ColorField sort(int sort) => this(sort: sort);

  @override
  ColorField type(FieldType type) => this(type: type);

  @override
  ColorField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  ColorField width(double? width) => this(width: width);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ColorField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ColorField(...).copyWith(id: 12, name: "My name")
  /// ````
  ColorField call({
    Object? id = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
  }) {
    return ColorField(
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

extension $ColorFieldCopyWith on ColorField {
  /// Returns a callable class that can be used as follows: `instanceOfColorField.copyWith(...)` or like so:`instanceOfColorField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ColorFieldCWProxy get copyWith => _$ColorFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorField _$ColorFieldFromJson(Map<String, dynamic> json) => ColorField(
      name: json['name'] as String,
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      width: (json['width'] as num?)?.toDouble(),
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.colorField,
    );

Map<String, dynamic> _$ColorFieldToJson(ColorField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
      'width': instance.width,
      'type': _$FieldTypeEnumMap[instance.type]!,
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
