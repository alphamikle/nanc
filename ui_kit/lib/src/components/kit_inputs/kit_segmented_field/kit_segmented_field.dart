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
    return _FixedChild(child: this);
  }

  Widget fix(EdgeInsets clipPadding) {
    return _FixedChild(
      clipPadding: clipPadding,
      child: this,
    );
  }
}

class _FixedChild extends StatelessWidget {
  const _FixedChild({
    required this.child,
    this.clipPadding = const EdgeInsets.only(left: 1.25, right: 1.15),
    super.key,
  });

  final Widget child;
  final EdgeInsets clipPadding;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipper: _FieldClipper(clipPadding),
      child: Padding(
        padding: const EdgeInsets.only(top: 0.5),
        child: child,
      ),
    );
  }
}

class _FieldClipper extends CustomClipper<Rect> {
  _FieldClipper(this.clipPadding);

  final EdgeInsets clipPadding;

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(clipPadding.left, clipPadding.top, size.width - clipPadding.right, size.height - clipPadding.bottom);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
