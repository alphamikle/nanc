import 'package:xml/xml.dart';

import './xml_parser.dart' if (dart.library.io) './xml_parser_native.dart' if (dart.library.html) './xml_parser_web';

Future<XmlDocument> parseXml(String xml) async => parse(xml);
XmlDocument parseXmlSync(String xml) => parseSync(xml);
const String kRootNode = 'root';
