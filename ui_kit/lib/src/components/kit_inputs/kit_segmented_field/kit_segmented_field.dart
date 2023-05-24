import 'package:flutter/material.dart';

import 'kit_segmented_field_ui.dart';

class KitSegmentedField extends FormField<String> {
  KitSegmentedField({
    required List<Widget> children,
    required String helper,
    required this.controller,
    bool isChanged = false,
    bool autoExpanded = true,
    Stream<bool>? focusStream,
    super.validator,
    super.key,
  }) : super(
          initialValue: controller.text,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState<String> state) {
            return KitSegmentedFieldUI(
              helper: helper,
              state: state,
              isChanged: isChanged,
              autoExpanded: autoExpanded,
              focusStream: focusStream,
              children: children,
            );
          },
        );

  final TextEditingController controller;

  @override
  FormFieldState<String> createState() => _KitSegmentedFieldState();
}

class _KitSegmentedFieldState extends FormFieldState<String> {
  @override
  KitSegmentedField get widget => super.widget as KitSegmentedField;

  void updateValue() {
    if (value != widget.controller.text) {
      didChange(widget.controller.text);
    }
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(updateValue);
  }

  @override
  void dispose() {
    widget.controller.removeListener(updateValue);
    super.dispose();
  }
}

extension FixFieldInTheSegment on Widget {
  Widget get fixed {
    return Padding(
      padding: const EdgeInsets.only(top: 0.5, right: 1.5),
      child: this,
    );
  }
}
