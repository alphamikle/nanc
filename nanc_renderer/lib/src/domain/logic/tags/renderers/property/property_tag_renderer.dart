import '../../tag_description.dart';
import '../../tag_renderer.dart';

class PropertyTagRenderer extends TagRenderer {
  PropertyTagRenderer({
    required super.icon,
    required super.tag,
    required super.example,
    required super.builder,
  }) : super(description: const TagDescription.empty());
}
