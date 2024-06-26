import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../field/logic/fields/field/field.dart';
import '../../../ui_kit/domain/ui/components/kit_ink_well.dart';
import 'field_card.dart';
import 'field_card_deleter.dart';
import 'field_card_mover.dart';

class FieldCardFunctionalWrapper extends StatefulWidget {
  const FieldCardFunctionalWrapper({
    required this.field,
    required this.creationMode,
    required this.onChange,
    required this.onPressed,
    required this.availableDirections,
    this.onDelete,
    this.onExpand,
    this.customSize,
    super.key,
  });

  final Field field;
  final bool creationMode;
  final VoidCallback? onDelete;
  final VoidCallback? onExpand;
  final ValueChanged<AxisDirection> onChange;
  final VoidCallback onPressed;
  final List<AxisDirection> availableDirections;
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
                    child: FieldCardMover(
                      onChange: widget.onChange,
                      availableDirections: widget.availableDirections,
                      child: const SizedBox(),
                    ),
                  ),
                ),
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
          child: fieldCard,
        ),
      );
    }
    return KitInkWell(
      onPressed: () {},
      noReaction: true,
      onHover: _toggleFunctionalElementsVisibility,
      child: fieldCard,
    );
  }
}
