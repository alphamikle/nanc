// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_page_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ModelPageStateCWProxy {
  ModelPageState controllerMap(
      Map<String, TextEditingController> controllerMap);

  ModelPageState editableModel(Model editableModel);

  ModelPageState idWasChanged(bool idWasChanged);

  ModelPageState initialModel(Model initialModel);

  ModelPageState isSaving(bool isSaving);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ModelPageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ModelPageState(...).copyWith(id: 12, name: "My name")
  /// ````
  ModelPageState call({
    Map<String, TextEditingController>? controllerMap,
    Model? editableModel,
    bool? idWasChanged,
    Model? initialModel,
    bool? isSaving,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfModelPageState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfModelPageState.copyWith.fieldName(...)`
class _$ModelPageStateCWProxyImpl implements _$ModelPageStateCWProxy {
  final ModelPageState _value;

  const _$ModelPageStateCWProxyImpl(this._value);

  @override
  ModelPageState controllerMap(
          Map<String, TextEditingController> controllerMap) =>
      this(controllerMap: controllerMap);

  @override
  ModelPageState editableModel(Model editableModel) =>
      this(editableModel: editableModel);

  @override
  ModelPageState idWasChanged(bool idWasChanged) =>
      this(idWasChanged: idWasChanged);

  @override
  ModelPageState initialModel(Model initialModel) =>
      this(initialModel: initialModel);

  @override
  ModelPageState isSaving(bool isSaving) => this(isSaving: isSaving);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ModelPageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ModelPageState(...).copyWith(id: 12, name: "My name")
  /// ````
  ModelPageState call({
    Object? controllerMap = const $CopyWithPlaceholder(),
    Object? editableModel = const $CopyWithPlaceholder(),
    Object? idWasChanged = const $CopyWithPlaceholder(),
    Object? initialModel = const $CopyWithPlaceholder(),
    Object? isSaving = const $CopyWithPlaceholder(),
  }) {
    return ModelPageState(
      controllerMap:
          controllerMap == const $CopyWithPlaceholder() || controllerMap == null
              ? _value.controllerMap
              // ignore: cast_nullable_to_non_nullable
              : controllerMap as Map<String, TextEditingController>,
      editableModel:
          editableModel == const $CopyWithPlaceholder() || editableModel == null
              ? _value.editableModel
              // ignore: cast_nullable_to_non_nullable
              : editableModel as Model,
      idWasChanged:
          idWasChanged == const $CopyWithPlaceholder() || idWasChanged == null
              ? _value.idWasChanged
              // ignore: cast_nullable_to_non_nullable
              : idWasChanged as bool,
      initialModel:
          initialModel == const $CopyWithPlaceholder() || initialModel == null
              ? _value.initialModel
              // ignore: cast_nullable_to_non_nullable
              : initialModel as Model,
      isSaving: isSaving == const $CopyWithPlaceholder() || isSaving == null
          ? _value.isSaving
          // ignore: cast_nullable_to_non_nullable
          : isSaving as bool,
    );
  }
}

extension $ModelPageStateCopyWith on ModelPageState {
  /// Returns a callable class that can be used as follows: `instanceOfModelPageState.copyWith(...)` or like so:`instanceOfModelPageState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ModelPageStateCWProxy get copyWith => _$ModelPageStateCWProxyImpl(this);
}
