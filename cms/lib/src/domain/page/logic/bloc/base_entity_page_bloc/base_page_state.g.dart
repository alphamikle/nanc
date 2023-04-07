// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_page_state.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$BaseEntityPageStateAutoequal on BaseEntityPageState {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props =>
      [data, initialData, isLoading, isSaving, isDeleting, controllerMap];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BaseEntityPageStateCWProxy {
  BaseEntityPageState data(Map<String, dynamic> data);

  BaseEntityPageState initialData(Map<String, dynamic> initialData);

  BaseEntityPageState isLoading(bool isLoading);

  BaseEntityPageState isDeleting(bool isDeleting);

  BaseEntityPageState isSaving(bool isSaving);

  BaseEntityPageState controllerMap(
      Map<String, TextEditingController> controllerMap);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseEntityPageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseEntityPageState(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseEntityPageState call({
    Map<String, dynamic>? data,
    Map<String, dynamic>? initialData,
    bool? isLoading,
    bool? isDeleting,
    bool? isSaving,
    Map<String, TextEditingController>? controllerMap,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBaseEntityPageState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBaseEntityPageState.copyWith.fieldName(...)`
class _$BaseEntityPageStateCWProxyImpl implements _$BaseEntityPageStateCWProxy {
  const _$BaseEntityPageStateCWProxyImpl(this._value);

  final BaseEntityPageState _value;

  @override
  BaseEntityPageState data(Map<String, dynamic> data) => this(data: data);

  @override
  BaseEntityPageState initialData(Map<String, dynamic> initialData) =>
      this(initialData: initialData);

  @override
  BaseEntityPageState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  BaseEntityPageState isDeleting(bool isDeleting) =>
      this(isDeleting: isDeleting);

  @override
  BaseEntityPageState isSaving(bool isSaving) => this(isSaving: isSaving);

  @override
  BaseEntityPageState controllerMap(
          Map<String, TextEditingController> controllerMap) =>
      this(controllerMap: controllerMap);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseEntityPageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseEntityPageState(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseEntityPageState call({
    Object? data = const $CopyWithPlaceholder(),
    Object? initialData = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? isSaving = const $CopyWithPlaceholder(),
    Object? controllerMap = const $CopyWithPlaceholder(),
  }) {
    return BaseEntityPageState(
      data: data == const $CopyWithPlaceholder() || data == null
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as Map<String, dynamic>,
      initialData:
          initialData == const $CopyWithPlaceholder() || initialData == null
              ? _value.initialData
              // ignore: cast_nullable_to_non_nullable
              : initialData as Map<String, dynamic>,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      isDeleting:
          isDeleting == const $CopyWithPlaceholder() || isDeleting == null
              ? _value.isDeleting
              // ignore: cast_nullable_to_non_nullable
              : isDeleting as bool,
      isSaving: isSaving == const $CopyWithPlaceholder() || isSaving == null
          ? _value.isSaving
          // ignore: cast_nullable_to_non_nullable
          : isSaving as bool,
      controllerMap:
          controllerMap == const $CopyWithPlaceholder() || controllerMap == null
              ? _value.controllerMap
              // ignore: cast_nullable_to_non_nullable
              : controllerMap as Map<String, TextEditingController>,
    );
  }
}

extension $BaseEntityPageStateCopyWith on BaseEntityPageState {
  /// Returns a callable class that can be used as follows: `instanceOfBaseEntityPageState.copyWith(...)` or like so:`instanceOfBaseEntityPageState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BaseEntityPageStateCWProxy get copyWith =>
      _$BaseEntityPageStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseEntityPageState _$BaseEntityPageStateFromJson(Map<String, dynamic> json) =>
    BaseEntityPageState(
      data: json['data'] as Map<String, dynamic>,
      initialData: json['initialData'] as Map<String, dynamic>,
      isLoading: json['isLoading'] as bool,
      isDeleting: json['isDeleting'] as bool,
      isSaving: json['isSaving'] as bool,
      controllerMap: _controllerMapFromJson(
          json['controllerMap'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$BaseEntityPageStateToJson(
        BaseEntityPageState instance) =>
    <String, dynamic>{
      'data': instance.data,
      'initialData': instance.initialData,
      'isLoading': instance.isLoading,
      'isSaving': instance.isSaving,
      'isDeleting': instance.isDeleting,
      'controllerMap': _controllerMapToJson(instance.controllerMap),
    };
