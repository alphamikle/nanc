import 'package:tools/tools.dart';

final RegExp _commentsRegExp = RegExp(r'(<!--.*-->)|(<!--.*)');
final RegExp _emptyLinesAfterTagOpener = RegExp(r'(?<open><\w+)(?<blank>[ \n\r\s]+)');
final RegExp _emptyLinesBetweenArguments = RegExp(r'(?<argument>\w+=")(?<value>[^"]+")(?<blank>[ \n\r\s]+)');

String sanitizeMarkup(String rawMarkup) {
  Bench.start('Sanitize');
  final String clearFromCommentsString = _clearComments(rawMarkup);
  final String clearFromAttributesNewLinesString = _clearTagFromNewLines(clearFromCommentsString);
  Bench.end('Sanitize');
  return clearFromAttributesNewLinesString;
}

String _clearComments(String rawMarkup) {
  final String clearString = rawMarkup.replaceAll(_commentsRegExp, '');
  return clearString;
}

String _clearTagFromNewLines(String rawMarkup) {
  final String clearString = rawMarkup.replaceAllMapped(
    _emptyLinesAfterTagOpener,
    (Match match) {
      if (match is RegExpMatch) {
        return '${match.namedGroup('open')} ';
      }
      return match.input;
    },
  );
  return clearString.replaceAllMapped(
    _emptyLinesBetweenArguments,
    (Match match) {
      if (match is RegExpMatch) {
        return '${match.namedGroup('argument')}${match.namedGroup('value')} ';
      }
      return match.input;
    },
  );
}
