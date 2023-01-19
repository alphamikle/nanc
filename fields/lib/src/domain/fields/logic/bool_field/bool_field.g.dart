// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bool_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BoolFieldCWProxy {
  BoolField defaultValue(bool defaultValue);

  BoolField id(String? id);

  BoolField isRequired(bool isRequired);

  BoolField name(String name);

  BoolField showInList(bool showInList);

  BoolField sort(int sort);

  BoolField type(FieldType type);

  BoolField validator(String? Function(Object?)? validator);

  BoolField width(double? width);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BoolField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BoolField(...).copyWith(id: 12, name: "My name")
  /// ````
  BoolField call({
    bool? defaultValue,
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

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBoolField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBoolField.copyWith.fieldName(...)`
class _$BoolFieldCWProxyImpl implements _$BoolFieldCWProxy {
  final BoolField _value;

  const _$BoolFieldCWProxyImpl(this._value);

  @override
  BoolField defaultValue(bool defaultValue) => this(defaultValue: defaultValue);

  @override
  BoolField id(String? id) => this(id: id);

  @override
  BoolField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  BoolField name(String name) => this(name: name);

  @override
  BoolField showInList(bool showInList) => this(showInList: showInList);

  @override
  BoolField sort(int sort) => this(sort: sort);

  @override
  BoolField type(FieldType type) => this(type: type);

  @override
  BoolField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  BoolField width(double? width) => this(width: width);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BoolField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BoolField(...).copyWith(id: 12, name: "My name")
  /// ````
  BoolField call({
    Object? defaultValue = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
  }) {
    return BoolField(
      defaultValue:
          defaultValue == const $CopyWithPlaceholder() || defaultValue == null
              ? _value.defaultValue
              // ignore: cast_nullable_to_non_nullable
              : defaultValue as bool,
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

extension $BoolFieldCopyWith on BoolField {
  /// Returns a callable class that can be used as follows: `instanceOfBoolField.copyWith(...)` or like so:`instanceOfBoolField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BoolFieldCWProxy get copyWith => _$BoolFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoolField _$BoolFieldFromJson(Map<String, dynamic> json) => BoolField(
      name: json['name'] as String,
      id: json['id'] as String?,
      defaultValue: json['defaultValue'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      showInList: json['showInList'] as bool? ?? true,
      sort: json['sort'] as int? ?? 0,
      width: (json['width'] as num?)?.toDouble(),
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.boolField,
    );

Map<String, dynamic> _$BoolFieldToJson(BoolField instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
      'width': instance.width,
      'type': _$FieldTypeEnumMap[instance.type]!,
      'defaultValue': instance.defaultValue,
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
