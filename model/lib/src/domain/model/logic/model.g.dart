// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ModelCWProxy {
  Model codeFirstEntity(bool codeFirstEntity);

  Model fields(List<List<Field>> fields);

  Model icon(String icon);

  Model id(String? id);

  Model isCollection(bool isCollection);

  Model name(String name);

  Model showInMenu(bool showInMenu);

  Model sort(int sort);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Model(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Model(...).copyWith(id: 12, name: "My name")
  /// ````
  Model call({
    bool? codeFirstEntity,
    List<List<Field>>? fields,
    String? icon,
    String? id,
    bool? isCollection,
    String? name,
    bool? showInMenu,
    int? sort,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfModel.copyWith.fieldName(...)`
class _$ModelCWProxyImpl implements _$ModelCWProxy {
  final Model _value;

  const _$ModelCWProxyImpl(this._value);

  @override
  Model codeFirstEntity(bool codeFirstEntity) =>
      this(codeFirstEntity: codeFirstEntity);

  @override
  Model fields(List<List<Field>> fields) => this(fields: fields);

  @override
  Model icon(String icon) => this(icon: icon);

  @override
  Model id(String? id) => this(id: id);

  @override
  Model isCollection(bool isCollection) => this(isCollection: isCollection);

  @override
  Model name(String name) => this(name: name);

  @override
  Model showInMenu(bool showInMenu) => this(showInMenu: showInMenu);

  @override
  Model sort(int sort) => this(sort: sort);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Model(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Model(...).copyWith(id: 12, name: "My name")
  /// ````
  Model call({
    Object? codeFirstEntity = const $CopyWithPlaceholder(),
    Object? fields = const $CopyWithPlaceholder(),
    Object? icon = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? isCollection = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? showInMenu = const $CopyWithPlaceholder(),
    Object? sort = const $CopyWithPlaceholder(),
  }) {
    return Model(
      codeFirstEntity: codeFirstEntity == const $CopyWithPlaceholder() ||
              codeFirstEntity == null
          ? _value.codeFirstEntity
          // ignore: cast_nullable_to_non_nullable
          : codeFirstEntity as bool,
      fields: fields == const $CopyWithPlaceholder() || fields == null
          ? _value.fields
          // ignore: cast_nullable_to_non_nullable
          : fields as List<List<Field>>,
      icon: icon == const $CopyWithPlaceholder() || icon == null
          ? _value.icon
          // ignore: cast_nullable_to_non_nullable
          : icon as String,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      isCollection:
          isCollection == const $CopyWithPlaceholder() || isCollection == null
              ? _value.isCollection
              // ignore: cast_nullable_to_non_nullable
              : isCollection as bool,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      showInMenu:
          showInMenu == const $CopyWithPlaceholder() || showInMenu == null
              ? _value.showInMenu
              // ignore: cast_nullable_to_non_nullable
              : showInMenu as bool,
      sort: sort == const $CopyWithPlaceholder() || sort == null
          ? _value.sort
          // ignore: cast_nullable_to_non_nullable
          : sort as int,
    );
  }
}

extension $ModelCopyWith on Model {
  /// Returns a callable class that can be used as follows: `instanceOfModel.copyWith(...)` or like so:`instanceOfModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ModelCWProxy get copyWith => _$ModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      name: json['name'] as String,
      icon: json['icon'] as String,
      fields: fieldsFromJson(json['fields'] as List),
      isCollection: json['isCollection'] as bool? ?? true,
      sort: json['sort'] as int? ?? 0,
      showInMenu: json['showInMenu'] as bool? ?? true,
      id: json['id'] as String?,
      codeFirstEntity: json['codeFirstEntity'] == null
          ? false
          : _codeFirstFlagFromJson(json['codeFirstEntity']),
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'isCollection': instance.isCollection,
      'sort': instance.sort,
      'showInMenu': instance.showInMenu,
      'fields': fieldsToJson(instance.fields),
      'codeFirstEntity': _codeFirstFlagToJson(instance.codeFirstEntity),
    };
