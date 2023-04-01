import 'package:flutter/material.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/for/for_widget.dart';

void forWidgetFilter(Widget nodeWidget, List<Widget> output) {
  if (nodeWidget is ForWidget) {
    output.addAll(nodeWidget.children);
  } else {
    output.add(nodeWidget);
  }
}
