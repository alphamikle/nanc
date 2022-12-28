import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/src/components/kit_inputs/kit_autocomplete_text_field.dart';
import 'package:ui_kit/src/components/kit_inputs/kit_button_field_wrapper.dart';
import 'package:ui_kit/src/components/kit_list_tile.dart';

class KitEnumField extends StatefulWidget {
  const KitEnumField({
    required this.controller,
    required this.selected,
    required this.values,
    required this.onSelect,
    required this.helper,
    required this.placeholder,
    this.isChanged = false,
    this.isRequired = false,
    super.key,
  });

  final TextEditingController controller;
  final EnumValue? selected;
  final List<EnumValue> values;
  final ValueChanged<EnumValue?> onSelect;
  final String helper;
  final String placeholder;
  final bool isChanged;
  final bool isRequired;

  @override
  State<KitEnumField> createState() => _KitEnumFieldState();
}

class _KitEnumFieldState extends State<KitEnumField> {
  final FocusNode focusNode = FocusNode();

  Widget itemBuilder(BuildContext context, EnumValue value) {
    return KitListTile(
      title: value.title,
      isSelected: widget.selected == value,
    );
  }

  void controllerListener() {
    if (widget.controller.text.isEmpty) {
      widget.onSelect(null);
    }
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(controllerListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(controllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KitButtonFieldWrapper(
      onPressed: () => focusNode.requestFocus(),
      child: KitAutocompleteTextField(
        controller: widget.controller,
        finder: (_) => widget.values,
        onSelect: widget.onSelect,
        helper: widget.helper,
        placeholder: widget.placeholder,
        readOnly: true,
        isChanged: widget.isChanged,
        itemBuilder: itemBuilder,
        formatters: [
          FilteringTextInputFormatter(
            '',
            allow: true,
          ),
        ],
        withCursor: false,
        focusNode: focusNode,
        isRequired: widget.isRequired,
      ),
    );
  }
}
