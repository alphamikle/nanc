// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'string_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$StringFieldAutoequal on StringField {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [maxLines];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StringFieldCWProxy {
  StringField name(String name);

  StringField id(String? id);

  StringField showInList(bool showInList);

  StringField isRequired(bool isRequired);

  StringField sort(int sort);

  StringField width(double? width);

  StringField validator(String? Function(Object?)? validator);

  StringField maxLines(int? maxLines);

  StringField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StringField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StringField(...).copyWith(id: 12, name: "My name")
  /// ````
  StringField call({
    String? name,
    String? id,
    bool? showInList,
    bool? isRequired,
    int? sort,
    double? width,
    String? Function(Object?)? validator,
    int? maxLines,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStringField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStringField.copyWith.fieldName(...)`
class _$StringFieldCWProxyImpl implements _$StringFieldCWProxy {
  const _$StringFieldCWProxyImpl(this._value);

  final StringField _value;

  @override
  StringField name(String name) => this(name: name);

  @override
  StringField id(String? id) => this(id: id);

  @override
  StringField showInList(bool showInList) => this(showInList: showInList);

  @override
  StringField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  StringField sort(int sort) => this(sort: sort);

  @override
  StringField width(double? width) => this(width: width);

  @override
  StringField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  StringField maxLines(int? maxLines) => this(maxLines: maxLines);

  @override
  StringField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StringField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StringField(...).copyWith(id: 12, name: "My name")
  /// ````
  StringField call({
    Object? name = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? maxLines = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return StringField(
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
      maxLines: maxLines == const $CopyWithPlaceholder()
          ? _value.maxLines
          // ignore: cast_nullable_to_non_nullable
          : maxLines as int?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as FieldType,
    );
  }
}

extension $StringFieldCopyWith on StringField {
  /// Returns a callable class that can be used as follows: `instanceOfStringField.copyWith(...)` or like so:`instanceOfStringField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StringFieldCWProxy get copyWith => _$StringFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StringField _$StringFieldFromJson(Map<String, dynamic> json) => StringField(
      name: json['name'] as String,
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      width: (json['width'] as num?)?.toDouble(),
      maxLines: json['maxLines'] as int?,
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.stringField,
    );

Map<String, dynamic> _$StringFieldToJson(StringField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showInList': instance.showInList,
      'isRequired': instance.isRequired,
      'sort': instance.sort,
      'width': instance.width,
      'type': _$FieldTypeEnumMap[instance.type]!,
      'maxLines': instance.maxLines,
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
  FieldType.modelsSelectorField: 'modelsSelectorField',
  FieldType.titleFieldsField: 'titleFieldsField',
};
