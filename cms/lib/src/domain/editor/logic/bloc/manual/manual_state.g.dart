// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manual_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ManualStateCWProxy {
  ManualState activeElement(MenuElement activeElement);

  ManualState isLoading(bool isLoading);

  ManualState isSyncedWithFile(bool isSyncedWithFile);

  ManualState markdownContent(String markdownContent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ManualState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ManualState(...).copyWith(id: 12, name: "My name")
  /// ````
  ManualState call({
    MenuElement? activeElement,
    bool? isLoading,
    bool? isSyncedWithFile,
    String? markdownContent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfManualState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfManualState.copyWith.fieldName(...)`
class _$ManualStateCWProxyImpl implements _$ManualStateCWProxy {
  final ManualState _value;

  const _$ManualStateCWProxyImpl(this._value);

  @override
  ManualState activeElement(MenuElement activeElement) =>
      this(activeElement: activeElement);

  @override
  ManualState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  ManualState isSyncedWithFile(bool isSyncedWithFile) =>
      this(isSyncedWithFile: isSyncedWithFile);

  @override
  ManualState markdownContent(String markdownContent) =>
      this(markdownContent: markdownContent);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ManualState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ManualState(...).copyWith(id: 12, name: "My name")
  /// ````
  ManualState call({
    Object? activeElement = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? isSyncedWithFile = const $CopyWithPlaceholder(),
    Object? markdownContent = const $CopyWithPlaceholder(),
  }) {
    return ManualState(
      activeElement:
          activeElement == const $CopyWithPlaceholder() || activeElement == null
              ? _value.activeElement
              // ignore: cast_nullable_to_non_nullable
              : activeElement as MenuElement,
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
      isSyncedWithFile: json['isSyncedWithFile'] as bool,
    );

Map<String, dynamic> _$ManualStateToJson(ManualState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'markdownContent': instance.markdownContent,
      'isSyncedWithFile': instance.isSyncedWithFile,
      'activeElement': instance.activeElement.toJson(),
    };
