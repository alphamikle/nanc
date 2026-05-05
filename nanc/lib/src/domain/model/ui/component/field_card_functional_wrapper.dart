import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../field/logic/fields/field/field.dart';
import '../../../ui_kit/domain/ui/components/kit_ink_well.dart';
import 'field_card.dart';
import 'field_card_deleter.dart';
import 'field_card_draggable.dart';

class FieldCardFunctionalWrapper extends StatefulWidget {
  const FieldCardFunctionalWrapper({
    required this.field,
    required this.creationMode,
    required this.onDragCompleted,
    required this.onPressed,
    this.onDelete,
    this.onExpand,
    this.customSize,
    this.row = 0,
    this.column = 0,
    super.key,
  });

  final Field field;
  final bool creationMode;
  final VoidCallback? onDelete;
  final VoidCallback? onExpand;
  final Function(int sourceRow, int sourceColumn, int targetRow, int targetColumn, DropPosition position) onDragCompleted;
  final VoidCallback onPressed;
  final int row;
  final int column;
  final double? customSize;

  @override
  State<FieldCardFunctionalWrapper> createState() => _FieldCardFunctionalWrapperState();
}

class _FieldCardFunctionalWrapperState extends State<FieldCardFunctionalWrapper> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  bool _isFunctionalElementsExists = false;

  void _toggleFunctionalElementsVisibility(bool isHovered) {
    if (isHovered) {
      unawaited(_showElements());
    } else {
      unawaited(_hideElements());
    }
  }

  Future<void> _showElements() async {
    safeSetState(() => _isFunctionalElementsExists = true);
    await wait(duration: const Duration(milliseconds: 10));
    if (mounted) {
      await controller.forward();
    }
  }

  Future<void> _hideElements() async {
    await controller.animateBack(0);
    if (mounted) {
      safeSetState(() => _isFunctionalElementsExists = false);
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 350));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOutQuart);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget fieldCard = FieldCard(
      field: widget.field,
      creationMode: widget.creationMode,
      onPressed: widget.onPressed,
      editorMode: true,
      customHeight: widget.customSize,
    );

    // Wrap the field card with the draggable functionality
    final Widget draggableFieldCard = FieldCardDraggable(
      field: widget.field,
      row: widget.row,
      column: widget.column,
      onDragCompleted: widget.onDragCompleted,
      child: fieldCard,
    );

    if (_isFunctionalElementsExists) {
      return KitInkWell(
        onPressed: () {},
        noReaction: true,
        onHover: _toggleFunctionalElementsVisibility,
        child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return Stack(
              children: [
                child!,
                Positioned.fill(
                  child: Opacity(
                    opacity: animation.value,
                    child: FieldCardDeleter(
                      onDelete: widget.onDelete,
                      onExpand: widget.onExpand,
                      child: const SizedBox(),
                    ),
                  ),
                ),
              ],
            );
          },
          child: draggableFieldCard,
        ),
      );
    }
    return KitInkWell(
      onPressed: () {},
      noReaction: true,
      onHover: _toggleFunctionalElementsVisibility,
      child: draggableFieldCard,
    );
  }
}
