import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/src/constants/gap.dart';

class KitContainerTransition<T> extends StatelessWidget {
  const KitContainerTransition({
    required this.openBuilder,
    required this.closedBuilder,
    this.useRootNavigator = false,
    this.closedShape = const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(Gap.small))),
    this.transitionType = ContainerTransitionType.fadeThrough,
    this.closedColor,
    this.middleColor,
    this.transitionDuration = const Duration(milliseconds: 750),
    super.key,
  });

  final CloseContainerBuilder closedBuilder;
  final OpenContainerBuilder<T> openBuilder;
  final bool useRootNavigator;
  final ShapeBorder closedShape;
  final ContainerTransitionType transitionType;
  final Duration transitionDuration;

  final Color? closedColor;
  final Color? middleColor;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openElevation: 0,
      closedElevation: 0,
      closedBuilder: closedBuilder,
      openBuilder: openBuilder,
      middleColor: middleColor ?? context.theme.colorScheme.background,
      closedColor: closedColor ?? context.theme.colorScheme.background,
      transitionType: transitionType,
      transitionDuration: transitionDuration,
      useRootNavigator: useRootNavigator,
      closedShape: closedShape,
    );
  }
}
