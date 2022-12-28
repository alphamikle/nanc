import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/src/components/kit_buttons/kit_input_button.dart';
import 'package:ui_kit/src/components/kit_inputs/kit_segmented_field/kit_focus_stream_mixin.dart';
import 'package:ui_kit/src/components/kit_inputs/kit_segmented_field/kit_segmented_field.dart';
import 'package:ui_kit/src/components/kit_inputs/kit_text_field.dart';
import 'package:ui_kit/src/theme/kit_input_decorations.dart';

class KitIdInput extends StatefulWidget {
  const KitIdInput({
    required this.controller,
    required this.helper,
    required this.placeholder,
    required this.tooltip,
    required this.onChanged,
    this.isChanged = false,
    this.isRequired = false,
    super.key,
  });

  final String helper;
  final String placeholder;
  final String tooltip;
  final bool isChanged;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool isRequired;

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
      ]),
      isChanged: widget.isChanged,
      autoExpanded: false,
      focusStream: focusStream,
      children: [
        KitInputButton(
          icon: MdiIcons.keyChain,
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
          ).fixed,
        ),
      ],
    );
  }
}
