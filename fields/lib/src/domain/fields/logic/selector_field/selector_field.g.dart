// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selector_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$SelectorFieldAutoequal on SelectorField {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [virtualField, model, titleFields];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SelectorFieldCWProxy {
  SelectorField name(String name);

  SelectorField model(Model model);

  SelectorField titleFields(List<TitleField> titleFields);

  SelectorField virtualField(String? virtualField);

  SelectorField id(String? id);

  SelectorField showInList(bool showInList);

  SelectorField isRequired(bool isRequired);

  SelectorField sort(int sort);

  SelectorField width(double? width);

  SelectorField validator(String? Function(Object?)? validator);

  SelectorField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SelectorField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SelectorField(...).copyWith(id: 12, name: "My name")
  /// ````
  SelectorField call({
    String? name,
    Model? model,
    List<TitleField>? titleFields,
    String? virtualField,
    String? id,
    bool? showInList,
    bool? isRequired,
    int? sort,
    double? width,
    String? Function(Object?)? validator,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSelectorField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSelectorField.copyWith.fieldName(...)`
class _$SelectorFieldCWProxyImpl implements _$SelectorFieldCWProxy {
  const _$SelectorFieldCWProxyImpl(this._value);

  final SelectorField _value;

  @override
  SelectorField name(String name) => this(name: name);

  @override
  SelectorField model(Model model) => this(model: model);

  @override
  SelectorField titleFields(List<TitleField> titleFields) =>
      this(titleFields: titleFields);

  @override
  SelectorField virtualField(String? virtualField) =>
      this(virtualField: virtualField);

  @override
  SelectorField id(String? id) => this(id: id);

  @override
  SelectorField showInList(bool showInList) => this(showInList: showInList);

  @override
  SelectorField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  SelectorField sort(int sort) => this(sort: sort);

  @override
  SelectorField width(double? width) => this(width: width);

  @override
  SelectorField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  SelectorField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SelectorField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SelectorField(...).copyWith(id: 12, name: "My name")
  /// ````
  SelectorField call({
    Object? name = const $CopyWithPlaceholder(),
    Object? model = const $CopyWithPlaceholder(),
    Object? titleFields = const $CopyWithPlaceholder(),
    Object? virtualField = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return SelectorField(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      model: model == const $CopyWithPlaceholder() || model == null
          ? _value.model
          // ignore: cast_nullable_to_non_nullable
          : model as Model,
      titleFields:
          titleFields == const $CopyWithPlaceholder() || titleFields == null
              ? _value.titleFields
              // ignore: cast_nullable_to_non_nullable
              : titleFields as List<TitleField>,
      virtualField: virtualField == const $CopyWithPlaceholder()
          ? _value.virtualField
          // ignore: cast_nullable_to_non_nullable
          : virtualField as String?,
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
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as FieldType,
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
      model: Model.fromJson(json['model']),
      titleFields: titleFieldsFromJson(json['titleFields']),
      virtualField: json['virtualField'] as String?,
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? false,
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
      'virtualField': instance.virtualField,
      'model': instance.model.toJson(),
      'titleFields': titleFieldsToJson(instance.titleFields),
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
