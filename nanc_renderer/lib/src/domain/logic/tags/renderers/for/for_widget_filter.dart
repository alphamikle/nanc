import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../service/delayer.dart';
import 'for_widget.dart';

void forWidgetFilter(Widget nodeWidget, List<Widget> output) {
  if (nodeWidget is ForWidget) {
    output.addAll(nodeWidget.children);
  } else {
    output.add(nodeWidget);
  }
}

Future<void> forWidgetAsyncFilter(Widget nodeWidget, List<Widget> output) async {
  if (nodeWidget is ForWidget) {
    final int cycles = max((output.length ~/ 150), 31);
    for (final Widget widget in nodeWidget.children) {
      if (Delayer.needToPause(pauseEveryCycles: cycles)) {
        await Delayer.pause();
        output.add(widget);
      }
    }
  } else {
    output.add(nodeWidget);
  }
}
