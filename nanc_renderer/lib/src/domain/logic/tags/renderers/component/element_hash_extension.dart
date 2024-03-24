import 'package:tag_converter/tag_converter.dart';

import 'component_renderer.dart';

extension ContentElementHash on WidgetTag {
  String get contentHash {
    return attributes[kHashAttribute] ?? '';
  }
}
