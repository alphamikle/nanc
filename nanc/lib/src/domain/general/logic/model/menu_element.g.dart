// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_element.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$MenuElementAutoequal on MenuElement {
  List<Object?> get _$props => [
        title,
        url,
        aliases,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MenuElementCWProxy {
  MenuElement title(String title);

  MenuElement url(String url);

  MenuElement aliases(Set<String> aliases);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuElement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuElement(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuElement call({
    String? title,
    String? url,
    Set<String>? aliases,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMenuElement.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMenuElement.copyWith.fieldName(...)`
class _$MenuElementCWProxyImpl implements _$MenuElementCWProxy {
  const _$MenuElementCWProxyImpl(this._value);

  final MenuElement _value;

  @override
  MenuElement title(String title) => this(title: title);

  @override
  MenuElement url(String url) => this(url: url);

  @override
  MenuElement aliases(Set<String> aliases) => this(aliases: aliases);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuElement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuElement(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuElement call({
    Object? title = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? aliases = const $CopyWithPlaceholder(),
  }) {
    return MenuElement(
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
      aliases: aliases == const $CopyWithPlaceholder() || aliases == null
          ? _value.aliases
          // ignore: cast_nullable_to_non_nullable
          : aliases as Set<String>,
    );
  }
}

extension $MenuElementCopyWith on MenuElement {
  /// Returns a callable class that can be used as follows: `instanceOfMenuElement.copyWith(...)` or like so:`instanceOfMenuElement.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MenuElementCWProxy get copyWith => _$MenuElementCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuElement _$MenuElementFromJson(Map<String, dynamic> json) => MenuElement(
      title: json['title'] as String,
      url: json['url'] as String,
      aliases: (json['aliases'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const {},
    );

Map<String, dynamic> _$MenuElementToJson(MenuElement instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'aliases': instance.aliases.toList(),
    };
