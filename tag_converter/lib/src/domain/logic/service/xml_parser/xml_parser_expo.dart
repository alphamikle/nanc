import 'package:xml/xml.dart';

XmlDocument parseXmlSync(String xml) => XmlDocument.parse(_prepareXml(xml));

String _prepareXml(String html) {
  return '''
<?xml version="1.0"?>
<root>
  $html
</root>
''';
}

const String kRootNode = 'root';
