import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:fonts/fonts.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';

import '../kit_buttons/kit_icon_button_v2.dart';
import '../kit_fonts/kit_fonts.dart';
import '../kit_icons/kit_icon_selector_modal.dart';
import '../kit_list_tile.dart';
import 'kit_autocomplete_text_field.dart';

class KitFontInput extends StatefulWidget {
  const KitFontInput({
    required this.controller,
    required this.helper,
    required this.placeholder,
    required this.onChanged,
    this.isChanged = false,
    this.isReadOnly = false,
    this.isRequired = false,
    super.key,
  });

  final String helper;
  final String placeholder;
  final bool isChanged;
  final bool isReadOnly;
  final bool isRequired;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  State<KitFontInput> createState() => _KitFontInputState();
}

class _KitFontInputState extends State<KitFontInput> {
  void controllerListener() => widget.onChanged(widget.controller.text);

  void preload() {
    final EnumValue? selectedValue = findSelected();
    if (selectedValue != null) {
      widget.controller.text = selectedValue.title;
    }
  }

  void onSelect(EnumValue value) {
    widget.controller.text = value.title;
    widget.onChanged(value.title);
  }

  EnumValue? findSelected() {
    final String fontName = widget.controller.text.trim();
    if (fontName.isEmpty) {
      return null;
    }
    final String? font = tryToGetFontByName(fontName);
    if (font != null) {
      return EnumValue(title: font, value: font);
    }
    return null;
  }

  Widget fontItemBuilder(BuildContext context, EnumValue enumValue) {
    final String font = enumValue.title;
    final bool isCustom = isCustomFontExist(font);
    final Text fontWidget = Text('$font${isCustom ? ' (custom)' : ''}');

    return KitListTile(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          fontWidget,
          if (isCustom == false) const Spacer(),
          if (isCustom == false)
            Opacity(
              opacity: 0.5,
              child: KitIconButtonV2(
                icon: IconPack.rmx_external_link_line,
                onPressed: () async => launchUrl(Uri.parse('https://fonts.google.com/specimen/$font')),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> selectFontFromModal() async {
    final EnumValue? selectedIcon = await selectIcon(
      context: context,
      query: widget.controller.text,
      selectedIcon: findSelected(),
    );
    if (selectedIcon != null) {
      onSelect(selectedIcon);
    }
  }

  @override
  void initState() {
    super.initState();
    preload();
    widget.controller.addListener(controllerListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(controllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KitAutocompleteTextField(
      controller: widget.controller,
      helper: widget.helper,
      label: 'Type to search fonts...',
      validator: groupOfValidators([
        _fontValidator,
      ]),
      finder: fontFinder,
      onSelect: onSelect,
      itemBuilder: fontItemBuilder,
      isRequired: widget.isRequired,
      isChanged: widget.isChanged,
    );
  }
}

String? _fontValidator(String? query) {
  if (query != null && query.trim() != '') {
    if (isGoogleFontExist(query) || isCustomFontExist(query)) {
      return null;
    }
    return 'Font family "$query" don\'t exist';
  }
  return null;
}
