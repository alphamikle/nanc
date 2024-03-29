import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import '../../../logic/constants/gap.dart';

class KitViewContainer extends StatelessWidget {
  const KitViewContainer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const BorderRadius radius = BorderRadius.only(
      topLeft: Radius.circular(12),
      topRight: Radius.circular(12),
    );

    return ColoredBox(
      color: context.theme.colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.only(left: Gap.large, right: Gap.large),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.background,
            borderRadius: radius,
            boxShadow: [
              BoxShadow(
                color: context.theme.colorScheme.shadow,
                spreadRadius: -10,
                blurRadius: 12,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: radius,
            child: child,
          ),
        ),
      ),
    );
  }
}
