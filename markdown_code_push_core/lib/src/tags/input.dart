import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as m;

import 'package:markdown_code_push_core/src/config/style_config.dart';

///Tag: input
InlineSpan getInputSpan(m.Element node) {
  bool checked = true;
  if (node.attributes['checked'] != null) {
    checked = node.attributes['checked']!.toLowerCase() == 'true';
  }
  return WidgetSpan(
    child: StyleConfig().checkBoxBuilder?.call(checked, node.attributes) ?? MCheckBox(attributes: node.attributes, config: StyleConfig().checkBoxConfig),
  );
}

typedef CheckBoxBuilder = Widget Function(bool checked, Map<String, String> attributes);

///config class for [MCheckBox]
class CheckBoxConfig {

  CheckBoxConfig({this.color, this.size});
  final Color? color;
  final double? size;
}

///the check box widget
class MCheckBox extends StatefulWidget {

  const MCheckBox({
    super.key,
    this.config,
    required this.attributes,
  });
  final CheckBoxConfig? config;
  final Map<String, String> attributes;

  @override
  _MCheckBoxState createState() => _MCheckBoxState();
}

class _MCheckBoxState extends State<MCheckBox> {
  late bool value;

  @override
  void initState() {
    bool checked = false;
    if (widget.attributes['checked'] != null) {
      checked = widget.attributes['checked']!.toLowerCase() == 'true';
    }
    value = checked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        value ? Icons.check_box : Icons.check_box_outline_blank,
        size: widget.config?.size ?? 15,
        color: widget.config?.color,
      ),
      onTap: () {
        setState(() {
          value = !value;
        });
      },
    );
  }
}
