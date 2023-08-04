// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'font_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$FontFieldAutoequal on FontField {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FontFieldCWProxy {
  FontField name(String name);

  FontField id(String? id);

  FontField showInList(bool showInList);

  FontField isRequired(bool isRequired);

  FontField sort(int sort);

  FontField validator(String? Function(Object?)? validator);

  FontField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FontField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FontField(...).copyWith(id: 12, name: "My name")
  /// ````
  FontField call({
    String? name,
    String? id,
    bool? showInList,
    bool? isRequired,
    int? sort,
    String? Function(Object?)? validator,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFontField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFontField.copyWith.fieldName(...)`
class _$FontFieldCWProxyImpl implements _$FontFieldCWProxy {
  const _$FontFieldCWProxyImpl(this._value);

  final FontField _value;

  @override
  FontField name(String name) => this(name: name);

  @override
  FontField id(String? id) => this(id: id);

  @override
  FontField showInList(bool showInList) => this(showInList: showInList);

  @override
  FontField isRequired(bool isRequired) => this(isRequired: isRequired);

  @override
  FontField sort(int sort) => this(sort: sort);

  @override
  FontField validator(String? Function(Object?)? validator) =>
      this(validator: validator);

  @override
  FontField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FontField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FontField(...).copyWith(id: 12, name: "My name")
  /// ````
  FontField call({
    Object? name = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? showInList = const $CopyWithPlaceholder(),
    Object? isRequired = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
    Object? validator = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return FontField(
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

extension $FontFieldCopyWith on FontField {
  /// Returns a callable class that can be used as follows: `instanceOfFontField.copyWith(...)` or like so:`instanceOfFontField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FontFieldCWProxy get copyWith => _$FontFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FontField _$FontFieldFromJson(Map<String, dynamic> json) => FontField(
      name: json['name'] as String,
      id: json['id'] as String?,
      showInList: json['showInList'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      sort: json['sort'] as int? ?? 0,
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.fontField,
    );

Map<String, dynamic> _$FontFieldToJson(FontField instance) => <String, dynamic>{
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
