import 'package:cms/src/service/config/config.dart';
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

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
          color: field.description(context).color.o35,
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
                        Text(
                          editorMode ? field.name : field.description(context).title,
                          style: titleStyle?.copyWith(color: titleStyle.color?.withOpacity(0.8)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          editorMode ? field.id : field.description(context).description,
                          style: subtitleStyle?.copyWith(color: subtitleStyle.color?.withOpacity(0.5)),
                          maxLines: 3,
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
