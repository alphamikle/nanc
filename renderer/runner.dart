import 'dart:io';
import 'dart:isolate';

import 'package:xml/xml.dart';

Future<void> main() async {
  final String source = File(String.fromEnvironment('SOURCE')).readAsStringSync();
  final sw = Stopwatch()..start();
  final XmlDocument result = XmlDocument.parse(prepareXml(source));
  print('parsed in ==> ${sw.elapsedMicroseconds / 1000}');
  sw.reset();
  final XmlDocument isolatedResult = await Isolate.run(() => isolatedParser(source));
  print('isolated parsed in ==> ${sw.elapsedMicroseconds / 1000}');
  print(1);
}

XmlDocument isolatedParser(String source) => XmlDocument.parse(prepareXml(source));

String prepareXml(String html) {
  return '''
<?xml version="1.0"?>
<root>
  $html
</root>
''';
}
