// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_page_state.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$BaseDocumentStateAutoequal on BaseDocumentState {
  @Deprecated(r'Use _$props instead')
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [
        data,
        initialData,
        isLoading,
        isSaving,
        isError,
        isDeleting,
        controllerMap
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BaseDocumentStateCWProxy {
  BaseDocumentState data(Map<String, dynamic> data);

  BaseDocumentState initialData(Map<String, dynamic> initialData);

  BaseDocumentState isLoading(bool isLoading);

  BaseDocumentState isDeleting(bool isDeleting);

  BaseDocumentState isSaving(bool isSaving);

  BaseDocumentState isError(bool isError);

  BaseDocumentState controllerMap(
      Map<String, TextEditingController> controllerMap);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseDocumentState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseDocumentState(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseDocumentState call({
    Map<String, dynamic>? data,
    Map<String, dynamic>? initialData,
    bool? isLoading,
    bool? isDeleting,
    bool? isSaving,
    bool? isError,
    Map<String, TextEditingController>? controllerMap,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBaseDocumentState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBaseDocumentState.copyWith.fieldName(...)`
class _$BaseDocumentStateCWProxyImpl implements _$BaseDocumentStateCWProxy {
  const _$BaseDocumentStateCWProxyImpl(this._value);

  final BaseDocumentState _value;

  @override
  BaseDocumentState data(Map<String, dynamic> data) => this(data: data);

  @override
  BaseDocumentState initialData(Map<String, dynamic> initialData) =>
      this(initialData: initialData);

  @override
  BaseDocumentState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  BaseDocumentState isDeleting(bool isDeleting) => this(isDeleting: isDeleting);

  @override
  BaseDocumentState isSaving(bool isSaving) => this(isSaving: isSaving);

  @override
  BaseDocumentState isError(bool isError) => this(isError: isError);

  @override
  BaseDocumentState controllerMap(
          Map<String, TextEditingController> controllerMap) =>
      this(controllerMap: controllerMap);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseDocumentState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseDocumentState(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseDocumentState call({
    Object? data = const $CopyWithPlaceholder(),
    Object? initialData = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? isDeleting = const $CopyWithPlaceholder(),
    Object? isSaving = const $CopyWithPlaceholder(),
    Object? isError = const $CopyWithPlaceholder(),
    Object? controllerMap = const $CopyWithPlaceholder(),
  }) {
    return BaseDocumentState(
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
      isError: isError == const $CopyWithPlaceholder() || isError == null
          ? _value.isError
          // ignore: cast_nullable_to_non_nullable
          : isError as bool,
      controllerMap:
          controllerMap == const $CopyWithPlaceholder() || controllerMap == null
              ? _value.controllerMap
              // ignore: cast_nullable_to_non_nullable
              : controllerMap as Map<String, TextEditingController>,
    );
  }
}

extension $BaseDocumentStateCopyWith on BaseDocumentState {
  /// Returns a callable class that can be used as follows: `instanceOfBaseDocumentState.copyWith(...)` or like so:`instanceOfBaseDocumentState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BaseDocumentStateCWProxy get copyWith =>
      _$BaseDocumentStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseDocumentState _$BaseDocumentStateFromJson(Map<String, dynamic> json) =>
    BaseDocumentState(
      data: json['data'] as Map<String, dynamic>,
      initialData: json['initialData'] as Map<String, dynamic>,
      isLoading: json['isLoading'] as bool,
      isDeleting: json['isDeleting'] as bool,
      isSaving: json['isSaving'] as bool,
      isError: json['isError'] as bool,
      controllerMap: _controllerMapFromJson(
          json['controllerMap'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$BaseDocumentStateToJson(BaseDocumentState instance) =>
    <String, dynamic>{
      'data': instance.data,
      'initialData': instance.initialData,
      'isLoading': instance.isLoading,
      'isSaving': instance.isSaving,
      'isError': instance.isError,
      'isDeleting': instance.isDeleting,
      'controllerMap': _controllerMapToJson(instance.controllerMap),
    };
