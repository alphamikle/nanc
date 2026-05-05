import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../field/logic/fields/field/field.dart';

/// A draggable wrapper for field cards that enables drag-n-drop functionality
class FieldCardDraggable extends StatefulWidget {
  const FieldCardDraggable({
    required this.child,
    required this.field,
    required this.onDragCompleted,
    required this.row,
    required this.column,
    super.key,
  });

  final Widget child;
  final Field field;
  final int row;
  final int column;
  final Function(int sourceRow, int sourceColumn, int targetRow, int targetColumn, DropPosition position) onDragCompleted;

  @override
  State<FieldCardDraggable> createState() => _FieldCardDraggableState();
}

/// Represents the position where a field should be dropped
enum DropPosition {
  left,
  right,
  above,
  below,
  newRow,
}

class _FieldCardDraggableState extends State<FieldCardDraggable> {
  @override
  Widget build(BuildContext context) {
    return Draggable<Map<String, dynamic>>(
      data: {
        'field': widget.field,
        'row': widget.row,
        'column': widget.column,
      },
      feedback: Material(
        elevation: 8.0,
        color: Colors.transparent,
        child: SizedBox(
          width: 200,
          child: Opacity(
            opacity: 0.7,
            child: widget.child,
          ),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: widget.child,
      ),
      child: widget.child,
    );
  }
}

/// A drop target for field cards with visual indicators
class FieldDropTarget extends StatefulWidget {
  const FieldDropTarget({
    required this.child,
    required this.row,
    required this.column,
    required this.onDragCompleted,
    this.isNewRowTarget = false,
    super.key,
  });

  final Widget child;
  final int row;
  final int column;
  final bool isNewRowTarget;
  final Function(int sourceRow, int sourceColumn, int targetRow, int targetColumn, DropPosition position) onDragCompleted;

  @override
  State<FieldDropTarget> createState() => _FieldDropTargetState();
}

class _FieldDropTargetState extends State<FieldDropTarget> with SingleTickerProviderStateMixin {
  DropPosition? _dropPosition;
  bool _isDragOver = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<Map<String, dynamic>>(
      onWillAccept: (data) => true,
      onAccept: (data) {
        if (_dropPosition != null) {
          final int sourceRow = data['row'] as int;
          final int sourceColumn = data['column'] as int;
          
          widget.onDragCompleted(
            sourceRow,
            sourceColumn,
            widget.row,
            widget.column,
            _dropPosition!,
          );
        }
        setState(() {
          _isDragOver = false;
          _dropPosition = null;
        });
        _animationController.reverse();
      },
      onLeave: (_) {
        setState(() {
          _isDragOver = false;
          _dropPosition = null;
        });
        _animationController.reverse();
      },
      onMove: (details) {
        final RenderBox box = context.findRenderObject() as RenderBox;
        final Offset localPosition = box.globalToLocal(details.offset);
        final Size size = box.size;
        
        DropPosition position;
        
        if (widget.isNewRowTarget) {
          position = DropPosition.newRow;
        } else {
          // Determine drop position based on where in the target the pointer is
          final double horizontalRatio = localPosition.dx / size.width;
          final double verticalRatio = localPosition.dy / size.height;
          
          if (horizontalRatio < 0.3) {
            position = DropPosition.left;
          } else if (horizontalRatio > 0.7) {
            position = DropPosition.right;
          } else if (verticalRatio < 0.3) {
            position = DropPosition.above;
          } else if (verticalRatio > 0.7) {
            position = DropPosition.below;
          } else {
            // Default to right if in the middle
            position = DropPosition.right;
          }
        }
        
        if (_dropPosition != position || !_isDragOver) {
          setState(() {
            _dropPosition = position;
            _isDragOver = true;
          });
          _animationController.forward();
        }
      },
      builder: (context, candidateData, rejectedData) {
        return Stack(
          children: [
            widget.child,
            if (_isDragOver) _buildDropIndicator(_dropPosition!),
          ],
        );
      },
    );
  }

  Widget _buildDropIndicator(DropPosition position) {
    final Color indicatorColor = context.theme.colorScheme.primary;
    
    switch (position) {
      case DropPosition.left:
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 4,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      indicatorColor,
                      indicatorColor.withOpacity(0.5 * _animation.value),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: indicatorColor.withOpacity(0.5 * _animation.value),
                      blurRadius: 4 * _animation.value,
                      spreadRadius: 1 * _animation.value,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      case DropPosition.right:
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: 4,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      indicatorColor,
                      indicatorColor.withOpacity(0.5 * _animation.value),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: indicatorColor.withOpacity(0.5 * _animation.value),
                      blurRadius: 4 * _animation.value,
                      spreadRadius: 1 * _animation.value,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      case DropPosition.above:
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Positioned(
              left: 0,
              right: 0,
              top: 0,
              height: 4,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      indicatorColor,
                      indicatorColor.withOpacity(0.5 * _animation.value),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: indicatorColor.withOpacity(0.5 * _animation.value),
                      blurRadius: 4 * _animation.value,
                      spreadRadius: 1 * _animation.value,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      case DropPosition.below:
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 4,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      indicatorColor,
                      indicatorColor.withOpacity(0.5 * _animation.value),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: indicatorColor.withOpacity(0.5 * _animation.value),
                      blurRadius: 4 * _animation.value,
                      spreadRadius: 1 * _animation.value,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      case DropPosition.newRow:
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: indicatorColor.withOpacity(_animation.value),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: indicatorColor.withOpacity(0.3 * _animation.value),
                      blurRadius: 6 * _animation.value,
                      spreadRadius: 1 * _animation.value,
                    ),
                  ],
                ),
              ),
            );
          },
        );
    }
  }
}