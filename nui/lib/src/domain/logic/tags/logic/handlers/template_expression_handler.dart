import '../substitutor.dart';
import '../template_storage.dart';

ExpressionHandler templateExpressionHandler(String hash, TemplateStorage templateStorage) {
  return (String expression) {
    final Iterable<RegExpMatch> matches = TemplateStorage.getMatches(expression);
    if (matches.isEmpty) {
      return expression;
    }
    String replacedValue = expression;
    for (final RegExpMatch match in matches) {
      final String templateId = match.namedGroup(kTemplateId)!;
      final String valueId = match.namedGroup(kValueId)!;
      final String data = templateStorage.getValue(templateId: templateId, valueId: valueId, hash: hash) ?? 'null';
      replacedValue = replacedValue.replaceFirst(match.pattern, data);
    }
    return replacedValue;
  };
}
