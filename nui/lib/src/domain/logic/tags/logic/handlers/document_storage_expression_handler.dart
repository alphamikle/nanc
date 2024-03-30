import '../document_storage.dart';
import '../substitutor.dart';

ExpressionHandler documentStorageExpressionHandler(DocumentStorage pageDataStorage) {
  return (String expression) {
    final Iterable<RegExpMatch> matches = DocumentStorage.getMatches(expression);
    if (matches.isEmpty) {
      return expression;
    }
    String replacedValue = expression;
    for (final RegExpMatch match in matches) {
      final String? query = match.group(0);
      final String pageData = pageDataStorage.getValueAsString(query: query) ?? 'null';

      replacedValue = replacedValue.replaceFirst(
        match.pattern,
        pageData,
      );
    }
    return replacedValue;
  };
}
