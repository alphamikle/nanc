import 'package:flutter/cupertino.dart';

Widget compactWidgets(List<Widget> widgets) {
  if (widgets.isEmpty) {
    return const SizedBox.shrink();
  } else if (widgets.length == 1) {
    return widgets.first;
  }
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: widgets,
  );
}
