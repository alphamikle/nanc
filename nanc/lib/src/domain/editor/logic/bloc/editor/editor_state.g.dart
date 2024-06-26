// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editor_state.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$EditorStateAutoequal on EditorState {
  List<Object?> get _$props => [
        isLoading,
        xmlContent,
        asyncMode,
        contentType,
        canChangeContentType,
        isSyncedWithFile,
        activeElement,
        activeTagRenderer,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EditorStateCWProxy {
  EditorState isLoading(bool isLoading);

  EditorState xmlContent(String xmlContent);

  EditorState asyncMode(bool asyncMode);

  EditorState contentType(ScreenContentType contentType);

  EditorState canChangeContentType(bool canChangeContentType);

  EditorState isSyncedWithFile(bool isSyncedWithFile);

  EditorState activeElement(MenuElement activeElement);

  EditorState activeTagRenderer(TagRenderer<Widget> activeTagRenderer);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EditorState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EditorState(...).copyWith(id: 12, name: "My name")
  /// ````
  EditorState call({
    bool? isLoading,
    String? xmlContent,
    bool? asyncMode,
    ScreenContentType? contentType,
    bool? canChangeContentType,
    bool? isSyncedWithFile,
    MenuElement? activeElement,
    TagRenderer<Widget>? activeTagRenderer,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEditorState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEditorState.copyWith.fieldName(...)`
class _$EditorStateCWProxyImpl implements _$EditorStateCWProxy {
  const _$EditorStateCWProxyImpl(this._value);

  final EditorState _value;

  @override
  EditorState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  EditorState xmlContent(String xmlContent) => this(xmlContent: xmlContent);

  @override
  EditorState asyncMode(bool asyncMode) => this(asyncMode: asyncMode);

  @override
  EditorState contentType(ScreenContentType contentType) =>
      this(contentType: contentType);

  @override
  EditorState canChangeContentType(bool canChangeContentType) =>
      this(canChangeContentType: canChangeContentType);

  @override
  EditorState isSyncedWithFile(bool isSyncedWithFile) =>
      this(isSyncedWithFile: isSyncedWithFile);

  @override
  EditorState activeElement(MenuElement activeElement) =>
      this(activeElement: activeElement);

  @override
  EditorState activeTagRenderer(TagRenderer<Widget> activeTagRenderer) =>
      this(activeTagRenderer: activeTagRenderer);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EditorState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EditorState(...).copyWith(id: 12, name: "My name")
  /// ````
  EditorState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? xmlContent = const $CopyWithPlaceholder(),
    Object? asyncMode = const $CopyWithPlaceholder(),
    Object? contentType = const $CopyWithPlaceholder(),
    Object? canChangeContentType = const $CopyWithPlaceholder(),
    Object? isSyncedWithFile = const $CopyWithPlaceholder(),
    Object? activeElement = const $CopyWithPlaceholder(),
    Object? activeTagRenderer = const $CopyWithPlaceholder(),
  }) {
    return EditorState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      xmlContent:
          xmlContent == const $CopyWithPlaceholder() || xmlContent == null
              ? _value.xmlContent
              // ignore: cast_nullable_to_non_nullable
              : xmlContent as String,
      asyncMode: asyncMode == const $CopyWithPlaceholder() || asyncMode == null
          ? _value.asyncMode
          // ignore: cast_nullable_to_non_nullable
          : asyncMode as bool,
      contentType:
          contentType == const $CopyWithPlaceholder() || contentType == null
              ? _value.contentType
              // ignore: cast_nullable_to_non_nullable
              : contentType as ScreenContentType,
      canChangeContentType:
          canChangeContentType == const $CopyWithPlaceholder() ||
                  canChangeContentType == null
              ? _value.canChangeContentType
              // ignore: cast_nullable_to_non_nullable
              : canChangeContentType as bool,
      isSyncedWithFile: isSyncedWithFile == const $CopyWithPlaceholder() ||
              isSyncedWithFile == null
          ? _value.isSyncedWithFile
          // ignore: cast_nullable_to_non_nullable
          : isSyncedWithFile as bool,
      activeElement:
          activeElement == const $CopyWithPlaceholder() || activeElement == null
              ? _value.activeElement
              // ignore: cast_nullable_to_non_nullable
              : activeElement as MenuElement,
      activeTagRenderer: activeTagRenderer == const $CopyWithPlaceholder() ||
              activeTagRenderer == null
          ? _value.activeTagRenderer
          // ignore: cast_nullable_to_non_nullable
          : activeTagRenderer as TagRenderer<Widget>,
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
      xmlContent: json['xmlContent'] as String,
      asyncMode: json['asyncMode'] as bool,
      contentType: $enumDecode(_$ScreenContentTypeEnumMap, json['contentType']),
      canChangeContentType: json['canChangeContentType'] as bool,
      isSyncedWithFile: json['isSyncedWithFile'] as bool,
      activeElement: MenuElement.fromJson(json['activeElement']),
      activeTagRenderer: _rendererFrom(json['activeTagRenderer']),
    );

Map<String, dynamic> _$EditorStateToJson(EditorState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'xmlContent': instance.xmlContent,
      'asyncMode': instance.asyncMode,
      'contentType': _$ScreenContentTypeEnumMap[instance.contentType]!,
      'canChangeContentType': instance.canChangeContentType,
      'isSyncedWithFile': instance.isSyncedWithFile,
      'activeElement': instance.activeElement.toJson(),
      'activeTagRenderer': _rendererTo(instance.activeTagRenderer),
    };

const _$ScreenContentTypeEnumMap = {
  ScreenContentType.scrollable: 'scrollable',
  ScreenContentType.stack: 'stack',
};
