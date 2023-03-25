// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preview_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PreviewStateCWProxy {
  PreviewState isLoading(bool isLoading);

  PreviewState markdownContent(String markdownContent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PreviewState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PreviewState(...).copyWith(id: 12, name: "My name")
  /// ````
  PreviewState call({
    bool? isLoading,
    String? markdownContent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPreviewState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPreviewState.copyWith.fieldName(...)`
class _$PreviewStateCWProxyImpl implements _$PreviewStateCWProxy {
  const _$PreviewStateCWProxyImpl(this._value);

  final PreviewState _value;

  @override
  PreviewState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  PreviewState markdownContent(String markdownContent) =>
      this(markdownContent: markdownContent);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PreviewState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PreviewState(...).copyWith(id: 12, name: "My name")
  /// ````
  PreviewState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? markdownContent = const $CopyWithPlaceholder(),
  }) {
    return PreviewState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      markdownContent: markdownContent == const $CopyWithPlaceholder() ||
              markdownContent == null
          ? _value.markdownContent
          // ignore: cast_nullable_to_non_nullable
          : markdownContent as String,
    );
  }
}

extension $PreviewStateCopyWith on PreviewState {
  /// Returns a callable class that can be used as follows: `instanceOfPreviewState.copyWith(...)` or like so:`instanceOfPreviewState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PreviewStateCWProxy get copyWith => _$PreviewStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreviewState _$PreviewStateFromJson(Map<String, dynamic> json) => PreviewState(
      isLoading: json['isLoading'] as bool,
      markdownContent: json['markdownContent'] as String,
    );

Map<String, dynamic> _$PreviewStateToJson(PreviewState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'markdownContent': instance.markdownContent,
    };
