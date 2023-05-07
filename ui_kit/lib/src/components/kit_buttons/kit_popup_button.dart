import 'package:flutter/material.dart';

import 'system_popup_menu_button.dart';

class KitPopupButton<T> extends StatelessWidget {
  const KitPopupButton({
    required this.builder,
    required this.itemBuilder,
    super.key,
  });

  final PopupMenuButtonChildBuilder builder;
  final PopupMenuItemBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    return SystemPopupMenuButton(
      childBuilder: builder,
      itemBuilder: itemBuilder,
    );
  }
}
