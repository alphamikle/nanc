// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PageStateCWProxy {
  PageState isConnectedToTheBackend(bool isConnectedToTheBackend);

  PageState isConnectingToTheBackend(bool isConnectingToTheBackend);

  PageState isLoading(bool isLoading);

  PageState pageData(Map<String, dynamic> pageData);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PageState(...).copyWith(id: 12, name: "My name")
  /// ````
  PageState call({
    bool? isConnectedToTheBackend,
    bool? isConnectingToTheBackend,
    bool? isLoading,
    Map<String, dynamic>? pageData,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPageState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPageState.copyWith.fieldName(...)`
class _$PageStateCWProxyImpl implements _$PageStateCWProxy {
  final PageState _value;

  const _$PageStateCWProxyImpl(this._value);

  @override
  PageState isConnectedToTheBackend(bool isConnectedToTheBackend) =>
      this(isConnectedToTheBackend: isConnectedToTheBackend);

  @override
  PageState isConnectingToTheBackend(bool isConnectingToTheBackend) =>
      this(isConnectingToTheBackend: isConnectingToTheBackend);

  @override
  PageState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  PageState pageData(Map<String, dynamic> pageData) => this(pageData: pageData);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PageState(...).copyWith(id: 12, name: "My name")
  /// ````
  PageState call({
    Object? isConnectedToTheBackend = const $CopyWithPlaceholder(),
    Object? isConnectingToTheBackend = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? pageData = const $CopyWithPlaceholder(),
  }) {
    return PageState(
      isConnectedToTheBackend:
          isConnectedToTheBackend == const $CopyWithPlaceholder() ||
                  isConnectedToTheBackend == null
              ? _value.isConnectedToTheBackend
              // ignore: cast_nullable_to_non_nullable
              : isConnectedToTheBackend as bool,
      isConnectingToTheBackend:
          isConnectingToTheBackend == const $CopyWithPlaceholder() ||
                  isConnectingToTheBackend == null
              ? _value.isConnectingToTheBackend
              // ignore: cast_nullable_to_non_nullable
              : isConnectingToTheBackend as bool,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      pageData: pageData == const $CopyWithPlaceholder() || pageData == null
          ? _value.pageData
          // ignore: cast_nullable_to_non_nullable
          : pageData as Map<String, dynamic>,
    );
  }
}

extension $PageStateCopyWith on PageState {
  /// Returns a callable class that can be used as follows: `instanceOfPageState.copyWith(...)` or like so:`instanceOfPageState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PageStateCWProxy get copyWith => _$PageStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageState _$PageStateFromJson(Map<String, dynamic> json) => PageState(
      isLoading: json['isLoading'] as bool,
      isConnectingToTheBackend: json['isConnectingToTheBackend'] as bool,
      isConnectedToTheBackend: json['isConnectedToTheBackend'] as bool,
      pageData: json['pageData'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$PageStateToJson(PageState instance) => <String, dynamic>{
      'isLoading': instance.isLoading,
      'isConnectingToTheBackend': instance.isConnectingToTheBackend,
      'isConnectedToTheBackend': instance.isConnectedToTheBackend,
      'pageData': instance.pageData,
    };
