import 'package:flutter/material.dart';
import 'package:tag_converter/tag_converter.dart';

typedef TemplateId = String;

const String kTemplateId = 'templateId';
const String kValueId = 'valueId';

final RegExp _templateRegExp = RegExp(r'template\((?<templateId>[-\w.]+)\)\.(?<valueId>\w+)');

class TemplateStorage extends InheritedWidget {
  TemplateStorage({
    required super.child,
    super.key,
  });

  final Map<TemplateId, List<TagNode>> _templates = {};
  final Map<TemplateId, Map<String, String>> _templateValues = {};

  static TemplateStorage of(BuildContext context) {
    final TemplateStorage? templateStorage = context.dependOnInheritedWidgetOfExactType<TemplateStorage>();
    if (templateStorage == null) {
      throw Exception('Not found TemplateStorage at the widget tree');
    }
    return templateStorage;
  }

  static String? findData({
    required BuildContext context,
    required TemplateId templateId,
    required String valueId,
    required String hash,
  }) {
    return TemplateStorage.of(context).getValue(
      templateId: templateId,
      valueId: valueId,
      hash: hash,
    );
  }

  static Iterable<RegExpMatch> getMatches(String value) => _templateRegExp.allMatches(value);

  void saveTemplate({
    required TemplateId templateId,
    required List<TagNode> components,
  }) {
    _templates[templateId] = components;
    _templateValues.removeWhere((TemplateId key, Map<String, String> value) => key.startsWith(templateId));
  }

  void saveArguments({
    required TemplateId templateId,
    required Map<String, String> arguments,
    required String hash,
  }) {
    _templateValues['$templateId:$hash'] = arguments;
  }

  List<TagNode>? findTemplate(TemplateId templateId) => _templates[templateId];

  String? getValue({
    required TemplateId templateId,
    required String valueId,
    required String hash,
  }) {
    return _templateValues['$templateId:$hash']?[valueId];
  }

  @override
  bool updateShouldNotify(TemplateStorage oldWidget) => oldWidget._templates != _templates || oldWidget._templateValues != _templateValues;
}
