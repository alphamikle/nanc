// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_list_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ModelListStateCWProxy {
  ModelListState preloadedModels(List<Model> preloadedModels);

  ModelListState collectionModels(List<Model> collectionModels);

  ModelListState soloModels(List<Model> soloModels);

  ModelListState hiddenModels(List<Model> hiddenModels);

  ModelListState isLoading(bool isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ModelListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ModelListState(...).copyWith(id: 12, name: "My name")
  /// ````
  ModelListState call({
    List<Model>? preloadedModels,
    List<Model>? collectionModels,
    List<Model>? soloModels,
    List<Model>? hiddenModels,
    bool? isLoading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfModelListState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfModelListState.copyWith.fieldName(...)`
class _$ModelListStateCWProxyImpl implements _$ModelListStateCWProxy {
  const _$ModelListStateCWProxyImpl(this._value);

  final ModelListState _value;

  @override
  ModelListState preloadedModels(List<Model> preloadedModels) =>
      this(preloadedModels: preloadedModels);

  @override
  ModelListState collectionModels(List<Model> collectionModels) =>
      this(collectionModels: collectionModels);

  @override
  ModelListState soloModels(List<Model> soloModels) =>
      this(soloModels: soloModels);

  @override
  ModelListState hiddenModels(List<Model> hiddenModels) =>
      this(hiddenModels: hiddenModels);

  @override
  ModelListState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ModelListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ModelListState(...).copyWith(id: 12, name: "My name")
  /// ````
  ModelListState call({
    Object? preloadedModels = const $CopyWithPlaceholder(),
    Object? collectionModels = const $CopyWithPlaceholder(),
    Object? soloModels = const $CopyWithPlaceholder(),
    Object? hiddenModels = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return ModelListState(
      preloadedModels: preloadedModels == const $CopyWithPlaceholder() ||
              preloadedModels == null
          ? _value.preloadedModels
          // ignore: cast_nullable_to_non_nullable
          : preloadedModels as List<Model>,
      collectionModels: collectionModels == const $CopyWithPlaceholder() ||
              collectionModels == null
          ? _value.collectionModels
          // ignore: cast_nullable_to_non_nullable
          : collectionModels as List<Model>,
      soloModels:
          soloModels == const $CopyWithPlaceholder() || soloModels == null
              ? _value.soloModels
              // ignore: cast_nullable_to_non_nullable
              : soloModels as List<Model>,
      hiddenModels:
          hiddenModels == const $CopyWithPlaceholder() || hiddenModels == null
              ? _value.hiddenModels
              // ignore: cast_nullable_to_non_nullable
              : hiddenModels as List<Model>,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
    );
  }
}

extension $ModelListStateCopyWith on ModelListState {
  /// Returns a callable class that can be used as follows: `instanceOfModelListState.copyWith(...)` or like so:`instanceOfModelListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ModelListStateCWProxy get copyWith => _$ModelListStateCWProxyImpl(this);
}
