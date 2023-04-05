import 'package:markdown/markdown.dart' as md;
import '../types/types.dart';

extension ElementToJson on md.Node {
  Json toJson() {
    if (this is md.Element) {
      final md.Element me = this as md.Element;

      return <String, dynamic>{
        'tag': me.tag,
        'children': (me.children ?? []).map<Json>((md.Node node) => node.toJson()).toList(),
        'attributes': me.attributes,
        'generatedId': me.generatedId,
      };
    } else if (this is md.Text) {
      final md.Text me = this as md.Text;

      return <String, dynamic>{
        'text': me.text,
      };
    } else if (this is md.UnparsedContent) {
      final md.UnparsedContent me = this as md.UnparsedContent;

      return <String, dynamic>{
        'textContent': me.textContent,
      };
    }
    return <String, dynamic>{};
  }
}
