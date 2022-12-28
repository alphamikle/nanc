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
    super.key,
  });

  final Field field;
  final bool creationMode;
  final VoidCallback onPressed;
  final bool editorMode;

  static const double height = 120;

  @override
  Widget build(BuildContext context) {
    const BorderRadius radius = BorderRadius.all(Radius.circular(kPadding));

    return KitTooltip(
      disabled: editorMode == false,
      text: field.description(context).description,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: field.description(context).color.filling,
          borderRadius: radius,
          border: Border.all(
            color: field.description(context).color.border,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: kPadding),
                      child: KitIconContainer(
                        icon: field.description(context).icon,
                        color: field.description(context).color,
                      ),
                    ),
                    Expanded(
                      child: KitColumn(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            editorMode ? field.name : field.description(context).title,
                            style: context.theme.textTheme.headline4,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Opacity(
                            opacity: 0.25,
                            child: Text(
                              editorMode ? field.id : field.description(context).description,
                              style: context.theme.textTheme.bodyLarge,
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            ),
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
      ),
    );
  }
}
