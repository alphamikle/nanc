import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';

import '../../theme/kit_input_decorations.dart';
import '../kit_buttons/kit_input_button.dart';
import 'kit_segmented_field/kit_focus_stream_mixin.dart';
import 'kit_segmented_field/kit_segmented_field.dart';
import 'kit_text_field.dart';

class KitIdInput extends StatefulWidget {
  const KitIdInput({
    required this.controller,
    required this.helper,
    required this.placeholder,
    required this.tooltip,
    required this.onChanged,
    this.isChanged = false,
    this.isRequired = false,
    this.validator,
    super.key,
  });

  final String helper;
  final String placeholder;
  final String tooltip;
  final bool isChanged;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool isRequired;
  final FormFieldValidator<String?>? validator;

  @override
  State<KitIdInput> createState() => _KitIdInputState();
}

class _KitIdInputState extends State<KitIdInput> with KitFocusStreamMixin {
  void generateId() {
    final String id = Ulid().toUuid();
    widget.controller.text = id;
    widget.onChanged(id);
  }

  @override
  Widget build(BuildContext context) {
    return KitSegmentedField(
      controller: widget.controller,
      helper: widget.helper,
      validator: groupOfValidators([
        if (widget.isRequired) isRequiredValidator,
        if (widget.validator != null) widget.validator!,
      ]),
      isChanged: widget.isChanged,
      autoExpanded: false,
      focusStream: focusStream,
      children: [
        KitInputButton(
          icon: IconPack.flu_key_reset_regular,
          onPressed: generateId,
          tooltip: widget.tooltip,
          first: true,
        ),
        Expanded(
          child: KitTextField(
            decoration: context.kitDecorations.noneDecoration(context).copyWith(hintText: widget.placeholder),
            controller: widget.controller,
            onChanged: widget.onChanged,
            maxLines: 1,
            focusNode: focusNode,
          ).fix(const EdgeInsets.only(right: 1.25)),
        ),
      ],
    );
  }
}
