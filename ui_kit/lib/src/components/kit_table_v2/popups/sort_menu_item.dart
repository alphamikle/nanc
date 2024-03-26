import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:nanc_fields/nanc_fields.dart';
import 'package:tools/tools.dart';

import '../../../../ui_kit.dart';

PopupMenuItem<T> sortMenuItem<T>({
  required BuildContext context,
  required Order order,
  required Field field,
  required VoidCallback onPressed,
  required bool isSelected,
}) {
  late final String text;
  late final IconData icon;

  if (field.isString) {
    text = order.isAsc ? 'Sort A to Z' : 'Sort Z to A';
    icon = order.isAsc ? IconPack.mdi_sort_alphabetical_ascending : IconPack.mdi_sort_alphabetical_descending;
  } else if (field.isNumeric) {
    text = order.isAsc ? 'Sort small to large' : 'Sort large to small';
    icon = order.isAsc ? IconPack.mdi_sort_numeric_ascending : IconPack.mdi_sort_numeric_descending;
  } else if (field.isDateTime) {
    text = order.isAsc ? 'Sort old to new' : 'Sort new to old';
    icon = order.isAsc ? IconPack.mdi_sort_calendar_ascending : IconPack.mdi_sort_calendar_descending;
  } else {
    text = order.isAsc ? 'Sort Ascending' : 'Sort Descending';
    icon = order.isAsc ? IconPack.mdi_sort_ascending : IconPack.mdi_sort_descending;
  }

  return PopupMenuItem(
    onTap: onPressed,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: Gap.regular),
          child: Icon(
            icon,
            color: isSelected ? context.theme.primaryColor : null,
          ),
        ),
        Expanded(
          child: KitText(
            text: text,
            style: DefaultTextStyle.of(context).style.copyWith(
                  color: isSelected ? context.theme.primaryColor : null,
                ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: Gap.regular,
          height: Gap.regular,
          decoration: BoxDecoration(
            color: context.theme.primaryColor.withOpacity(isSelected ? 1 : 0),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ],
    ),
  );
}
