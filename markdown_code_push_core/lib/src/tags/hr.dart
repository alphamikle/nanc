import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as m;

import 'package:markdown_code_push_core/src/config/style_config.dart';

///Tag: hr
///the hr widget
class HrWidget extends StatelessWidget {

  const HrWidget({
    super.key,
    required this.node,
  });
  final m.Element node;

  @override
  Widget build(BuildContext context) {
    final HrConfig? hrConfig = StyleConfig().hrConfig;

    return Container(
      height: hrConfig?.height ?? 2,
      color: hrConfig?.color ?? defaultDividerColor,
    );
  }
}

///config class for [HrWidget]
class HrConfig {

  HrConfig({this.height, this.color});
  final double? height;
  final Color? color;
}
