import '../data_storage.dart';
import '../substitutor.dart';

ExpressionHandler dataStorageExpressionHandler(DataStorage dataStorage) {
  return (String expression) {
    final Iterable<RegExpMatch> matches = DataStorage.getMatches(expression);
    if (matches.isEmpty) {
      return expression;
    }
    String replacedValue = expression;
    for (final RegExpMatch match in matches) {
      final String? query = match.group(0);
      final String pageData = dataStorage.getValueAsString(query: query) ?? 'null';

      replacedValue = replacedValue.replaceFirst(
        match.pattern,
        pageData,
      );
    }
    return replacedValue;
  };
}
