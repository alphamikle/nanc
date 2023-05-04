import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import 'menu_divider.dart';
import 'sort_menu_item.dart';

class KitTablePopupButton extends StatelessWidget {
  const KitTablePopupButton({
    required this.field,
    required this.child,
    this.size = 26,
    super.key,
  });

  final Field field;
  final Widget child;
  final double size;

  bool get isNumberField => field is NumberField;

  bool get isStringField {
    return field is StringField ||
        field is DateTimeField ||
        field is EnumField ||
        field is ColorField ||
        field is FontField ||
        field is IconField ||
        field is IdField ||
        field is SelectorField;
  }

  List<PopupMenuEntry<dynamic>> itemBuilder(BuildContext context) {
    return [
      sortMenuItem(
        field: isNumberField
            ? SortFieldType.number
            : isStringField
                ? SortFieldType.string
                : SortFieldType.other,
        sort: SortType.asc,
      ),
      sortMenuItem(
        field: isNumberField
            ? SortFieldType.number
            : isStringField
                ? SortFieldType.string
                : SortFieldType.other,
        sort: SortType.desc,
      ),
      menuDividerItem(context),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            maximumSize: MaterialStatePropertyAll(Size(size, size)),
            minimumSize: MaterialStatePropertyAll(Size(size, size)),
          ),
        ),
      ),
      child: PopupMenuButton(
        tooltip: '',
        itemBuilder: itemBuilder,
        padding: EdgeInsets.zero,
        icon: child,
      ),
    );
  }
}
