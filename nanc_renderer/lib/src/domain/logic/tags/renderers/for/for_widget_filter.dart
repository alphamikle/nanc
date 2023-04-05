import 'package:flutter/material.dart';
import 'for_widget.dart';

void forWidgetFilter(Widget nodeWidget, List<Widget> output) {
  if (nodeWidget is ForWidget) {
    output.addAll(nodeWidget.children);
  } else {
    output.add(nodeWidget);
  }
}
