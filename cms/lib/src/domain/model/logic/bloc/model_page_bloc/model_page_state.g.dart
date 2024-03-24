// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_page_state.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$ModelPageStateAutoequal on ModelPageState {
  List<Object?> get _$props => [
        editableModel,
        initialModel,
        controllerMap,
        idWasChanged,
        isSaving,
        isDeleting,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ModelPageStateCWProxy {
  ModelPageState editableModel(Model editableModel);

  ModelPageState initialModel(Model initialModel);

  ModelPageState controllerMap(
      Map<String, TextEditingController> controllerMap);

  ModelPageState idWasChanged(bool idWasChanged);

  ModelPageState isSaving(bool isSaving);

  ModelPageState isDeleting(bool isDeleting);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ModelPageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ModelPageState(...).copyWith(id: 12, name: "My name")
  /// ````
  ModelPageState call({
    Model? editableModel,
    Model? initialModel,
    Map<String, TextEditingController>? controllerMap,
    bool? idWasChanged,
    bool? isSaving,
    bool? isDeleting,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfModelPageState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfModelPageState.copyWith.fieldName(...)`
class _$ModelPageStateCWProxyImpl implements _$ModelPageStateCWProxy {
  const _$ModelPageStateCWProxyImpl(this._value);

  final ModelPageState _value;

  @override
  ModelPageState editableModel(Model editableModel) =>
      this(editableModel: editableModel);

  @override
  ModelPageState initialModel(Model initialModel) =>
      this(initialModel: initialModel);

  @override
  ModelPageState controllerMap(
          Map<String, TextEditingController> controllerMap) =>
      this(controllerMap: controllerMap);

  @override
  ModelPageState idWasChanged(bool idWasChanged) =>
      this(idWasChanged: idWasChanged);

  @override
  ModelPageState isSaving(bool isSaving) => this(isSaving: isSaving);

  @override
  ModelPageState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ModelPageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ModelPageState(...).copyWith(id: 12, name: "My name")
  /// ````
  ModelPageState call({
    Object? editableModel = const $CopyWithPlaceholder(),
    Object? initialModel = const $CopyWithPlaceholder(),
    Object? controllerMap = const $CopyWithPlaceholder(),
    Object? idWasChanged = const $CopyWithPlaceholder(),
    Object? isSaving = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
  }) {
    return ModelPageState(
      editableModel:
          editableModel == const $CopyWithPlaceholder() || editableModel == null
              ? _value.editableModel
              // ignore: cast_nullable_to_non_nullable
              : editableModel as Model,
      initialModel:
          initialModel == const $CopyWithPlaceholder() || initialModel == null
              ? _value.initialModel
              // ignore: cast_nullable_to_non_nullable
              : initialModel as Model,
      controllerMap:
          controllerMap == const $CopyWithPlaceholder() || controllerMap == null
              ? _value.controllerMap
              // ignore: cast_nullable_to_non_nullable
              : controllerMap as Map<String, TextEditingController>,
      idWasChanged:
          idWasChanged == const $CopyWithPlaceholder() || idWasChanged == null
              ? _value.idWasChanged
              // ignore: cast_nullable_to_non_nullable
              : idWasChanged as bool,
      isSaving: isSaving == const $CopyWithPlaceholder() || isSaving == null
          ? _value.isSaving
          // ignore: cast_nullable_to_non_nullable
          : isSaving as bool,
      isDeleting:
          isDeleting == const $CopyWithPlaceholder() || isDeleting == null
              ? _value.isDeleting
              // ignore: cast_nullable_to_non_nullable
              : isDeleting as bool,
    );
  }
}

extension $ModelPageStateCopyWith on ModelPageState {
  /// Returns a callable class that can be used as follows: `instanceOfModelPageState.copyWith(...)` or like so:`instanceOfModelPageState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ModelPageStateCWProxy get copyWith => _$ModelPageStateCWProxyImpl(this);
}
