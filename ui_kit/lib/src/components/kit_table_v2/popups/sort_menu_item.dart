import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../constants/gap.dart';
import '../../kit_text.dart';

enum SortType {
  asc,
  desc;

  bool get isAsc => this == SortType.asc;
  bool get isDesc => this == SortType.desc;
}

enum SortFieldType {
  string,
  other,
  number;

  bool get isString => this == SortFieldType.string;
  bool get isNumber => this == SortFieldType.number;
}

PopupMenuItem<T> sortMenuItem<T>({
  required SortType sort,
  required SortFieldType field,
}) {
  late final String text;
  late final IconData icon;
  if (field.isString) {
    text = sort.isAsc ? 'Sort A to Z' : 'Sort Z to A';
    icon = sort.isAsc ? IconPack.mdi_sort_alphabetical_ascending : IconPack.mdi_sort_alphabetical_descending;
  } else if (field.isNumber) {
    text = sort.isAsc ? 'Sort small to large' : 'Sort large to small';
    icon = sort.isAsc ? IconPack.mdi_sort_numeric_ascending : IconPack.mdi_sort_numeric_descending;
  } else {
    text = sort.isAsc ? 'Sort Ascending' : 'Sort Descending';
    icon = sort.isAsc ? IconPack.mdi_sort_ascending : IconPack.mdi_sort_descending;
  }

  return PopupMenuItem(
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: Gap.regular),
          child: Icon(icon),
        ),
        Expanded(
          child: KitText(text: text),
        ),
      ],
    ),
  );
}
