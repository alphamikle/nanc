final RegExp _bracketsRegExp = RegExp(r'({{ *)|( *}})');

String bracketsExpressionHandler(String expression) {
  return expression.replaceAll(_bracketsRegExp, '');
}
