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
  final List<PropertyWidget> _properties = [];

  T? getProperty<T>(String name) {
    return _properties.firstWhereOrNull((PropertyWidget widget) => widget.name == name)?.property as T?;
  }

  List<T> getProperties<T>(String name) {
    return _properties.where((PropertyWidget widget) => widget.name == name).map((PropertyWidget widget) => widget.property as T).toList();
  }

  bool _isPropertyWidget(Widget widget) {
    if (widget is PropertyWidget) {
      _properties.add(widget);
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
