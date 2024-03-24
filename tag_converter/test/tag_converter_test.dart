import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'package:tag_converter/src/domain/logic/model/tag.dart';
import 'package:tag_converter/src/domain/logic/service/converter/tags_converter.dart';
import 'package:test/test.dart';

import 'data/small_node.dart';

void main() {
  late final File xmlFile;
  late final String xmlContent;
  late final List<TagNode> xmlNodes;
  late final File jsonFile;
  late final String jsonContent;
  late final List<TagNode> jsonNodes;
  late final File binaryFile;
  late final Uint8List binaryContent;
  late final List<TagNode> binaryNodes;

  setUpAll(() {
    final bool runningFromTestFolder = p.current.endsWith('test');

    /// ? XML
    xmlFile = File(p.join(p.current, '${runningFromTestFolder ? '' : 'test/'}data/test_xml_page.html'));
    xmlContent = xmlFile.readAsStringSync();
    xmlNodes = TagsConverter.fromXml(xmlContent);

    /// ? JSON
    jsonFile = File(p.join(p.current, '${runningFromTestFolder ? '' : 'test/'}data/test_json_page.json'));
    jsonContent = jsonFile.readAsStringSync();
    jsonNodes = TagsConverter.fromJson(jsonDecode(jsonContent));

    /// ? Protobuf
    binaryFile = File(p.join(p.current, '${runningFromTestFolder ? '' : 'test/'}data/test_proto_page'));
    // binaryFile.writeAsBytesSync(TagsConverter.toBinaryFromXml(xmlContent) ?? []);
    binaryContent = binaryFile.readAsBytesSync();
    binaryNodes = [...TagsConverter.fromBinary(binaryContent)];
  });

  test('Small conversion from XML to Protobuf', () {
    final List<TagNode> xmlNodes = TagsConverter.fromXml(adCardXmlNode);
    final Uint8List? binaryForm = TagsConverter.toBinaryFromXml(adCardXmlNode);
    final List<TagNode> binaryNodes = TagsConverter.fromBinary(binaryForm ?? Uint8List(0));
    expect(xmlNodes, equals(binaryNodes));
  });

  test('XML to JSON Converting', () {
    expect(xmlNodes.length, jsonNodes.length);

    for (int i = 0; i < xmlNodes.length; i++) {
      final TagNode xmlNode = xmlNodes[i];
      final TagNode jsonNode = jsonNodes[i];

      expect(xmlNode, equals(jsonNode));
    }
  });

  test('XML to Protobuf', () {
    expect(xmlNodes.length, jsonNodes.length);

    for (int i = 0; i < xmlNodes.length; i++) {
      final TagNode xmlNode = xmlNodes[i];
      final TagNode binaryNode = binaryNodes[i];

      expect(xmlNode, equals(binaryNode));
    }
  });
}
