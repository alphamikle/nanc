import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class HeaderFieldCell extends StatelessWidget {
  const HeaderFieldCell({
    required this.field,
    super.key,
  });

  final HeaderField field;

  @override
  Widget build(BuildContext context) {
    TextStyle style = context.theme.textTheme.titleLarge ?? DefaultTextStyle.of(context).style;
    final Color color = field.contentColor ?? style.color ?? context.theme.colorScheme.onSurface;
    if (field.contentFontSize != null && field.contentFontSize! > 0) {
      style = style.copyWith(fontSize: field.contentFontSize);
    }
    if (color != style.color) {
      style = style.copyWith(color: color);
    }
    final Widget text = Text(
      field.content,
      style: style,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    if (field.useAsDivider) {
      return Padding(
        padding: const EdgeInsets.only(top: Gap.regular),
        child: Divider(
          color: color,
          height: style.fontSize,
        ),
      );
    }

    const EdgeInsets padding = EdgeInsets.only(top: Gap.large);

    if (field.contentIcon != null) {
      final IconData? iconData = tryToGetIconByName(field.contentIcon);
      if (iconData != null) {
        return Padding(
          padding: padding,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: Gap.regular),
                child: Icon(
                  iconData,
                  size: style.fontSize,
                  color: style.color,
                ),
              ),
              Expanded(child: text),
            ],
          ),
        );
      }
    }
    return Padding(
      padding: padding,
      child: text,
    );
  }
}
