import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/src/components/kit_buttons/kit_input_button.dart';
import 'package:ui_kit/src/components/kit_icons/kit_icon_selector_modal.dart';
import 'package:ui_kit/src/components/kit_icons/kit_icons.dart';
import 'package:ui_kit/src/components/kit_inputs/kit_autocomplete_text_field.dart';
import 'package:ui_kit/src/components/kit_inputs/kit_segmented_field/kit_focus_stream_mixin.dart';
import 'package:ui_kit/src/components/kit_inputs/kit_segmented_field/kit_segmented_field.dart';
import 'package:ui_kit/src/components/kit_list_tile.dart';
import 'package:ui_kit/src/constants/gap.dart';
import 'package:ui_kit/src/theme/kit_colors.dart';
import 'package:ui_kit/src/theme/kit_input_decorations.dart';

class KitIconInput extends StatefulWidget {
  const KitIconInput({
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
  State<KitIconInput> createState() => _KitIconInputState();
}

class _KitIconInputState extends State<KitIconInput> with KitFocusStreamMixin {
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
    final String iconName = widget.controller.text;
    if (iconName.isEmpty) {
      return null;
    }
    final IconData? iconPath = tryToGetIconByName(iconName);
    if (iconPath != null) {
      return EnumValue(title: iconName, value: iconPath);
    }
    return null;
  }

  Widget buildIcon(EnumValue enumValue, {bool withOpacity = false}) {
    return Icon(
      enumValue.typedValue(),
      size: withOpacity ? 30 : null,
      color: withOpacity ? context.theme.iconTheme.color?.border : null,
    );
  }

  Widget _iconItemBuilder(BuildContext context, EnumValue enumValue) {
    return KitListTile(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: Gap.large),
            child: buildIcon(enumValue),
          ),
          Text(enumValue.title),
        ],
      ),
    );
  }

  Future<void> selectIconFromModal() async {
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
    final EnumValue? selected = findSelected();
    // v2
    return Stack(
      children: [
        KitSegmentedField(
          autoExpanded: false,
          controller: widget.controller,
          helper: widget.helper,
          validator: groupOfValidators([
            _iconValidator,
          ]),
          focusStream: focusStream,
          children: [
            KitInputButton(
              icon: IconPack.flu_grid_dots_filled,
              onPressed: selectIconFromModal,
              tooltip: 'Open icon grid view',
              first: true,
            ),
            Expanded(
              child: KitAutocompleteTextField(
                controller: widget.controller,
                finder: iconFinder,
                onSelect: onSelect,
                itemBuilder: _iconItemBuilder,
                isRequired: widget.isRequired,
                isChanged: widget.isChanged,
                inputDecoration: context.kitDecorations.noneDecoration(context).copyWith(hintText: widget.placeholder),
                suggestionOffset: Gap.regular,
                focusNode: focusNode,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 50,
            height: 50,
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: selected == null ? const SizedBox.shrink() : buildIcon(selected, withOpacity: true),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String? _iconValidator(String? iconName) {
  if (iconName != null && iconName.trim() != '') {
    if (isIconExist(iconName)) {
      return null;
    }
    return '"$iconName" is not a valid icon name';
  }
  return null;
}
