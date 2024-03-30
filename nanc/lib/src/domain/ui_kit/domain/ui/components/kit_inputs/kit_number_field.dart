import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nanc_tools/nanc_tools.dart';

import 'kit_text_field.dart';

class KitNumberField extends StatefulWidget {
  const KitNumberField({
    required this.controller,
    required this.helper,
    required this.placeholder,
    this.isReadOnly = false,
    this.isChanged = false,
    this.isRequired = false,
    this.onChanged,
    this.validator,
    super.key,
  });

  final TextEditingController controller;
  final String helper;
  final String placeholder;
  final bool isReadOnly;
  final bool isChanged;
  final bool isRequired;

  /// Can be [num], [double], [int] or [BigInt]
  final ValueChanged<Object?>? onChanged;
  final FormFieldValidator<String?>? validator;

  @override
  State<KitNumberField> createState() => _KitNumberFieldState();
}

class _KitNumberFieldState extends State<KitNumberField> {
  void onChanged(String value) {
    if (widget.onChanged != null) {
      final bool isFloating = value.contains(RegExp(r'[,.]'));
      if (isFloating) {
        widget.onChanged!(double.tryParse(value));
        return;
      }
      final (int? number, NumberParsingErrorType? error, String? message) = detailedIntFromString(value);
      if (number != null) {
        widget.onChanged!(number);
        return;
      }
      if (error != null && error.isOutOfLimit) {
        widget.onChanged!(BigInt.tryParse(value));
        return;
      }
      widget.onChanged!(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return KitTextField(
      placeholder: widget.placeholder,
      helper: widget.helper,
      controller: widget.controller,
      readOnly: widget.isReadOnly,
      onChanged: onChanged,
      formatters: [
        FilteringTextInputFormatter(
          RegExp(r'^-?(0|[1-9]*)(\d*)(\.?\d*)?'),
          allow: true,
        ),
        FilteringTextInputFormatter(
          RegExp(r'^-?0+[1-9]'),
          allow: false,
        ),
      ], //
      isChanged: widget.isChanged,
      validator: widget.validator,
      isRequired: widget.isRequired,
    );
  }
}
