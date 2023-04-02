import 'package:nanc_renderer/src/domain/logic/xml_parser/xml_parser.dart'
    if (dart.library.io) './xml_parser_native.dart'
    if (dart.library.html) './xml_parser_web';
import 'package:xml/xml.dart';

Future<XmlDocument> parseXml(String xml) async => parse(xml);
XmlDocument parseXmlSync(String xml) => parseSync(xml);
const String kRootNode = 'root';
