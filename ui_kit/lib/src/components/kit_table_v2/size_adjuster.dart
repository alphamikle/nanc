import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../kit_ink_well.dart';

const double _maxWidth = 4;
const double _minWidth = 1;
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
        child: SizedBox(
          width: _maxWidth,
          child: AnimatedPadding(
            duration: _duration,
            padding: EdgeInsets.only(
              left: isHovered ? 0 : (_maxWidth - _minWidth) / 2,
              right: isHovered ? 0 : (_maxWidth - _minWidth) / 2,
            ),
            child: AnimatedContainer(
              duration: _duration,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.primary.withOpacity(isHovered ? 1 : 0.1),
                borderRadius: BorderRadius.circular(2),
              ),
              width: isHovered ? _maxWidth : _minWidth,
            ),
          ),
        ),
      ),
    );
  }
}
