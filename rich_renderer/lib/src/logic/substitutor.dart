import 'package:flutter/cupertino.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/component/element_hash_extension.dart';
import 'package:tools/tools.dart';

class Substitutor {
  Substitutor({
    required this.context,
  });

  final BuildContext context;
  final RegExp _substitutionRegExp = RegExp(r'{{.*}}');
  final RegExp _clearingRegExp = RegExp(r'(?<start>{{)(?<content>[^}}]+)(?<end>}})');

  static Future<md.Element> enrichElement({required BuildContext context, required md.Element node}) async {
    final Substitutor substitutor = Substitutor(context: context);
    final Map<String, String> attributes = {...node.attributes};
    for (final MapEntry<String, String> attributeEntry in node.attributes.entries) {
      if (substitutor.haveExpression(attributeEntry.value)) {
        attributes[attributeEntry.key] = await substitutor.substitute(node.contentHash, attributeEntry.value);
      }
    }
    final md.Element newNode = md.Element(node.tag, node.children);
    newNode.attributes.addAll(attributes);
    return newNode;
  }

  bool haveExpression(String value) => _substitutionRegExp.hasMatch(value);

  Future<String> substitute(String hash, String value) async {
    final String withLocalData = _replaceWithLocalData(value);
    await wait();
    final String withTemplateData = _replaceWithTemplateData(hash, withLocalData);
    await wait();
    final String withPageData = _replaceWithPageData(withTemplateData);
    await wait();
    final String preparedForClearingData = _prepareForClearing(withPageData);
    await wait();
    return _clearValue(preparedForClearingData);
  }

  String _prepareForClearing(String value) {
    return value.replaceAll(RegExp(r'{{ *'), '{{').replaceAll(RegExp(r' *}}'), '}}');
  }

  String _clearValue(String value) {
    final Iterable<RegExpMatch> matches = _clearingRegExp.allMatches(value);
    if (matches.isEmpty) {
      return value;
    }
    String clearValue = value;

    for (final RegExpMatch match in matches) {
      final String content = match.namedGroup('content')!;
      clearValue = clearValue.replaceFirst(match.pattern, content);
    }
    return clearValue;
  }

  String _replaceWithLocalData(String value) {
    final Iterable<RegExpMatch> matches = LocalData.getMatches(value);
    if (matches.isEmpty) {
      return value;
    }
    String replacedValue = value;
    for (final RegExpMatch match in matches) {
      final String dataId = match.namedGroup(kDataId)!;
      final String valueId = match.namedGroup(kValueId)!;

      replacedValue = replacedValue.replaceFirst(
        match.pattern,
        LocalData.findData(
              context: context,
              dataId: dataId,
              valueId: valueId,
            ) ??
            'null',
      );
    }
    return replacedValue;
  }

  String _replaceWithTemplateData(String hash, String value) {
    final Iterable<RegExpMatch> matches = TemplateStorage.getMatches(value);
    if (matches.isEmpty) {
      return value;
    }
    String replacedValue = value;
    for (final RegExpMatch match in matches) {
      final String templateId = match.namedGroup(kTemplateId)!;
      final String valueId = match.namedGroup(kValueId)!;
      final String data = TemplateStorage.findData(
            context: context,
            templateId: templateId,
            valueId: valueId,
            hash: hash,
          ) ??
          'null';
      replacedValue = replacedValue.replaceFirst(match.pattern, data);
    }
    return replacedValue;
  }

  String _replaceWithPageData(String value) {
    final Iterable<RegExpMatch> matches = PageData.getMatches(value);
    if (matches.isEmpty) {
      return value;
    }
    String replacedValue = value;
    for (final RegExpMatch match in matches) {
      final PageData pageDataProvider = PageData.of(context);
      final String pageData = pageDataProvider.getValue(query: match.group(0)) ?? 'null';

      replacedValue = replacedValue.replaceFirst(
        match.pattern,
        pageData,
      );
    }
    return replacedValue;
  }
}
