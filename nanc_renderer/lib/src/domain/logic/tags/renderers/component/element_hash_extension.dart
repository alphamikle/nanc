import '../../../model/tag.dart';
import 'component_renderer.dart';

extension ContentElementHash on WidgetTag {
  String get contentHash {
    return attributes[kHashAttribute] ?? '';
  }
}
