import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../kit_ink_well.dart';

const double _minWidth = 3;
const Duration _duration = Duration(milliseconds: 250);

typedef ColumnResizingCallback = ValueSetter<double>;

class SizeAdjuster extends StatefulWidget {
  const SizeAdjuster({
    required this.resizingCallback,
    super.key,
  });

  final ColumnResizingCallback resizingCallback;

  @override
  State<SizeAdjuster> createState() => _SizeAdjusterState();
}

class _SizeAdjusterState extends State<SizeAdjuster> {
  bool isHovered = false;

  void toggleHover(bool hovered) => safeSetState(() => isHovered = hovered);

  void resize(DragUpdateDetails details) {
    widget.resizingCallback(details.delta.dx);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: resize,
      child: KitInkWell(
        onPressed: () {},
        noReaction: true,
        mouseCursor: SystemMouseCursors.resizeColumn,
        onHover: toggleHover,
        child: AnimatedContainer(
          duration: _duration,
          decoration: BoxDecoration(
            color: isHovered ? context.theme.colorScheme.primary : context.theme.colorScheme.surfaceVariant,
          ),
          width: _minWidth,
        ),
      ),
    );
  }
}
