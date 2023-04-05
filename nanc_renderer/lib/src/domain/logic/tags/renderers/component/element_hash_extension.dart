import 'package:markdown/markdown.dart' as md;
import 'component_renderer.dart';

extension ContentElementHash on md.Element {
  String get contentHash {
    return attributes[kHashAttribute] ?? '';
  }
}
