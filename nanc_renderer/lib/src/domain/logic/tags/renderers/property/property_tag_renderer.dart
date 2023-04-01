import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_renderer.dart';

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
