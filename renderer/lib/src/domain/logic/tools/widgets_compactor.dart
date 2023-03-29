import 'package:flutter/cupertino.dart';

Widget compactWidgets(List<Widget> widgets, {bool toRow = false}) {
  if (widgets.isEmpty) {
    return const SizedBox.shrink();
  } else if (widgets.length == 1) {
    return widgets.first;
  }
  if (toRow) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );
  }
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: widgets,
  );
}
