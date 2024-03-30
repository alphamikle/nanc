import 'package:flutter/material.dart';
import 'package:nui_converter/nui_converter.dart';

import '../property_widget.dart';
import '../rich_renderer.dart';
import '../tag_renderer.dart';

typedef NuiBuilder<T extends Widget> = T? Function(BuildContext context, WidgetTag element, RichRenderer renderer);
typedef TagRendererFactory<T extends Widget> = TagRenderer<T> Function();
typedef PropertyWidgetFactory<T> = PropertyWidget<PropertyWidget<T>> Function();
