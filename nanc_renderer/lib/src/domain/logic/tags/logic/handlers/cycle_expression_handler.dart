import '../../renderers/for/for_renderer.dart';
import '../../tools/chain_extractor.dart';
import '../for_storage.dart';
import '../substitutor.dart';

ExpressionHandler cycleExpressionHandler(ForStorage forStorage) {
  return (String expression) {
    final Iterable<RegExpMatch> matches = ForStorage.getMatches(expression);
    if (matches.isEmpty) {
      return expression;
    }
    String replacedValue = expression;
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
  };
}
