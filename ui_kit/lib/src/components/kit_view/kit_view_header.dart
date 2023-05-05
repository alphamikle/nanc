import 'package:flutter/material.dart';

import '../../constants/gap.dart';

class KitViewHeader extends StatelessWidget {
  const KitViewHeader({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Gap.regular),
      child: Row(
        children: children,
      ),
    );
  }
}
