// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_list_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ModelListStateCWProxy {
  ModelListState collectionModels(List<Model> collectionModels);

  ModelListState hiddenModels(List<Model> hiddenModels);

  ModelListState isLoading(bool isLoading);

  ModelListState preloadedModels(List<Model> preloadedModels);

  ModelListState soloModels(List<Model> soloModels);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ModelListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ModelListState(...).copyWith(id: 12, name: "My name")
  /// ````
  ModelListState call({
    List<Model>? collectionModels,
    List<Model>? hiddenModels,
    bool? isLoading,
    List<Model>? preloadedModels,
    List<Model>? soloModels,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfModelListState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfModelListState.copyWith.fieldName(...)`
class _$ModelListStateCWProxyImpl implements _$ModelListStateCWProxy {
  final ModelListState _value;

  const _$ModelListStateCWProxyImpl(this._value);

  @override
  ModelListState collectionModels(List<Model> collectionModels) =>
      this(collectionModels: collectionModels);

  @override
  ModelListState hiddenModels(List<Model> hiddenModels) =>
      this(hiddenModels: hiddenModels);

  @override
  ModelListState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  ModelListState preloadedModels(List<Model> preloadedModels) =>
      this(preloadedModels: preloadedModels);

  @override
  ModelListState soloModels(List<Model> soloModels) =>
      this(soloModels: soloModels);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ModelListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ModelListState(...).copyWith(id: 12, name: "My name")
  /// ````
  ModelListState call({
    Object? collectionModels = const $CopyWithPlaceholder(),
    Object? hiddenModels = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? preloadedModels = const $CopyWithPlaceholder(),
    Object? soloModels = const $CopyWithPlaceholder(),
  }) {
    return ModelListState(
      collectionModels: collectionModels == const $CopyWithPlaceholder() ||
              collectionModels == null
          ? _value.collectionModels
          // ignore: cast_nullable_to_non_nullable
          : collectionModels as List<Model>,
      hiddenModels:
          hiddenModels == const $CopyWithPlaceholder() || hiddenModels == null
              ? _value.hiddenModels
              // ignore: cast_nullable_to_non_nullable
              : hiddenModels as List<Model>,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      preloadedModels: preloadedModels == const $CopyWithPlaceholder() ||
              preloadedModels == null
          ? _value.preloadedModels
          // ignore: cast_nullable_to_non_nullable
          : preloadedModels as List<Model>,
      soloModels:
          soloModels == const $CopyWithPlaceholder() || soloModels == null
              ? _value.soloModels
              // ignore: cast_nullable_to_non_nullable
              : soloModels as List<Model>,
    );
  }
}

extension $ModelListStateCopyWith on ModelListState {
  /// Returns a callable class that can be used as follows: `instanceOfModelListState.copyWith(...)` or like so:`instanceOfModelListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ModelListStateCWProxy get copyWith => _$ModelListStateCWProxyImpl(this);
}
