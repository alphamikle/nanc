import 'package:markdown/markdown.dart' as md;
import 'package:nanc_renderer/src/domain/logic/tags/renderers/component/component_renderer.dart';

extension ContentElementHash on md.Element {
  String get contentHash {
    return attributes[kHashAttribute] ?? '';
  }
}
