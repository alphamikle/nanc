import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../field/logic/fields/enum_field/enum_value.dart';
import '../kit_list_tile.dart';
import 'kit_autocomplete_text_field.dart';
import 'kit_button_field_wrapper.dart';

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
    this.withSearch = false,
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
  final bool withSearch;

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
    final Widget child = KitAutocompleteTextField(
      controller: widget.controller,
      finder: (_) => widget.values,
      onSelect: widget.onSelect,
      helper: widget.helper,
      placeholder: widget.placeholder,
      readOnly: widget.withSearch == false,
      isChanged: widget.isChanged,
      itemBuilder: itemBuilder,
      formatters: [
        if (widget.withSearch == false)
          FilteringTextInputFormatter(
            '',
            allow: true,
          ),
      ],
      withCursor: widget.withSearch,
      focusNode: focusNode,
      isRequired: widget.isRequired,
    );

    if (widget.withSearch) {
      return child;
    }

    return KitButtonFieldWrapper(
      onPressed: () => focusNode.requestFocus(),
      child: child,
    );
  }
}
