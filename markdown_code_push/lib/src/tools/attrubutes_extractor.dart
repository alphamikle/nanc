import 'dart:convert';

import 'package:xml2json/xml2json.dart';

Map<String, String> extractAttributes(String tag) {
  String xml = '';
  try {
    final Xml2Json transformer = Xml2Json();
    final RegExp clearingTagNameRegExp = RegExp(r'^ *<(?<name>[a-z_A-Z-:]+) ?.*$');
    final RegExpMatch? match = clearingTagNameRegExp.firstMatch(tag);
    if (match == null) {
      throw Exception('Incorrect tag: $tag');
    }
    final String clearTagName = match.namedGroup('name')!;
    final String notClosedTag = tag.replaceFirst(RegExp(r'/>'), '>');

    xml = '<root>$notClosedTag</$clearTagName></root>';

    transformer.parse(xml);
    final Map<String, dynamic> rawAttributes = jsonDecode(transformer.toBadgerfish()) as Map<String, dynamic>;

    /// ? Digging into something like this: {\"root\": {\"padding\": {\"@left\": \"50\", \"@top\": \"25\"}}}
    final Map<String, dynamic> tagAttributes = (rawAttributes['root'] as Map<String, dynamic>).entries.first.value as Map<String, dynamic>;
    return tagAttributes.map((String key, dynamic value) => MapEntry(key.replaceFirst('@', ''), value.toString()));
  } catch (error, stackTrace) {
    // Handle error
    // log('Error while extract attributes from tag: $tag; xml: $xml', name: 'ERROR', error: error, stackTrace: stackTrace);
  }
  return {};
}
