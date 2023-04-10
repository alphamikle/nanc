// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editor_state.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$EditorStateAutoequal on EditorState {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props =>
      [isLoading, markdownContent, contentType, isSyncedWithFile];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EditorStateCWProxy {
  EditorState isLoading(bool isLoading);

  EditorState markdownContent(String markdownContent);

  EditorState contentType(ScreenContentType contentType);

  EditorState isSyncedWithFile(bool isSyncedWithFile);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EditorState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EditorState(...).copyWith(id: 12, name: "My name")
  /// ````
  EditorState call({
    bool? isLoading,
    String? markdownContent,
    ScreenContentType? contentType,
    bool? isSyncedWithFile,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEditorState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEditorState.copyWith.fieldName(...)`
class _$EditorStateCWProxyImpl implements _$EditorStateCWProxy {
  const _$EditorStateCWProxyImpl(this._value);

  final EditorState _value;

  @override
  EditorState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  EditorState markdownContent(String markdownContent) =>
      this(markdownContent: markdownContent);

  @override
  EditorState contentType(ScreenContentType contentType) =>
      this(contentType: contentType);

  @override
  EditorState isSyncedWithFile(bool isSyncedWithFile) =>
      this(isSyncedWithFile: isSyncedWithFile);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EditorState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EditorState(...).copyWith(id: 12, name: "My name")
  /// ````
  EditorState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? markdownContent = const $CopyWithPlaceholder(),
    Object? contentType = const $CopyWithPlaceholder(),
    Object? isSyncedWithFile = const $CopyWithPlaceholder(),
  }) {
    return EditorState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      markdownContent: markdownContent == const $CopyWithPlaceholder() ||
              markdownContent == null
          ? _value.markdownContent
          // ignore: cast_nullable_to_non_nullable
          : markdownContent as String,
      contentType:
          contentType == const $CopyWithPlaceholder() || contentType == null
              ? _value.contentType
              // ignore: cast_nullable_to_non_nullable
              : contentType as ScreenContentType,
      isSyncedWithFile: isSyncedWithFile == const $CopyWithPlaceholder() ||
              isSyncedWithFile == null
          ? _value.isSyncedWithFile
          // ignore: cast_nullable_to_non_nullable
          : isSyncedWithFile as bool,
    );
  }
}

extension $EditorStateCopyWith on EditorState {
  /// Returns a callable class that can be used as follows: `instanceOfEditorState.copyWith(...)` or like so:`instanceOfEditorState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EditorStateCWProxy get copyWith => _$EditorStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditorState _$EditorStateFromJson(Map<String, dynamic> json) => EditorState(
      isLoading: json['isLoading'] as bool,
      markdownContent: json['markdownContent'] as String,
      contentType: $enumDecode(_$ScreenContentTypeEnumMap, json['contentType']),
      isSyncedWithFile: json['isSyncedWithFile'] as bool,
    );

Map<String, dynamic> _$EditorStateToJson(EditorState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'markdownContent': instance.markdownContent,
      'contentType': _$ScreenContentTypeEnumMap[instance.contentType]!,
      'isSyncedWithFile': instance.isSyncedWithFile,
    };

const _$ScreenContentTypeEnumMap = {
  ScreenContentType.scrollable: 'scrollable',
  ScreenContentType.stack: 'stack',
};
