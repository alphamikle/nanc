import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/src/theme/kit_colors.dart';

const double kDefaultKitFieldSize = 15;
const double kHelperWidgetHeight = 24;

const EdgeInsets kInputScrollPadding = EdgeInsets.only(bottom: 300);

class KitTextField extends StatelessWidget {
  const KitTextField({
    required this.controller,
    this.readOnly = false,
    this.formatters = const [],
    this.placeholder,
    this.label,
    this.helper,
    this.onChanged,
    this.size = kDefaultKitFieldSize,
    this.maxLines,
    this.maxHeight,
    this.onPressed,
    this.isChanged = false,
    this.isRequired = false,
    this.validator,
    this.focusNode,
    this.decoration,
    this.suffixIcon,
    this.prefixIcon,
    this.suffix,
    this.prefix,
    this.fieldKey,
    this.autovalidateMode,
    super.key,
  });

  final String? placeholder;
  final String? label;
  final TextEditingController controller;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter> formatters;
  final double size;
  final int? maxLines;
  final String? helper;
  final double? maxHeight;
  final VoidCallback? onPressed;
  final bool isChanged;
  final bool isRequired;
  final FormFieldValidator<String?>? validator;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final Key? fieldKey;
  final AutovalidateMode? autovalidateMode;

  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Widget? suffix;
  final Widget? prefix;

  static InputDecoration createInputDecoration({
    required BuildContext context,
    required bool isChanged,
    String? placeholder,
    String? label,
    double? maxHeight,
    String? helper,
  }) {
    const OutlineInputBorder border = OutlineInputBorder();

    final InputDecoration effectiveDecoration = InputDecoration(
      hintText: placeholder,
      labelText: label,
      border: border,
      enabledBorder: isChanged
          ? border.copyWith(
              borderSide: BorderSide(
                color: context.kitColors.successColor,
              ),
            )
          : null,
      focusedBorder: isChanged
          ? border.copyWith(
              borderSide: BorderSide(
                color: context.kitColors.successColor,
                width: 2,
              ),
            )
          : null,
      errorMaxLines: 1,
      isDense: true,
      constraints: maxHeight == null ? null : BoxConstraints(maxHeight: maxHeight),
      helperText: helper,
      filled: true,
    );
    return effectiveDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: fieldKey,
      decoration: (decoration ??
              createInputDecoration(
                context: context,
                isChanged: isChanged,
                placeholder: placeholder,
                maxHeight: maxHeight,
                label: label,
                helper: helper,
              ))
          .copyWith(
        suffix: suffix,
        prefix: prefix,
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
      ),
      readOnly: readOnly,
      style: TextStyle(fontSize: size),
      controller: controller,
      onChanged: onChanged,
      inputFormatters: formatters,
      maxLines: maxLines,
      onTap: onPressed,
      validator: groupOfValidators([
        if (isRequired) isRequiredValidator,
        if (validator != null) validator!,
      ]),
      autovalidateMode: autovalidateMode,
      focusNode: focusNode,
      scrollPadding: kInputScrollPadding,
    );
  }
}
