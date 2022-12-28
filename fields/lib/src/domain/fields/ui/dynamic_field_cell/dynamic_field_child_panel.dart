import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class DynamicFieldChildPanel extends StatelessWidget {
  const DynamicFieldChildPanel({
    this.onMoveUp,
    this.onMoveDown,
    this.onDelete,
    this.onEdit,
    super.key,
  });

  final VoidCallback? onMoveUp;
  final VoidCallback? onMoveDown;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = context.theme;
    final ColorScheme colors = theme.colorScheme;

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(Gap.small)),
      child: SizedBox(
        width: 51,
        height: 51,
        child: Column(
          children: [
            if (onMoveUp != null || onDelete != null)
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// ? MOVE UP
                    if (onMoveUp != null)
                      Expanded(
                        child: KitTooltip(
                          text: 'Move up',
                          child: _PanelButton(
                            icon: MdiIcons.chevronUp,
                            color: colors.primaryContainer,
                            onPressed: onMoveUp!,
                          ),
                        ),
                      )
                    else
                      const SizedBox.shrink(),

                    /// ? DELETE
                    if (onDelete != null)
                      Expanded(
                        child: KitTooltip(
                          text: 'Delete',
                          child: _PanelButton(
                            icon: MdiIcons.deleteOutline,
                            color: context.kitColors.deleteFieldColor,
                            onPressed: onDelete!,
                          ),
                        ),
                      )
                    else
                      const SizedBox(),
                  ],
                ),
              ),
            if (onMoveDown != null || onEdit != null)
              Expanded(
                child: Row(
                  children: [
                    /// ? MOVE DOWN
                    if (onMoveDown != null)
                      Expanded(
                        child: KitTooltip(
                          text: 'Move down',
                          child: _PanelButton(
                            icon: MdiIcons.chevronDown,
                            color: colors.primaryContainer,
                            onPressed: onMoveDown!,
                          ),
                        ),
                      )
                    else
                      const SizedBox(),

                    /// ? EDIT
                    if (onEdit != null)
                      Expanded(
                        child: KitTooltip(
                          text: 'Edit',
                          child: _PanelButton(
                            icon: MdiIcons.cogs,
                            color: context.kitColors.editFieldColor,
                            onPressed: onEdit!,
                          ),
                        ),
                      )
                    else
                      const SizedBox(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _PanelButton extends StatelessWidget {
  const _PanelButton({
    required this.icon,
    required this.onPressed,
    required this.color,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(color: color),
          child: Center(
            child: Icon(
              icon,
              size: 18,
            ),
          ),
        ),
        Positioned.fill(
          child: KitInkWell(
            borderRadius: BorderRadius.zero,
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
