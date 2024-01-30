import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../model/tag.dart';
import '../renderers/component/element_hash_extension.dart';
import 'data_storage.dart';
import 'document_storage.dart';
import 'for_storage.dart';
import 'handlers/brackets_expression_handler.dart';
import 'handlers/calculation_expression_handler.dart';
import 'handlers/cycle_expression_handler.dart';
import 'handlers/data_storage_expression_handler.dart';
import 'handlers/document_storage_expression_handler.dart';
import 'handlers/template_expression_handler.dart';
import 'template_storage.dart';

typedef ExpressionHandler = String Function(String expression);

final RegExp _substitutionRegExp = RegExp(r'{{[^}]+}}');

class Substitutor {
  Substitutor({
    required BuildContext context,
  })  : _context = context,
        _testDataStorage = null,
        _testTemplateStorage = null,
        _testPageData = null,
        _testForStorage = null;

  @visibleForTesting
  Substitutor.test({
    required DataStorage dataStorage,
    required TemplateStorage templateStorage,
    required DocumentStorage pageData,
    required ForStorage forStorage,
  })  : _context = null,
        _testDataStorage = dataStorage,
        _testTemplateStorage = templateStorage,
        _testPageData = pageData,
        _testForStorage = forStorage;

  // static final Map<String, String> _cache = {};

  static WidgetTag enrichElement({required BuildContext context, required WidgetTag node}) {
    final Substitutor substitutor = Substitutor(context: context);
    final Map<String, String> attributes = {...node.attributes};
    for (final MapEntry<String, String> attributeEntry in node.attributes.entries) {
      if (substitutor.haveExpression(attributeEntry.value)) {
        attributes[attributeEntry.key] = substitutor.substitute(node.contentHash, attributeEntry.value);
        attributes['${attributeEntry.key}_old'] = bracketsExpressionHandler(attributeEntry.value);
      }
    }
    return node.copyWith(attributes: attributes);
  }

  final BuildContext? _context;

  bool get _isTest => kDebugMode && _context == null;

  final DataStorage? _testDataStorage;
  final TemplateStorage? _testTemplateStorage;
  final DocumentStorage? _testPageData;
  final ForStorage? _testForStorage;

  @visibleForTesting
  final List<RegExpMatch> testExpressions = [];

  List<ExpressionHandler> _createHandlers({
    required DataStorage dataStorage,
    required String hash,
    required TemplateStorage templateStorage,
    required DocumentStorage pageDataStorage,
    required ForStorage forStorage,
  }) {
    return [
      bracketsExpressionHandler,
      dataStorageExpressionHandler(dataStorage),
      templateExpressionHandler(hash, templateStorage),
      documentStorageExpressionHandler(pageDataStorage),
      cycleExpressionHandler(forStorage),
      calculationExpressionHandler,
    ];
  }

  bool haveExpression(String value) => _substitutionRegExp.hasMatch(value);

  String substitute(String hash, String value) {
    if (_isTest) {
      final Iterable<RegExpMatch> expressions = _substitutionRegExp.allMatches(value);
      testExpressions.addAll(expressions);
    }

    final List<ExpressionHandler> handlers = _createHandlers(
      dataStorage: _isTest ? _testDataStorage! : DataStorage.of(_context!),
      hash: hash,
      templateStorage: _isTest ? _testTemplateStorage! : TemplateStorage.of(_context!),
      pageDataStorage: _isTest ? _testPageData! : DocumentStorage.of(_context!),
      forStorage: _isTest ? _testForStorage! : ForStorage.of(_context!),
    );

    final String result = value.replaceAllMapped(_substitutionRegExp, (Match match) {
      final String originalExpression = match.group(0)!;
      // final String? cachedValue = _getFromCache(originalExpression);
      // if (cachedValue != null) {
      //   return cachedValue;
      // }
      String expression = originalExpression;
      for (final ExpressionHandler handler in handlers) {
        expression = handler(expression);
      }
      // _updateCacheValue(originalExpression, expression);
      return expression;
    });
    return result;
  }

  // String? _getFromCache(String expression) {
  //   if (_cache.containsKey(expression)) {
  //     return _cache[expression];
  //   }
  //   return null;
  // }
  //
  // void _updateCacheValue(String originalExpression, String result) {
  //   _cache[originalExpression] = result;
  // }
}
