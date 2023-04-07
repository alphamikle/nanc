// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_field.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$HeaderFieldAutoequal on HeaderField {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props =>
      [content, contentIcon, contentColor, contentFontSize, useAsDivider];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HeaderFieldCWProxy {
  HeaderField name(String name);

  HeaderField content(String? content);

  HeaderField contentColor(Color? contentColor);

  HeaderField contentIcon(String? contentIcon);

  HeaderField contentFontSize(double? contentFontSize);

  HeaderField useAsDivider(bool useAsDivider);

  HeaderField id(String? id);

  HeaderField type(FieldType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HeaderField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HeaderField(...).copyWith(id: 12, name: "My name")
  /// ````
  HeaderField call({
    String? name,
    String? content,
    Color? contentColor,
    String? contentIcon,
    double? contentFontSize,
    bool? useAsDivider,
    String? id,
    FieldType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHeaderField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHeaderField.copyWith.fieldName(...)`
class _$HeaderFieldCWProxyImpl implements _$HeaderFieldCWProxy {
  const _$HeaderFieldCWProxyImpl(this._value);

  final HeaderField _value;

  @override
  HeaderField name(String name) => this(name: name);

  @override
  HeaderField content(String? content) => this(content: content);

  @override
  HeaderField contentColor(Color? contentColor) =>
      this(contentColor: contentColor);

  @override
  HeaderField contentIcon(String? contentIcon) =>
      this(contentIcon: contentIcon);

  @override
  HeaderField contentFontSize(double? contentFontSize) =>
      this(contentFontSize: contentFontSize);

  @override
  HeaderField useAsDivider(bool useAsDivider) =>
      this(useAsDivider: useAsDivider);

  @override
  HeaderField id(String? id) => this(id: id);

  @override
  HeaderField type(FieldType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HeaderField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HeaderField(...).copyWith(id: 12, name: "My name")
  /// ````
  HeaderField call({
    Object? name = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
    Object? contentColor = const $CopyWithPlaceholder(),
    Object? contentIcon = const $CopyWithPlaceholder(),
    Object? contentFontSize = const $CopyWithPlaceholder(),
    Object? useAsDivider = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return HeaderField(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      content: content == const $CopyWithPlaceholder()
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as String?,
      contentColor: contentColor == const $CopyWithPlaceholder()
          ? _value.contentColor
          // ignore: cast_nullable_to_non_nullable
          : contentColor as Color?,
      contentIcon: contentIcon == const $CopyWithPlaceholder()
          ? _value.contentIcon
          // ignore: cast_nullable_to_non_nullable
          : contentIcon as String?,
      contentFontSize: contentFontSize == const $CopyWithPlaceholder()
          ? _value.contentFontSize
          // ignore: cast_nullable_to_non_nullable
          : contentFontSize as double?,
      useAsDivider:
          useAsDivider == const $CopyWithPlaceholder() || useAsDivider == null
              ? _value.useAsDivider
              // ignore: cast_nullable_to_non_nullable
              : useAsDivider as bool,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as FieldType,
    );
  }
}

extension $HeaderFieldCopyWith on HeaderField {
  /// Returns a callable class that can be used as follows: `instanceOfHeaderField.copyWith(...)` or like so:`instanceOfHeaderField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HeaderFieldCWProxy get copyWith => _$HeaderFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeaderField _$HeaderFieldFromJson(Map<String, dynamic> json) => HeaderField(
      name: json['name'] as String,
      content: json['content'] as String?,
      contentColor: nullableColorFromJson(json['contentColor'] as String?),
      contentIcon: json['contentIcon'] as String?,
      contentFontSize:
          nullableDoubleFromJson(json['contentFontSize'] as String?),
      useAsDivider: json['useAsDivider'] as bool? ?? false,
      id: json['id'] as String?,
      type: $enumDecodeNullable(_$FieldTypeEnumMap, json['type']) ??
          FieldType.headerField,
    );

Map<String, dynamic> _$HeaderFieldToJson(HeaderField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$FieldTypeEnumMap[instance.type]!,
      'content': instance.content,
      'contentIcon': instance.contentIcon,
      'contentColor': colorToJson(instance.contentColor),
      'contentFontSize': instance.contentFontSize,
      'useAsDivider': instance.useAsDivider,
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
