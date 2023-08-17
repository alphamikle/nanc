import 'package:flutter/cupertino.dart';

import '../../../../../nanc_renderer.dart';
import '../renderers/component/element_hash_extension.dart';
import '../renderers/for/for_renderer.dart';
import '../tools/chain_extractor.dart';
import 'for_storage.dart';
import 'local_data.dart';
import 'page_data.dart';
import 'template_storage.dart';

class Substitutor {
  Substitutor({
    required this.context,
  });

  final BuildContext context;
  final RegExp _substitutionRegExp = RegExp(r'{{.*}}');
  final RegExp _clearingRegExp = RegExp(r'(?<start>{{)(?<content>[^}]+)(?<end>}})');

  static WidgetTag enrichElement({required BuildContext context, required WidgetTag node}) {
    final Substitutor substitutor = Substitutor(context: context);
    final Map<String, String> attributes = {...node.attributes};
    for (final MapEntry<String, String> attributeEntry in node.attributes.entries) {
      if (substitutor.haveExpression(attributeEntry.value)) {
        attributes[attributeEntry.key] = substitutor.substitute(node.contentHash, attributeEntry.value);
        attributes['${attributeEntry.key}_old'] = substitutor._clearValue(substitutor._prepareForClearing(attributeEntry.value));
      }
    }
    return node.copyWith(attributes: attributes);
  }

  bool haveExpression(String value) => _substitutionRegExp.hasMatch(value);

  String substitute(String hash, String value) {
    final String withLocalData = _replaceWithLocalData(value);
    final String withDataStorage = _replaceWithDataStorage(withLocalData);
    final String withTemplateData = _replaceWithTemplateData(hash, withDataStorage);
    final String withPageData = _replaceWithPageData(withTemplateData);
    final String withCycleData = _replaceWithCycleData(withPageData);
    final String preparedForClearingData = _prepareForClearing(withCycleData);
    final String clearValue = _clearValue(preparedForClearingData);
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

  String _replaceWithDataStorage(String value) {
    final Iterable<RegExpMatch> matches = DataStorage.getMatches(value);
    if (matches.isEmpty) {
      return value;
    }
    String replacedValue = value;
    final DataStorage pageDataProvider = DataStorage.of(context);
    for (final RegExpMatch match in matches) {
      final String? query = match.group(0);
      final String pageData = pageDataProvider.getValueAsString(query: query) ?? 'null';

      replacedValue = replacedValue.replaceFirst(
        match.pattern,
        pageData,
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
    final PageData pageDataProvider = PageData.of(context);
    for (final RegExpMatch match in matches) {
      final String? query = match.group(0);
      final String pageData = pageDataProvider.getValueAsString(query: query) ?? 'null';

      replacedValue = replacedValue.replaceFirst(
        match.pattern,
        pageData,
      );
    }
    return replacedValue;
  }

  String _replaceWithCycleData(String value) {
    final Iterable<RegExpMatch> matches = ForStorage.getMatches(value);
    if (matches.isEmpty) {
      return value;
    }
    String replacedValue = value;
    final ForStorage forStorage = ForStorage.of(context);
    for (final RegExpMatch match in matches) {
      final String cycleId = match.namedGroup('cycleId')!;
      final int index = int.parse(match.namedGroup('index')!);
      final String paramName = match.namedGroup('paramName')!;
      final String? expression = match.namedGroup('expression');
      final List<Object?>? values = forStorage.getCycleData(cycleId);
      final bool isNull = index < 0 || values == null || values.isEmpty || values.length <= index;
      final bool isIndex = paramName.startsWith(kIndex);
      final bool isSimpleValue = paramName.startsWith(kValue) && expression == null;

      String cycleData = 'null';
      if (isNull == false) {
        if (isIndex) {
          cycleData = index.toString();
        } else if (isSimpleValue) {
          cycleData = values![index].toString();
        } else {
          final dynamic value = values![index];
          cycleData = extractValueByChain(value, expression!.split('.')).toString();
        }
      }

      replacedValue = replacedValue.replaceFirst(
        match.pattern,
        cycleData,
      );
    }
    return replacedValue;
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
}
