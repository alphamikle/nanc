import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../ui_kit/domain/logic/constants/gap.dart';
import '../../logic/fields/header_field/header_field.dart';

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
      final IconData? iconData = IconsStorage.tryToGetIconByName(field.contentIcon);
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
