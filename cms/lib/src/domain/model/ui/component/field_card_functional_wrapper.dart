import 'dart:async';

import 'package:cms/src/domain/model/ui/component/field_card.dart';
import 'package:cms/src/domain/model/ui/component/field_card_deleter.dart';
import 'package:cms/src/domain/model/ui/component/field_card_mover.dart';
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

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
  AnimationController? controller;
  Animation<double>? animation;

  bool _isFunctionalElementsExists = false;

  void _toggleFunctionalElementsVisibility(bool isHovered) {
    if (isHovered) {
      unawaited(_showElements());
    } else {
      unawaited(_hideElements());
    }
  }

  Future<void> _showElements() async {
    setState(() => _isFunctionalElementsExists = true);
    await wait(duration: const Duration(milliseconds: 10));
    unawaited(controller?.forward());
  }

  Future<void> _hideElements() async {
    await controller?.animateBack(0);
    if (mounted) {
      setState(() => _isFunctionalElementsExists = false);
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 350));
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeInOutQuart);
  }

  @override
  void dispose() {
    controller?.dispose();
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

    if (_isFunctionalElementsExists && controller != null) {
      return KitInkWell(
        onPressed: () {},
        noReaction: true,
        onHover: _toggleFunctionalElementsVisibility,
        child: AnimatedBuilder(
          animation: animation!,
          builder: (BuildContext context, Widget? child) {
            return Stack(
              children: [
                child!,
                Positioned.fill(
                  child: Opacity(
                    opacity: animation!.value,
                    child: FieldCardMover(
                      onChange: widget.onChange,
                      availableDirections: widget.availableDirections,
                      child: const SizedBox(),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Opacity(
                    opacity: animation!.value,
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
