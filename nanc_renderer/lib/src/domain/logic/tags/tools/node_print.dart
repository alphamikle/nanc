import 'package:markdown/markdown.dart' as md;
import 'package:tools/tools.dart';

void nodePrint(md.Element element) {
  logg('''
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
TAG INFO
tag: ${element.tag}
children: ${prettyJson((element.children ?? []).map((md.Node node) => node.toJson()).toList())}
attributes: ${element.attributes}
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
''');
}
