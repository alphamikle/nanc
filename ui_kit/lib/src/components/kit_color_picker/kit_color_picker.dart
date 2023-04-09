import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../constants/gap.dart';
import 'palette.dart';

class KitColorPicker extends StatefulWidget {
  const KitColorPicker({
    required this.pickerColor,
    required this.onColorChanged,
    this.pickerAreaBorderRadius = BorderRadius.zero,
    super.key,
  });

  final Color pickerColor;
  final ValueChanged<Color> onColorChanged;
  final BorderRadius pickerAreaBorderRadius;

  @override
  State<KitColorPicker> createState() => _KitColorPickerState();
}

class _KitColorPickerState extends State<KitColorPicker> {
  HSVColor currentHsvColor = const HSVColor.fromAHSV(0, 0, 0, 0);
  List<Color> colorHistory = [];

  // ignore: avoid_positional_boolean_parameters
  void updateColorOfPickerSlider(HSVColor color, bool isMonochromeMode) {
    safeSetState(() => currentHsvColor = color);
    if (isMonochromeMode == false) {
      widget.onColorChanged(currentHsvColor.toColor());
    }
  }

  @override
  void initState() {
    currentHsvColor = HSVColor.fromColor(widget.pickerColor);
    super.initState();
  }

  void onColorChanging(HSVColor color) {
    safeSetState(() => currentHsvColor = color);
    widget.onColorChanged(currentHsvColor.toColor());
  }

  @override
  void didUpdateWidget(KitColorPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    currentHsvColor = HSVColor.fromColor(widget.pickerColor);
  }

  Widget colorPickerSlider(TrackType trackType) {
    return ColorPickerSlider(
      trackType,
      currentHsvColor,
      updateColorOfPickerSlider,
      displayThumbColor: true,
    );
  }

  Widget colorPicker() {
    return ClipRRect(
      borderRadius: widget.pickerAreaBorderRadius,
      child: ColorPickerArea(
        currentHsvColor,
        onColorChanging,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;

        return SizedBox(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  width: width,
                  height: height / 2,
                  child: colorPicker(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Gap.regular),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: Gap.small),
                      child: ColorIndicator(currentHsvColor),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: colorPickerSlider(TrackType.hue),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: colorPickerSlider(TrackType.alpha),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 3.5),
                                child: Text(
                                  ((currentHsvColor.alpha * 100 * 2).round() / 2).toString(),
                                  style: context.theme.textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
