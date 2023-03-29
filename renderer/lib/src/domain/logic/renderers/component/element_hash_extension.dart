import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/src/renderers/component/component_renderer.dart';

extension ContentElementHash on md.Element {
  String get contentHash {
    return attributes[kHashAttribute] ?? '';
  }
}
