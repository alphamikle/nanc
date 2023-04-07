// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manual_state.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$ManualStateAutoequal on ManualState {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [activeElement, activeTagRenderer];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ManualStateCWProxy {
  ManualState isLoading(bool isLoading);

  ManualState markdownContent(String markdownContent);

  ManualState activeElement(MenuElement activeElement);

  ManualState activeTagRenderer(TagRenderer activeTagRenderer);

  ManualState isSyncedWithFile(bool isSyncedWithFile);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ManualState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ManualState(...).copyWith(id: 12, name: "My name")
  /// ````
  ManualState call({
    bool? isLoading,
    String? markdownContent,
    MenuElement? activeElement,
    TagRenderer? activeTagRenderer,
    bool? isSyncedWithFile,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfManualState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfManualState.copyWith.fieldName(...)`
class _$ManualStateCWProxyImpl implements _$ManualStateCWProxy {
  const _$ManualStateCWProxyImpl(this._value);

  final ManualState _value;

  @override
  ManualState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  ManualState markdownContent(String markdownContent) =>
      this(markdownContent: markdownContent);

  @override
  ManualState activeElement(MenuElement activeElement) =>
      this(activeElement: activeElement);

  @override
  ManualState activeTagRenderer(TagRenderer activeTagRenderer) =>
      this(activeTagRenderer: activeTagRenderer);

  @override
  ManualState isSyncedWithFile(bool isSyncedWithFile) =>
      this(isSyncedWithFile: isSyncedWithFile);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ManualState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ManualState(...).copyWith(id: 12, name: "My name")
  /// ````
  ManualState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? markdownContent = const $CopyWithPlaceholder(),
    Object? activeElement = const $CopyWithPlaceholder(),
    Object? activeTagRenderer = const $CopyWithPlaceholder(),
    Object? isSyncedWithFile = const $CopyWithPlaceholder(),
  }) {
    return ManualState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      markdownContent: markdownContent == const $CopyWithPlaceholder() ||
              markdownContent == null
          ? _value.markdownContent
          // ignore: cast_nullable_to_non_nullable
          : markdownContent as String,
      activeElement:
          activeElement == const $CopyWithPlaceholder() || activeElement == null
              ? _value.activeElement
              // ignore: cast_nullable_to_non_nullable
              : activeElement as MenuElement,
      activeTagRenderer: activeTagRenderer == const $CopyWithPlaceholder() ||
              activeTagRenderer == null
          ? _value.activeTagRenderer
          // ignore: cast_nullable_to_non_nullable
          : activeTagRenderer as TagRenderer,
      isSyncedWithFile: isSyncedWithFile == const $CopyWithPlaceholder() ||
              isSyncedWithFile == null
          ? _value.isSyncedWithFile
          // ignore: cast_nullable_to_non_nullable
          : isSyncedWithFile as bool,
    );
  }
}

extension $ManualStateCopyWith on ManualState {
  /// Returns a callable class that can be used as follows: `instanceOfManualState.copyWith(...)` or like so:`instanceOfManualState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ManualStateCWProxy get copyWith => _$ManualStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManualState _$ManualStateFromJson(Map<String, dynamic> json) => ManualState(
      isLoading: json['isLoading'] as bool,
      markdownContent: json['markdownContent'] as String,
      activeElement: MenuElement.fromJson(json['activeElement']),
      activeTagRenderer: _rendererFrom(json['activeTagRenderer']),
      isSyncedWithFile: json['isSyncedWithFile'] as bool,
    );

Map<String, dynamic> _$ManualStateToJson(ManualState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'markdownContent': instance.markdownContent,
      'isSyncedWithFile': instance.isSyncedWithFile,
      'activeElement': instance.activeElement.toJson(),
      'activeTagRenderer': _rendererTo(instance.activeTagRenderer),
    };
