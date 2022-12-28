import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/src/components/kit_color_picker/kit_color_picker.dart';
import 'package:ui_kit/src/components/kit_inputs/kit_autocomplete_text_field.dart';
import 'package:ui_kit/src/theme/kit_borders.dart';

String? _isValueColor(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  final Color? color = colorFromHex(value);
  if (color == null) {
    return 'Value "$value" is not a hex color (#FFD1510D)';
  }
  return null;
}

class KitColorInput extends StatefulWidget {
  const KitColorInput({
    required this.controller,
    required this.helper,
    required this.placeholder,
    this.onChanged,
    this.isChanged = false,
    this.isRequired = false,
    super.key,
  });

  final TextEditingController controller;
  final String helper;
  final String placeholder;
  final bool isChanged;
  final bool isRequired;
  final ValueChanged<String>? onChanged;

  @override
  State<KitColorInput> createState() => _KitColorInputState();
}

class _KitColorInputState extends State<KitColorInput> {
  final StreamController<Color> colorStreamController = StreamController.broadcast();
  Timer? debounce;
  Color color = Colors.white;
  bool isUpdating = false;

  Widget buildColorPalette(BuildContext context, String colorValue) {
    final BorderRadius inputBorderRadius = context.kitBorders.inputRadius;
    final double radiusValue = inputBorderRadius.topLeft.x;
    final Radius effectiveRadius = Radius.circular(radiusValue * 1.15);

    final BorderRadius borderRadius = BorderRadius.only(
      topLeft: effectiveRadius,
      topRight: effectiveRadius,
    );

    return ClipRRect(
      borderRadius: context.kitBorders.inputRadius,
      child: Container(
        height: 300,
        color: context.theme.colorScheme.tertiaryContainer,
        child: StreamBuilder<Color>(
          initialData: color,
          stream: colorStreamController.stream,
          builder: (BuildContext context, AsyncSnapshot<Color> snapshot) => KitColorPicker(
            onColorChanged: updateColor,
            pickerColor: snapshot.requireData,
            pickerAreaBorderRadius: borderRadius,
          ),
        ),
      ),
    );
  }

  void updateColor(Color color) {
    isUpdating = true;
    debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 250), () {
      colorStreamController.add(color);
      this.color = color;
      final String hexColor = colorToHex(color, includeHashSign: true);
      widget.controller.text = hexColor;
      onChanged(hexColor);
      debounce = null;
      isUpdating = false;
    });
  }

  void onChanged(String hexColor) {
    if (widget.onChanged != null) {
      widget.onChanged!(hexColor);
    }
  }

  void initColor() {
    if (widget.controller.text.isNotEmpty) {
      final String hexColor = widget.controller.text;
      final Color? color = colorFromHex(hexColor);
      if (color == null) {
        widget.controller.clear();
      } else {
        colorStreamController.add(color);
        this.color = color;
      }
    }
  }

  void textToColorHandler() {
    if (isUpdating) {
      return;
    }
    final String hexColor = widget.controller.text;
    final Color? color = colorFromHex(hexColor);
    if (color != null) {
      colorStreamController.add(color);
      this.color = color;
      onChanged(hexColor);
    } else {
      colorStreamController.add(Colors.white);
      this.color = Colors.white;
      onChanged(hexColor);
    }
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(textToColorHandler);
    initColor();
  }

  @override
  void dispose() {
    unawaited(colorStreamController.close());
    widget.controller.removeListener(textToColorHandler);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KitAutocompleteTextField(
      controller: widget.controller,
      finder: (_) => [''],
      helper: widget.helper,
      placeholder: widget.placeholder,
      isChanged: widget.isChanged,
      itemBuilder: buildColorPalette,
      closeOnSelect: false,
      noUpdateOnType: true,
      isRequired: widget.isRequired,
      validator: groupOfValidators([
        _isValueColor,
      ]),
    );
  }
}
