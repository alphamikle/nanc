import 'package:rich_renderer/rich_renderer.dart';

class PropertyTagRenderer extends TagRenderer {
  PropertyTagRenderer({
    required super.icon,
    required super.tag,
    required super.pattern,
    required super.endPattern,
    required super.example,
    required super.builder,
  }) : super(description: const TagDescription.empty());
}
