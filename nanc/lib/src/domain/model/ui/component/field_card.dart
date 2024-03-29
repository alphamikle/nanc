import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../../../service/config/config.dart';
import '../../../field/logic/fields/field/field.dart';
import '../../../ui_kit/domain/ui/components/kit_column.dart';
import '../../../ui_kit/domain/ui/components/kit_icons/kit_icon_container.dart';
import '../../../ui_kit/domain/ui/components/kit_text.dart';
import '../../../ui_kit/domain/ui/constants/gap.dart';
import '../../../ui_kit/domain/ui/theme/kit_colors.dart';

class FieldCard extends StatelessWidget {
  const FieldCard({
    required this.field,
    required this.creationMode,
    required this.onPressed,
    this.editorMode = false,
    this.customHeight,
    super.key,
  });

  final Field field;
  final bool creationMode;
  final VoidCallback onPressed;
  final bool editorMode;
  final double? customHeight;

  static const double height = 100;

  @override
  Widget build(BuildContext context) {
    const BorderRadius radius = BorderRadius.all(Radius.circular(kPadding));
    final TextStyle? titleStyle = context.theme.textTheme.titleMedium;
    final TextStyle? subtitleStyle = context.theme.textTheme.titleSmall;

    return Container(
      height: customHeight ?? height,
      decoration: BoxDecoration(
        color: field.description(context).color.o075,
        borderRadius: radius,
        border: Border.all(
          color: field.description(context).color.o35!,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: Gap.small,
              top: Gap.small,
              right: Gap.small,
              bottom: Gap.small,
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: Gap.regular),
                    child: KitIconContainer(
                      icon: field.description(context).icon,
                      color: field.description(context).color,
                      iconSize: customHeight == null ? 30 : customHeight! * 0.5,
                    ),
                  ),
                  Expanded(
                    child: KitColumn(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        KitText(
                          text: editorMode ? field.name : field.description(context).title,
                          height: 1.5,
                          style: titleStyle?.copyWith(color: titleStyle.color?.withOpacity(0.8)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        KitText(
                          text: editorMode ? field.id : field.description(context).description,
                          height: 1.25,
                          style: subtitleStyle?.copyWith(color: subtitleStyle.color?.withOpacity(0.5)),
                          maxLines: editorMode ? 1 : 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: radius,
                onTap: onPressed,
                child: const ColoredBox(color: Colors.transparent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
