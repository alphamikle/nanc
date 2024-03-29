import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../../../../../field/logic/fields/field/field.dart';
import 'sort_menu_item.dart';

typedef SortingCallback = void Function(Field field, Order order);

class KitTablePopupButton extends StatelessWidget {
  const KitTablePopupButton({
    required this.field,
    required this.child,
    required this.onSort,
    required this.selectedSort,
    this.size = 26,
    super.key,
  });

  final Field field;
  final Widget child;
  final double size;
  final Sort? selectedSort;
  final SortingCallback onSort;

  List<PopupMenuEntry<dynamic>> itemBuilder(BuildContext context) {
    return [
      sortMenuItem(
        context: context,
        field: field,
        order: Order.asc,
        isSelected: selectedSort?.fieldId == field.id && selectedSort?.order == Order.asc,
        onPressed: () => onSort(field, Order.asc),
      ),
      sortMenuItem(
        context: context,
        field: field,
        order: Order.desc,
        isSelected: selectedSort?.fieldId == field.id && selectedSort?.order == Order.desc,
        onPressed: () => onSort(field, Order.desc),
      ),
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
