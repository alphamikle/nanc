final RegExp _commentsRegExp = RegExp(r'(<!--.*-->)|(<!--.*)');
final RegExp _emptyLinesAfterTagOpener = RegExp(r'(?<open><\w+)(?<blank>[ \n\r\s]+)');
final RegExp _emptyLinesBetweenArguments = RegExp(r'(?<argument>\w+=")(?<value>[^"]+")(?<blank>[ \n\r\s]+)');
final RegExp _invisibleDotsRegExp = RegExp(r'·');
final RegExp _backslashRegExp = RegExp(r'\"');

String sanitizeMarkup(String rawMarkup) {
  final String clearFromCommentsString = _clearComments(rawMarkup);
  final String clearFromAttributesNewLinesString = _clearTagFromNewLines(clearFromCommentsString);
  String cleanedAfterWebFixesString = clearFromAttributesNewLinesString;
  cleanedAfterWebFixesString = cleanedAfterWebFixesString.replaceAll(_invisibleDotsRegExp, ' ');
  cleanedAfterWebFixesString = cleanedAfterWebFixesString.replaceAll(_backslashRegExp, '"');
  return cleanedAfterWebFixesString;
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
