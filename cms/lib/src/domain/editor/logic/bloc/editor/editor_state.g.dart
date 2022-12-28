// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editor_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EditorStateCWProxy {
  EditorState isLoading(bool isLoading);

  EditorState isSyncedWithFile(bool isSyncedWithFile);

  EditorState markdownContent(String markdownContent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EditorState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EditorState(...).copyWith(id: 12, name: "My name")
  /// ````
  EditorState call({
    bool? isLoading,
    bool? isSyncedWithFile,
    String? markdownContent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEditorState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEditorState.copyWith.fieldName(...)`
class _$EditorStateCWProxyImpl implements _$EditorStateCWProxy {
  final EditorState _value;

  const _$EditorStateCWProxyImpl(this._value);

  @override
  EditorState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  EditorState isSyncedWithFile(bool isSyncedWithFile) =>
      this(isSyncedWithFile: isSyncedWithFile);

  @override
  EditorState markdownContent(String markdownContent) =>
      this(markdownContent: markdownContent);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EditorState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EditorState(...).copyWith(id: 12, name: "My name")
  /// ````
  EditorState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? isSyncedWithFile = const $CopyWithPlaceholder(),
    Object? markdownContent = const $CopyWithPlaceholder(),
  }) {
    return EditorState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      isSyncedWithFile: isSyncedWithFile == const $CopyWithPlaceholder() ||
              isSyncedWithFile == null
          ? _value.isSyncedWithFile
          // ignore: cast_nullable_to_non_nullable
          : isSyncedWithFile as bool,
      markdownContent: markdownContent == const $CopyWithPlaceholder() ||
              markdownContent == null
          ? _value.markdownContent
          // ignore: cast_nullable_to_non_nullable
          : markdownContent as String,
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
      isSyncedWithFile: json['isSyncedWithFile'] as bool,
    );

Map<String, dynamic> _$EditorStateToJson(EditorState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'markdownContent': instance.markdownContent,
      'isSyncedWithFile': instance.isSyncedWithFile,
    };
