import 'package:flutter/cupertino.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../property_widget.dart';
import '../renderers/alias/alias_widget.dart';

class PropertiesExtractor {
  PropertiesExtractor({
    @Deprecated('Remove that argument') required BuildContext context,
    required List<Widget> rawChildren,
  }) : _rawChildren = rawChildren {
    _handleRawChildren();
  }

  final List<Widget> children = [];
  final List<Widget> _rawChildren;
  final Map<String, List<PropertyWidget<dynamic>>> _properties = {};
  final Map<String, List<Widget>> _aliases = {};

  T? getProperty<T>(String name) {
    final List<PropertyWidget<dynamic>>? properties = _properties[name];
    if (properties != null && properties.isNotEmpty) {
      if (properties.first.property is! T) {
        throw Exception('Wrong type of property "$name". Required type was "$T", but actual type is "${properties.first.runtimeType}".');
      }
      return properties.first.property as T;
    }
    return null;
  }

  List<T> getProperties<T>(String name) {
    final List<PropertyWidget<dynamic>>? properties = _properties[name];
    if (properties == null) {
      return [];
    }
    return properties.map((PropertyWidget<dynamic> widget) => widget.property as T).toList();
  }

  Widget? getAlias(String name) {
    final List<Widget>? aliases = _aliases[name];
    if (aliases != null && aliases.isNotEmpty) {
      return aliases.first;
    }
    return null;
  }

  List<Widget> getAliases(String name) => _aliases[name] ?? [];

  bool _isPropertyWidget(Widget widget) {
    if (widget is PropertyWidget) {
      if (_properties.containsKey(widget.name) == false) {
        _properties[widget.name] = [];
      }
      _properties[widget.name]!.add(widget);
      if (widget.runtimeType.toString().startsWith('PropertyWidget')) {
        logWarning('Generic property widget was found! "${widget.name}" | "${widget.property}"');
      }
      return true;
    }
    return false;
  }

  bool _isAliasWidget(Widget widget) {
    if (widget is AliasWidget) {
      if (_aliases.containsKey(widget.name) == false) {
        _aliases[widget.name] = [];
      }
      _aliases[widget.name]!.add(widget.child);
      return true;
    }
    return false;
  }

  void _handleRawChildren() {
    for (final Widget rawChild in _rawChildren) {
      if (_isPropertyWidget(rawChild) == false && _isAliasWidget(rawChild) == false) {
        children.add(rawChild);
      }
    }
  }
}
