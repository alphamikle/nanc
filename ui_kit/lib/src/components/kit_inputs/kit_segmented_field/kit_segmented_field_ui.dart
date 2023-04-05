import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../../theme/kit_borders.dart';
import '../../../theme/kit_colors.dart';
import '../kit_text_field.dart';

class KitSegmentedFieldUI extends StatelessWidget {
  const KitSegmentedFieldUI({
    required this.children,
    required this.helper,
    required this.state,
    this.isChanged = false,
    this.autoExpanded = true,
    this.focusStream,
    super.key,
  });

  final List<Widget> children;
  final String helper;
  final bool isChanged;
  final bool autoExpanded;
  final FormFieldState<String> state;
  final Stream<bool>? focusStream;

  Stream<bool> get effectiveFocusStream => focusStream ?? Stream.value(false);
  bool get hasError => state.errorText != null;

  static Color generateBorderColor({
    required BuildContext context,
    required bool isChanged,
    required bool hasError,
    required bool hasFocus,
    Color? customColor,
  }) {
    final ThemeData theme = context.theme;
    Color borderColor = theme.inputDecorationTheme.enabledBorder?.borderSide.color ?? Colors.black;
    if (hasError) {
      borderColor = theme.inputDecorationTheme.errorBorder?.borderSide.color ?? theme.colorScheme.error;
    } else if (isChanged) {
      borderColor = context.kitColors.successColor;
    } else if (customColor != null) {
      return customColor;
    } else if (hasFocus) {
      borderColor = theme.inputDecorationTheme.focusedBorder?.borderSide.color ?? theme.colorScheme.primary;
    }
    return borderColor;
  }

  List<Widget> buildChildren(BuildContext context) {
    final List<Widget> children = [];

    for (int i = 0; i < this.children.length; i++) {
      if (autoExpanded) {
        children.add(
          Expanded(
            child: this.children[i],
          ),
        );
      } else {
        children.add(this.children[i]);
      }
      if (i != this.children.length - 1) {
        children.add(
          StreamBuilder(
            initialData: false,
            stream: effectiveFocusStream,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                width: 1,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: generateBorderColor(
                        context: context,
                        isChanged: isChanged,
                        hasError: hasError,
                        hasFocus: snapshot.data ?? false,
                      ),
                      width: (snapshot.data ?? false) ? 2 : 1,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    final InputDecoration decoration = KitTextField.createInputDecoration(
      context: context,
      isChanged: isChanged,
    );

    return Stack(
      children: [
        ClipRRect(
          borderRadius: context.kitBorders.inputRadius,
          child: InputDecorator(
            decoration: decoration.copyWith(
              helperText: helper,
              errorText: state.errorText,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              fillColor: Colors.transparent,
            ),
            child: const SizedBox(
              height: 39,
            ),
          ),
        ),
        StreamBuilder(
          initialData: false,
          stream: effectiveFocusStream,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                border: Border.all(
                  color: generateBorderColor(
                    context: context,
                    isChanged: isChanged,
                    hasError: hasError,
                    hasFocus: snapshot.data ?? false,
                  ),
                  width: (snapshot.data ?? false) ? 2 : 1,
                ),
                borderRadius: context.kitBorders.inputRadius,
              ),
              height: 51,
            );
          },
        ),
        Positioned(
          left: 0,
          top: 1,
          right: 0,
          bottom: 25,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildChildren(context),
          ),
        ),
      ],
    );
  }
}
