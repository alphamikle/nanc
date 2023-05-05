import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../constants/gap.dart';
import 'kit_text_field.dart';

class KitSearchInput extends StatelessWidget {
  const KitSearchInput({
    required this.controller,
    this.placeholder = 'Search',
    this.prefixIcon = IconPack.flu_search_filled,
    super.key,
  });

  final TextEditingController controller;
  final String placeholder;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    final InputBorder border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 0,
        strokeAlign: 0,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    return KitTextField(
      controller: controller,
      decoration: InputDecoration(
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        errorBorder: border,
        focusedErrorBorder: border,
        hintText: placeholder,
        isDense: true,
        contentPadding: const EdgeInsets.only(left: Gap.large, top: Gap.regular, right: Gap.large, bottom: Gap.regular),
      ),
      prefixIcon: prefixIcon,
    );
  }
}
