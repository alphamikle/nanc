// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_content_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ScreenContentModelCWProxy {
  ScreenContentModel content(String content);

  ScreenContentModel contentType(ScreenContentType contentType);

  ScreenContentModel fieldType(String fieldType);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScreenContentModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScreenContentModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ScreenContentModel call({
    String? content,
    ScreenContentType? contentType,
    String? fieldType,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfScreenContentModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfScreenContentModel.copyWith.fieldName(...)`
class _$ScreenContentModelCWProxyImpl implements _$ScreenContentModelCWProxy {
  const _$ScreenContentModelCWProxyImpl(this._value);

  final ScreenContentModel _value;

  @override
  ScreenContentModel content(String content) => this(content: content);

  @override
  ScreenContentModel contentType(ScreenContentType contentType) =>
      this(contentType: contentType);

  @override
  ScreenContentModel fieldType(String fieldType) => this(fieldType: fieldType);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScreenContentModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScreenContentModel(...).copyWith(id: 12, name: "My name")
  /// ````
  ScreenContentModel call({
    Object? content = const $CopyWithPlaceholder(),
    Object? contentType = const $CopyWithPlaceholder(),
    Object? fieldType = const $CopyWithPlaceholder(),
  }) {
    return ScreenContentModel(
      content: content == const $CopyWithPlaceholder() || content == null
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as String,
      contentType:
          contentType == const $CopyWithPlaceholder() || contentType == null
              ? _value.contentType
              // ignore: cast_nullable_to_non_nullable
              : contentType as ScreenContentType,
      fieldType: fieldType == const $CopyWithPlaceholder() || fieldType == null
          ? _value.fieldType
          // ignore: cast_nullable_to_non_nullable
          : fieldType as String,
    );
  }
}

extension $ScreenContentModelCopyWith on ScreenContentModel {
  /// Returns a callable class that can be used as follows: `instanceOfScreenContentModel.copyWith(...)` or like so:`instanceOfScreenContentModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ScreenContentModelCWProxy get copyWith =>
      _$ScreenContentModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenContentModel _$ScreenContentModelFromJson(Map<String, dynamic> json) =>
    ScreenContentModel(
      content: json['content'] as String,
      contentType: $enumDecode(_$ScreenContentTypeEnumMap, json['contentType']),
      fieldType: json['fieldType'] == null
          ? _fieldType
          : _fieldTypeFromJson(json['fieldType']),
    );

Map<String, dynamic> _$ScreenContentModelToJson(ScreenContentModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'contentType': _$ScreenContentTypeEnumMap[instance.contentType]!,
      'fieldType': _fieldTypeToJson(instance.fieldType),
    };

const _$ScreenContentTypeEnumMap = {
  ScreenContentType.scrollable: 'scrollable',
  ScreenContentType.freeform: 'freeform',
};
