// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_selector_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$ModelsSelectorFieldAutoequal on ModelsSelectorField {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ModelsSelectorFieldCWProxy {
  ModelsSelectorField name(String name);

  ModelsSelectorField id(String? id);

  ModelsSelectorField showInList(bool showInList);

  ModelsSelectorField isRequired(bool isRequired);

  ModelsSelectorField sort(int sort);

  ModelsSelectorField validator(String? Function(Object?)? validator);

  ModelsSelectorField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ModelsSelectorField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ModelsSelectorField(...).copyWith(id: 12, name: "My name")
  /// ````
  ModelsSelectorField call({
    String? name,
    String? id,
    bool? showInList,
    bool? isRequired,
    int? sort,
    String? Function(Object?)? validator,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfModelsSelectorField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfModelsSelectorField.copyWith.fieldName(...)`
class _$ModelsSelectorFieldCWProxyImpl implements _$ModelsSelectorFieldCWProxy {
  const _$ModelsSelectorFieldCWProxyImpl(this._value);

  final ModelsSelectorField _value;

  @override
  ModelsSelectorField name(String name) => this(name: name);

  @override
  ModelsSelectorField id(String? id) => this(id: id);

  @override
  ModelsSelectorField showInList(bool showInList) =>
      this(showInList: showInList);

  @override
  ModelsSelectorField isRequired(bool isRequired) =>
      this(isRequired: isRequired);

  @override
  ModelsSelectorField sort(int sort) => this(sort: sort);

  @override
  ModelsSelectorField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  ModelsSelectorField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ModelsSelectorField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ModelsSelectorField(...).copyWith(id: 12, name: "My name")
  /// ````
  ModelsSelectorField call({
    Object? name = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return ModelsSelectorField(
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

extension $ModelsSelectorFieldCopyWith on ModelsSelectorField {
  /// Returns a callable class that can be used as follows: `instanceOfModelsSelectorField.copyWith(...)` or like so:`instanceOfModelsSelectorField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ModelsSelectorFieldCWProxy get copyWith =>
      _$ModelsSelectorFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelsSelectorField _$ModelsSelectorFieldFromJson(Map<String, dynamic> json) =>
    ModelsSelectorField(
      name: json['name'] as String,
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.modelsSelectorField,
    );

Map<String, dynamic> _$ModelsSelectorFieldToJson(
        ModelsSelectorField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
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
  FieldType.queryFilterField: 'queryFilterField',
  FieldType.queryFilterValueField: 'queryFilterValueField',
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
  FieldType.titleFieldsField: 'titleFieldsField',
};
