// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preview_state.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$PreviewStateAutoequal on PreviewState {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [isLoading, xmlContent, contentType];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PreviewStateCWProxy {
  PreviewState isLoading(bool isLoading);

  PreviewState xmlContent(String xmlContent);

  PreviewState contentType(ScreenContentType contentType);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PreviewState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PreviewState(...).copyWith(id: 12, name: "My name")
  /// ````
  PreviewState call({
    bool? isLoading,
    String? xmlContent,
    ScreenContentType? contentType,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPreviewState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPreviewState.copyWith.fieldName(...)`
class _$PreviewStateCWProxyImpl implements _$PreviewStateCWProxy {
  const _$PreviewStateCWProxyImpl(this._value);

  final PreviewState _value;

  @override
  PreviewState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  PreviewState xmlContent(String xmlContent) => this(xmlContent: xmlContent);

  @override
  PreviewState contentType(ScreenContentType contentType) =>
      this(contentType: contentType);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PreviewState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PreviewState(...).copyWith(id: 12, name: "My name")
  /// ````
  PreviewState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? xmlContent = const $CopyWithPlaceholder(),
    Object? contentType = const $CopyWithPlaceholder(),
  }) {
    return PreviewState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      xmlContent:
          xmlContent == const $CopyWithPlaceholder() || xmlContent == null
              ? _value.xmlContent
              // ignore: cast_nullable_to_non_nullable
              : xmlContent as String,
      contentType:
          contentType == const $CopyWithPlaceholder() || contentType == null
              ? _value.contentType
              // ignore: cast_nullable_to_non_nullable
              : contentType as ScreenContentType,
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
      xmlContent: json['xmlContent'] as String,
      contentType: $enumDecode(_$ScreenContentTypeEnumMap, json['contentType']),
    );

Map<String, dynamic> _$PreviewStateToJson(PreviewState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'xmlContent': instance.xmlContent,
      'contentType': _$ScreenContentTypeEnumMap[instance.contentType]!,
    };

const _$ScreenContentTypeEnumMap = {
  ScreenContentType.scrollable: 'scrollable',
  ScreenContentType.stack: 'stack',
};
