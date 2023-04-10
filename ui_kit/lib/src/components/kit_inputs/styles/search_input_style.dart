import 'package:flutter/material.dart';

import '../../../constants/gap.dart';

InputDecoration searchInputDecoration({
  required BuildContext context,
  String? placeholder,
}) {
  final InputBorder border = OutlineInputBorder(
    borderSide: const BorderSide(
      width: 0,
      strokeAlign: 0,
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.circular(10),
  );

  return InputDecoration(
    border: border,
    enabledBorder: border,
    focusedBorder: border,
    disabledBorder: border,
    errorBorder: border,
    focusedErrorBorder: border,
    hintText: placeholder,
    isDense: true,
    contentPadding: const EdgeInsets.only(left: Gap.large, top: Gap.regular, right: Gap.large, bottom: Gap.regular),
  );
}
