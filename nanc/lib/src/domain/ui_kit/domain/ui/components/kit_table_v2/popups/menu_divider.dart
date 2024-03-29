import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../../constants/gap.dart';

class MenuDivider extends PopupMenuEntry<Never> {
  const MenuDivider({
    required this.height,
    this.color,
    this.thickness,
    this.gap = 0,
    super.key,
  });

  @override
  State<MenuDivider> createState() => _MenuDividerState();

  @override
  final double height;

  final Color? color;

  final double? thickness;

  final double gap;

  @override
  bool represents(void value) => false;
}

class _MenuDividerState extends State<MenuDivider> {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: widget.color,
      height: widget.height,
      thickness: widget.thickness,
      endIndent: widget.gap,
      indent: widget.gap,
    );
  }
}

MenuDivider menuDividerItem(BuildContext context) {
  return MenuDivider(
    height: 4,
    color: context.theme.colorScheme.primary.withOpacity(0.5),
    gap: Gap.regular,
  );
}
