import 'package:flutter/cupertino.dart';
import 'package:tools/tools.dart';

import '../property_widget.dart';

class PropertiesExtractor {
  PropertiesExtractor({
    @Deprecated('Remove that argument') required BuildContext context,
    required List<Widget> rawChildren,
  }) : _rawChildren = rawChildren {
    _handleRawChildren();
  }

  final List<Widget> children = [];
  final List<Widget> _rawChildren;
  final Map<String, List<PropertyWidget>> _properties = {};

  T? getProperty<T>(String name) {
    final List<PropertyWidget>? properties = _properties[name];
    if (properties != null && properties.isNotEmpty) {
      if (properties.first.property is! T) {
        throw Exception('Wrong type of property "$name". Required type was "$T", but actual type is "${properties.first.runtimeType}".');
      }
      return properties.first.property as T;
    }
    return null;
  }

  List<T> getProperties<T>(String name) {
    final List<PropertyWidget>? properties = _properties[name];
    if (properties == null) {
      return [];
    }
    return properties.map((PropertyWidget widget) => widget.property as T).toList();
  }

  bool _isPropertyWidget(Widget widget) {
    if (widget is PropertyWidget) {
      if (_properties.containsKey(widget.name) == false) {
        _properties[widget.name] = [];
      }
      _properties[widget.name]!.add(widget);
      if (widget.runtimeType.toString().startsWith('PropertyWidget')) {
        logg('Generic property widget was found! "${widget.name}" | "${widget.property}"');
      }
      return true;
    }
    return false;
  }

  void _handleRawChildren() {
    for (final Widget rawChild in _rawChildren) {
      if (_isPropertyWidget(rawChild) == false) {
        children.add(rawChild);
      }
    }
  }
}
